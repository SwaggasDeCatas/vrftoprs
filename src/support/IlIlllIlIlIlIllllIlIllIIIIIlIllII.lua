-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function(_)
	local v_u_1 = UserSettings():GetService("UserGameSettings")
	local v_u_2 = game:GetService("UserInputService")
	local v_u_3 = game:GetService("Workspace")
	local v_u_4 = game:GetService("Debris")
	local v5 = game:GetService("RunService")
	local v_u_6 = game:GetService("TweenService")
	local v7 = game:GetService("ReplicatedStorage")
	local v8 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules")
	local v9 = v7:WaitForChild("Remotes")
	require(v8:WaitForChild("PlayerModule")):GetControls()
	local v_u_10 = require(v8:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"))
	local v_u_11 = require(v8:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"))
	local v_u_12 = require(v8:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"))
	local v_u_13 = require(v8:WaitForChild("lIIllllIIllIllIIllIIIIIlIllIllllI"))
	local v14 = {}
	local v_u_15 = v9:WaitForChild("FallClientRemote")
	local v_u_16 = v9:WaitForChild("RagdollRemote")
	local v17 = v9:WaitForChild("TripRemote")
	local v_u_18 = game:GetService("Players").LocalPlayer
	v_u_18:WaitForChild("PlayerGui")
	local v19 = v_u_18.PlayerGui:WaitForChild("Animations")
	local v_u_20 = v_u_18.Character
	if not (v_u_20 and v_u_20.Parent) then
		v_u_20 = v_u_18.CharacterAdded:wait()
	end
	local v_u_21 = v_u_20:WaitForChild("Humanoid")
	local v_u_22 = v_u_3:WaitForChild("Balls")
	local v_u_23 = v_u_20:WaitForChild("Torso")
	local v_u_24 = v_u_20:WaitForChild("HumanoidRootPart")
	local v_u_25 = v_u_20:WaitForChild("Head")
	local v26 = v_u_20:WaitForChild("Ragdoll")
	local v_u_27 = v26.Hitboxes
	local v_u_28 = v26.Constraints
	local v_u_29 = false
	local v_u_30 = false
	local v_u_31 = {
		["Front"] = {
			["cframe"] = CFrame.Angles(1.5707963267948966, 0, 0),
			["vector3"] = Vector3.new(0, 2.5, 0),
			["Animation"] = v_u_21:LoadAnimation(v19.GetUp.FrontGetUp)
		},
		["Back"] = {
			["cframe"] = CFrame.Angles(-1.5707963267948966, 0, 0),
			["vector3"] = Vector3.new(0, 2.5, 0),
			["Animation"] = v_u_21:LoadAnimation(v19.GetUp.BackGetUp)
		},
		["Straight"] = {
			["cframe"] = CFrame.Angles(0, 0, 0),
			["vector3"] = Vector3.new(0, 2, 0),
			["Animation"] = v_u_21:LoadAnimation(v19.GetUp.StraightGetUp)
		},
		["Left"] = {
			["cframe"] = CFrame.Angles(0, 0, -1.5707963267948966),
			["vector3"] = Vector3.new(0, 2, 0),
			["Animation"] = v_u_21:LoadAnimation(v19.GetUp.LeftGetUp)
		},
		["Right"] = {
			["cframe"] = CFrame.Angles(0, 0, 1.5707963267948966),
			["vector3"] = Vector3.new(0, 2, 0),
			["Animation"] = v_u_21:LoadAnimation(v19.GetUp.RightGetUp)
		},
		["Head"] = {
			["cframe"] = CFrame.Angles(3.141592653589793, 0, 0),
			["vector3"] = Vector3.new(0, 1, 0),
			["Animation"] = v_u_21:LoadAnimation(v19.GetUp.HeadGetUp)
		}
	}
	local v_u_32 = {
		["Standing"] = {
			["Way"] = Vector3.new(0, 0, 0.1),
			["Animation"] = v_u_21:LoadAnimation(v19.Ankled.DefaultAnkled),
			["Amount"] = 30
		},
		["Foward"] = {
			["Way"] = Vector3.new(0, 0, -1),
			["Animation"] = v_u_21:LoadAnimation(v19.Ankled.FowardAnkled),
			["Amount"] = 6
		},
		["Back"] = {
			["Way"] = Vector3.new(0, 0, 1),
			["Animation"] = v_u_21:LoadAnimation(v19.Ankled.BackAnkled),
			["Amount"] = 6
		},
		["Left"] = {
			["Way"] = Vector3.new(-1, 0, 0),
			["Animation"] = v_u_21:LoadAnimation(v19.Ankled.LeftAnkled),
			["Amount"] = 6
		},
		["Right"] = {
			["Way"] = Vector3.new(1, 0, 0),
			["Animation"] = v_u_21:LoadAnimation(v19.Ankled.RightAnkled),
			["Amount"] = 6
		},
		["BackLeft"] = {
			["Way"] = Vector3.new(-0.7, 0, 0.7),
			["Animation"] = v_u_21:LoadAnimation(v19.Ankled.BackAnkled),
			["Amount"] = 6
		},
		["BackRight"] = {
			["Way"] = Vector3.new(0.7, 0, 0.7),
			["Animation"] = v_u_21:LoadAnimation(v19.Ankled.BackAnkled),
			["Amount"] = 6
		},
		["FowardLeft"] = {
			["Way"] = Vector3.new(-0.7, 0, -0.7),
			["Animation"] = v_u_21:LoadAnimation(v19.Ankled.FowardLeftAnkled),
			["Amount"] = 7
		},
		["FowardRight"] = {
			["Way"] = Vector3.new(0.7, 0, -0.7),
			["Animation"] = v_u_21:LoadAnimation(v19.Ankled.FowardRightAnkled),
			["Amount"] = 7
		}
	}
	local v_u_33 = nil
	local function v_u_35()
		-- upvalues: (ref) v_u_33, (copy) v_u_21, (copy) v_u_24, (copy) v_u_6
		if v_u_33 then
			v_u_33:Destroy()
			v_u_33 = nil
		end
		local v34 = Instance.new("BodyVelocity")
		v34.P = 150
		v34.Velocity = v_u_21.MoveDirection * v_u_21.WalkSpeed + Vector3.new(0, 1, 0)
		v34.MaxForce = Vector3.new(1000, 3500, 1000)
		v34.Parent = v_u_24
		v_u_6:Create(v34, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
			["MaxForce"] = Vector3.new(1000, 2750, 1000)
		}):Play()
		v_u_33 = v34
		return v34
	end
	local function v_u_36()
		-- upvalues: (ref) v_u_33, (copy) v_u_6, (copy) v_u_21
		if v_u_33 then
			v_u_6:Create(v_u_33, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
				["Velocity"] = v_u_21.MoveDirection * v_u_21.WalkSpeed
			}):Play()
			v_u_33.MaxForce = Vector3.new(1000, 3000, 1000)
		end
	end
	local v_u_37 = nil
	local function v_u_38()
		-- upvalues: (ref) v_u_33, (ref) v_u_37, (copy) v_u_35, (copy) v_u_21, (copy) v_u_36
		if v_u_33 then
			v_u_33:Destroy()
			v_u_33 = nil
		end
		if v_u_37 then
			v_u_37:Disconnect()
			v_u_37 = nil
		end
		v_u_35()
		v_u_37 = v_u_21:GetPropertyChangedSignal("MoveDirection"):Connect(function()
			-- upvalues: (ref) v_u_36
			v_u_36()
		end)
		v_u_36()
	end
	local function v_u_44()
		-- upvalues: (copy) v_u_24, (copy) v_u_21, (copy) v_u_32
		local v39 = v_u_24.CFrame:VectorToObjectSpace(v_u_21.MoveDirection).Unit
		local v40 = (1 / 0)
		local v41 = nil
		for _, v42 in pairs(v_u_32) do
			local v43 = (v42.Way - v39).Magnitude
			if v43 < v40 then
				v41 = v42
				v40 = v43
			end
		end
		if v41 == nil then
			return v_u_32.Standing
		else
			return v41
		end
	end
	local function v_u_45()
		-- upvalues: (copy) v_u_23
		return v_u_23.Orientation.X >= -130 and v_u_23.Orientation.X <= -50 and "Front" or (v_u_23.Orientation.X <= 130 and v_u_23.Orientation.X >= 50 and "Back" or (v_u_23.Orientation.X >= -50 and (v_u_23.Orientation.X <= 50 and (v_u_23.Orientation.Z >= -50 and v_u_23.Orientation.Z <= 50)) and "Straight" or (v_u_23.Orientation.Z <= 130 and v_u_23.Orientation.Z >= 50 and "Left" or (v_u_23.Orientation.Z >= -130 and v_u_23.Orientation.Z <= -50 and "Right" or (v_u_23.Orientation.Y >= -160 and v_u_23.Orientation.Y <= 160 and "Head" or "Straight")))))
	end
	local function v_u_51()
		-- upvalues: (copy) v_u_24, (copy) v_u_3, (ref) v_u_20
		local v46 = Vector3.new(0, 0, 0)
		local v47 = 0
		while true do
			task.wait(0.05)
			local v48 = v_u_24.Velocity.Magnitude
			local v49 = v_u_24.RotVelocity.Magnitude
			local v50 = v_u_24.Position
			if (v50 - v46).Magnitude < 3 and (v49 < 5 and v48 < 5) and v_u_3:FindPartOnRay(Ray.new(v_u_24.CFrame.p, Vector3.new(0, -2.8, 0)), v_u_20) then
				v47 = v47 + 1
			else
				v46 = v50
				v47 = 0
			end
			if v47 > 4 then
				return
			end
		end
	end
	local function v_u_62()
		-- upvalues: (copy) v_u_45, (ref) v_u_30, (copy) v_u_3, (copy) v_u_21, (copy) v_u_25, (copy) v_u_31, (copy) v_u_23, (copy) v_u_10, (copy) v_u_24
		local v52 = v_u_45()
		if v52 ~= nil then
			v_u_30 = true
			if v_u_3.CurrentCamera.CameraSubject == v_u_21 then
				v_u_3.CurrentCamera.CameraSubject = v_u_25
			end
			local v53 = v_u_31[v52]
			local v54 = v_u_23.CFrame * v53.cframe + v53.vector3
			local v55 = CFrame.new
			local v56 = v54.p
			local v57 = v54.p
			local v58 = v54.LookVector
			local v59 = v54.LookVector.Y
			local v60 = v55(v56, v57 + (v58 - Vector3.new(0, v59, 0)))
			v_u_21:ChangeState(Enum.HumanoidStateType.Physics)
			local v61 = v_u_10:PlayTorsoMovementAnim({
				["CFrame"] = v60,
				["Animation"] = v53.Animation.Animation,
				["Root"] = v_u_24,
				["Humanoid"] = v_u_21
			})
			v_u_23.Anchored = true
			v_u_10:StopAnimations(v_u_21, false)
			v61:Play(0)
			v53.Animation.Priority = Enum.AnimationPriority.Idle
			v53.Animation:Play(0)
			v53.Animation.Stopped:Wait()
			v_u_23.Anchored = false
			v_u_21:ChangeState(Enum.HumanoidStateType.GettingUp)
			if v_u_3.CurrentCamera.CameraSubject == v_u_25 then
				v_u_3.CurrentCamera.CameraSubject = v_u_21
			end
			v_u_30 = false
		end
	end
	local v_u_63 = nil
	local function v_u_70()
		-- upvalues: (ref) v_u_63, (copy) v_u_6, (copy) v_u_21, (copy) v_u_24
		if v_u_63 then
			local v64 = v_u_6
			local v65 = v_u_63
			local v66 = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
			local v67 = {}
			local v68 = v_u_21.MoveDirection
			local v69 = v_u_24.AssemblyLinearVelocity.Magnitude / 6
			v67.Velocity = v68 * math.clamp(v69, 0, 10)
			v64:Create(v65, v66, v67):Play()
			v_u_63.MaxForce = Vector3.new(2500, 0, 2500)
		end
	end
	local v_u_71 = nil
	local function v_u_73()
		-- upvalues: (ref) v_u_33, (ref) v_u_37, (ref) v_u_63, (copy) v_u_21, (copy) v_u_24, (ref) v_u_71, (copy) v_u_70
		if v_u_33 then
			v_u_33:Destroy()
			v_u_33 = nil
		end
		if v_u_37 then
			v_u_37:Disconnect()
			v_u_37 = nil
		end
		if v_u_63 then
			v_u_63:Destroy()
			v_u_63 = nil
		end
		local v72 = Instance.new("BodyVelocity")
		v72.P = 200
		v72.Velocity = v_u_21.MoveDirection * v_u_21.WalkSpeed
		v72.MaxForce = Vector3.new(2500, 0, 2500)
		v72.Parent = v_u_24
		v_u_63 = v72
		v_u_71 = v_u_21:GetPropertyChangedSignal("MoveDirection"):Connect(function()
			-- upvalues: (ref) v_u_70
			v_u_70()
		end)
		v_u_70()
	end
	local v_u_74 = v_u_23:WaitForChild("RagdollForce")
	local v_u_75 = v_u_25:WaitForChild("RagdollForce")
	local function v_u_86(p76)
		-- upvalues: (ref) v_u_20, (copy) v_u_21, (copy) v_u_23, (copy) v_u_28, (copy) v_u_27, (copy) v_u_10, (copy) v_u_74, (copy) v_u_75, (copy) v_u_73, (copy) v_u_16, (ref) v_u_63, (ref) v_u_71, (copy) v_u_18
		if p76 then
			local v_u_77 = v_u_20:FindFirstChild("LocalBWeld")
			v_u_21:ChangeState(Enum.HumanoidStateType.Physics)
			for _, v_u_78 in pairs(v_u_20:GetChildren()) do
				task.spawn(function()
					-- upvalues: (copy) v_u_78
					if v_u_78:IsA("BasePart") then
						v_u_78.CollisionGroupId = 10
					end
				end)
			end
			for _, v_u_79 in pairs(v_u_23:GetChildren()) do
				task.spawn(function()
					-- upvalues: (copy) v_u_79, (copy) v_u_77
					if v_u_79:IsA("Motor6D") and (v_u_77 == nil or v_u_79.Name ~= "Right Shoulder" and v_u_79.Name ~= "Left Shoulder") then
						v_u_79.Enabled = false
					end
				end)
			end
			for _, v_u_80 in pairs(v_u_28:GetChildren()) do
				task.spawn(function()
					-- upvalues: (copy) v_u_80
					v_u_80.Enabled = true
				end)
			end
			for _, v_u_81 in pairs(v_u_27:GetChildren()) do
				task.spawn(function()
					-- upvalues: (copy) v_u_81
					v_u_81.Massless = false
					v_u_81.CanCollide = true
				end)
			end
			v_u_10:StopAnimations(v_u_21, true)
			v_u_74.Force = Vector3.new(0, -2500, 0)
			v_u_75.Force = Vector3.new(0, -500, 0)
			v_u_73()
			v_u_16:FireServer({
				["Boolean"] = p76,
				["RagdollConstraints"] = v_u_28,
				["Torso"] = v_u_23,
				["Character"] = v_u_20,
				["RagdollHitBoxes"] = v_u_27
			})
		else
			if v_u_63 then
				v_u_63:Destroy()
				v_u_63 = nil
			end
			if v_u_71 then
				v_u_71:Disconnect()
				v_u_71 = nil
			end
			for _, v_u_82 in pairs(v_u_20:GetChildren()) do
				task.spawn(function()
					-- upvalues: (copy) v_u_82, (ref) v_u_18
					if v_u_82:IsA("BasePart") then
						if v_u_18.TeamColor == BrickColor.new("Really red") then
							v_u_82.CollisionGroupId = 6
							return
						end
						if v_u_82.Name == "HumanoidRootPart" then
							v_u_82.CollisionGroupId = 7
							return
						end
						v_u_82.CollisionGroupId = 9
					end
				end)
			end
			for _, v_u_83 in pairs(v_u_23:GetChildren()) do
				task.spawn(function()
					-- upvalues: (copy) v_u_83
					if v_u_83:IsA("Motor6D") then
						v_u_83.Enabled = true
					end
				end)
			end
			for _, v_u_84 in pairs(v_u_28:GetChildren()) do
				task.spawn(function()
					-- upvalues: (copy) v_u_84
					v_u_84.Enabled = false
				end)
			end
			for _, v_u_85 in pairs(v_u_27:GetChildren()) do
				task.spawn(function()
					-- upvalues: (copy) v_u_85
					v_u_85.Massless = true
					v_u_85.CanCollide = false
				end)
			end
			v_u_74.Force = Vector3.new(0, 0, 0)
			v_u_75.Force = Vector3.new(0, 0, 0)
			v_u_16:FireServer({
				["Boolean"] = p76,
				["RagdollConstraints"] = v_u_28,
				["Torso"] = v_u_23,
				["Character"] = v_u_20,
				["RagdollHitBoxes"] = v_u_27
			})
		end
	end
	local function v_u_90()
		-- upvalues: (copy) v_u_44, (ref) v_u_29, (copy) v_u_3, (copy) v_u_21, (copy) v_u_25, (copy) v_u_10, (copy) v_u_23, (copy) v_u_24, (copy) v_u_4, (copy) v_u_86, (copy) v_u_51, (copy) v_u_62
		local v87 = v_u_44()
		if v87 then
			v_u_29 = true
			if v_u_3.CurrentCamera.CameraSubject == v_u_21 then
				v_u_3.CurrentCamera.CameraSubject = v_u_25
			end
			v_u_21:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
			v_u_21.AutoRotate = false
			v_u_10:StopAnimations(v_u_21, true)
			v87.Animation:Play(0.2)
			local v88 = Instance.new("BodyVelocity")
			v88.Parent = v_u_23
			v88.Velocity = v_u_24.CFrame:VectorToWorldSpace(v87.Way) * v87.Amount
			v88.MaxForce = Vector3.new(9000000, 0, 9000000)
			v_u_4:AddItem(v88, 0.6)
			task.wait(0.6)
			local v89 = v_u_23.CFrame
			v87.Animation:Stop(0)
			v_u_24.CFrame = v89
			v_u_86(true)
			task.wait(0.8)
			v_u_51()
			v_u_86(false)
			v_u_62()
			v_u_21:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
			v_u_21.AutoRotate = true
			if v_u_3.CurrentCamera.CameraSubject == v_u_25 then
				v_u_3.CurrentCamera.CameraSubject = v_u_21
			end
			v_u_29 = false
		end
	end
	v_u_21.StateChanged:Connect(function(p91, p92)
		-- upvalues: (copy) v_u_21, (copy) v_u_1, (copy) v_u_2
		if p92 == Enum.HumanoidStateType.Physics then
			v_u_21.AutoRotate = false
			pcall(function()
				-- upvalues: (ref) v_u_1
				v_u_1.RotationType = Enum.RotationType.MovementRelative
			end)
		elseif p91 == Enum.HumanoidStateType.Physics then
			v_u_21.AutoRotate = true
			if v_u_2.MouseBehavior == Enum.MouseBehavior.LockCenter then
				pcall(function()
					-- upvalues: (ref) v_u_1
					v_u_1.RotationType = Enum.RotationType.CameraRelative
				end)
			end
		end
	end)
	function v14.OnInvoke()
		-- upvalues: (copy) v_u_21, (ref) v_u_29, (ref) v_u_30
		return (v_u_21:GetState() == Enum.HumanoidStateType.Physics or (v_u_29 or v_u_30)) and true or false
	end
	local v_u_93 = false
	v_u_15.Event:Connect(function(p94)
		-- upvalues: (ref) v_u_93, (copy) v_u_38, (copy) v_u_21, (ref) v_u_33, (ref) v_u_37, (copy) v_u_86, (copy) v_u_51, (copy) v_u_62, (ref) v_u_29, (ref) v_u_30, (copy) v_u_90
		if not v_u_93 then
			v_u_93 = true
			if p94.Type == "Trip" then
				if p94.Movement then
					v_u_38()
				end
				v_u_21:ChangeState(Enum.HumanoidStateType.Physics)
				if p94.Ragdoll then
					if p94.RagDelay then
						task.wait(p94.RagDelay)
					end
					if v_u_33 then
						v_u_33:Destroy()
						v_u_33 = nil
					end
					if v_u_37 then
						v_u_37:Disconnect()
						v_u_37 = nil
					end
					v_u_86(true)
				end
				if p94.Time then
					task.wait(p94.Time)
				end
				v_u_51()
				if p94.Ragdoll then
					v_u_86(false)
				end
				if v_u_33 then
					v_u_33:Destroy()
					v_u_33 = nil
				end
				if v_u_37 then
					v_u_37:Disconnect()
					v_u_37 = nil
				end
				v_u_62()
			elseif p94.Type == "UTrip" then
				if p94.Movement then
					v_u_38()
				end
				v_u_21:ChangeState(Enum.HumanoidStateType.Physics)
			elseif p94.Type == "Ankle" and (v_u_21:GetState() ~= Enum.HumanoidStateType.Physics and not (v_u_29 or v_u_30)) then
				v_u_90()
			end
			v_u_93 = false
		end
	end)
	v17.OnClientEvent:Connect(function(p95)
		-- upvalues: (copy) v_u_15
		v_u_15:Fire(p95)
	end)
	local v_u_96 = 0
	local v_u_97 = 19
	v_u_21:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		-- upvalues: (copy) v_u_21, (ref) v_u_97
		local v98 = v_u_21.WalkSpeed
		if v_u_97 <= v98 then
			v_u_97 = v_u_21.WalkSpeed
		elseif v98 < v_u_97 then
			task.wait((v_u_97 - v_u_21.WalkSpeed) / 10)
			if v_u_21.WalkSpeed == v98 then
				v_u_97 = v98
			end
		end
	end)
	local function v_u_100()
		-- upvalues: (copy) v_u_24, (copy) v_u_15, (copy) v_u_4
		if not v_u_24:FindFirstChild("Fly_Pos") then
			v_u_15:Fire({
				["Type"] = "Trip",
				["Ragdoll"] = true
			})
			local v99 = Instance.new("BodyVelocity")
			v99.MaxForce = Vector3.new(12500, 250, 12500)
			v99.P = 1500
			v99.Velocity = Vector3.new(0, 0, 0)
			v99.Parent = v_u_24
			v_u_4:AddItem(v99, 0.5)
		end
	end
	local function v_u_105()
		-- upvalues: (copy) v_u_24, (copy) v_u_21, (copy) v_u_4
		local v101 = v_u_24
		local v102 = v_u_24.Velocity.Y
		v101.Velocity = Vector3.new(0, v102, 0)
		local v103 = Instance.new("BodyVelocity")
		v103.MaxForce = Vector3.new(50000, 0, 50000)
		v103.P = 25000
		local v104 = v_u_21.MoveDirection * v_u_21.WalkSpeed
		v103.Velocity = Vector3.new(v104)
		v103.Parent = v_u_24
		v_u_4:AddItem(v103, 0.08)
	end
	local v_u_106 = false
	local v_u_107 = 0
	local v_u_108 = tick()
	local v_u_109 = 0
	local v_u_110 = tick()
	local function v_u_115()
		-- upvalues: (copy) v_u_24, (copy) v_u_21, (ref) v_u_29, (ref) v_u_30, (ref) v_u_106, (ref) v_u_108, (ref) v_u_107, (copy) v_u_100, (ref) v_u_110, (ref) v_u_109, (copy) v_u_11, (ref) v_u_97, (copy) v_u_105, (ref) v_u_96
		if v_u_24.Velocity.Y > 60 and (v_u_21:GetState() ~= Enum.HumanoidStateType.Physics and not (v_u_29 or (v_u_30 or v_u_106))) then
			v_u_106 = true
			if v_u_108 + 0.075 < tick() then
				v_u_108 = tick()
				v_u_107 = v_u_107 + 1
				task.delay(0.425, function()
					-- upvalues: (ref) v_u_107
					v_u_107 = v_u_107 - 1
				end)
			end
			if v_u_107 > 4 then
				v_u_100()
			end
			v_u_106 = false
		end
		if v_u_110 + 0.2 > tick() and (v_u_109 > 1 and (v_u_21:GetState() ~= Enum.HumanoidStateType.Physics and (not v_u_29 and (not v_u_30 and (v_u_11:GetSharedCooldown("BoostTrip") and v_u_11:CheckIfInAir(v_u_21)))))) then
			local v111 = v_u_24.Velocity.Y
			if math.abs(v111) > 50 then
				v_u_100()
			end
		end
		local v112 = v_u_24.Velocity.Magnitude
		local v113 = v_u_24.Velocity.Y
		local v114 = v112 - math.abs(v113)
		if v_u_11:GetSharedCooldown("BoostTrip") and (v_u_11:CheckIfInAir(v_u_21) and v_u_97 + 1 < v114) then
			v_u_100()
		end
		if v_u_97 + 1 <= v114 and (v_u_11:CheckIfInAir(v_u_21) or v_u_97 + 1.5 <= v114) and (v_u_21:GetState() ~= Enum.HumanoidStateType.Physics and not (v_u_29 or v_u_30) or v_u_97 + 26 <= v114) then
			if v_u_110 + 0.075 < tick() then
				v_u_110 = tick()
				v_u_109 = v_u_109 + 1
				task.delay(0.8, function()
					-- upvalues: (ref) v_u_109
					v_u_109 = v_u_109 - 1
				end)
			end
			if v_u_109 > 1 then
				v_u_105()
			end
		end
		v_u_96 = v_u_24.Velocity.Magnitude
	end
	local v_u_116 = false
	local function v_u_120()
		-- upvalues: (copy) v_u_22, (copy) v_u_24, (copy) v_u_18, (ref) v_u_116, (copy) v_u_12
		local v117 = RaycastParams.new()
		v117.FilterType = Enum.RaycastFilterType.Whitelist
		v117.IgnoreWater = true
		v117.FilterDescendantsInstances = { v_u_22 }
		local v118 = workspace:Raycast(v_u_24.CFrame.p - Vector3.new(0, -1, 0), Vector3.new(0, -2, 0), v117)
		if v118 then
			local v_u_119 = v118.Instance
			pcall(function()
				-- upvalues: (copy) v_u_119, (ref) v_u_18, (ref) v_u_116, (ref) v_u_24, (ref) v_u_12
				if v_u_119.NetworkOwner.Value ~= v_u_18 and (not v_u_119.Server.Value and (v_u_119.NetworkOwner.Value.Character and (not v_u_116 and (v_u_119.NetworkOwner.Value.Character.HumanoidRootPart.Position - v_u_24.Position).Magnitude < 15))) then
					v_u_116 = true
					task.wait(0.2)
					if v_u_119.NetworkOwner.Value ~= v_u_18 and not v_u_119.Server.Value then
						v_u_12:Speed({
							["Slowdown"] = 3,
							["ReturnTime"] = 1
						})
						task.wait(1.5)
						v_u_116 = false
						return
					end
					v_u_116 = false
				end
			end)
		end
	end
	local function v_u_124()
		-- upvalues: (copy) v_u_21, (copy) v_u_22, (copy) v_u_24, (copy) v_u_18, (copy) v_u_13
		if v_u_21:GetState() == Enum.HumanoidStateType.Running then
			local v121 = RaycastParams.new()
			v121.FilterType = Enum.RaycastFilterType.Whitelist
			v121.IgnoreWater = true
			v121.FilterDescendantsInstances = { v_u_22 }
			for v122 = -0.5, 0.5, 0.5 do
				local v123 = workspace:Raycast((v_u_24.CFrame * CFrame.new(v122, -1, 0)).Position, Vector3.new(0, -1, 0), v121)
				if v123 and (v123.Instance and v123.Instance.NetworkOwner.Value == v_u_18) then
					v_u_13:UnderPhysicsTweak(v123.Instance)
					return
				end
			end
		end
	end
	v5.Heartbeat:Connect(function()
		-- upvalues: (copy) v_u_115, (copy) v_u_120, (copy) v_u_124
		v_u_115()
		v_u_120()
		v_u_124()
	end)
	local v_u_125 = 0
	local function v_u_126()
		-- upvalues: (copy) v_u_21, (ref) v_u_125
		if v_u_21.JumpPower > 40 then
			v_u_125 = v_u_125 + 1
			if v_u_125 > 1 then
				-- vrftoprs: removed Humanoid WalkSpeed/JumpPower editor
				task.delay(4, function()
					-- upvalues: (ref) v_u_21
					-- vrftoprs: removed Humanoid WalkSpeed/JumpPower editor
					if v_u_21.JumpPower > 50 then
						-- vrftoprs: removed Humanoid WalkSpeed/JumpPower editor
					end
				end)
			end
			task.wait(4)
			v_u_125 = v_u_125 - 1
		end
	end
	local v_u_127 = tick()
	v_u_25.Touched:Connect(function(p_u_128)
		-- upvalues: (ref) v_u_127, (copy) v_u_126
		pcall(function()
			-- upvalues: (copy) p_u_128, (ref) v_u_127, (ref) v_u_126
			if p_u_128:IsA("Part") and p_u_128.Name == "Perius" then
				if v_u_127 + 0.5 <= tick() then
					v_u_127 = tick()
					v_u_126()
				end
			else
				return
			end
		end)
	end)
	local v_u_129 = 0
	local function v_u_130(_)
		-- upvalues: (copy) v_u_21, (ref) v_u_129
		if v_u_21.JumpPower > 35 then
			v_u_129 = v_u_129 + 1
			if v_u_129 > 3 then
				-- vrftoprs: removed Humanoid WalkSpeed/JumpPower editor
				task.delay(2.5, function()
					-- upvalues: (ref) v_u_21
					-- vrftoprs: removed Humanoid WalkSpeed/JumpPower editor
					if v_u_21.JumpPower > 50 then
						-- vrftoprs: removed Humanoid WalkSpeed/JumpPower editor
					end
				end)
			end
			task.wait(2.5)
			v_u_129 = v_u_129 - 1
		end
	end
	v_u_21.Jumping:Connect(function(p_u_131)
		-- upvalues: (copy) v_u_130
		pcall(function()
			-- upvalues: (copy) p_u_131, (ref) v_u_130
			if p_u_131 then
				v_u_130()
			end
		end)
	end)
	local v_u_132 = 0
	v_u_21.Touched:Connect(function(p133, _)
		-- upvalues: (ref) v_u_132, (copy) v_u_15
		if p133.Name == "Trip" and v_u_132 == 0 then
			v_u_132 = v_u_132 + 1
			local v134 = p133.Parent:FindFirstChild("Settings")
			if v134 then
				local v135 = v134:FindFirstChild("Trip")
				if v135 and v135.Value then
					v_u_132 = v_u_132 + 1
					v_u_15:Fire({
						["Type"] = "Trip",
						["Ragdoll"] = true
					})
					task.delay(1, function()
						-- upvalues: (ref) v_u_132
						v_u_132 = v_u_132 - 1
					end)
				end
			end
			v_u_132 = v_u_132 - 1
		end
	end)
	local v_u_136 = tick()
	v_u_21.StateChanged:Connect(function(p137, p138)
		-- upvalues: (ref) v_u_136, (copy) v_u_11, (copy) v_u_15
		if p138 == Enum.HumanoidStateType.Freefall then
			local v_u_139 = v_u_136
			v_u_136 = v_u_139
			local v140 = v_u_11:GetSharedCooldown("NoAirWalking") and 0.8 or 1.8
			task.delay(v140, function()
				-- upvalues: (ref) v_u_136, (copy) v_u_139, (ref) v_u_15
				if v_u_136 == v_u_139 then
					v_u_15:Fire({
						["Type"] = "Trip",
						["Ragdoll"] = true
					})
				end
			end)
		elseif p137 == Enum.HumanoidStateType.Freefall then
			v_u_136 = tick()
		end
	end)
end
