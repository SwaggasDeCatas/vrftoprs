return function()
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local TweenService = game:GetService("TweenService")
	local Debris = game:GetService("Debris")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Workspace = game:GetService("Workspace")
	local StarterGui = game:GetService("StarterGui")

	local ClientModules = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules")
	local Remotes = ReplicatedStorage:WaitForChild("Remotes")
	local Storage = ReplicatedStorage:WaitForChild("Storage")

	local LocalPlayer = Players.LocalPlayer
	local PlayerData = ReplicatedStorage:WaitForChild("PlayerData"):WaitForChild(LocalPlayer.UserId, 10)
	if not PlayerData then
		LocalPlayer:Kick("Failed to fetch user data")
		return
	end

	local DebugSettings = PlayerData:WaitForChild("Environment"):WaitForChild("Debug")

	-- Assign types for value constructors
	local Vector3_new = Vector3.new
	local BrickColor_new = BrickColor.new
	local CFrame_new = CFrame.new

	local function SetupCharacter(character)
		local humanoid = character:WaitForChild("Humanoid")
		local head = character:WaitForChild("Head")
		humanoid.FreeFalling:Connect(function(isFreeFalling)
			head.CollisionGroupId = isFreeFalling and 13 or 7
		end)
	end

	local function OnPlayerAdded(player)
		if player ~= LocalPlayer then
			player.CharacterAdded:Connect(SetupCharacter)
			if player.Character then
				SetupCharacter(player.Character)
			end
		end
	end

	-- Connect existing and new players
	for _, player in ipairs(Players:GetPlayers()) do
		OnPlayerAdded(player)
	end
	Players.PlayerAdded:Connect(OnPlayerAdded)

	-- Handle debug visualization event
	Remotes.DebugRemote.OnClientEvent:Connect(function(eventType, data)
		if not DebugSettings.React.Value then return end

		if eventType == "AntiReach" then
			local visual = Storage.Debug.NetworkVisual:Clone()
			visual.BallVisual.Size = Vector3_new(data.CalcSize, data.CalcSize, data.CalcSize)
			visual.BallVisual.CFrame = data.Ball
			visual.HitVisual.CFrame = data.Hit
			visual.BallVisual.Transparency = DebugSettings.Transparency1.Value
			visual.HitVisual.Transparency = DebugSettings.Transparency2.Value
			if data.GK then
				visual.BallVisual.BrickColor = BrickColor_new("Really blue")
				visual.HitVisual.BrickColor = BrickColor_new("Really red")
			end
			visual.Parent = Workspace
			Debris:AddItem(visual, 3)

		elseif eventType == "BallCatch" then
			local visual = Storage.Debug.CatchVisual:Clone()
			visual.Parent = Workspace
			visual.BallVisual.Size = Vector3_new(2.5, 2.5, 2.5)
			visual.LimbVisual.Size = data.LimbSize
			visual.LimbVisual.CFrame = data.LimbCFrame
			visual.BallVisual.CFrame = CFrame_new(data.BallPos)
			Debris:AddItem(visual, 3)
		end
	end)

	-- Echo back data on invoke
	Remotes.PingRemote.OnClientInvoke = function(data)
		local pingSeconds = LocalPlayer:GetNetworkPing()
		local pingMs = math.floor(pingSeconds * 1000)
		return data, pingMs
	end

	-- Custom reset button handling
	local ResetBindable = Instance.new("BindableEvent")
	ResetBindable.Event:Connect(function()
		Remotes.RTP:FireServer("rtp")
	end)

	local setCallbackSuccess = false
	repeat
		setCallbackSuccess = pcall(function()
			StarterGui:SetCore("ResetButtonCallback", ResetBindable)
		end)
		task.wait(0.5)
	until setCallbackSuccess
end

