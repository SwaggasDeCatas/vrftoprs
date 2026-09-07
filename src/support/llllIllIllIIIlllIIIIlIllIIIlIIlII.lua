-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {}
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("ContextActionService")
local v_u_4 = v2:WaitForChild("Remotes")
local v5 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules")
local v_u_6 = require(v5:WaitForChild("IlllIIlIIIIlllIlIlIIllllIllllIllI"))
local v_u_7 = require(v5:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"))
local v_u_8 = require(v5:WaitForChild("lllIllllIlIlIlIIIlIllIIlIIlllllII"))
game:GetService("Debris")
local v9 = game:GetService("Workspace")
local v_u_10 = game:GetService("CollectionService")
local v_u_11 = game:GetService("TweenService")
local v_u_12 = game:GetService("UserInputService")
local v_u_13 = game:GetService("RunService")
local v_u_14 = game:GetService("Players")
local v_u_15 = v_u_14.LocalPlayer
local v_u_16 = v9.CurrentCamera
local v_u_17 = v9:WaitForChild("Balls")
local v18 = v_u_15:WaitForChild("PlayerGui"):WaitForChild("Start", 10):WaitForChild("Frame")
local v_u_19 = v18:WaitForChild("PowerBar")
local v_u_20 = v_u_19:WaitForChild("PB")
local v_u_21 = v_u_19:WaitForChild("PP")
local v_u_22 = v18:WaitForChild("AngleBar")
local v_u_23 = v_u_22:WaitForChild("AB")
local v_u_24 = v18:WaitForChild("SixSecond")
local v_u_25 = {}
local function v_u_26()
	return false
end
local v_u_27 = v_u_4:WaitForChild("FallClientRemote")
local v_u_28 = v_u_4:WaitForChild("TripRemote")
local v_u_29 = v_u_4:WaitForChild("PullRemote")
local v_u_31 = v_u_4:WaitForChild("CatchRemote")
local v_u_32 = v_u_4:WaitForChild("DropRemote")
local v33 = v2:WaitForChild("PlayerData"):WaitForChild(v_u_15.UserId)
local v_u_34 = v33:WaitForChild("Environment"):WaitForChild("UI"):WaitForChild("PowerPercentage")
local v_u_35 = v33:WaitForChild("Environment"):WaitForChild("UI"):WaitForChild("AngleBar")
local v_u_36 = v33:WaitForChild("Environment"):WaitForChild("Gameplay"):WaitForChild("AngleOffset")
local v_u_37 = v33:WaitForChild("Environment"):WaitForChild("Gameplay"):WaitForChild("AngleMultiplier")
local v_u_38 = v33:WaitForChild("Environment"):WaitForChild("Colors"):WaitForChild("MainColor")
v33:WaitForChild("Environment"):WaitForChild("Colors"):WaitForChild("SecondColor")
local v_u_39 = v33:WaitForChild("Environment"):WaitForChild("Debug"):WaitForChild("Prints")
function v_u_1.DebugPrint(_, _)
	-- upvalues: (copy) v_u_39
	local _ = v_u_39.Value
end
function v_u_1.NullVectorCheck(_, p40)
	return p40 ~= p40 and Vector3.new(0, 0, 0) or p40
end
function v_u_1.GetXZMag(_, p41, p42)
	local v43 = p41.X
	local v44 = p41.Z
	local v45 = Vector3.new(v43, 0, v44)
	local v46 = p42.X
	local v47 = p42.Z
	return (v45 - Vector3.new(v46, 0, v47)).Magnitude
end
function v_u_1.ConvertKey(_, p48)
	if string.sub(p48, 1, 4) == "UIT_" then
		return Enum.UserInputType[string.sub(p48, 5)]
	else
		return Enum.KeyCode[p48]
	end
end
local v_u_49 = {
	[Enum.UserInputType.MouseButton1] = true,
	[Enum.UserInputType.MouseButton2] = true,
	[Enum.UserInputType.MouseButton3] = true,
	[Enum.UserInputType.MouseWheel] = true
}
function v_u_1.IsKeyDown(_, p50)
	-- upvalues: (copy) v_u_12, (copy) v_u_49
	if v_u_12.TouchEnabled then
		return p50 == "Clicked"
	else
		return p50.UserInputType == Enum.UserInputType.Keyboard and v_u_12:IsKeyDown(p50.KeyCode) and true or (v_u_49[p50.UserInputType] and v_u_12:IsMouseButtonPressed(p50.UserInputType) and true or ((v_u_12:IsNavigationGamepad(p50.UserInputType) or v_u_12:IsGamepadButtonDown(p50.UserInputType, p50.KeyCode)) and true or false))
	end
end
local v_u_51 = {
	["Tick"] = 0
}
function v_u_1.DelayQueue(_, p52, p53, p54)
	-- upvalues: (ref) v_u_51
	v_u_51 = {
		["Move"] = p52,
		["MoveName"] = p53,
		["Key"] = p54,
		["Tick"] = tick()
	}
end
function v_u_1.PlayQueue(_)
	-- upvalues: (ref) v_u_51
	if v_u_51.Tick + 0.1 > tick() then
		task.spawn(function()
			-- upvalues: (ref) v_u_51
			v_u_51.Move(v_u_51.MoveName, Enum.UserInputState.Begin, v_u_51.Key)
		end)
	end
end
local v_u_55 = {}
local v_u_56 = {
	["Move"] = nil
}
function v_u_1.DelayReleaseQueue(_, p57, p58, p59)
	-- upvalues: (ref) v_u_56
	v_u_56 = {
		["Move"] = p57,
		["Priority"] = p58,
		["KeyState"] = p59
	}
end
function v_u_1.CheckDebounce2(_, p60)
	-- upvalues: (copy) v_u_55
	return v_u_55[p60]
end
function v_u_1.CheckDebounce(_, p61)
	-- upvalues: (copy) v_u_55
	local v62 = p61 == nil and 1 or p61
	local v63 = v62
	local v64 = false
	local v65 = nil
	for v66, v67 in pairs(v_u_55) do
		if v62 < v66 and v67 then
			v64 = true
			v65 = false
		end
		if v64 then
			break
		end
	end
	return (v64 and not v65 and true or false) and true or v_u_55[v63]
end
function v_u_1.PlayReleaseQueue(_, p68)
	-- upvalues: (ref) v_u_56
	if v_u_56.Move ~= nil and v_u_56.Priority == p68 then
		task.spawn(function()
			-- upvalues: (ref) v_u_56
			local v69 = v_u_56.KeyState or Enum.UserInputState.End
			v_u_56.Move("Delayed", v69)
		end)
		v_u_56.Move = nil
		return true
	end
end
function v_u_1.SetDebounce(_, p70, p71, p72)
	-- upvalues: (copy) v_u_55, (copy) v_u_1
	local v73 = p71 == nil and 1 or p71
	if p70 then
		v_u_55[v73] = true
	else
		if not p72 then
			v_u_1:PlayReleaseQueue(v73)
		end
		v_u_55[v73] = false
	end
end
function v_u_1.MinMaxValue(_, v101, v102, v103)
	local l_v101_0 = v101;
	if v102 < l_v101_0 then
		return v102;
	else
		if l_v101_0 < v103 then
			l_v101_0 = v103;
		end;
		return l_v101_0;
	end;
end
function v_u_1.CheckHold(_)
	-- upvalues: (copy) v_u_15
	local v77 = v_u_15.Character
	if v77 and not v77:FindFirstChild("LocalBWeld") then
		return true
	end
end
function v_u_1.CheckState(_)
	-- upvalues: (copy) v_u_26, (copy) v_u_1
	if not v_u_26() and v_u_1:CheckHold() then
		return true
	end
end
function v_u_1.GetLimbs(_, p78, p79)
	task.wait(0.1)
	local v80 = {}
	for _, v81 in pairs(p78:GetChildren()) do
		if p79:GetLimb(v81) ~= Enum.Limb.Unknown or v81.Name == "HumanoidRootPart" then
			v80[v81.Name] = v81
		end
	end
	return v80
end
function v_u_1.GetLegSwitch(_)
	-- upvalues: (copy) v_u_15
	return v_u_15.PlayerScripts:WaitForChild("LegSwitch")
end
function v_u_1.GetSpinType(_)
	-- upvalues: (copy) v_u_15
	return v_u_15.PlayerScripts:WaitForChild("Spin").Value
end
function v_u_1.CheckIfPlayer(_, p82)
	-- upvalues: (copy) v_u_14, (copy) v_u_15
	local v83 = v_u_14:GetPlayerFromCharacter(p82.Parent)
	if v83 and v83 ~= v_u_15 then
		return v83
	end
end
local function v87(v79, v80) --[[ Line: 238 ]]
	local v81 = {};
	for _, v83 in pairs(v79:GetTouchingParts()) do
		if v_u_1:CheckIfPlayer(v83) and v83.Name ~= "Right Arm" and v83.Name ~= "Left Arm" then
			table.insert(v81, v83);
		end;
	end;
	local l_v8_XZMag_0 = v_u_1:GetXZMag((v79.CFrame * CFrame.new(0, v79.Size.Y / 2, 0)).p, (v79.CFrame * CFrame.new(0, -v79.Size.Y / 2, 0)).p);
	for _, v86 in pairs(v81) do
		if v_u_1:GetXZMag(v86.Position, v80.Position) > 1.4 and (not (v_u_1:GetXZMag(v86.Position, v79.Position) >= 1) or v_u_1:GetXZMag(v86.Position, v79.Position) < v_u_1:GetXZMag(v79.Position, v80.Position) + l_v8_XZMag_0 / 2) then
			return false;
		end;
	end;
	return true;
end;
local v_u_108 = false
local v_u_109 = {
	["Tick"] = tick(),
	["Target"] = nil
}
function v_u_1.ReactBallCheck(_, p110, p111, p112, p113)
	-- upvalues: (copy) v_u_107, (copy) v_u_10, (copy) v_u_3, (copy) v_u_1, (copy) v_u_17, (copy) v_u_15, (ref) v_u_109, (ref) v_u_108, (copy) v_u_7
	if p111.Locked == false and (p111.Anchored == false and (p111.Name == "Perius" and (p111.Welded.Value == false and (p110.Position - p111.Position).magnitude < 4.25))) then
		if (p110.Position - p112).magnitude < 3.75 then
			if not (p110.Name ~= "Head" and p110.Name ~= "Torso") or v87(p110, p111) then
				if v_u_10:HasTag(p111, "BtP") then
					local l_StringValue_2 = Instance.new("StringValue");
					l_StringValue_2.Parent = v_u_3;
					v_u_10:AddTag(l_StringValue_2, "BtPCom");
					l_StringValue_2:Destroy();
				end;
				return true;
			end;
		else
			local l_StringValue_3 = Instance.new("StringValue");
			l_StringValue_3.Parent = v_u_3;
			v_u_10:AddTag(l_StringValue_3, "BrPCom");
			l_StringValue_3:Destroy();
			return;
		end;
	end
	local v116 = p110.Name ~= "Head" and (p110.Name ~= "Torso" and (v_u_1:GetXZMag(p110.Position, p111.Position) < 8 and v_u_1:CheckIfPlayer(p111)))
	if v116 then
		local v117 = false
		for _, v118 in pairs(v_u_17:GetChildren()) do
			if v118:IsA("Part") and (v118.Name == "Perius" and v118.NetworkOwner.Value == v_u_15) then
				local v119 = v118.Position
				local v120 = v118.Position.Y
				local v121 = v119 - Vector3.new(0, v120, 0)
				local v122 = p110.Position
				local v123 = p110.Position.Y
				if (v121 - (v122 - Vector3.new(0, v123, 0))).Magnitude < 10 then
					v117 = true
					break
				end
			end
		end
		if not v117 then
			if v_u_109.Target ~= v116 or v_u_109.Tick + 1 < tick() then
				v_u_109 = {
					["Tick"] = tick(),
					["Target"] = v116
				}
			end
			if not v_u_108 and (v_u_109.Tick + 0.3 < tick() and v_u_109.Target == v116) then
				v_u_108 = true
				v_u_109.Tick = tick() - 0.3
				local v_u_124 = p113 and p113.LowPen and 0.4 or 1
				task.spawn(function()
					-- upvalues: (ref) v_u_7, (copy) v_u_124, (ref) v_u_108
					v_u_7:Speed({
						["Slowdown"] = v_u_124,
						["ReturnTime"] = 1
					})
					task.wait(0.6)
					v_u_108 = false
				end)
				return false
			end
		end
	end
end
local function v_u_128(p125, p126)
	-- upvalues: (ref) v_u_25
	local v_u_127 = Instance.new("AngularVelocity")
	v_u_127.RelativeTo = Enum.ActuatorRelativeTo.World
	v_u_127.Attachment0 = p125.Middle
	v_u_127.AngularVelocity = p126
	v_u_127.MaxTorque = 1000000
	v_u_127.Enabled = true
	v_u_127.Parent = p125
	v_u_25[v_u_127] = true
	task.delay(0.1, function()
		-- upvalues: (ref) v_u_25, (copy) v_u_127
		v_u_25[v_u_127] = nil
		v_u_127.Enabled = false
	end)
end
local v_u_129 = false
local function v_u_133(p_u_130, p_u_131)
	-- upvalues: (copy) v_u_4, (ref) v_u_129
	local v132, _ = pcall(function()
		-- upvalues: (ref) v_u_4, (copy) p_u_130, (copy) p_u_131, (ref) v_u_129
		v_u_4.ReactRemote:InvokeServer(p_u_130, p_u_131)
		task.delay(0.5, function()
			-- upvalues: (ref) v_u_129
			v_u_129 = false
		end)
		return true
	end)
	if not v132 and v_u_129 then
		task.delay(1, function()
			-- upvalues: (ref) v_u_129
			v_u_129 = false
		end)
	end
end
function v_u_1.ServerReact(_, p134, p135)
	-- upvalues: (copy) v_u_15, (copy) v_u_8, (ref) v_u_129, (copy) v_u_133
	if p134.Ball.Anchored or not p134.Ball.CanCollide then
		return false
	end
	if p134.Ball.NetworkOwner.Value == v_u_15 then
		v_u_8:HitBall(p134.Ball, p134)
		return true
	end
	if v_u_129 then
		return false
	end
	v_u_8:HitBall(p134.Ball, p134)
	local v136
	if p134.GK then
		p134.Ball.CanCollide = false
		p134.Ball.Anchored = true
		v136 = true
	else
		v136 = false
	end
	v_u_129 = true
	p134.Count = p134.Ball.Count.Value
	p134.Tick = workspace:GetServerTimeNow()
	v_u_133(p134, p135)
	if v136 then
		p134.Ball.CanCollide = true
		p134.Ball.Anchored = false
	end
	return true
end
function v_u_1.ClientReact(_, p137)
	-- upvalues: (ref) v_u_25, (copy) v_u_128
	local v138 = p137.Ball
	if v138 and (not v138.Anchored and v138.CanCollide) then
		if v138:FindFirstChild("BodyVelocity") then
			v138.BodyVelocity:Destroy()
		end
		if v138:FindFirstChild("ServerBodyVelocity") then
			v138.ServerBodyVelocity:Destroy()
		end
		local v_u_139 = Instance.new("BodyVelocity")
		v_u_139.Parent = v138
		v_u_139.Velocity = p137.Velocity
		v_u_139.MaxForce = p137.MaxForce
		v_u_25[v_u_139] = true
		task.delay(p137.Time, function()
			-- upvalues: (copy) v_u_139, (ref) v_u_25
			if v_u_139 or v_u_139.Parent then
				v_u_25[v_u_139] = nil
				v_u_139:Destroy()
			end
		end)
		if p137.Spin ~= nil then
			v_u_128(v138, p137.Spin)
		end
	end
end
function v_u_1.ComboReset(_, p140)
	for _, v141 in pairs(p140) do
		v141.Used = false
	end
end
function CheckOverlay(p142, p143)
	for _, v144 in pairs(p143) do
		if v144 == p142 then
			return true
		end
	end
end
function v_u_1.InputCombo(_, p145, p146, p147)
	if p146 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end
	for v148, v149 in pairs(p147) do
		if p145 == v148 then
			v149.Used = true
		elseif not (v149.Overlay and CheckOverlay(p145, v149.Overlay)) then
			v149.Used = false
		end
	end
	return Enum.ContextActionResult.Sink
end
function v_u_1.ActivateReact(_, p_u_150)
	-- upvalues: (copy) v_u_13
	v_u_13.Stepped:Wait()
	local v151 = {}
	for _, v_u_152 in pairs(p_u_150.ReactLimbs) do
		v151[v_u_152] = {
			["Touched"] = v_u_152.Touched:Connect(function(p153)
				-- upvalues: (copy) p_u_150, (copy) v_u_152
				p_u_150.ReactFunc(v_u_152, p153)
			end),
			["ReactLoop"] = v_u_13.Stepped:Connect(function()
				-- upvalues: (copy) v_u_152, (copy) p_u_150
				for _, v_u_154 in pairs(v_u_152:GetTouchingParts()) do
					task.spawn(function()
						-- upvalues: (ref) p_u_150, (ref) v_u_152, (copy) v_u_154
						p_u_150.ReactFunc(v_u_152, v_u_154)
					end)
				end
			end)
		}
	end
	return v151
end

--local function Shielded(Limb, Connections)
--	local touchingParts = Limb:GetTouchingParts()
--	local foundBall = false
--	local foundPlayer = false
	
--	if not (Limb.Name == "Left Leg" or Limb.Name == "Right Leg") then
--		return false
--	end

--	for _, part in ipairs(touchingParts) do
--		if workspace:FindFirstChild("Balls") and table.find(workspace.Balls:GetChildren(), part) then
--			foundBall = true
--		elseif v_u_1:CheckIfPlayer(part) then
--			foundPlayer = true
--		end
--	end

--	if foundBall then
--		return false
--	end

--	if foundPlayer then
--		local conns = Connections[Limb]
--		if conns then
--			if conns.Touched then conns.Touched:Disconnect() end
--			if conns.ReactLoop then conns.ReactLoop:Disconnect() end
--			Connections[Limb] = nil
--		end
--		return true
--	end

--	return false
--end

--function v_u_1.ActivateReact(_, p_u_150)
--	-- upvalues: (copy) v_u_13
--	v_u_13.Stepped:Wait()
--	local v151 = {}
--	for _, v_u_152 in pairs(p_u_150.ReactLimbs) do
--		v151[v_u_152] = {
--			["Touched"] = v_u_152.Touched:Connect(function(p153)
--				if Shielded(v_u_152, v151) then return end
--				-- upvalues: (copy) p_u_150, (copy) v_u_152
--				p_u_150.ReactFunc(v_u_152, p153)
--			end),
--			["ReactLoop"] = v_u_13.Stepped:Connect(function()
--				if Shielded(v_u_152, v151) then return end
--				-- upvalues: (copy) v_u_152, (copy) p_u_150
--				for _, v_u_154 in pairs(v_u_152:GetTouchingParts()) do
--					task.spawn(function()
--						-- upvalues: (ref) p_u_150, (ref) v_u_152, (copy) v_u_154
--						p_u_150.ReactFunc(v_u_152, v_u_154)
--					end)
--				end
--			end)
--		}
--	end
--	return v151
--end

function v_u_1.DeactivateReact(_, p155)
	if p155 ~= nil then
		for _, v156 in pairs(p155) do
			for _, v157 in pairs(v156) do
				v157:Disconnect()
			end
		end
	end
end
local v_u_158 = 0
function v_u_1.ActivateCombo(_, p159)
	-- upvalues: (ref) v_u_158, (copy) v_u_3, (copy) v_u_1
	local v160 = {}
	local v161 = v_u_158 + 1
	v_u_158 = math.clamp(v161, 0, 3)
	for v162, v163 in pairs(p159.Table) do
		v_u_3:BindActionAtPriority(v162, p159.Func, false, v_u_158 + 6, v_u_1:ConvertKey(v163.Keybind.Value))
		table.insert(v160, v162)
	end
	return v160
end
function v_u_1.DeactivateCombo(_, p164)
	-- upvalues: (ref) v_u_158, (copy) v_u_3
	if p164 ~= nil then
		local v165 = v_u_158 - 1
		v_u_158 = math.clamp(v165, 0, 3)
		for _, v166 in pairs(p164) do
			v_u_3:UnbindAction(v166)
		end
	end
end
local v_u_167 = tick()
function v_u_1.ActivatePowerBar(_, p_u_168)
	-- upvalues: (ref) v_u_167, (copy) v_u_19, (copy) v_u_11, (copy) v_u_20
	local v_u_169 = false
	local v_u_170 = tick()
	v_u_167 = v_u_170
	v_u_19.Visible = true
	task.spawn(function()
		-- upvalues: (copy) p_u_168, (ref) v_u_11, (ref) v_u_20, (ref) v_u_167, (copy) v_u_170, (ref) v_u_19, (ref) v_u_169
		for _, v171 in pairs(p_u_168) do
			local v172 = v_u_11:Create(v_u_20, TweenInfo.new(v171.Time, v171.ES, v171.ED), {
				["Size"] = UDim2.new((100 - v171.To) / 100, 0, 1, 0)
			})
			v172:Play()
			v172.Completed:Wait()
			if v_u_167 ~= v_u_170 or not v_u_19.Visible then
				break
			end
			if v171.NoHoldReset then
				v_u_169 = true
			end
		end
		if not v_u_169 and (v_u_167 == v_u_170 and v_u_19.Visible) then
			local v173 = v_u_11:Create(v_u_20, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
				["Size"] = UDim2.new(0.25, 0, 1, 0)
			})
			v173:Play()
			v173.Completed:Wait()
			if v_u_167 == v_u_170 and v_u_19.Visible then
				v_u_11:Create(v_u_20, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
					["Size"] = UDim2.new(0.4, 0, 1, 0)
				}):Play()
			end
		end
	end)
