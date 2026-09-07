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
						local v3 = (... .. ... or ({
							...
						})[...] and ...) or ...;
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
				return (((p4 and not v0) and v0_) + (p3 and v1)) / 2 + (detecc or 2), 0;
			end;
		end);
	end);
end);
local v7 = {};
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Workspace_0 = game:GetService("Workspace");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or not l_Character_0.Parent then
	l_Character_0 = l_LocalPlayer_0.CharacterAdded:wait();
end;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local _ = l_Workspace_0.CurrentCamera;
local l_ClientModules_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules");
local l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0 = require(l_ClientModules_0:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"));
local l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0 = require(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local _ = require(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetLimbs(l_Character_0, l_Humanoid_0);
local l_Animations_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations");
local v21 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.ArmsLowCatch);
local v22 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.LowPickup);
local v23 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.LowMidPickup);
local v24 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.RightLowPickup);
local v25 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.LeftLowPickup);
local v26 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.ArmsHighCatch);
local v27 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.HighPickup);
local v28 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.HighMidPickup);
local v29 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.RightHighPickup);
local v30 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Catch.LeftHighPickup);
local l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_LegSwitch_0 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetLegSwitch();
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = {};
local v36 = {};
local v37 = false;
local v38 = {
	Right = {
		Direction = Vector3.new(1, 0, 0), 
		States = {
			Start = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.HighDive.Right.Start), 
				BoostHeight = Vector3.new(0, 0, 0), 
				Power = 30
			}, 
			LateAir = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.HighDive.Right.LateAirEnd), 
				BoostHeight = Vector3.new(0, -0.3, 0), 
				Power = 20
			}, 
			Jump = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Right.JumpEnd), 
				BoostHeight = Vector3.new(0, 0.525, 0), 
				Power = 33
			}, 
			Right = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Right.RightEnd), 
				Direction = Vector3.new(0, 0, 0), 
				BoostDir = Vector3.new(1, 0, 0), 
				Power = 32
			}, 
			Left = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Right.LeftEnd), 
				Direction = Vector3.new(-1, 0, 0), 
				BoostDir = Vector3.new(1, 0, 0), 
				Power = 18
			}, 
			Front = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Right.FrontEnd), 
				Direction = Vector3.new(0, 0, -1), 
				BoostDir = Vector3.new(0.6, 0, -0.4), 
				Power = 32
			}, 
			Back = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Right.BackEnd), 
				Direction = Vector3.new(0, 0, 1), 
				BoostDir = Vector3.new(0.6, 0, 0.4), 
				Power = 32
			}
		}
	}, 
	Left = {
		Direction = Vector3.new(-1, 0, 0), 
		States = {
			Start = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.HighDive.Left.Start), 
				BoostHeight = Vector3.new(0, 0, 0), 
				Power = 30
			}, 
			LateAir = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.HighDive.Left.LateAirEnd), 
				BoostHeight = Vector3.new(0, -0.3, 0), 
				Power = 20
			}, 
			Jump = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Left.JumpEnd), 
				BoostHeight = Vector3.new(0, 0.525, 0), 
				Power = 33
			}, 
			Right = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Left.RightEnd), 
				Direction = Vector3.new(1, 0, 0), 
				BoostDir = Vector3.new(-1, 0, 0), 
				Power = 18
			}, 
			Left = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Left.LeftEnd), 
				Direction = Vector3.new(0, 0, 0), 
				BoostDir = Vector3.new(-1, 0, 0), 
				Power = 32
			}, 
			Front = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Left.FrontEnd), 
				Direction = Vector3.new(0, 0, -1), 
				BoostDir = Vector3.new(-0.6, 0, -0.4), 
				Power = 32
			}, 
			Back = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Left.BackEnd), 
				Direction = Vector3.new(0, 0, 1), 
				BoostDir = Vector3.new(-0.6, 0, 0.4), 
				Power = 32
			}
		}
	}, 
	Front = {
		Direction = Vector3.new(0, 0, -1.5), 
		States = {
			Start = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Front.Start), 
				BoostHeight = Vector3.new(0, -0.2, 0), 
				Power = 30
			}, 
			Right = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Front.FrontRightEnd), 
				Direction = Vector3.new(0.1, 0, -0.9), 
				BoostDir = Vector3.new(0, 0, -1), 
				Power = 32
			}, 
			Left = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Front.FrontLeftEnd), 
				Direction = Vector3.new(-0.1, 0, -0.9), 
				BoostDir = Vector3.new(0, 0, -1), 
				Power = 32
			}
		}
	}, 
	Back = {
		Direction = Vector3.new(0, 0, 1.5), 
		States = {
			Start = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Back.Start), 
				BoostHeight = Vector3.new(0, -0.3, 0), 
				BoostDir = Vector3.new(0, 0, 1), 
				Power = 24, 
				NoJumpBoost = true
			}, 
			Back = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Back.BackEnd), 
				Direction = Vector3.new(0, 0, 1), 
				BoostDir = Vector3.new(0, 0, 1), 
				Power = 24, 
				NoJumpBoost = true
			}, 
			Jump = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Back.JumpEnd), 
				BoostHeight = Vector3.new(0, 0.6, 0), 
				Power = 26
			}
		}
	}, 
	Stand = {
		Direction = Vector3.new(0, 0, 0), 
		States = {
			Stand = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Stand.StandEnd), 
				Direction = Vector3.new(0, 0, 0), 
				BoostDir = Vector3.new(0, 0, 0.2), 
				BoostHeight = Vector3.new(0, -0.8, 0), 
				Power = 24, 
				NoJumpBoost = true
			}, 
			Air = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Stand.StandEnd), 
				BoostDir = Vector3.new(0, 0, 0.2), 
				BoostHeight = Vector3.new(0, -0.8, 0), 
				Power = 24, 
				NoJumpBoost = true
			}, 
			LateAir = {
				Anim = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.LowDive.Stand.StandEnd), 
				BoostDir = Vector3.new(0, 0, 0.2), 
				BoostHeight = Vector3.new(0, -0.8, 0), 
				Power = 24, 
				NoJumpBoost = true
			}
		}
	}
};
local l_Keybinds_0 = l_ReplicatedStorage_0:WaitForChild("PlayerData"):WaitForChild(l_LocalPlayer_0.UserId):WaitForChild("Keybinds");
local v40 = {
	CatchUp = {
		Used = false, 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("LowDive"):WaitForChild("KeepUp")
	}, 
	CatchDown = {
		Used = false, 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("LowDive"):WaitForChild("KeepDown")
	}
};
local function v48(v41, v42) --[[ Line: 156 ]]
	local v43 = nil;
	local v44 = 9999;
	for _, v46 in pairs(v41) do
		if v46.Direction then
			local l_Magnitude_0 = (v46.Direction - v42).Magnitude;
			if l_Magnitude_0 < v44 then
				v44 = l_Magnitude_0;
				v43 = v46;
			end;
		end;
	end;
	return v43;
