-- Package is injected by scripts/build.mjs above this file.
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
assert(LocalPlayer, "vrftoprs must run on the client")
assert(type(loadstring) == "function", "vrftoprs requires a loadstring-capable client environment")

if _G.VRFToPRS and _G.VRFToPRS.Stop then
	_G.VRFToPRS.Stop()
end

local Runtime = {
	Created = {},
	Connections = {},
	Tasks = {},
	OwnedTools = {},
	ModuleInstances = {},
	ModuleCache = {},
	Running = true,
}
_G.VRFToPRS = Runtime

function Runtime.TrackConnection(connection)
	table.insert(Runtime.Connections, connection)
	return connection
end

local function runtimeConnect(signal, callback)
	local connection = signal:Connect(function(...)
		if Runtime.Running then callback(...) end
	end)
	Runtime.TrackConnection(connection)
	if not Runtime.Running then connection:Disconnect() end
	return connection
end

local function mark(object)
	table.insert(Runtime.Created, object)
	return object
end

local function child(parent, name, className)
	local found = parent:FindFirstChild(name)
	if found then return found end
	local object = mark(Instance.new(className or "Folder"))
	object.Name = name
	object.Parent = parent
	return object
end

local function createPath(root, path, leafClass)
	local current = root
	local parts = string.split(path, ".")
	for index, name in ipairs(parts) do
		current = child(current, name, index == #parts and leafClass or "Folder")
	end
	return current
end

local function compile(source, chunkName, scriptObject, customRequire)
	local chunk, compileError = loadstring(source, "@vrftoprs/" .. chunkName)
	assert(chunk, compileError)
	if setfenv and getfenv then
		local environment = setmetatable({
			script = scriptObject,
			require = customRequire,
			VRFConnect = runtimeConnect,
		}, {__index = getfenv(chunk)})
		setfenv(chunk, environment)
	end
	return chunk
end

local function loadInternal(key)
	local source = assert(Package.Sources[key], "missing package source: " .. key)
	local placeholder = Instance.new("ModuleScript")
	placeholder.Name = key
	local chunk = compile(source, key, placeholder, require)
	return chunk()
end

local Animations = Package.Manifest.animations
local Keybinds = Package.Manifest.keybinds
local ToolObjects = Package.Manifest.tools

local playerGui = LocalPlayer:WaitForChild("PlayerGui")

-- T expects PlayerGui.Start.Frame, while Kick Off uses a different HUD layout.
-- Supply the smallest compatible tree before loading T's mechanics so none of
-- its WaitForChild calls can hang forever.
local startGui = child(playerGui, "Start", "ScreenGui")
local startFrame = child(startGui, "Frame", "Frame")
pcall(function()
	startFrame.Size = UDim2.fromScale(1, 1)
	startFrame.BackgroundTransparency = 1
end)
local powerBar = child(startFrame, "PowerBar", "ImageLabel")
local powerFill = child(powerBar, "PB", "Frame")
local powerPercent = child(powerBar, "PP", "TextLabel")
local angleBar = child(startFrame, "AngleBar", "ImageLabel")
local angleFill = child(angleBar, "AB", "Frame")
child(angleBar, "Frame", "Frame")
local sixSecond = child(startFrame, "SixSecond", "Frame")
pcall(function()
	powerBar.BackgroundTransparency = 1
	powerFill.Size = UDim2.fromScale(1, 1)
	powerPercent.BackgroundTransparency = 1
	angleBar.BackgroundTransparency = 1
	angleFill.Size = UDim2.fromScale(1, 1)
	sixSecond.BackgroundTransparency = 1
	sixSecond.Visible = false
end)

local animationsRoot = child(playerGui, "Animations", "ScreenGui")
for _, item in ipairs(Animations) do
	local relative = string.gsub(item.path, "^StarterGui%.Animations%.", "")
	local animation = createPath(animationsRoot, relative, "Animation")
	animation.AnimationId = item.id
end

local playerData = child(ReplicatedStorage, "PlayerData", "Folder")
local userData = child(playerData, tostring(LocalPlayer.UserId), "Folder")
local keybindRoot = child(userData, "Keybinds", "Folder")
local overrides = rawget(_G, "VRFToPRSKeybinds") or {}
for _, item in ipairs(Keybinds) do
	local relative = string.gsub(
		item.path,
		"^ServerScriptService%.Firebase%.DefaultSettings%.Keybinds%.",
		""
	)
	local value = createPath(keybindRoot, relative, "StringValue")
	value.Value = overrides[relative] or item.value
end

local playerScripts = LocalPlayer:WaitForChild("PlayerScripts")
local clientModules = child(playerScripts, "ClientModules", "Folder")
local backpack = LocalPlayer:WaitForChild("Backpack")
local toolsByName = {}

local function removeTools(container, ownedOnly)
	if not container then return end
	for _, object in ipairs(container:GetChildren()) do
		if object:IsA("Tool") and (not ownedOnly or Runtime.OwnedTools[object]) then
			pcall(function() object:Destroy() end)
		end
	end
end

-- Start from a clean hotbar. Equipped tools are moved back first, then every
-- old Backpack/Character tool is deleted before the replacement set is added.
local character = LocalPlayer.Character
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if humanoid then pcall(function() humanoid:UnequipTools() end) end
removeTools(backpack, false)
removeTools(character, false)

Runtime.TrackConnection(backpack.ChildAdded:Connect(function(object)
	if Runtime.Running and object:IsA("Tool") and not Runtime.OwnedTools[object] then
		task.defer(function()
			if Runtime.Running and object.Parent == backpack and not Runtime.OwnedTools[object] then
				pcall(function() object:Destroy() end)
			end
		end)
	end
end))

for _, item in ipairs(ToolObjects) do
	local relative = string.gsub(item.path, "^ServerStorage%.Assets%.Tools%.", "")
	if item.class == "Tool" then
		local toolName = string.split(relative, ".")[1]
		local tool = Instance.new("Tool")
		tool.Name = toolName
		for property, value in pairs(item.properties or {}) do
			if property ~= "Name" then pcall(function() tool[property] = value end) end
		end
		Runtime.OwnedTools[tool] = true
		tool.Parent = backpack
		mark(tool)
		toolsByName[toolName] = tool
	end
end

local sourceByInstance = {}
for key in pairs(Package.Sources) do
	if string.sub(key, 1, 8) == "support/" then
		local name = string.sub(key, 9)
		local module = child(clientModules, name, "ModuleScript")
		Runtime.ModuleInstances[key] = module
		sourceByInstance[module] = key
	elseif string.sub(key, 1, 6) == "tools/" then
		local relative = string.sub(key, 7)
		local pieces = string.split(relative, "/")
		local tool = toolsByName[pieces[1]]
		if tool then
			local current = tool
			for index = 2, #pieces do
				local isLeaf = index == #pieces
				local className = isLeaf and (pieces[index] == "Controller" and "LocalScript" or "ModuleScript") or "Folder"
				current = child(current, pieces[index], className)
				if isLeaf then
					Runtime.ModuleInstances[key] = current
					sourceByInstance[current] = key
					if current:IsA("LocalScript") then current.Disabled = true end
				end
			end
		end
	end
end

for _, item in ipairs(ToolObjects) do
	if item.class == "StringValue" then
		local relative = string.gsub(item.path, "^ServerStorage%.Assets%.Tools%.", "")
		local pieces = string.split(relative, ".")
		local current = toolsByName[pieces[1]]
		if current then
			for index = 2, #pieces do
				current = child(current, pieces[index], index == #pieces and "StringValue" or "Folder")
			end
			current.Value = item.properties.Value
		end
	end
end

local loading = {}
local nativeRequire = require
local function packageRequire(target)
	local key = sourceByInstance[target]
	if not key then return nativeRequire(target) end
	if Runtime.ModuleCache[key] ~= nil then return Runtime.ModuleCache[key] end
	assert(not loading[key], "cyclic package require: " .. key)
	loading[key] = true
	local chunk = compile(Package.Sources[key], key, target, packageRequire)
	local result = chunk()
	if result == nil then result = true end
	Runtime.ModuleCache[key] = result
	loading[key] = nil
	return result
end

local mechanicsInstance = Runtime.ModuleInstances["support/llllIllIllIIIlllIIIIlIllIIIlIIlII"]
local mechanics = packageRequire(mechanicsInstance)
local adapter = loadInternal("runtime/KickoffAdapter")
adapter.Install(mechanics)

local physics = loadInternal("runtime/TBallPhysics")
physics.Start()
Runtime.Physics = physics

for key, instance in pairs(Runtime.ModuleInstances) do
	if string.sub(key, 1, 6) == "tools/" and instance:IsA("LocalScript") then
		local controllerTask = task.spawn(function()
			local ok, err = pcall(function()
				compile(Package.Sources[key], key, instance, packageRequire)()
			end)
			if Runtime.Running and not ok then
				warn("vrftoprs controller failed [" .. key .. "]: " .. tostring(err))
			end
		end)
		table.insert(Runtime.Tasks, controllerTask)
	end
end

local function removeActiveMovers()
	local targets = {LocalPlayer.Character, workspace:FindFirstChild("Balls")}
	for _, target in ipairs(targets) do
		if target then
			for _, object in ipairs(target:GetDescendants()) do
				if object:IsA("BodyVelocity")
					or object:IsA("BodyAngularVelocity")
					or object:IsA("AngularVelocity") then
					pcall(function() object:Destroy() end)
				end
			end
		end
	end
end

function Runtime.Stop()
	if not Runtime.Running then return end
	Runtime.Running = false
	for _, connection in ipairs(Runtime.Connections) do
		pcall(function() connection:Disconnect() end)
	end
	table.clear(Runtime.Connections)
	for _, controllerTask in ipairs(Runtime.Tasks) do
		pcall(function() task.cancel(controllerTask) end)
	end
	table.clear(Runtime.Tasks)
	if Runtime.Physics then Runtime.Physics.Stop() end
	local character = LocalPlayer.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	if humanoid then humanoid:UnequipTools() end
	removeTools(backpack, true)
	removeTools(character, true)
	removeActiveMovers()
	for key in pairs(Package.Sources) do
		if string.sub(key, 1, 6) == "tools/" then
			local action = string.split(key, "/")[#string.split(key, "/")]
			pcall(function() game:GetService("ContextActionService"):UnbindAction(action) end)
		end
	end
	for index = #Runtime.Created, 1, -1 do
		local object = Runtime.Created[index]
		pcall(function() object:Destroy() end)
	end
	table.clear(Runtime.OwnedTools)
	if _G.VRFToPRS == Runtime then _G.VRFToPRS = nil end
	print("vrftoprs stopped")
end

Runtime.InputConnection = Runtime.TrackConnection(UserInputService.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.F4 then Runtime.Stop() end
end))

print("vrftoprs loaded | F4 = stop")
return Runtime