end
function v_u_1.GetPowerBar(_)
	-- upvalues: (copy) v_u_21, (copy) v_u_20
	task.spawn(function()
		-- upvalues: (ref) v_u_21, (ref) v_u_20
		local v174 = v_u_21
		local v175 = (1 - v_u_20.Size.X.Scale) * 100
		local v176 = math.ceil(v175)
		v174.Text = tostring(v176) .. "%"
	end)
	return (1 - v_u_20.Size.X.Scale) * 100
end
function v_u_1.StopPowerBar(_)
	-- upvalues: (ref) v_u_167, (copy) v_u_11, (copy) v_u_20
	v_u_167 = tick()
	v_u_11:Create(v_u_20, TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		["Size"] = UDim2.new(v_u_20.Size.X.Scale, 0, 1, 0)
	}):Play()
	v_u_20.Size = UDim2.new(v_u_20.Size.X.Scale, 0, 1, 0)
end
function v_u_1.DeactivatePowerBar(_)
	-- upvalues: (ref) v_u_167, (copy) v_u_19, (copy) v_u_21, (copy) v_u_11, (copy) v_u_20
	v_u_167 = tick()
	v_u_19.Visible = false
	v_u_21.Text = ""
	v_u_11:Create(v_u_20, TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		["Size"] = UDim2.new(1, 0, 1, 0)
	}):Play()
	v_u_20.Size = UDim2.new(1, 0, 1, 0)
