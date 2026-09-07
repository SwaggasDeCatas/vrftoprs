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
	ModuleInstances = {},
	ModuleCache = {},
	Running = true,
}
_G.VRFToPRS = Runtime

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

for _, item in ipairs(ToolObjects) do
	local relative = string.gsub(item.path, "^ServerStorage%.Assets%.Tools%.", "")
	if item.class == "Tool" then
		local toolName = string.split(relative, ".")[1]
		local tool = Instance.new("Tool")
		tool.Name = backpack:FindFirstChild(toolName) and ("T_" .. toolName) or toolName
		for property, value in pairs(item.properties or {}) do
			if property ~= "Name" then pcall(function() tool[property] = value end) end
		end
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
		task.spawn(function()
			local ok, err = pcall(function()
				compile(Package.Sources[key], key, instance, packageRequire)()
			end)
			if not ok then warn("vrftoprs controller failed [" .. key .. "]: " .. tostring(err)) end
		end)
	end
end

function Runtime.Stop()
	if not Runtime.Running then return end
	Runtime.Running = false
	if Runtime.InputConnection then Runtime.InputConnection:Disconnect() end
	if Runtime.Physics then Runtime.Physics.Stop() end
	local character = LocalPlayer.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	if humanoid then humanoid:UnequipTools() end
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
	if _G.VRFToPRS == Runtime then _G.VRFToPRS = nil end
	print("vrftoprs stopped")
end

Runtime.InputConnection = UserInputService.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.F4 then Runtime.Stop() end
end)

print("vrftoprs loaded | F4 = stop")
return Runtime
