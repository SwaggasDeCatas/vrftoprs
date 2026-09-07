-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v_u_2 = game:GetService("Workspace")
local v3 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v4 = game:GetService("RunService")
local v_u_5 = game:GetService("Debris")
local v_u_6 = game:GetService("Players")
local v_u_7 = v_u_6.LocalPlayer
local v_u_8 = game:GetService("Workspace"):WaitForChild("Balls")
local v9 = v3:WaitForChild("Remotes")
local v10 = v3:WaitForChild("Storage")
local v_u_11 = v10:WaitForChild("Sounds")
local v_u_12 = v10:WaitForChild("Effects")
local v_u_13 = v9:WaitForChild("OwnershipRemovalRemote")
local v14 = v3:WaitForChild("PlayerData"):WaitForChild(v_u_7.UserId, 10)
if v14 == nil then
	v_u_7:Kick("Failed to fetch user data")
end
local v15 = v14:WaitForChild("Environment")
local v_u_16 = v15:WaitForChild("Sounds")
local v_u_17 = v15:WaitForChild("Pitch")
local v18 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules")
require(v18:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"))
local v_u_19 = {}
local v_u_20 = {
	["HomeNet"] = {
		["Region"] = Region3.new(Vector3.new(-19.836, 4.306, 395.076), Vector3.new(19.093, 19.007, 405.977)),
		["ActiveRegion"] = Region3.new(Vector3.new(-19.836, 4.306, 391.476), Vector3.new(19.093, 19.007, 405.977)),
		["BallList"] = {}
	},
	["AwayNet"] = {
		["Region"] = Region3.new(Vector3.new(-19.944, 4.309, -321.463), Vector3.new(18.987, 19.008, -310.44)),
		["ActiveRegion"] = Region3.new(Vector3.new(-19.944, 4.309, -321.463), Vector3.new(18.987, 19.008, -306.94)),
		["BallList"] = {}
	}
}
local function v_u_28(p_u_21)
	-- upvalues: (copy) v_u_20, (copy) v_u_2
	local v22 = false
	for _, v_u_23 in pairs(v_u_20) do
		local v_u_24 = tick()
		local v25 = v_u_23.Region
		if p_u_21.CollisionGroupId == 4 then
			v25 = v_u_23.ActiveRegion
		end
		local v26 = nil
		for _, v27 in pairs(v_u_2:FindPartsInRegion3(v25, nil, (1 / 0))) do
			if v27 == p_u_21 then
				v22 = true
				v26 = true
			end
			if v22 then
				break
			end
		end
		if not v22 then
			v26 = nil
		end
		v22 = false
		if v26 then
			if v_u_23.BallList[p_u_21] == nil then
				v_u_23.BallList[p_u_21] = {
					["DebounceTick"] = v_u_24
				}
				p_u_21.CollisionGroupId = 4
			elseif v_u_23.BallList[p_u_21].DebounceTick + 4 < tick() and p_u_21.CollisionGroupId == 4 then
				p_u_21.CollisionGroupId = 2
				v_u_23.BallList[p_u_21].DebounceTick = v_u_24
				task.delay(2, function()
					-- upvalues: (copy) v_u_23, (copy) p_u_21, (copy) v_u_24
					if v_u_23.BallList[p_u_21].DebounceTick == v_u_24 then
						v_u_23.BallList[p_u_21] = nil
					end
				end)
			end
		elseif v_u_23.BallList[p_u_21] and p_u_21.CollisionGroupId == 4 then
			p_u_21.CollisionGroupId = 2
			v_u_23.BallList[p_u_21] = nil
		end
	end
end
local v_u_29 = {}
function v1.UnderPhysicsTweak(_, p_u_30)
	-- upvalues: (copy) v_u_29
	if not v_u_29[p_u_30] then
		v_u_29[p_u_30] = true
		task.delay(0.05, function()
			-- upvalues: (ref) v_u_29, (copy) p_u_30
			v_u_29[p_u_30] = nil
		end)
	end
end
local v_u_31 = RaycastParams.new()
v_u_31.FilterType = Enum.RaycastFilterType.Exclude
v_u_31.IgnoreWater = true
v_u_31.RespectCanCollide = true
local function v_u_73(p32)
	-- upvalues: (copy) v_u_2, (copy) v_u_31
	local v33 = PhysicalProperties.new(0.7, 0.1, 0.91, 5, 6)
	local v34 = Vector3.new(0, 0, 0)
	local v35 = 0.9
	local v36 = p32.AssemblyAngularVelocity.X
	local v37 = math.abs(v36)
	local v38 = p32.AssemblyAngularVelocity.Z
	local v39 = v37 + math.abs(v38)
	local v40 = CFrame.new(p32.Position, p32.Position + p32.AssemblyLinearVelocity).rightVector
	local v41 = CFrame.new
	local v42 = p32.Position
	local v43 = p32.Position
	local v44 = p32.AssemblyLinearVelocity.X
	local v45 = p32.AssemblyLinearVelocity.Z
	local v46 = v41(v42, v43 + Vector3.new(v44, 0, v45)).upVector
	local v47 = v_u_2:Raycast(p32.Position + Vector3.new(0, -1, 0), Vector3.new(0, -1, 0), v_u_31)
	local v48 = v47 and v47.Instance and true or false
	local v49 = p32.AssemblyLinearVelocity.X
	local v50 = math.abs(v49)
	local v51 = p32.AssemblyLinearVelocity.Z
	if v50 + math.abs(v51) < 40 then
		return v33, v34, v35, v48
	end
	local v52 = p32.AssemblyLinearVelocity.Unit
	local v53 = v52.Z
	local v54 = -v52.X
	local v55
	--print((Vector3.new(v53, 0, v54) - p32.AssemblyAngularVelocity.Unit).Magnitude)
	if (Vector3.new(v53, 0, v54) - p32.AssemblyAngularVelocity.Unit).Magnitude > 1 then
		v55 = v34 + v46 * (-v39 * 0.7)
		v35 = v35 + 0.1
		if v55.Magnitude > 30 or p32.AssemblyAngularVelocity.Magnitude > 30 then
			v33 = PhysicalProperties.new(0.7, 0.1 + p32.AssemblyLinearVelocity.Magnitude / 500, 0.76, 5, 6)
		end
		if v48 then
			v55 = v55 * 0.5
		end
	else
		v55 = v34 + v46 * (v39 * 1.7)
		if v55.Magnitude > 80 or p32.AssemblyAngularVelocity.Magnitude > 80 then
			v33 = PhysicalProperties.new(0.7, 0.1, 0.76, 5, 6)
		end
		if v48 then
			v55 = v55 * 0.5
			v35 = v35 + 0.3
		end
	end
	if p32.AssemblyAngularVelocity.Magnitude < 20 then
		local v56 = p32.AssemblyLinearVelocity.X
		local v57 = math.abs(v56)
		local v58 = p32.AssemblyLinearVelocity.Z
		local v59 = v57 + math.abs(v58)
		if v39 < 10 and v59 > 100 then
			local v60 = v_u_2:Raycast(p32.Position + Vector3.new(0, -1, 0), Vector3.new(0, -6, 0), v_u_31)
			if not (v60 and v60.Instance) then
				local v61 = v59 ^ 1.3
				local v62 = math.noise(p32.Position.X / 15, p32.Position.Z / 15, tick() / 4) * (v59 / (5 + p32.AssemblyAngularVelocity.Magnitude))
				local v63 = math.clamp(v62, -0.6, 0.6) * v61
				v55 = v40 * math.clamp(v63, -400, 400)
			end
		end
		return v33, v55, v35, v48
	end
	if p32.AssemblyAngularVelocity.Magnitude < 40 then
		return v33, Vector3.new(0, 0, 0), v35, v48
	end
	local v64 = p32.AssemblyAngularVelocity.Y
	local v65 = p32.AssemblyLinearVelocity
	local v66 = v64 > 0
	local v67 = v64 / 6
	local v68 = math.abs(v67)
	local v69 = math.pow(v68, 1.2)
	local v70 = v65.Magnitude / 43
	local v71 = v69 * (math.pow(v70, 2) + 1)
	if v66 then
		v71 = -v71
	end
	local v72 = v65.Y / 175
	return v33, (v55 + v40 * (v71 / (math.abs(v72) + 1)) * 1.15) * 1.2, v35 + 0.2
end
local function v_u_110(p74)
	-- upvalues: (copy) v_u_73, (copy) v_u_29, (copy) v_u_7, (copy) v_u_28, (copy) v_u_17
	local v75 = p74.AssemblyLinearVelocity.X
	local v76 = math.clamp(v75, -80, 80)
	local v77 = p74.AssemblyLinearVelocity.Z
	local v78 = math.clamp(v77, -80, 80)
	local v79, v80, v81, v82 = v_u_73(p74, v76, v78)
	p74.CurvePower.Force = v80
	local v83 = p74.Stopper2
	local v84 = -v76
	local v85 = -v78
	v83.Force = Vector3.new(v84, 0, v85) * v81
	if v_u_29[p74] then
		v79 = PhysicalProperties.new(10, 0, 0, 10, 10)
	end
	p74.CustomPhysicalProperties = v79
	local v86 = (40 - (math.abs(v76) + math.abs(v78))) / 16
	local v87 = (v86 <= 1 or p74.AssemblyAngularVelocity.Magnitude < 15) and 1 or v86
	local v88 = p74.AssemblyAngularVelocity.Magnitude < 20 and 1.2 or 0.9
	if v82 then
		v88 = v88 + 1.75
		p74.CurvePower.Force = p74.CurvePower.Force / 1.75
	end
	local v89 = p74.Stopper
	local v90 = p74.AssemblyAngularVelocity.X
	local v91 = math.abs(v90)
	local v92 = p74.AssemblyAngularVelocity.Y
	local v93 = math.abs(v92)
	local v94 = p74.AssemblyAngularVelocity.Z
	local v95 = math.abs(v94)
	v89.MaxTorque = Vector3.new(v91, v93, v95) * (v88 + v87)
	if p74.NetworkOwner.Value == v_u_7 then
		v_u_28(p74)
	end
	local v96 = false
	for v97, v98 in pairs(p74:GetTouchingParts()) do
		if v97 == 1 and v98.Material == Enum.Material.Grass then
			v96 = true
			if p74.NetworkOwner.Value == v_u_7 and (p74:FindFirstChild("BodyVelocity") and (p74.BodyVelocity.Velocity.Unit.Y < 0 and p74.BodyVelocity.MaxForce.Y ~= 0)) then
				local v99 = p74.BodyVelocity
				local v100 = p74.BodyVelocity.MaxForce
				local v101 = p74.BodyVelocity.MaxForce.Y
				v99.MaxForce = v100 - Vector3.new(0, v101, 0)
			end
		end
	end
	if v_u_17.BEffects.Value then
		if v96 and p74.AssemblyLinearVelocity.Magnitude > 5 then
			p74.Effects.grass1.Rate = p74.AssemblyLinearVelocity.Magnitude * 2;
			p74.Effects.grass1.Enabled = true;
		else
			p74.Effects.grass1.Enabled = false;
		end;
		p74.Trail.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1), 
			NumberSequenceKeypoint.new(0.1, (math.clamp(1.05 - p74.AssemblyLinearVelocity.Magnitude / 1250, 0.975, 1))), 
			NumberSequenceKeypoint.new(1, 1)
		});
		if p74.AssemblyLinearVelocity.Magnitude - math.abs(p74.AssemblyLinearVelocity.Y) > 30 then
			p74.Wind.MaxDistance = p74.AssemblyLinearVelocity.Magnitude / 3.5;
			p74.Wind.Volume = p74.AssemblyLinearVelocity.Magnitude / 450;
		else
			p74.Wind.Volume = 0;
		end;
	end;
	if p74.NetworkOwner.Value == v_u_7 and p74.AssemblyLinearVelocity == Vector3.new() then
		p74:ApplyImpulse((Vector3.new(0, -0.10000000149011612, 0, 0)));
	end;