end
function v_u_1.CheckClosestBall(_, p177, p178)
	-- upvalues: (copy) v_u_17
	local v179 = 9999
	local v180 = nil
	for _, v181 in pairs(v_u_17:GetChildren()) do
		if v181:IsA("BasePart") and (v181.Name == "Perius" and (v181.Anchored == false and (v181.Locked == false and (v181.Transparency == 0 and (p177.Position - v181.Position).magnitude < v179)))) then
			v179 = (p177.Position - v181.Position).magnitude
			v180 = v181
		end
	end
	return v180 ~= nil and v179 < p178
end
local v_u_182 = nil
local v_u_183 = nil
local v_u_184 = nil
local v_u_185 = nil
function v_u_1.ActivateAngler(_, p_u_186)
	-- upvalues: (ref) v_u_182, (copy) v_u_16, (copy) v_u_11, (ref) v_u_185, (copy) v_u_13, (ref) v_u_183, (ref) v_u_184
	if v_u_182 == nil and p_u_186.Root then
		local v_u_187 = nil
		local function v_u_207(_)
			-- upvalues: (ref) v_u_16, (copy) p_u_186, (ref) v_u_187
			local v188 = v_u_16.CFrame.lookVector
			if p_u_186.Custom == nil then
				local v189 = p_u_186.Root
				local v190 = CFrame.new
				local v191 = p_u_186.Root.CFrame.p
				local v192 = p_u_186.Root.CFrame.p
				local v193 = v188.X
				local v194 = v188.Z
				v189.CFrame = v190(v191, v192 + Vector3.new(v193, 0, v194))
				return
			elseif v_u_187 == nil then
				local v195 = p_u_186.Root
				local v196 = CFrame.new
				local v197 = p_u_186.Root.CFrame.p
				local v198 = p_u_186.Root.CFrame.p
				local v199 = v188.X
				local v200 = v188.Z
				v195.CFrame = v196(v197, v198 + Vector3.new(v199, 0, v200)) * p_u_186.Custom
			else
				local v201 = p_u_186.Root
				local v202 = CFrame.new
				local v203 = p_u_186.Root.CFrame.p
				local v204 = p_u_186.Root.CFrame.p
				local v205 = v188.X
				local v206 = v188.Z
				v201.CFrame = v202(v203, v204 + Vector3.new(v205, 0, v206)) * v_u_187.Value
			end
		end
		if p_u_186.TweenCFrame ~= nil and p_u_186.Custom ~= nil then
			v_u_187 = Instance.new("CFrameValue")
			v_u_187.Value = CFrame.new(0, 0, 0) * p_u_186.Custom
			v_u_11:Create(v_u_187, TweenInfo.new(p_u_186.TweenTime, p_u_186.TweenES, p_u_186.TweenED), {
				["Value"] = CFrame.new(0, 0, 0) * p_u_186.TweenCFrame
			}):Play()
		end
		v_u_185 = Instance.new("BodyAngularVelocity")
		v_u_185.MaxTorque = Vector3.new(500000, 500000, 500000)
		v_u_185.P = 500000
		v_u_185.AngularVelocity = Vector3.new(0, 0, 0)
		v_u_185.Parent = p_u_186.Root
		v_u_182 = v_u_13.RenderStepped:Connect(function()
			-- upvalues: (copy) v_u_207
			v_u_207()
		end)
		v_u_183 = v_u_13.RenderStepped:Connect(function()
			-- upvalues: (copy) v_u_207
			v_u_207()
		end)
		v_u_184 = v_u_13.RenderStepped:Connect(function()
			-- upvalues: (copy) v_u_207
			v_u_207()
		end)
	end
