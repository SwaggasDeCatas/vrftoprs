local _ = _G;
local l_game_0 = game;
local _ = script;
local _ = getfenv;
local _ = setfenv;
local _ = workspace;
local _ = getmetatable;
local _ = setmetatable;
local _ = loadstring;
local _ = coroutine;
local _ = rawequal;
local _ = typeof;
local _ = print;
local l_math_0 = math;
local l_pairs_0 = pairs;
local l_require_0 = require;
local _ = table;
local _ = type;
local _ = wait;
local l_Enum_0 = Enum;
local _ = UDim;
local _ = UDim2;
local _ = Vector2;
local l_Vector3_0 = Vector3;
local _ = Region3;
local l_CFrame_0 = CFrame;
local _ = Ray;
local _ = delay;
local v69 = {};
local l_RunService_0 = l_game_0:GetService("RunService");
local l_ReplicatedStorage_0 = l_game_0:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_game_0:GetService("Players").LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or not l_Character_0.Parent then
	l_Character_0 = l_LocalPlayer_0.CharacterAdded:wait();
end;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local l_ClientModules_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules");
local v76 = l_require_0(l_ClientModules_0:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"));
local v77 = l_require_0(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local v78 = l_require_0(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_HumanoidStateRemote_0 = l_ReplicatedStorage_0:WaitForChild("Remotes"):WaitForChild("HumanoidStateRemote");
local l_v76_Limbs_0 = v76:GetLimbs(l_Character_0, l_Humanoid_0);
local l_Animations_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations");
local v82 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Throw.RightThrowStart);
local v83 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Throw.RightThrowHigh);
local v84 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Throw.RightThrowLow);
local v85 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Throw.LeftThrowStart);
local v86 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Throw.LeftThrowHigh);
local v87 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Throw.LeftThrowLow);
local l_v76_LegSwitch_0 = v76:GetLegSwitch();
local v89 = nil;
local v90 = false;
local v91 = 0;
local v92 = nil;
local l_Keybinds_0 = l_ReplicatedStorage_0:WaitForChild("PlayerData"):WaitForChild(l_LocalPlayer_0.UserId):WaitForChild("Keybinds");
local v94 = nil;
local v95 = {
	CancelCombo = {
		Used = false, 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("Clear"):WaitForChild("Cancel")
	}
};
local function v100(v96, v97) --[[ Line: 137 ]]
	if v97 == l_Enum_0.UserInputState.Begin then
		for v98, v99 in l_pairs_0(v95) do
			if v96 == v98 then
				v99.Used = true;
				if v99 == v95.CancelCombo then
					v69.Activate("Cancel", l_Enum_0.UserInputState.End, "Cancel");
				end;
			else
				v99.Used = false;
			end;
		end;
		return l_Enum_0.ContextActionResult.Sink;
	else
		return l_Enum_0.ContextActionResult.Pass;
	end;
