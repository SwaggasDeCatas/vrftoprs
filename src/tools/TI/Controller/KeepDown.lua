task.spawn(function() --[[ Line: 3 ]]
	task.spawn(function() --[[ Line: 5 ]]
		pcall(function() --[[ Line: 6 ]]
			remote = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvent");
			func = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteFunction");
			func.OnClientInvoke = function(v0_, v1, ...) --[[ Line: 9 ]]
				if not v0 then
					while ({
						...
						})[...] do
						local v2 = ({
							...
						})[...];
						local v3 = ... .. ... or ({
							...
						})[...] and ... or ...;
						for _ = v2, v3 do
							while true do
								local v5 = ({
									...
								})[...];
								if not (... .. ...) and (not ({
									...
									})[...] or not ...) then
									local _ = ...;
								end;
								p3 = v5;
								p4 = p3 * workspace:GetDescendants() and pairs;
							end;
						end;
					end;
				end;
				p3 = v1;
				p4 = v0_ * p3;
				p3 = ... or 5;
				local v7 = p3 and v1;
				return ((p4 and not v0 and v0_) + v7) / 2 + (detecc or 2), 0;
			end;
		end);
	end);
end);
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
local _ = math;
local _ = warn;
local _ = error;
local _ = pcall;
local _ = ypcall;
local _ = xpcall;
local _ = select;
local _ = rawset;
local _ = rawget;
local _ = ipairs;
local l_pairs_0 = pairs;
local _ = next;
local _ = Rect;
local _ = Axes;
local _ = os;
local _ = tick;
local _ = Faces;
local _ = unpack;
local _ = string;
local _ = Color3;
local _ = newproxy;
local _ = tostring;
local _ = tonumber;
local _ = Instance;
local _ = TweenInfo;
local _ = BrickColor;
local _ = NumberRange;
local _ = ColorSequence;
local _ = NumberSequence;
local _ = ColorSequenceKeypoint;
local _ = NumberSequenceKeypoint;
local _ = PhysicalProperties;
local _ = Region3int16;
local _ = Vector3int16;
local _ = elapsedTime;
local l_require_0 = require;
local _ = table;
local _ = type;
local _ = wait;
local l_Enum_0 = Enum;
local _ = UDim;
local _ = UDim2;
local _ = Vector2;
local _ = Vector3;
local _ = Region3;
local _ = CFrame;
local _ = Ray;
local _ = delay;
local v69 = {};
local l_ReplicatedStorage_0 = l_game_0:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_game_0:GetService("Players").LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or not l_Character_0.Parent then
	l_Character_0 = l_LocalPlayer_0.CharacterAdded:wait();
end;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local l_ClientModules_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules");
local v75 = l_require_0(l_ClientModules_0:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"));
local v76 = l_require_0(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local _ = l_require_0(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_v75_Limbs_0 = v75:GetLimbs(l_Character_0, l_Humanoid_0);
local l_Animations_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations");
local v80 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.LowCatch);
local v81 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.LowPickup);
local v82 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.LowMidPickup);
local v83 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.RightLowPickup);
local v84 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.LeftLowPickup);
local v85 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.UpperCatch);
local v86 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.HighPickup);
local v87 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.HighMidPickup);
local v88 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.RightHighPickup);
local v89 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.LeftHighPickup);
local l_v75_LegSwitch_0 = v75:GetLegSwitch();
local v91 = nil;
local v92 = false;
local v93 = nil;
local v94 = {
	KeepUpCombo = {
		Used = false, 
		Keybind = script:WaitForChild("KeepDown"):WaitForChild("KeepUp")
	}
};
local function v99(v95, v96) --[[ Line: 133 ]]
	if v96 == l_Enum_0.UserInputState.Begin then
		for v97, v98 in l_pairs_0(v94) do
			if v95 == v97 then
				if v98.Used == false then
					v76:PlayAnim(v85, 0.05, l_Enum_0.AnimationPriority.Action2);
					v76:StopAnim(v80, 0.1);
				end;
				v98.Used = true;
			else
				v98.Used = false;
			end;
		end;
		return l_Enum_0.ContextActionResult.Sink;
	else
		return l_Enum_0.ContextActionResult.Pass;
	end;