end
function v_u_1.DeactivateAngler(_, p208)
	-- upvalues: (ref) v_u_182, (ref) v_u_183, (ref) v_u_184, (ref) v_u_185
	local v209 = p208.RotVelocity
	if v_u_182 ~= nil then
		v_u_182:Disconnect()
		v_u_182 = nil
	end
	if v_u_183 ~= nil then
		v_u_183:Disconnect()
		v_u_183 = nil
	end
	if v_u_184 ~= nil then
		v_u_184:Disconnect()
		v_u_184 = nil
	end
	if v_u_185 ~= nil then
		v_u_185:Destroy()
		v_u_185 = nil
	end
	p208.RotVelocity = v209 / 3
end
function v_u_1.FallClient(_, p210)
	-- upvalues: (copy) v_u_27
	v_u_27:Fire(p210)
end
function v_u_1.CheckIfInAir(_, p211)
	if p211:GetState() == Enum.HumanoidStateType.FallingDown or (p211:GetState() == Enum.HumanoidStateType.Jumping or (p211:GetState() == Enum.HumanoidStateType.Freefall or p211:GetState() == Enum.HumanoidStateType.Landed)) then
		return true
	end
end
function v_u_1.IsBallGrounded(_, p212)
	local v213 = p212:GetTouchingParts()
	if #v213 <= 0 then
		return false
	end
	for _, v214 in pairs(v213) do
		if v214:IsA("BasePart") and v214.Material == Enum.Material.Grass then
			return true
		end
	end