end;
local function v51(v49, v50) --[[ Line: 171 ]]
	if v50 then
		if v49 == v40.CatchUp then
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v26, 0.05, Enum.AnimationPriority.Action3);
		elseif v49 == v40.CatchDown then
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v21, 0.05, Enum.AnimationPriority.Action3);
		end;
		l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivateCombo(v34);
		return ;
	elseif v49 == v40.CatchUp then
		l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v26, 0.1);
		return ;
	else
		if v49 == v40.CatchDown then
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v21, 0.1);
		end;
		return ;
	end;
end;
local function v56(v52, v53) --[[ Line: 188 ]]
	if v53 == Enum.UserInputState.Begin then
		for v54, v55 in pairs(v40) do
			if v52 == v54 then
				v55.Used = true;
				v51(v55, true);
			else
				v55.Used = false;
				v51(v55, false);
			end;
		end;
		return Enum.ContextActionResult.Sink;
	else
		return Enum.ContextActionResult.Pass;
	end;
end;
local function v61(v57, _) --[[ Line: 204 ]]
	local l_Magnitude_1 = (l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Left Arm"].Position - v57).Magnitude;
	local l_Magnitude_2 = (l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Right Arm"].Position - v57).Magnitude;
	if v40.CatchDown.Used then
		if l_Magnitude_1 < 3 and l_Magnitude_2 < 3 then
			if v57.Y < l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.Position.Y - 1 then
				l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v22, 0, Enum.AnimationPriority.Action4);
				return ;
			else
				l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v23, 0, Enum.AnimationPriority.Action4);
				return ;
			end;
		elseif l_Magnitude_2 < l_Magnitude_1 then
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v24, 0, Enum.AnimationPriority.Action4);
			return ;
		else
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v25, 0, Enum.AnimationPriority.Action4);
			return ;
		end;
	else
		if v40.CatchUp.Used then
			if l_Magnitude_1 < 3 and l_Magnitude_2 < 3 then
				if v57.Y < l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.Position.Y + 2.5 then
					l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v27, 0, Enum.AnimationPriority.Action4);
					return ;
				else
					l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v28, 0, Enum.AnimationPriority.Action4);
					return ;
				end;
			elseif l_Magnitude_2 < l_Magnitude_1 then
				l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v29, 0, Enum.AnimationPriority.Action4);
				return ;
			else
				l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v30, 0, Enum.AnimationPriority.Action4);
			end;
		end;
		return ;
	end;
