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
local l_Instance_0 = Instance;
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
local l_ReplicatedStorage_0 = l_game_0:GetService("ReplicatedStorage");
local l_Players_0 = l_game_0:GetService("Players");
local l_Debris_0 = l_game_0:GetService("Debris");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or not l_Character_0.Parent then
	l_Character_0 = l_LocalPlayer_0.CharacterAdded:wait();
end;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local l_ClientModules_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules");
local v77 = l_require_0(l_ClientModules_0:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"));
local v78 = l_require_0(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local v79 = l_require_0(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_v77_Limbs_0 = v77:GetLimbs(l_Character_0, l_Humanoid_0);
local l_Animations_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations");
local v82 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Punch.PunchRight);
local v83 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Punch.PunchLeft);
local v84 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.ArmsLowCatch);
local v85 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.LowPickup);
local v86 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.LowMidPickup);
local v87 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.RightLowPickup);
local v88 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.LeftLowPickup);
local v89 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.ArmsHighCatch);
local v90 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.HighPickup);
local v91 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.HighMidPickup);
local v92 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.RightHighPickup);
local v93 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.LeftHighPickup);
local l_v77_LegSwitch_0 = v77:GetLegSwitch();
local v95 = nil;
local v96 = false;
local v97 = nil;
local v98 = nil;
local l_Keybinds_0 = l_ReplicatedStorage_0:WaitForChild("PlayerData"):WaitForChild(l_LocalPlayer_0.UserId):WaitForChild("Keybinds");
local v100 = {
	CatchUp = {
		Used = false, 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("Punch"):WaitForChild("KeepUp")
	}, 
	CatchDown = {
		Used = false, 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("Punch"):WaitForChild("KeepDown")
	}
};
local function v103(v101, v102) --[[ Line: 139 ]]
	if v102 then
		if v101 == v100.CatchUp then
			v78:PlayAnim(v89, 0.05, l_Enum_0.AnimationPriority.Action3);
		elseif v101 == v100.CatchDown then
			v78:PlayAnim(v84, 0.05, l_Enum_0.AnimationPriority.Action3);
		end;
		v77:DeactivateCombo(v98);
		return;
	elseif v101 == v100.CatchUp then
		v78:StopAnim(v89, 0.1);
		return;
	else
		if v101 == v100.CatchDown then
			v78:StopAnim(v84, 0.1);
		end;
		return;
	end;
end;
local function v108(v104, v105) --[[ Line: 156 ]]
	if v105 == l_Enum_0.UserInputState.Begin then
		for v106, v107 in l_pairs_0(v100) do
			if v104 == v106 then
				v107.Used = true;
				v103(v107, true);
			else
				v107.Used = false;
				v103(v107, false);
			end;
		end;
		return l_Enum_0.ContextActionResult.Sink;
	else
		return l_Enum_0.ContextActionResult.Pass;
	end;
end;
local function v113(v109, _) --[[ Line: 172 ]]
	local l_Magnitude_0 = (l_v77_Limbs_0["Left Arm"].Position - v109).Magnitude;
	local l_Magnitude_1 = (l_v77_Limbs_0["Right Arm"].Position - v109).Magnitude;
	if v100.CatchDown.Used then
		if l_Magnitude_0 < 3 and l_Magnitude_1 < 3 then
			if l_v77_Limbs_0.HumanoidRootPart.Position.Y - 1 > v109.Y then
				v78:PlayAnim(v85, 0, l_Enum_0.AnimationPriority.Action4);
				return;
			else
				v78:PlayAnim(v86, 0, l_Enum_0.AnimationPriority.Action4);
				return;
			end;
		elseif l_Magnitude_1 < l_Magnitude_0 then
			v78:PlayAnim(v87, 0, l_Enum_0.AnimationPriority.Action4);
			return;
		else
			v78:PlayAnim(v88, 0, l_Enum_0.AnimationPriority.Action4);
			return;
		end;
	else
		if v100.CatchUp.Used then
			if l_Magnitude_0 < 3 and l_Magnitude_1 < 3 then
				if l_v77_Limbs_0.HumanoidRootPart.Position.Y + 2.5 > v109.Y then
					v78:PlayAnim(v90, 0, l_Enum_0.AnimationPriority.Action4);
					return;
				else
					v78:PlayAnim(v91, 0, l_Enum_0.AnimationPriority.Action4);
					return;
				end;
			elseif l_Magnitude_1 < l_Magnitude_0 then
				v78:PlayAnim(v92, 0, l_Enum_0.AnimationPriority.Action4);
				return;
			else
				v78:PlayAnim(v93, 0, l_Enum_0.AnimationPriority.Action4);
			end;
		end;
		return;
	end;