end
function v_u_1.TripPlayer(_, p215)
	-- upvalues: (copy) v_u_28
	v_u_28:FireServer(p215)
end
function v_u_1.Pull(_, p216)
	-- upvalues: (copy) v_u_29
	v_u_29:FireServer(p216)
end
function v_u_1.MakeFowardCFrame(_, p217)
	local _, v218, _ = p217:ToOrientation()
	return CFrame.new(p217.Position) * CFrame.fromOrientation(0, v218, 0)
end
function v_u_1.Deflect(_, v263, v264, v265, v266, v267)
	if not (v266 and v266 == v266 and v266 ~= Vector3.new(0, 0, 0, 0)) or (Vector3.new(v264.X, 0, v264.Z).Unit - Vector3.new(v266.X, 0, v266.Z).Unit).Magnitude < 1 then
		v266 = CFrame.new(v265.p, v263.p).LookVector;
	end;
	local v268 = nil;
	v268 = if v264.Unit == v264.Unit then v264.Unit * v_u_1:MinMaxValue(v264.Magnitude, 100, 1) else Vector3.new(0, 0, 0, 0) * v_u_1:MinMaxValue(v264.Magnitude, 100, 1);
	local l_Unit_0 = (CFrame.new(v265.p, v263.p).LookVector + CFrame.new(v267.p, v263.p).LookVector).Unit;
	local v270 = Vector3.new(v266.X, 0, v266.Z);
	local v271 = Vector3.new(v268.X, 0, v268.Z);
	return ((l_Unit_0 + v270 / 20 + v271 / 250).Unit + Vector3.new(0, l_Unit_0.Y + v268.Y, 0).Unit / 2).Unit;