end;
v69.Activate = function(_, v102, _) --[[ Line: 154 ]]
	if v102 == l_Enum_0.UserInputState.Begin then
		local l_LocalBWeld_0 = l_Character_0:FindFirstChild("LocalBWeld");
		if not v76:CheckHold() and not l_HumanoidStateRemote_0:Invoke() and l_LocalBWeld_0 and not v76:CheckDebounce() and l_LocalBWeld_0.Part0 then
			v76:SetDebounce(true, 3);
			v89 = l_v76_LegSwitch_0.Value;
			v90 = true;
			v94 = v76:ActivateCombo({
				Table = v95, 
				Func = v100
			});
			v76:ActivatePowerBar({
				{
					Time = 0.6, 
					ES = l_Enum_0.EasingStyle.Sine, 
					ED = l_Enum_0.EasingDirection.In, 
					To = 100
				}
			});
			if v92 ~= nil then
				v92:Disconnect();
				v92 = nil;
			end;
			v92 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 177 ]]
				v78:Speed({
					Set = v78:GetNeutralSpeed() - v76:GetPowerBar() / 100, 
					ReturnTime = 0.6
				});
			end);
			return;
		else
			return Enum.ContextActionResult.Pass
		end;
	elseif v102 == l_Enum_0.UserInputState.End and v90 then
		v90 = false;
		v76:StopPowerBar();
		v91 = v76:GetPowerBar();
		if v92 ~= nil then
			v92:Disconnect();
			v92 = nil;
		end;
		v76:DeactivateCombo(v94);
		local l_LocalBWeld_1 = l_Character_0:FindFirstChild("LocalBWeld");
		if l_LocalBWeld_1 then
			local l_Part0_0 = l_LocalBWeld_1.Part0;
			if l_Part0_0 then
				if not v95.CancelCombo.Used then
					local l_v76_HeightAngle_0 = v76:GetHeightAngle(30, -10);
					local v108 = false;
					if l_Humanoid_0:GetState() ~= l_Enum_0.HumanoidStateType.Jumping and l_Humanoid_0:GetState() ~= l_Enum_0.HumanoidStateType.FallingDown and l_Humanoid_0:GetState() ~= l_Enum_0.HumanoidStateType.Freefall and v91 <= 80 and l_v76_HeightAngle_0 < 10 then
						-- vrftoprs: removed Humanoid WalkSpeed/JumpPower editor
						v78:Speed({
							Set = 4, 
							ReturnTime = 0.8
						});
						v108 = true;
					end;
					if not v89 then
						v77:PlayAnim(v82, 0.1, l_Enum_0.AnimationPriority.Action);
					else
						v77:PlayAnim(v85, 0.1, l_Enum_0.AnimationPriority.Action);
					end;
					task.wait(0.3);
					if not v108 then
						if not v89 then
							v77:PlayAnim(v83, 0.1, l_Enum_0.AnimationPriority.Action2);
						else
							v77:PlayAnim(v86, 0.1, l_Enum_0.AnimationPriority.Action2);
						end;
						task.wait(0.2);
					else
						if not v89 then
							v77:PlayAnim(v84, 0.1, l_Enum_0.AnimationPriority.Action2);
						else
							v77:PlayAnim(v87, 0.1, l_Enum_0.AnimationPriority.Action2);
						end;
						task.wait(0.3);
					end;
					v76:DropBall({
						Character = l_Character_0
					});
					local l_Unit_0 = l_v76_Limbs_0.HumanoidRootPart.CFrame.LookVector.Unit;
					local v110 = l_Vector3_0.new(l_Unit_0.Z, 0, -l_Unit_0.X) * 16;
					l_v76_HeightAngle_0 = v76:GetHeightAngle(30, -10);
					local v111 = (v76:MakeFowardCFrame(l_v76_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(l_math_0.clamp(l_v76_HeightAngle_0, 10, 45)), 0, 0)).lookVector * (45 + v91 / 2.5);
					if v108 then
						v111 = (v76:MakeFowardCFrame(l_v76_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(l_math_0.clamp(l_v76_HeightAngle_0, 0, 5)), 0, 0)).lookVector * (35 + v91 / 3);
					end;
					local v112 = {
						Limb = l_v76_Limbs_0.HumanoidRootPart, 
						Ball = l_Part0_0, 
						MaxForce = l_Vector3_0.new(90000000000, 90000000000, 90000000000), 
						Velocity = v111, 
						Time = 0.3, 
						Spin = v110
					};
					v76:ClientReact(v112);
					if v108 then
						task.wait(0.1);
						-- vrftoprs: removed Humanoid WalkSpeed/JumpPower editor
					end;
				end;
				v76:DeactivatePowerBar();
				v76:ComboReset(v95);
				task.wait(0.2);
				v76:SetDebounce(false, 3);
				v76:PlayQueue();
			end;
		end;
	end;
end;
return v69;