end;
local v62 = Vector3.new(0, 0, 0);
local function v74(v63, v64) --[[ Line: 235 ]]
	local l_CFrame_0 = v64.CFrame;
	local l_CFrame_1 = v63.CFrame;
	local l_Velocity_0 = v64.Velocity;
	local l_CFrame_2 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame;
	local l_Velocity_1 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.Velocity;
	local v70 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckIfPlayer(v64);
	if not v70 then
		if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ReactBallCheck(v63, v64, l_CFrame_0.p) and v37 then
			v37 = false;
			if (v40.CatchDown.Used or v40.CatchUp.Used) and (not (v63 ~= l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Right Arm"]) or v63 == l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Left Arm"]) then
				if l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity") then
					l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy();
				end;
				for _, v72 in pairs(v36) do
					l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v72, 0);
				end;
				v61(l_CFrame_0.p);
				l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v21, 0);
				l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v26, 0);
				l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:Catch({
					Character = l_Character_0, 
					Ball = v64, 
					Limb = v63, 
					LimbCF = l_CFrame_1, 
					BallPos = l_CFrame_0.p, 
					Timer = true
				});
				return ;
			else
				print(l_Velocity_0)
				print(l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:Deflect(l_CFrame_0, l_Velocity_0, l_CFrame_1, v62 * l_Velocity_1.Magnitude, l_CFrame_2) * l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MinMaxValue(28 + l_Velocity_0.Magnitude / 2.75, 90, 28))
				local v73 = {
					Limb = v63, 
					Ball = v64, 
					MaxForce = Vector3.new(4000000000, 4000000000, 4000000000), 
					Velocity = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:Deflect(l_CFrame_0, l_Velocity_0, l_CFrame_1, v62 * l_Velocity_1.Magnitude, l_CFrame_2) * l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MinMaxValue(28 + l_Velocity_0.Magnitude / 2.75, 90, 28), 
					Time = 0.3, 
					GK = true, 
					BallPos = l_CFrame_0.p
				};
				if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ServerReact(v73, l_CFrame_0.p) then
					l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ClientReact(v73);
					return ;
				end;
			end;
		end;
	elseif v35[v70] == nil then
		l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:TripPlayer(v70);
		v35[v70] = v70;
	end;