end
function v_u_1.GetAngleHit(_, p239, p240, p241)
	-- upvalues: (copy) v_u_1
	local v242 = p239.Y - p240.Y
	local v243 = p240 + Vector3.new(0, v242, 0)
	local v244 = p241.X
	local v245 = p241.Z
	local v246 = v_u_1:NullVectorCheck(Vector3.new(v244, 0, v245).Unit):Dot(v243 - p239) / (v243 - p239).Magnitude
	local v247 = math.acos(v246)
	return math.deg(v247)
end
function v_u_1.GetCloserLeg(_, p248, p249, p250)
	local v251 = CFrame.new
	local v252 = p249.X
	local v253 = p249.Z
	local v254 = v251(p250, p250 + Vector3.new(v252, 0, v253))
	local v255 = p250 + v254.RightVector * 2
	local v256 = p250 + v254.RightVector * -2
	return (v255 - p248).Magnitude < (v256 - p248).Magnitude and "Right" or "Left"
end
function v_u_1.MaxSpin(_, p257, p258)
	if p258 < p257 then
		return p258
	else
		return p257
	end
end
function v_u_1.GetSpin(_, p259, p260, p261, p262, p263)
	-- upvalues: (copy) v_u_1
	if v_u_1:GetXZMag(p260, p259) > 0.5 then
		local v_u_264 = v_u_1:GetCloserLeg(p260, p261, p259)
		local v_u_265 = v_u_1:GetAngleHit(p259, p260, p261)
		task.spawn(function()
			-- upvalues: (ref) v_u_1, (copy) v_u_265, (copy) v_u_264
			local v266 = v_u_265
			v_u_1:DebugPrint("Hit Angle: " .. math.floor(v266) .. " degrees with " .. string.lower(v_u_264) .. " leg")
		end)
		if v_u_264 == "Right" then
			local v267 = v_u_1
			local v268 = v_u_265 * 1.9
			local v269 = math.abs(v268)
			local v270 = Vector3.new(0, -1, 0) * v267:MaxSpin(30 + math.pow(v269, 0.8) * (0.2 + (p262 / 50 - 0.2)), p263)
			if v_u_265 < 35 then
				return Vector3.new(0, 0, 0), v_u_265, -1
			else
				return v270, v_u_265, -1
			end
		end
		if v_u_264 == "Left" then
			local v271 = v_u_1
			local v272 = v_u_265 * 1.9
			local v273 = math.abs(v272)
			local v274 = Vector3.new(0, 1, 0) * v271:MaxSpin(30 + math.pow(v273, 0.8) * (0.2 + (p262 / 50 - 0.2)), p263)
			if v_u_265 < 35 then
				return Vector3.new(0, 0, 0), v_u_265, 1
			else
				return v274, v_u_265, 1
			end
		end
	end
	return Vector3.new(0, 0, 0), 0, 0