end;
local function v103(v100) --[[ Line: 151 ]]
	local l_Magnitude_0 = (l_v75_Limbs_0["Left Arm"].Position - v100).Magnitude;
	local l_Magnitude_1 = (l_v75_Limbs_0["Right Arm"].Position - v100).Magnitude;
	if not v94.KeepUpCombo.Used then
		if l_Magnitude_0 < 3 and l_Magnitude_1 < 3 then
			if l_v75_Limbs_0.HumanoidRootPart.Position.Y - 1 > v100.Y then
				v76:PlayAnim(v81, 0, l_Enum_0.AnimationPriority.Action3);
				return;
			else
				v76:PlayAnim(v82, 0, l_Enum_0.AnimationPriority.Action3);
				return;
			end;
		elseif l_Magnitude_1 < l_Magnitude_0 then
			v76:PlayAnim(v83, 0, l_Enum_0.AnimationPriority.Action3);
			return;
		else
			v76:PlayAnim(v84, 0, l_Enum_0.AnimationPriority.Action3);
			return;
		end;
	elseif l_Magnitude_0 < 3 and l_Magnitude_1 < 3 then
		if l_v75_Limbs_0.HumanoidRootPart.Position.Y + 2.5 > v100.Y then
			v76:PlayAnim(v86, 0, l_Enum_0.AnimationPriority.Action3);
			return;
		else
			v76:PlayAnim(v87, 0, l_Enum_0.AnimationPriority.Action3);
			return;
		end;
	elseif l_Magnitude_1 < l_Magnitude_0 then
		v76:PlayAnim(v88, 0, l_Enum_0.AnimationPriority.Action3);
		return;
	else
		v76:PlayAnim(v89, 0, l_Enum_0.AnimationPriority.Action3);
		return;
	end;
end;
local function v108(v104, v105) --[[ Line: 181 ]]
	local l_Position_0 = v105.Position;
	local l_CFrame_1 = v104.CFrame;
	if v75:ReactBallCheck(v104, v105, l_Position_0) and v92 then
		v92 = false;
		v103(l_Position_0);
		v76:StopAnim(v80, 0.2);
		v75:Catch({
			Character = l_Character_0, 
			Ball = v105, 
			Limb = v104, 
			LimbCF = l_CFrame_1, 
			BallPos = l_Position_0, 
			Timer = true
		});
	end;
end;
v69.Activate = function(v109, v110, v111) --[[ Line: 201 ]]
	if v110 == l_Enum_0.UserInputState.Begin then
		if v75:CheckState() and not v75:CheckDebounce() then
			v75:SetDebounce(true);
			v91 = l_v75_LegSwitch_0.Value;
			v75:EditSharedCooldown("NoPrecharge", true);
			v76:PlayAnim(v80, 0.05, l_Enum_0.AnimationPriority.Action);
			task.wait(0.05);
			local v112 = v75:ActivateReact({
				ReactLimbs = {
					l_v75_Limbs_0["Right Arm"], 
					l_v75_Limbs_0["Left Arm"]
				}, 
				ReactFunc = v108
			});
			v93 = v75:ActivateCombo({
				Table = v94, 
				Func = v99
			});
			v92 = true;
			task.wait(0.45);
			v75:DeactivateCombo(v93);
			if v94.KeepUpCombo.Used then
				task.wait(0.2);
			end;
			v92 = false;
			v75:DeactivateReact(v112);
			v76:StopAnim(v80, 0.1);
			v76:StopAnim(v85, 0.1);
			v75:ComboReset(v94);
			task.wait(0.2);
			v75:EditSharedCooldown("NoPrecharge", false);
			v75:SetDebounce(false);
			v75:PlayQueue();
			return;
		else
			v75:DelayQueue(v69.Activate, v109, v111);
		end;
	end;
end;
return v69;
