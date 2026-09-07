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
local _ = pairs;
local _ = next;
local _ = Rect;
local _ = Axes;
local _ = os;
local l_tick_0 = tick;
local _ = Faces;
local _ = unpack;
local _ = string;
local _ = Color3;
local _ = newproxy;
local _ = tostring;
local _ = tonumber;
local l_Instance_0 = Instance;
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
local l_Vector3_0 = Vector3;
local _ = Region3;
local _ = CFrame;
local _ = Ray;
local _ = delay;
local v69 = {};
local l_RunService_0 = l_game_0:GetService("RunService");
local l_ReplicatedStorage_0 = l_game_0:GetService("ReplicatedStorage");
local _ = l_game_0:GetService("TweenService");
local l_Debris_0 = l_game_0:GetService("Debris");
local l_LocalPlayer_0 = l_game_0:GetService("Players").LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or not l_Character_0.Parent then
	l_Character_0 = l_LocalPlayer_0.CharacterAdded:wait();
end;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local l_ClientModules_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules");
local v78 = l_require_0(l_ClientModules_0:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"));
local _ = l_require_0(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local v80 = l_require_0(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_v78_Limbs_0 = v78:GetLimbs(l_Character_0, l_Humanoid_0);
local l_Animations_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations");
local v83 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Save);
local v84 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.RABlock);
local v85 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LLBlock);
local v86 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.RLBlock);
local v87 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LABlock);
local v88 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.TorsoBlock);
local v89 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.HeadBlock);
local v90 = false;
local v91 = false;
local v92 = nil;
local v93 = nil;
local v94 = 0;
local function v97(v95) --[[ Line: 125 ]]
	if v95 == l_v78_Limbs_0["Left Arm"] then
		v87:Play(0.05, 1, 1.2);
	elseif v95 == l_v78_Limbs_0["Left Leg"] then
		v85:Play(0.05, 1, 1.2);
	elseif v95 == l_v78_Limbs_0["Right Arm"] then
		v84:Play(0.05, 1, 1.2);
	elseif v95 == l_v78_Limbs_0["Right Leg"] then
		v86:Play(0.05, 1, 1.2);
	elseif v95 == l_v78_Limbs_0.Torso then
		v88:Play(0.05, 1, 1.2);
	elseif v95 == l_v78_Limbs_0.Head then
		v89:Play(0.05, 1, 1);
	end;
	local v96 = l_Instance_0.new("BodyVelocity");
	v96.Parent = l_v78_Limbs_0.HumanoidRootPart;
	v96.velocity = l_v78_Limbs_0.HumanoidRootPart.CFrame.lookVector * 0;
	v96.maxForce = l_Vector3_0.new(90000, 0, 90000);
	l_Debris_0:AddItem(v96, 0.3);
	v83:Stop();
end;
local function v108(v98, v99) --[[ Line: 147 ]]
	local l_CFrame_1 = v99.CFrame;
	local l_CFrame_2 = v98.CFrame;
	local l_Velocity_0 = v99.Velocity;
	local l_CFrame_3 = l_v78_Limbs_0.HumanoidRootPart.CFrame;
	local l_Velocity_1 = l_v78_Limbs_0.HumanoidRootPart.Velocity;
	if v78:ReactBallCheck(v98, v99, l_CFrame_1.p) and v90 and v94 + 0.1 < l_tick_0() then
		v90 = false;
		task.spawn(function() --[[ Line: 156 ]]
			v69.Activate("End", l_Enum_0.UserInputState.End, "End");
		end);
		v97(v98);
		local l_Unit_0 = (v78:Deflect(l_CFrame_1, l_Velocity_0, l_CFrame_2, l_Velocity_1, l_CFrame_3) + l_v78_Limbs_0.HumanoidRootPart.CFrame.lookVector).Unit;
		local v106 = v78:MinMaxValue(28 + l_Velocity_0.Magnitude / 4, 80, 32);
		local v107 = {
			Limb = v98, 
			Ball = v99, 
			MaxForce = l_Vector3_0.new(4000000, 1000, 4000000), 
			Velocity = l_Unit_0 * v106, 
			Time = 0.3, 
			GK = true, 
			BallPos = l_CFrame_1.p
		};
		if v78:ServerReact(v107, l_CFrame_1.p) then
			v78:ClientReact(v107);
		end;
	end;
end;
v69.Activate = function(_, v110, _) --[[ Line: 180 ]]
	if v110 == l_Enum_0.UserInputState.Begin then
		if v78:CheckState() and not v78:CheckDebounce() and not v91 and not v90 then
			v78:SetDebounce(true, 2);
			v91 = true;
			-- vrftoprs: removed Humanoid WalkSpeed/JumpPower editor
			if v78:CheckIfInAir(l_Humanoid_0) then
				l_Humanoid_0.FreeFalling:Wait();
				if not v91 then
					return false;
				end;
			end;
			v83.Priority = l_Enum_0.AnimationPriority.Movement;
			v83:Play(0.2, 0.75, 1);
			if v93 ~= nil then
				v93:Disconnect();
				v93 = nil;
			end;
			v93 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 200 ]]
				v80:Speed({
					Set = 16, 
					ReturnTime = 0.09
				});
			end);
			v94 = l_tick_0();
			v92 = v78:ActivateReact({
				ReactLimbs = {
					l_v78_Limbs_0["Right Leg"], 
					l_v78_Limbs_0["Left Leg"], 
					l_v78_Limbs_0["Right Arm"], 
					l_v78_Limbs_0["Left Arm"], 
					l_v78_Limbs_0.Torso, 
					l_v78_Limbs_0.Head
				}, 
				ReactFunc = v108
			});
			v90 = true;
			return;
		end;
	elseif v110 == l_Enum_0.UserInputState.End and v91 then
		v91 = false;
		-- vrftoprs: removed Humanoid WalkSpeed/JumpPower editor
		if v93 ~= nil then
			v93:Disconnect();
			v93 = nil;
		end;
		v90 = false;
		v78:DeactivateReact(v92);
		v83:Stop(0.1);
		task.wait(0.1);
		v78:SetDebounce(false, 2);
	end;
end;
return v69;