end
function v_u_1.AnkleActivation(p275, p276)
	-- upvalues: (copy) v_u_6
	v_u_6:StartCalculation(p275, p276)
end
function v_u_1.AnkleDeactivation(p277)
	-- upvalues: (copy) v_u_6, (copy) v_u_27
	if p277 and v_u_6:StopCalculation() then
		v_u_27:Fire({
			["Type"] = "Ankle"
		})
	end
end
function v_u_1.DropBall(_, p278)
	-- upvalues: (copy) v_u_1, (copy) v_u_32
	local v279 = p278.Character:FindFirstChild("LocalBWeld")
	if not v_u_1:CheckHold() and v279 then
		v_u_32:FireServer()
		local v280 = p278.Character:WaitForChild("ServerBWeld", 6)
		if v280 then
			v280.Enabled = false
			v279:Destroy()
		end
	end
end
local v_u_281 = 0
function v_u_1.DropTimer(_, p_u_282)
	-- upvalues: (ref) v_u_281, (copy) v_u_24, (copy) v_u_1
	task.spawn(function()
		-- upvalues: (ref) v_u_281, (ref) v_u_24, (copy) p_u_282, (ref) v_u_1
		local v283 = tick()
		v_u_281 = v283
		while true do
			task.wait(0.1)
			if v283 + 4 < tick() then
				v_u_24.Visible = true
			end
			if p_u_282.BallWeld.Parent == nil then
				v283 = tick()
			end
			if (v283 + 6 < tick() or v_u_281 ~= v283) and not v_u_1:CheckDebounce() then
				v_u_24.Visible = false
				if v_u_281 == v283 and (not v_u_1:CheckDebounce() and p_u_282.BallWeld.Parent ~= nil) then
					v_u_1:DropBall({
						["Character"] = p_u_282.Character
					})
				end
				return
			end
		end
	end)
end
function v_u_1.Catch(_, p284)
	-- upvalues: (ref) v_u_129, (copy) v_u_1, (copy) v_u_10, (copy) v_u_3, (copy) v_u_31
	if not v_u_129 then
		v_u_129 = true
		task.delay(0.2, function()
			-- upvalues: (ref) v_u_129
			v_u_129 = false
		end)
		if v_u_1:CheckHold() and v_u_1:ReactBallCheck(p284.Limb, p284.Ball, p284.BallPos) then
			if v_u_10:HasTag(p284.Ball, "BtP") then
				local v285 = Instance.new("StringValue")
				v285.Parent = v_u_3
				v_u_10:AddTag(v285, "BtPCom")
				v285:Destroy()
			end
			local v286 = p284.Ball.Velocity
			if p284.Ball:FindFirstChild("ServerBodyVelocity") then
				p284.Ball.ServerBodyVelocity:Destroy()
			end
			local v_u_287 = Instance.new("Weld")
			v_u_287.Name = "LocalBWeld"
			v_u_287.Parent = p284.Character
			p284.Ball.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			p284.Ball.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			v_u_287.Part0 = p284.Ball
			v_u_287.Part1 = p284.Character.B
			p284.Ball:GetPropertyChangedSignal("Parent"):Connect(function()
				-- upvalues: (copy) v_u_287
				v_u_287:Destroy()
			end)
			v_u_287.Changed:Connect(function()
				-- upvalues: (copy) v_u_287
				v_u_287:Destroy()
			end)
			if p284.Timer then
				v_u_1:DropTimer({
					["Character"] = p284.Character,
					["BallWeld"] = v_u_287
				})
			end
			if not v_u_31:InvokeServer({
				["Ball"] = p284.Ball,
				["Limb"] = p284.Limb,
				["LimbCF"] = p284.LimbCF,
				["BallPos"] = p284.BallPos,
				["BallVel"] = v286,
				["Count"] = p284.Ball.Count.Value
				}) then
				v_u_287:Destroy()
			end
		end
	end
end
function v_u_1.MakeMarker(_, v318, v319)
	local v320 = v319 or v_u_15.Name;
	v_u_4.MarkerRemote:FireServer(v318, v320);
end
v_u_4.MarkerRemote.OnClientEvent:Connect(function(v321, v322)
	v_u_4.MarkPointClient:Fire(v321, v322);
end)
function v_u_1.GetCameraZX(_, p293)
	-- upvalues: (copy) v_u_16
	local v294 = CFrame.new
	local v295 = p293.Position
	local v296 = p293.Position
	local v297 = v_u_16.CFrame.lookVector.X
	local v298 = v_u_16.CFrame.lookVector.Z
	return v294(v295, v296 + Vector3.new(v297, 0, v298))
end
function v_u_1.GetCameraY(_)
	-- upvalues: (copy) v_u_16
	return v_u_16.CFrame.lookVector.Y
end
local v_u_299 = false
function v_u_1.GetHeightAngle(_, p300, p301)
	-- upvalues: (copy) v_u_37, (copy) v_u_36, (ref) v_u_299, (copy) v_u_16
	local v302 = v_u_37.Value
	local v303 = v_u_36.Value
	if v_u_299 then
		v302 = 0.5
		v303 = 40
	end
	local v304 = v_u_16.CFrame.LookVector.Y * (100 * v302) + v303
	if p300 < v304 then
		return p300
	end
	if v304 >= p301 then
		p301 = v304
	end
	return p301
