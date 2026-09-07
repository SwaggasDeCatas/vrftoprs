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
local l_math_0 = math;
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
local l_Vector3_0 = Vector3;
local _ = Region3;
local l_CFrame_0 = CFrame;
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
local _ = l_require_0(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local _ = l_require_0(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_HumanoidStateRemote_0 = l_ReplicatedStorage_0:WaitForChild("Remotes"):WaitForChild("HumanoidStateRemote");
local l_v75_Limbs_0 = v75:GetLimbs(l_Character_0, l_Humanoid_0);
local l_Animations_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations");
local v81 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.DropBall);
local v82 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.DropBallUp);
local _ = v75:GetLegSwitch();
v69.Activate = function(_, v85, _) --[[ Line: 117 ]]
	if v85 == l_Enum_0.UserInputState.Begin then
		local l_LocalBWeld_0 = l_Character_0:FindFirstChild("LocalBWeld");
		if not v75:CheckHold() and not l_HumanoidStateRemote_0:Invoke() and l_LocalBWeld_0 and not v75:CheckDebounce() then
			local l_Part0_0 = l_LocalBWeld_0.Part0;
			if l_Part0_0 then
				v75:SetDebounce(true);
				local v89 = false;
				if l_v75_Limbs_0.HumanoidRootPart.Velocity.Y > 2 then
					v89 = true;
					v82:Play(0.1);
				else
					v81:Play(0.1);
				end;
				task.wait(0.2);
				v75:DropBall({
					Character = l_Character_0
				});
				local l_Unit_0 = l_v75_Limbs_0.HumanoidRootPart.CFrame.LookVector.Unit;
				local v91 = l_Vector3_0.new(l_Unit_0.Z, 0, -l_Unit_0.X) * 8;
				local v92 = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(-45), 0, 0)).lookVector * (l_Humanoid_0.MoveDirection.Magnitude * l_Humanoid_0.WalkSpeed + 8);
				if v89 then
					v92 = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(45), 0, 0)).lookVector * (l_Humanoid_0.MoveDirection.Magnitude * l_Humanoid_0.WalkSpeed + 8);
				end;
				local v93 = {
					Limb = l_v75_Limbs_0.HumanoidRootPart, 
					Ball = l_Part0_0, 
					MaxForce = l_Vector3_0.new(90000000000, 2000, 90000000000), 
					Velocity = v92, 
					Time = 0.1, 
					Spin = v91
				};
				v75:ClientReact(v93);
				v75:SetDebounce(false);
				v75:PlayQueue();
			end;
		end;
	end;
end;
return v69;
