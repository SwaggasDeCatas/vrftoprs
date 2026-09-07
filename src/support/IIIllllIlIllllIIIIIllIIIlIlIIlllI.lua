local v_u_12 = game

local v_u_13 = pairs
local v_u_14 = tick
local v_u_15 = tostring
local v_u_16 = BrickColor
local v_u_17 = PhysicalProperties
local v_u_18 = require
local v_u_19 = Enum
return function()
	-- upvalues: (copy) v_u_12, (copy) v_u_18, (copy) v_u_19, (copy) v_u_13, (copy) v_u_17, (copy) v_u_16, (copy) v_u_15, (copy) v_u_14
	v_u_12:GetService("Debris")
	local v_u_20 = v_u_12:GetService("RunService")
	v_u_12:GetService("TweenService")
	local v21 = v_u_12:GetService("UserInputService")
	local v22 = v_u_12:GetService("ReplicatedStorage")
	local v23 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules")
	local v_u_24 = v22:WaitForChild("Remotes")
	v22:WaitForChild("Storage")
	local v_u_25 = v_u_18(v23:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"))
	local v_u_26 = v_u_18(v23:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"))
	local v_u_27 = v_u_12:GetService("Players").LocalPlayer
	local v28 = v_u_27:WaitForChild("PlayerGui")
	v_u_27:WaitForChild("Backpack")
	local v_u_29 = v_u_27.Character
	if not (v_u_29 and v_u_29.Parent) then
		v_u_29 = v_u_27.CharacterAdded:wait()
	end
	local v_u_30 = v_u_29:WaitForChild("Humanoid")
	local v_u_31 = v_u_29:WaitForChild("HumanoidRootPart")
	local v_u_32 = v_u_12:GetService("Workspace"):WaitForChild("Balls")
	v28:WaitForChild("Start"):WaitForChild("Sleep")
	local v33 = v22:WaitForChild("PlayerData"):WaitForChild(v_u_27.UserId, 10)
	if v33 == nil then
		v_u_27:Kick("Failed to fetch user data")
	end
	local v_u_34 = v33:WaitForChild("Inventory"):WaitForChild("BallHold")
	local v_u_35 = {
		["0"] = "rbxassetid://72861601282709",
		["4958889"] = "rbxassetid://100526153137785",
		["4959180"] = "rbxassetid://92804612471780",
		["4959338"] = "rbxassetid://130259777352565",
		["4959339"] = "rbxassetid://94675843674426",
		["4959341"] = "rbxassetid://130295833300040",
		["5044570"] = "rbxassetid://72868543849638",
		["5065827"] = "rbxassetid://139298484632667",
		["5172275"] = "rbxassetid://109419167750544",
		["5303618"] = "rbxassetid://114622048390802",
		["5303619"] = "rbxassetid://123447854708121"
	}
	v_u_30:SetStateEnabled(v_u_19.HumanoidStateType.Climbing, false)
	v_u_30:SetStateEnabled(v_u_19.HumanoidStateType.Ragdoll, false)
	v_u_30:SetStateEnabled(v_u_19.HumanoidStateType.FallingDown, false);
	(function()
		-- upvalues: (ref) v_u_13, (ref) v_u_29, (ref) v_u_17, (copy) v_u_27, (ref) v_u_16
		for _, v36 in v_u_13(v_u_29:GetChildren()) do
			if v36:IsA("BasePart") and v36.Name ~= "B" then
				if v36.Name == "HumanoidRootPart" then
					v36.CustomPhysicalProperties = v_u_17.new(2, 0.5, 0, 1, 100)
					v36.CollisionGroupId = 7
				elseif v36.Name == "Head" then
					v36.CustomPhysicalProperties = v_u_17.new(0.7, 0.5, 0.1, 1, 3)
					v36.CollisionGroupId = 9
				elseif v36.Name == "Right Leg" or (v36.Name == "Left Leg" or (v36.Name == "Right Arm" or v36.Name == "Left Arm")) then
					v36.CustomPhysicalProperties = v_u_17.new(0.01, 0, 0, 0, 0)
					v36.CollisionGroupId = 9
				else
					v36.CustomPhysicalProperties = v_u_17.new(2, 0.5, 0, 1, 100)
					v36.CollisionGroupId = 9
				end
				if v_u_27.TeamColor == v_u_16.new("Really red") then
					v36.CollisionGroupId = 6
				end
			end
		end
	end)()
	v33:WaitForChild("Inventory"):WaitForChild("BallHold")
	local v_u_37 = v28:WaitForChild("Animations")
	local v_u_38 = v_u_30:LoadAnimation(v_u_37.Sleeping);
	(function()
		-- upvalues: (ref) v_u_13, (copy) v_u_35, (copy) v_u_34, (ref) v_u_15, (copy) v_u_37
		for v39, v40 in v_u_13(v_u_35) do
			if v39 == v_u_15(v_u_34.Value) then
				v_u_37.Holding.HoldingAnim.AnimationId = v40
			end
		end
	end)()
	local v_u_41 = v_u_30:LoadAnimation(v_u_37.Holding.HoldingAnim)
	local v_u_42 = nil
	local function v_u_43()
		-- upvalues: (ref) v_u_42
		if v_u_42 ~= nil then
			v_u_42:Disconnect()
			v_u_42 = nil
		end
	end
	v_u_29.ChildAdded:Connect(function(p_u_44)
		-- upvalues: (copy) v_u_26, (ref) v_u_41, (ref) v_u_19, (copy) v_u_43, (ref) v_u_42, (copy) v_u_32, (copy) v_u_25, (ref) v_u_29
		if p_u_44:IsA("Weld") and p_u_44.Name == "LocalBWeld" then
			v_u_26:PlayAnim(v_u_41, 0.4, v_u_19.AnimationPriority.Movement)
			v_u_43()
			v_u_42 = v_u_32.ChildRemoved:Connect(function(p45)
				-- upvalues: (copy) p_u_44, (ref) v_u_25, (ref) v_u_29, (ref) v_u_43
				if p45 == p_u_44.Part0 then
					v_u_25:DropBall({
						["Character"] = v_u_29
					})
					v_u_43()
				end
			end)
		end
	end)
	v_u_29.ChildRemoved:Connect(function(p46)
		-- upvalues: (ref) v_u_41, (copy) v_u_43
		if p46:IsA("Weld") and p46.Name == "LocalBWeld" then
			v_u_41:Stop(0.01)
			v_u_43()
		end
	end)
	local v_u_47 = 0
	local v_u_48 = false
	local function v_u_51(p49, p_u_50)
		-- upvalues: (ref) v_u_48, (copy) v_u_31, (copy) v_u_30, (ref) v_u_19, (copy) v_u_20, (copy) v_u_24, (ref) v_u_47, (copy) v_u_38
		if p49 and not v_u_48 then
			v_u_48 = true
			v_u_31.Anchored = true
			v_u_30:ChangeState(v_u_19.HumanoidStateType.Physics)
			v_u_20.Stepped:Wait()
			v_u_31.Anchored = false
			v_u_30:ChangeState(v_u_19.HumanoidStateType.Landed)
			v_u_24.AFKRemote:FireServer(true)
			task.spawn(function()
				-- upvalues: (ref) v_u_48, (copy) p_u_50, (ref) v_u_47, (ref) v_u_38
				while true do
					if v_u_48 and (p_u_50 == v_u_47 and not v_u_38.IsPlaying) then
						v_u_38:Play(0.4)
					end
					task.wait(1)
					if not v_u_48 or p_u_50 ~= v_u_47 then
						return
					end
				end
			end)
		elseif v_u_48 then
			v_u_48 = false
			v_u_38:Stop(0.1)
			v_u_24.AFKRemote:FireServer(false)
		end
	end
	v21.WindowFocusReleased:Connect(function()
		-- upvalues: (ref) v_u_47, (ref) v_u_48, (copy) v_u_51
		local v52 = v_u_47
		v_u_47 = v52
		task.wait(10)
		if v52 == v_u_47 and not v_u_48 then
			v_u_51(true, v52)
		end
	end)
	v21.WindowFocused:Connect(function()
		-- upvalues: (ref) v_u_47, (ref) v_u_14, (ref) v_u_48, (copy) v_u_51
		v_u_47 = v_u_14()
		if v_u_48 then
			v_u_51(false)
		end
	end)
end