end
local function v_u_307()
	-- upvalues: (copy) v_u_37, (copy) v_u_36, (copy) v_u_22, (ref) v_u_299
	local v305 = 1 * (100 * v_u_37.Value) + v_u_36.Value
	local v306 = -1 * (100 * v_u_37.Value) + v_u_36.Value
	if v305 >= 30 and v306 <= 0 or v305 <= 0 and v306 >= 30 then
		v_u_22.Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		v_u_299 = false
	else
		v_u_299 = true
		v_u_22.Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	end
end
v_u_37:GetPropertyChangedSignal("Value"):Connect(function()
	-- upvalues: (copy) v_u_307
	v_u_307()
end)
v_u_36:GetPropertyChangedSignal("Value"):Connect(function()
	-- upvalues: (copy) v_u_307
	v_u_307()
end)
v_u_307()
v_u_38:GetPropertyChangedSignal("Value"):Connect(function()
	-- upvalues: (copy) v_u_22, (copy) v_u_38, (copy) v_u_19
	v_u_22.ImageColor3 = v_u_38.Value
	v_u_19.ImageColor3 = v_u_38.Value
end)
v_u_22.ImageColor3 = v_u_38.Value
v_u_19.ImageColor3 = v_u_38.Value
local v_u_308 = 0
v_u_13.Heartbeat:Connect(function()
	-- upvalues: (copy) v_u_22, (copy) v_u_1, (ref) v_u_308, (copy) v_u_23
	if v_u_22.Visible then
		local v309 = v_u_1:GetHeightAngle(30, -10)
		if v_u_308 ~= v309 then
			v_u_308 = v309
			local v310 = v_u_23
			local v311 = UDim2.new
			local v312 = 0.75 - v309 / 40
			v310.Size = v311(1, 0, math.clamp(v312, 0, 1), 0)
		end
	end
end)
local v_u_313 = {
	["Static"] = {
		["Right"] = UDim2.new(0.975, 0, 1, -75),
		["RightMid"] = UDim2.new(0.6, 0, 1, -75),
		["Left"] = UDim2.new(0.025, 0, 1, -75),
		["LeftMid"] = UDim2.new(0.4, 0, 1, -75)
	},
	["Mouse"] = {
		["MouseRight"] = UDim2.new(0, 75, 0.0625, 0),
		["MouseLeft"] = UDim2.new(0, -75, 0.0625, 0)
	}
}
local function v_u_316(_, _, _)
	-- upvalues: (copy) v_u_313, (copy) v_u_35, (copy) v_u_12, (copy) v_u_22, (copy) v_u_3
	local v314 = v_u_313.Mouse[v_u_35.Value]
	if v314 then
		local v315 = v_u_12:GetMouseLocation()
		v_u_22.Position = UDim2.new(0, v315.X + v314.X.Offset, v314.Y.Scale, v315.Y)
	else
		pcall(function()
			-- upvalues: (ref) v_u_3
			v_u_3:UnbindAction("AngleBarCameraMovement")
		end)
	end
end
local function v_u_317()
	-- upvalues: (copy) v_u_3, (copy) v_u_22, (copy) v_u_35, (copy) v_u_313, (copy) v_u_316
	pcall(function()
		-- upvalues: (ref) v_u_3
		v_u_3:UnbindAction("AngleBarCameraMovement")
	end)
	v_u_22.Visible = true
	if v_u_35.Value == "Off" then
		v_u_22.Visible = false
		return
	elseif v_u_313.Static[v_u_35.Value] then
		v_u_22.Position = v_u_313.Static[v_u_35.Value]
	elseif v_u_313.Mouse[v_u_35.Value] then
		v_u_3:BindAction("AngleBarCameraMovement", v_u_316, false, Enum.UserInputType.MouseMovement)
	end
end
v_u_35:GetPropertyChangedSignal("Value"):Connect(function()
	-- upvalues: (copy) v_u_317
	v_u_317()
end)
v_u_317()
v_u_34:GetPropertyChangedSignal("Value"):Connect(function()
	-- upvalues: (copy) v_u_34, (copy) v_u_21
	if v_u_34.Value then
		v_u_21.Visible = true
	else
		v_u_21.Visible = false
	end
end)
if v_u_34.Value then
	v_u_21.Visible = true
else
	v_u_21.Visible = false
end
local v_u_319 = {}
function v_u_1.GetSharedCooldown(_, p320)
	-- upvalues: (ref) v_u_319
	return v_u_319[p320]
end
function v_u_1.EditSharedCooldown(_, p321, p322)
	-- upvalues: (ref) v_u_319
	v_u_319[p321] = p322
end
function v_u_1.CharRestart(_)
	-- upvalues: (copy) v_u_1, (ref) v_u_319, (ref) v_u_25, (ref) v_u_129
	task.delay(0.5, function()
		-- upvalues: (ref) v_u_1, (ref) v_u_319
		v_u_1:SetDebounce(false, 3, true)
		v_u_1:SetDebounce(false, 2, true)
		v_u_1:SetDebounce(false, 1, true)
		v_u_319 = {}
	end)
	v_u_1:DeactivatePowerBar()
	for v323, _ in pairs(v_u_25) do
		if v323.Destroy then
			v323:Destroy()
		end
	end
	v_u_25 = {}
	v_u_129 = false
end
return v_u_1
