local Adapter = {}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer

local function findRemote(name)
	local object = ReplicatedStorage:FindFirstChild(name, true)
	return object and object:IsA("RemoteEvent") and object or nil
end

local OwnershipEvent = findRemote("OwnershipEvent")
local ReplicatedSounds = findRemote("ReplicatedSounds")

local function playKickoffBallSound(ball, velocity)
	local kick = ball:FindFirstChild("Kick")
	if kick and kick:IsA("Sound") then
		kick.Volume = math.clamp(velocity.Magnitude * 0.015, 0.1, 10)
		kick.PlaybackSpeed = math.clamp(velocity.Magnitude * 0.00375 + 1.25, 1, 2.1)
		kick:Play()
	end

	if ReplicatedSounds then
		ReplicatedSounds:FireServer(
			"BallHit",
			ball,
			math.clamp(velocity.Magnitude * 0.015, 0.1, 10)
		)
	end
end

function Adapter.Install(tMechanics)
	assert(type(tMechanics) == "table", "T mechanics module did not return a table")

	-- Keep T's ClientReact untouched. It is the exact T BodyVelocity applier.
	-- Replace only the server/network half with Kick Off's ownership protocol.
	function tMechanics.ServerReact(_, hit, position)
		local ball = hit and hit.Ball
		if not ball or ball.Anchored or not ball.CanCollide then
			return false
		end

		local networkOwner = ball:FindFirstChild("NetworkOwner")
		if networkOwner and networkOwner.Value == LocalPlayer then
			playKickoffBallSound(ball, hit.Velocity)
			return true
		end

		if not OwnershipEvent then
			warn("vrftoprs: Kick Off OwnershipEvent was not found")
			return false
		end

		local isTest = workspace:FindFirstChild("Test") ~= nil
		local reactProtection = not isTest and ball:FindFirstChild("ReactProtection") ~= nil
		local duration = hit.Time or 0.3
		local delayValue = hit.Delays
		local spin = hit.Spin
		local spinPayload = spin or {nil, nil, duration}
		local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

		OwnershipEvent:FireServer(
			ball,
			position or ball.Position,
			hit.Velocity,
			hit.MaxForce,
			spinPayload,
			duration,
			nil,
			nil,
			delayValue,
			ball.AssemblyLinearVelocity,
			LocalPlayer:GetNetworkPing(),
			reactProtection,
			isTest,
			false,
			false,
			root and root.Position or Vector3.zero
		)

		return true
	end

	return tMechanics
end

return Adapter