end
v4.Stepped:Connect(function()
	-- upvalues: (copy) v_u_19, (copy) v_u_110
	for v_u_111, _ in pairs(v_u_19) do
		pcall(function()
			-- upvalues: (ref) v_u_110, (copy) v_u_111
			v_u_110(v_u_111)
		end)
	end
end)
local function v_u_120(p112)
	local v113 = string.split(p112, "/")
	if not v113 or (not v113[1] or (not v113[2] or v113[3])) then
		return tonumber(p112)
	end
	table.sort(v113, function(p114, p115)
		return tonumber(p114) < tonumber(p115)
	end)
	local v116 = math.random
	local v117 = v113[1]
	local v118 = tonumber(v117) * 10
	local v119 = v113[2]
	return v116(v118, tonumber(v119) * 10) / 10
end
v_u_8.ChildAdded:Connect(function(p_u_121)
	-- upvalues: (copy) v_u_19, (copy) v_u_8, (copy) v_u_16, (copy) v_u_11, (copy) v_u_5, (copy) v_u_17, (copy) v_u_12, (copy) v_u_6, (copy) v_u_7, (copy) v_u_120, (copy) v_u_13
	v_u_19[p_u_121] = {
		["SoundDebounce"] = false,
		["VelocityDebounce"] = false,
		["ReflectDebounce"] = false
	}
	local v_u_122 = v_u_19[p_u_121]
	p_u_121.Touched:Connect(function(p_u_123)
		-- upvalues: (copy) p_u_121, (ref) v_u_8, (copy) v_u_122, (ref) v_u_16, (ref) v_u_11, (ref) v_u_5, (ref) v_u_17, (ref) v_u_12, (ref) v_u_6, (ref) v_u_7, (ref) v_u_120, (ref) v_u_13
		local v124 = false
		local v125 = false
		if p_u_121.Parent == v_u_8 then
			if p_u_123:CanCollideWith(p_u_121) then
				if p_u_121.AssemblyLinearVelocity.Magnitude >= 3 and not v_u_122.SoundDebounce then
					if p_u_123.Material == Enum.Material.Grass then
						if v_u_16.BSounds.Value then
							v_u_122.SoundDebounce = true
							local v126 = v_u_11.grass:Clone()
							local v127 = p_u_121.AssemblyLinearVelocity.Y
							v126.Volume = math.abs(v127) / 60 + 0.08
							local v128 = p_u_121.AssemblyLinearVelocity.Y
							v126.MaxDistance = math.abs(v128) * 1.2 + 10
							local v129 = 1.3 + math.random(0, 300) / 1000
							local v130 = p_u_121.AssemblyLinearVelocity.Y
							v126.PlaybackSpeed = v129 + math.abs(v130) / 100
							v126.Parent = p_u_121
							v126:Play()
							v_u_5:AddItem(v126, 0.5)
							task.delay(0.05, function()
								-- upvalues: (ref) v_u_122
								v_u_122.SoundDebounce = false
							end)
						end
						if v_u_17.BEffects.Value then
							local v131 = p_u_121.AssemblyLinearVelocity.Y
							if math.abs(v131) >= 20 then
								local v_u_132 = v_u_12.grasspump:Clone()
								local v133 = p_u_121.AssemblyLinearVelocity.Y
								v_u_132.Rate = math.abs(v133) * 8 + 10
								v_u_132.Speed = NumberRange.new(3, 5)
								v_u_132.Parent = p_u_121.Effects
								task.delay(0.05, function()
									-- upvalues: (copy) v_u_132
									v_u_132.Enabled = false
									task.wait(1)
									v_u_132:Destroy()
								end)
							end
						end
					elseif p_u_123.Name == "Net" then
						if not v_u_122.VelocityDebounce then
							v_u_122.VelocityDebounce = true
							p_u_121.AssemblyLinearVelocity = p_u_121.AssemblyLinearVelocity / 1.5
							p_u_121.AssemblyAngularVelocity = p_u_121.AssemblyAngularVelocity / 3
							task.delay(0.01, function()
								-- upvalues: (ref) v_u_122
								v_u_122.VelocityDebounce = false
							end)
						end
						v124 = true
						if v_u_16.BSounds.Value then
							--v_u_122.SoundDebounce = true
							--local v134 = v_u_11.net:Clone()
							--local v135 = p_u_121.AssemblyLinearVelocity.Magnitude
							--v134.Volume = math.abs(v135) / 180 + 0.2
							--v134.MaxDistance = 75 + p_u_121.AssemblyLinearVelocity.Magnitude * 1.2
							--v134.PlaybackSpeed = 0.95 + math.random(0, 1500) / 10000
							--v134.Parent = p_u_123
							--v134:Play()
							--v_u_5:AddItem(v134, 1)
							--task.delay(0.05, function()
							--	-- upvalues: (ref) v_u_122
							--	v_u_122.SoundDebounce = false
							--end)
						end
					elseif p_u_123.Name == "Post" or p_u_123.Name == "CrossBar" then
						v124 = true
						if v_u_16.BSounds.Value then
							v_u_122.SoundDebounce = true
							local v136 = v_u_11.posthit:Clone()
							local v137 = p_u_121.AssemblyLinearVelocity.Magnitude
							v136.Volume = math.abs(v137) / 180 + 0.05
							v136.MaxDistance = 100 + p_u_121.AssemblyLinearVelocity.Magnitude * 1.25
							v136.PlaybackSpeed = 6.6 + math.random(0, 400) / 1000 + p_u_121.AssemblyLinearVelocity.Magnitude / 60
							v136.Parent = p_u_123
							v136:Play()
							v_u_5:AddItem(v136, 0.6)
							task.delay(0.05, function()
								-- upvalues: (ref) v_u_122
								v_u_122.SoundDebounce = false
							end)
						end
					end
				end
				if p_u_123.Material ~= Enum.Material.Grass and not (v_u_6:GetPlayerFromCharacter(p_u_123.Parent) or v124) then
					v125 = true
					if not v_u_122.VelocityDebounce then
						v_u_122.VelocityDebounce = true
						p_u_121.AssemblyLinearVelocity = p_u_121.AssemblyLinearVelocity / 1.25
						p_u_121.AssemblyAngularVelocity = p_u_121.AssemblyAngularVelocity / 1.25
						task.delay(0.01, function()
							-- upvalues: (ref) v_u_122
							v_u_122.VelocityDebounce = false
						end)
					end
				end
			end
			if p_u_121.NetworkOwner.Value == v_u_7 then
				if v124 then
					local v138 = p_u_121:FindFirstChildOfClass("BodyVelocity")
					if v138 then
						v138:Destroy()
					end
				elseif v125 then
					local v_u_139 = p_u_121:FindFirstChildOfClass("BodyVelocity")
					if v_u_139 and not v_u_122.ReflectDebounce then
						v_u_122.ReflectDebounce = true
						local v_u_140 = v_u_139.Velocity
						local v_u_141 = v_u_139.MaxForce
						v_u_139.MaxForce = Vector3.new(0, 0, 0)
						v_u_139.Velocity = Vector3.new(0, 0, 0)
						task.spawn(function()
							-- upvalues: (ref) v_u_122, (copy) v_u_139, (ref) p_u_121, (copy) v_u_140, (copy) v_u_141
							task.delay(0.05, function()
								-- upvalues: (ref) v_u_122
								v_u_122.ReflectDebounce = false
							end)
							v_u_139.Velocity = p_u_121.AssemblyLinearVelocity.Unit * v_u_140.Magnitude / 1.5
							v_u_139.MaxForce = v_u_141
						end)
					end
				end
				if p_u_123.Name == "Pusher" and (p_u_121.NetworkOwner and (p_u_121.Welded and not p_u_121.Welded.Value)) then
					local v_u_142 = p_u_121
					pcall(function()
						-- upvalues: (copy) v_u_142, (copy) p_u_123, (ref) v_u_120, (ref) v_u_5, (ref) v_u_13
						local v_u_143 = not v_u_142:FindFirstChild("PusherVelocity") and p_u_123.Parent:FindFirstChild("Settings")
						if v_u_143 then
							local v144 = v_u_142:FindFirstChild("BodyVelocity")
							if v144 then
								v144:Destroy()
							end
							local v145 = Instance.new("BodyVelocity")
							v145.Name = "PusherVelocity"
							v145.Parent = v_u_142
							local v146 = v_u_143.LookVec.CFrame
							local v147 = CFrame.fromOrientation
							local v148 = v_u_120(v_u_143.UAngle.Value)
							local v149 = math.rad(v148)
							local v150 = v_u_120(v_u_143.SAngle.Value)
							v145.Velocity = (v146 * v147(v149, math.rad(v150), 0)).lookVector * v_u_120(v_u_143.Power.Value)
							v145.MaxForce = Vector3.new(400000, 400000, 400000)
							v_u_5:AddItem(v145, 0.3)
							task.delay(0.3, function()
								-- upvalues: (copy) v_u_143, (ref) v_u_13, (ref) v_u_142
								if not v_u_143.Ownership.Value then
									v_u_13:FireServer(v_u_142)
								end
							end)
						end
					end)
				end
			end
		end
	end)
end)
v_u_8.ChildRemoved:Connect(function(p151)
	-- upvalues: (copy) v_u_19
	v_u_19[p151] = nil
end)
for _, v_u_152 in pairs(v_u_8:GetChildren()) do
	if not v_u_19[v_u_152] then
		v_u_19[v_u_152] = {
			["SoundDebounce"] = false,
			["VelocityDebounce"] = false,
			["ReflectDebounce"] = false
		}
		local v_u_153 = v_u_19[v_u_152]
		v_u_152.Touched:Connect(function(p_u_154)
			-- upvalues: (copy) v_u_152, (copy) v_u_8, (copy) v_u_153, (copy) v_u_16, (copy) v_u_11, (copy) v_u_5, (copy) v_u_17, (copy) v_u_12, (copy) v_u_6, (copy) v_u_7, (copy) v_u_120, (copy) v_u_13
			local v155 = false
			local v156 = false
			if v_u_152.Parent == v_u_8 then
				if p_u_154:CanCollideWith(v_u_152) then
					if v_u_152.AssemblyLinearVelocity.Magnitude >= 3 and not v_u_153.SoundDebounce then
						if p_u_154.Material == Enum.Material.Grass then
							if v_u_16.BSounds.Value then
								v_u_153.SoundDebounce = true
								local v157 = v_u_11.grass:Clone()
								local v158 = v_u_152.AssemblyLinearVelocity.Y
								v157.Volume = math.abs(v158) / 60 + 0.08
								local v159 = v_u_152.AssemblyLinearVelocity.Y
								v157.MaxDistance = math.abs(v159) * 1.2 + 10
								local v160 = 1.3 + math.random(0, 300) / 1000
								local v161 = v_u_152.AssemblyLinearVelocity.Y
								v157.PlaybackSpeed = v160 + math.abs(v161) / 100
								v157.Parent = v_u_152
								v157:Play()
								v_u_5:AddItem(v157, 0.5)
								task.delay(0.05, function()
									-- upvalues: (ref) v_u_153
									v_u_153.SoundDebounce = false
								end)
							end
							if v_u_17.BEffects.Value then
								local v162 = v_u_152.AssemblyLinearVelocity.Y
								if math.abs(v162) >= 20 then
									local v_u_163 = v_u_12.grasspump:Clone()
									local v164 = v_u_152.AssemblyLinearVelocity.Y
									v_u_163.Rate = math.abs(v164) * 8 + 10
									v_u_163.Speed = NumberRange.new(3, 5)
									v_u_163.Parent = v_u_152.Effects
									task.delay(0.05, function()
										-- upvalues: (copy) v_u_163
										v_u_163.Enabled = false
										task.wait(1)
										v_u_163:Destroy()
									end)
								end
							end
						elseif p_u_154.Name == "Net" then
							if not v_u_153.VelocityDebounce then
								v_u_153.VelocityDebounce = true
								v_u_152.AssemblyLinearVelocity = v_u_152.AssemblyLinearVelocity / 1.5
								v_u_152.AssemblyAngularVelocity = v_u_152.AssemblyAngularVelocity / 3
								task.delay(0.01, function()
									-- upvalues: (ref) v_u_153
									v_u_153.VelocityDebounce = false
								end)
							end
							v155 = true
							if v_u_16.BSounds.Value then
								--v_u_153.SoundDebounce = true
								--local v165 = v_u_11.net:Clone()
								--local v166 = v_u_152.AssemblyLinearVelocity.Magnitude
								--v165.Volume = math.abs(v166) / 180 + 0.2
								--v165.MaxDistance = 75 + v_u_152.AssemblyLinearVelocity.Magnitude * 1.2
								--v165.PlaybackSpeed = 0.95 + math.random(0, 1500) / 10000
								--v165.Parent = p_u_154
								--v165:Play()
								--v_u_5:AddItem(v165, 1)
								--task.delay(0.05, function()
								--	-- upvalues: (ref) v_u_153
								--	v_u_153.SoundDebounce = false
								--end)
							end
						elseif p_u_154.Name == "Post" or p_u_154.Name == "CrossBar" then
							v155 = true
							if v_u_16.BSounds.Value then
								v_u_153.SoundDebounce = true
								local v167 = v_u_11.posthit:Clone()
								local v168 = v_u_152.AssemblyLinearVelocity.Magnitude
								v167.Volume = math.abs(v168) / 180 + 0.05
								v167.MaxDistance = 100 + v_u_152.AssemblyLinearVelocity.Magnitude * 1.25
								v167.PlaybackSpeed = 6.6 + math.random(0, 400) / 1000 + v_u_152.AssemblyLinearVelocity.Magnitude / 60
								v167.Parent = p_u_154
								v167:Play()
								v_u_5:AddItem(v167, 0.6)
								task.delay(0.05, function()
									-- upvalues: (ref) v_u_153
									v_u_153.SoundDebounce = false
								end)
							end
						end
					end
					if p_u_154.Material ~= Enum.Material.Grass and not (v_u_6:GetPlayerFromCharacter(p_u_154.Parent) or v155) then
						v156 = true
						if not v_u_153.VelocityDebounce then
							v_u_153.VelocityDebounce = true
							v_u_152.AssemblyLinearVelocity = v_u_152.AssemblyLinearVelocity / 1.25
							v_u_152.AssemblyAngularVelocity = v_u_152.AssemblyAngularVelocity / 1.25
							task.delay(0.01, function()
								-- upvalues: (ref) v_u_153
								v_u_153.VelocityDebounce = false
							end)
						end
					end
				end
				if v_u_152.NetworkOwner.Value == v_u_7 then
					if v155 then
						local v169 = v_u_152:FindFirstChildOfClass("BodyVelocity")
						if v169 then
							v169:Destroy()
						end
					elseif v156 then
						local v_u_170 = v_u_152:FindFirstChildOfClass("BodyVelocity")
						if v_u_170 and not v_u_153.ReflectDebounce then
							v_u_153.ReflectDebounce = true
							local v_u_171 = v_u_170.Velocity
							local v_u_172 = v_u_170.MaxForce
							v_u_170.MaxForce = Vector3.new(0, 0, 0)
							v_u_170.Velocity = Vector3.new(0, 0, 0)
							task.spawn(function()
								-- upvalues: (ref) v_u_153, (copy) v_u_170, (ref) v_u_152, (copy) v_u_171, (copy) v_u_172
								task.delay(0.05, function()
									-- upvalues: (ref) v_u_153
									v_u_153.ReflectDebounce = false
								end)
								v_u_170.Velocity = v_u_152.AssemblyLinearVelocity.Unit * v_u_171.Magnitude / 1.5
								v_u_170.MaxForce = v_u_172
							end)
						end
					end
					if p_u_154.Name == "Pusher" and (v_u_152.NetworkOwner and (v_u_152.Welded and not v_u_152.Welded.Value)) then
						local v_u_173 = v_u_152
						pcall(function()
							-- upvalues: (copy) v_u_173, (copy) p_u_154, (ref) v_u_120, (ref) v_u_5, (ref) v_u_13
							local v_u_174 = not v_u_173:FindFirstChild("PusherVelocity") and p_u_154.Parent:FindFirstChild("Settings")
							if v_u_174 then
								local v175 = v_u_173:FindFirstChild("BodyVelocity")
								if v175 then
									v175:Destroy()
								end
								local v176 = Instance.new("BodyVelocity")
								v176.Name = "PusherVelocity"
								v176.Parent = v_u_173
								local v177 = v_u_174.LookVec.CFrame
								local v178 = CFrame.fromOrientation
								local v179 = v_u_120(v_u_174.UAngle.Value)
								local v180 = math.rad(v179)
								local v181 = v_u_120(v_u_174.SAngle.Value)
								v176.Velocity = (v177 * v178(v180, math.rad(v181), 0)).lookVector * v_u_120(v_u_174.Power.Value)
								v176.MaxForce = Vector3.new(400000, 400000, 400000)
								v_u_5:AddItem(v176, 0.3)
								task.delay(0.3, function()
									-- upvalues: (copy) v_u_174, (ref) v_u_13, (ref) v_u_173
									if not v_u_174.Ownership.Value then
										v_u_13:FireServer(v_u_173)
									end
								end)
							end
						end)
					end
				end
			end
		end)
	end
end
return v1