end;
v7.Activate = function(_, v76, _) --[[ Line: 304 ]]
	if (v76 == Enum.UserInputState.Begin and l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckState()) and not l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckDebounce() then
		
		v36 = {};
		l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:SetDebounce(true);
		v32 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_LegSwitch_0.Value;
		local l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_CameraZX_0 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetCameraZX(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart);
		local v79 = v48(v38, l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:NullVectorCheck(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_CameraZX_0:VectorToObjectSpace(l_Humanoid_0.MoveDirection).Unit));
		local v80 = false;
		local v81 = false;
		if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckIfInAir(l_Humanoid_0) then
			v81 = true;
		end;
		l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:FallClient({
			Type = "UTrip"
		});
		l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_CameraZX_0;
		v35 = {};
		v33 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateReact({
			ReactLimbs = {
				l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Right Leg"], 
				l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Left Leg"], 
				l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Right Arm"], 
				l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Left Arm"], 
				l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.Torso, 
				l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.Head
			}, 
			ReactFunc = v74
		});
		v37 = true;
		local l_BodyVelocity_0 = Instance.new("BodyVelocity");
		l_BodyVelocity_0.P = 1500;
		l_BodyVelocity_0.MaxForce = Vector3.new(0, 0, 0);
		l_BodyVelocity_0.Parent = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart;
		do
			local l_v80_0 = v80;
			if not v81 and v79 ~= v38.Stand then
				local v84 = l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayTorsoAnim({
					CFrame = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_CameraZX_0, 
					Animation = v79.States.Start.Anim.Animation, 
					Root = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart, 
					Humanoid = l_Humanoid_0
				});
				task.spawn(function() --[[ Line: 348 ]]
					l_Humanoid_0:GetPropertyChangedSignal("Jump"):Wait();
					l_v80_0 = true;
				end);
				l_BodyVelocity_0.MaxForce = Vector3.new(100000, 100000, 100000);
				l_BodyVelocity_0.Velocity = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:NullVectorCheck((l_Humanoid_0.MoveDirection + v79.States.Start.BoostHeight).Unit) * v79.States.Start.Power;
				v79.States.Start.Anim:Play(0.1, 1, 1.1);
				v84:Play(0.1, 1, 1.1);
				v79.States.Start.Anim.Stopped:Wait();
			end;
			local v85 = v48(v79.States, l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:NullVectorCheck(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_CameraZX_0:VectorToObjectSpace(l_Humanoid_0.MoveDirection).Unit));
			local v86 = Vector3.new(100000, 100000, 100000);
			local l_BoostDir_0 = v85.BoostDir;
			if l_v80_0 and v79.States.Jump then
				v85 = v79.States.Jump;
			elseif v81 then
				if v79.States.LateAir then
					v85 = v79.States.LateAir;
				end;
				v86 = Vector3.new(100000, 2000, 100000);
			end;
			if v85.NoJumpBoost then
				v86 = Vector3.new(100000, 0, 100000);
			end;
			local v88 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:NullVectorCheck(l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:NullVectorCheck(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_CameraZX_0:VectorToWorldSpace(v85.BoostDir or l_BoostDir_0) + (v85.BoostHeight or Vector3.zero)).Unit);
			local l_Power_0 = v85.Power;
			local v90 = l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayTorsoAnim({
				CFrame = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame, 
				Animation = v85.Anim.Animation, 
				Root = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart, 
				Humanoid = l_Humanoid_0
			});
			v36 = {
				v90, 
				v85.Anim
			};
			local v91 = tick();
			l_BodyVelocity_0.MaxForce = v86;
			l_BodyVelocity_0.Velocity = v88 * l_Power_0;
			if v79 == v38.Stand then
				l_Power_0 = l_Power_0 * 1.2;
				v91 = v91 - 0.5;
			end;
			task.delay(0.1, function() --[[ Line: 402 ]]
				if l_BodyVelocity_0 then
					l_TweenService_0:Create(l_BodyVelocity_0, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
						MaxForce = Vector3.new(1000, 0, 1000)
					}):Play();
				end;
			end);
			local function v92() --[[ Line: 408 ]]
				l_TweenService_0:Create(l_BodyVelocity_0, TweenInfo.new(1.2 - (tick() - v91) * 1.6, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
					Velocity = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:NullVectorCheck((Vector3.new(0, v88.Y, 0) + l_Humanoid_0.MoveDirection).Unit) * l_Power_0
				}):Play();
			end;
			local v93 = nil;
			v93 = l_Humanoid_0:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 413 ]]
				v92();
			end);
			v34 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateCombo({
				Table = v40, 
				Func = v56
			});
			v85.Anim:Play(0.1);
			v90:Play(0.1);
			v85.Anim.Stopped:Wait();
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v21, 0);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v26, 0);
			if v93 then
				v93:Disconnect();
				v93 = nil;
			end;
			l_BodyVelocity_0:Destroy();
			l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivateCombo(v34);
			l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ComboReset(v40);
			l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:FallClient({
				Type = "Trip", 
				Ragdoll = true, 
				Time = 0.2
			});
			task.wait(0.1);
			v36 = {};
			v37 = false;
			l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivateReact(v33);
			task.wait(0.2);
			l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:SetDebounce(false);
		end;
	end;
end;
return v7;
