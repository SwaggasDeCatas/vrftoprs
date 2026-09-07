local Physics = {}

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local Balls = workspace:WaitForChild("Balls")
local connection
local active = false
local created = {}

local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Exclude
rayParams.IgnoreWater = true
rayParams.RespectCanCollide = true

local function mover(ball, name, className)
	local object = ball:FindFirstChild(name)
	if object and not object:IsA(className) then
		return nil
	end
	if not object then
		object = Instance.new(className)
		object.Name = name
		object.Parent = ball
		created[object] = true
	end
	return object
end

local function calculate(ball)
	local properties = PhysicalProperties.new(0.7, 0.1, 0.91, 5, 6)
	local curve = Vector3.zero
	local stopperMultiplier = 0.9
	local angular = ball.AssemblyAngularVelocity
	local velocity = ball.AssemblyLinearVelocity
	local horizontal = Vector3.new(velocity.X, 0, velocity.Z)
	local horizontalSpeed = math.abs(velocity.X) + math.abs(velocity.Z)
	local horizontalAngular = math.abs(angular.X) + math.abs(angular.Z)
	local side = velocity.Magnitude > 0.001
		and CFrame.lookAt(ball.Position, ball.Position + velocity).RightVector
		or Vector3.xAxis
	local vertical = horizontal.Magnitude > 0.001
		and CFrame.lookAt(ball.Position, ball.Position + horizontal).UpVector
		or Vector3.yAxis
	local ground = workspace:Raycast(
		ball.Position + Vector3.new(0, -1, 0),
		Vector3.new(0, -1, 0),
		rayParams
	)
	local nearGround = ground ~= nil and ground.Instance ~= nil

	if horizontalSpeed < 40 then
		return properties, curve, stopperMultiplier, nearGround
	end

	local direction = velocity.Unit
	local spinReference = Vector3.new(direction.Z, 0, -direction.X)
	if angular.Magnitude > 0 and (spinReference - angular.Unit).Magnitude > 1 then
		curve += vertical * (-horizontalAngular * 0.7)
		stopperMultiplier += 0.1
		if curve.Magnitude > 30 or angular.Magnitude > 30 then
			properties = PhysicalProperties.new(0.7, 0.1 + velocity.Magnitude / 500, 0.76, 5, 6)
		end
		if nearGround then curve *= 0.5 end
	else
		curve += vertical * (horizontalAngular * 1.7)
		if curve.Magnitude > 80 or angular.Magnitude > 80 then
			properties = PhysicalProperties.new(0.7, 0.1, 0.76, 5, 6)
		end
		if nearGround then
			curve *= 0.5
			stopperMultiplier += 0.3
		end
	end

	if angular.Magnitude < 20 then
		if horizontalAngular < 10 and horizontalSpeed > 100 then
			local groundCheck = workspace:Raycast(
				ball.Position + Vector3.new(0, -1, 0),
				Vector3.new(0, -6, 0),
				rayParams
			)
			if not (groundCheck and groundCheck.Instance) then
				local noise = math.noise(ball.Position.X / 15, ball.Position.Z / 15, tick() / 4)
				noise *= horizontalSpeed / (5 + angular.Magnitude)
				local strength = math.clamp(noise, -0.6, 0.6) * horizontalSpeed ^ 1.3
				curve = side * math.clamp(strength, -400, 400)
			end
		end
		return properties, curve, stopperMultiplier, nearGround
	end

	if angular.Magnitude < 40 then
		return properties, Vector3.zero, stopperMultiplier, nearGround
	end

	local amount = math.abs(angular.Y / 6) ^ 1.2 * ((velocity.Magnitude / 43) ^ 2 + 1)
	if angular.Y > 0 then amount = -amount end
	curve = (curve + side * (amount / (math.abs(velocity.Y / 175) + 1)) * 1.15) * 1.2
	return properties, curve, stopperMultiplier, nearGround
end

local function update(ball)
	if not active or not ball:IsA("BasePart") then return end
	local curvePower = mover(ball, "CurvePower", "BodyForce")
	local stopper = mover(ball, "Stopper", "BodyAngularVelocity")
	local stopper2 = mover(ball, "Stopper2", "BodyForce")
	local owner = ball:FindFirstChild("NetworkOwner")
	if not curvePower or not stopper or not stopper2 or not owner then return end

	stopper.P = 3
	local velocity = ball.AssemblyLinearVelocity
	local vx = math.clamp(velocity.X, -80, 80)
	local vz = math.clamp(velocity.Z, -80, 80)
	local properties, curve, multiplier, nearGround = calculate(ball)
	curvePower.Force = curve
	stopper2.Force = Vector3.new(-vx, 0, -vz) * multiplier
	ball.CustomPhysicalProperties = properties

	local slowdown = (40 - (math.abs(vx) + math.abs(vz))) / 16
	local speedTorque = (slowdown > 1 and ball.AssemblyAngularVelocity.Magnitude >= 15) and slowdown or 1
	local spinTorque = ball.AssemblyAngularVelocity.Magnitude < 20 and 1.2 or 0.9
	if nearGround then
		spinTorque += 1.75
		curvePower.Force /= 1.75
	end
	local angular = ball.AssemblyAngularVelocity
	stopper.MaxTorque = Vector3.new(math.abs(angular.X), math.abs(angular.Y), math.abs(angular.Z))
		* (spinTorque + speedTorque)

	for _, part in ipairs(ball:GetTouchingParts()) do
		if part.Material == Enum.Material.Grass then
			local bodyVelocity = ball:FindFirstChildOfClass("BodyVelocity")
			if owner.Value == LocalPlayer and bodyVelocity and bodyVelocity.Velocity.Magnitude > 0
				and bodyVelocity.Velocity.Unit.Y < 0 and bodyVelocity.MaxForce.Y ~= 0 then
				bodyVelocity.MaxForce -= Vector3.new(0, bodyVelocity.MaxForce.Y, 0)
			end
			break
		end
	end

	if owner.Value == LocalPlayer and ball.AssemblyLinearVelocity == Vector3.zero then
		ball:ApplyImpulse(Vector3.new(0, -0.1, 0))
	end
end

function Physics.Start()
	if active then return end
	active = true
	connection = RunService.Stepped:Connect(function()
		for _, ball in ipairs(Balls:GetChildren()) do
			if ball.Name == "VRF" then pcall(update, ball) end
		end
	end)
end

function Physics.Stop()
	active = false
	if connection then connection:Disconnect() connection = nil end
	for object in pairs(created) do
		pcall(function() object:Destroy() end)
	end
	table.clear(created)
end

return Physics