end;
local function v124(v114, v115) --[[ Line: 202 ]]
	local l_CFrame_1 = v115.CFrame;
	local l_CFrame_2 = v114.CFrame;
	local l_Velocity_0 = v115.Velocity;
	local l_CFrame_3 = l_v77_Limbs_0.HumanoidRootPart.CFrame;
	local l_Velocity_1 = l_v77_Limbs_0.HumanoidRootPart.Velocity;
	if v77:ReactBallCheck(v114, v115, l_CFrame_1.p) and v96 then
		v96 = false;
		if (v100.CatchDown.Used or v100.CatchUp.Used) and (not (v114 ~= l_v77_Limbs_0["Right Arm"]) or v114 == l_v77_Limbs_0["Left Arm"]) then
			v113(l_CFrame_1.p);
			v78:StopAnim(v84, 0.2);
			v78:StopAnim(v89, 0.2);
			v77:Catch({
				Character = l_Character_0, 
				Ball = v115, 
				Limb = v114, 
				LimbCF = l_CFrame_2, 
				BallPos = l_CFrame_1.p, 
				Timer = true
			});
			return;
		else
			local v121 = nil;
			local v122 = nil;
			if not (not (v114 == l_v77_Limbs_0["Right Arm"]) or v95) or v114 == l_v77_Limbs_0["Left Arm"] and v95 then
				v121 = (v77:MakeFowardCFrame(l_v77_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.Angles(l_math_0.rad(30), 0, 0)).lookVector * 70;
				v122 = l_Vector3_0.new(4000000000, 4000000000, 4000000000);
			else
				v121 = v77:Deflect(l_CFrame_1, l_Velocity_0, l_CFrame_2, l_Velocity_1, l_CFrame_3) * v77:MinMaxValue(8 + l_Velocity_0.Magnitude / 2, 70, 26);
				v122 = l_Vector3_0.new(4000000000, 0, 4000000000);
			end;
			local v123 = {
				Limb = v114, 
				Ball = v115, 
				MaxForce = v122, 
				Velocity = v121, 
				Time = 0.3, 
				GK = true, 
				BallPos = l_CFrame_1.p
			};
			if v77:ServerReact(v123, l_CFrame_1.p) then
				v77:ClientReact(v123);
			end;
		end;
	end;
end;
v69.Activate = function(v125, v126, v127) --[[ Line: 255 ]]
	if v126 == l_Enum_0.UserInputState.Begin then
		if v77:CheckState() and not v77:CheckDebounce() then
			v77:SetDebounce(true);
			v95 = l_v77_LegSwitch_0.Value;
			if not v95 then
				v82:Play(0.05);
			else
				v83:Play(0.05);
			end;
			v98 = v77:ActivateCombo({
				Table = v100, 
				Func = v108
			});
			local v128 = l_Instance_0.new("BodyVelocity");
			v128.Velocity = (v77:GetCameraZX(l_v77_Limbs_0.HumanoidRootPart) * l_CFrame_0.fromOrientation(l_math_0.rad(25), 0, 0)).lookVector * (v77:MinMaxValue(l_Humanoid_0.WalkSpeed, 20, 6) + 5);
			v128.Parent = l_v77_Limbs_0.HumanoidRootPart;
			v128.MaxForce = l_Vector3_0.new(4000000, 4000000, 4000000);
			v97 = v128.Velocity.Magnitude;
			l_Debris_0:AddItem(v128, 0.3);
			v77:FallClient({
				Type = "UTrip"
			});
			v77:ActivateAngler({
				Root = l_v77_Limbs_0.HumanoidRootPart
			});
			v79:Speed({
				Slowdown = 6, 
				ReturnTime = 1.5
			});
			task.wait(0.1);
			local v129 = v77:ActivateReact({
				ReactLimbs = {
					l_v77_Limbs_0["Right Leg"], 
					l_v77_Limbs_0["Left Leg"], 
					l_v77_Limbs_0.Torso, 
					l_v77_Limbs_0.Head, 
					l_v77_Limbs_0["Right Arm"], 
					l_v77_Limbs_0["Left Arm"]
				}, 
				ReactFunc = v124
			});
			v96 = true;
			task.wait(0.4);
			v96 = false;
			v77:DeactivateReact(v129);
			v77:DeactivateCombo(v98);
			task.wait(0.1);
			v77:DeactivateAngler(l_v77_Limbs_0.HumanoidRootPart);
			l_Humanoid_0:ChangeState(l_Enum_0.HumanoidStateType.GettingUp);
			v78:StopAnim(v82, 0.1);
			v78:StopAnim(v83, 0.1);
			v78:StopAnim(v84, 0.1);
			v78:StopAnim(v89, 0.1);
			v77:ComboReset(v100);
			task.wait(0.4);
			v77:SetDebounce(false);
			v77:PlayQueue();
			return;
		else
			v77:DelayQueue(v69.Activate, v125, v127);
			return Enum.ContextActionResult.Pass;
		end;
	end;
end;
return v69;
