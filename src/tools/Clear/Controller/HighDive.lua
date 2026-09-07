local v8 = {};
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Workspace_0 = game:GetService("Workspace");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or not l_Character_0.Parent then
	l_Character_0 = l_LocalPlayer_0.CharacterAdded:wait();
end;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local CurrentCamera = l_Workspace_0.CurrentCamera;
local l_ClientModules_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules");
local l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0 = require(l_ClientModules_0:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"));
local l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0 = require(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local _ = require(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetLimbs(l_Character_0, l_Humanoid_0);
local Animations = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations");
local ArmsLowCatch = l_Humanoid_0:LoadAnimation(Animations.Clear.Catch.ArmsLowCatch);
local LowPickup = l_Humanoid_0:LoadAnimation(Animations.Clear.Catch.LowPickup);
local v24 = l_Humanoid_0:LoadAnimation(Animations.Clear.Catch.LowMidPickup);
local v25 = l_Humanoid_0:LoadAnimation(Animations.Clear.Catch.RightLowPickup);
local v26 = l_Humanoid_0:LoadAnimation(Animations.Clear.Catch.LeftLowPickup);
local v27 = l_Humanoid_0:LoadAnimation(Animations.Clear.Catch.ArmsHighCatch);
local v28 = l_Humanoid_0:LoadAnimation(Animations.Clear.Catch.HighPickup);
local v29 = l_Humanoid_0:LoadAnimation(Animations.Clear.Catch.HighMidPickup);
local v30 = l_Humanoid_0:LoadAnimation(Animations.Clear.Catch.RightHighPickup);
local v31 = l_Humanoid_0:LoadAnimation(Animations.Clear.Catch.LeftHighPickup);
local l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_LegSwitch_0 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetLegSwitch();
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = {};
local v37 = {};
local v38 = false;
local v39 = {
	Right = {
		Direction = Vector3.new(1, 0, 0), 
		States = {
			Start = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Right.Start), 
				BoostHeight = Vector3.new(0, 0.725, 0), 
				Power = 29
			}, 
			Air = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Right.AirEnd), 
				BoostHeight = Vector3.new(0, 0.275, 0), 
				Power = 30
			}, 
			LateAir = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Right.LateAirEnd), 
				BoostHeight = Vector3.new(0, -0.3, 0), 
				Power = 20
			}, 
			Jump = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Right.JumpEnd), 
				BoostHeight = Vector3.new(0, 0.6, 0), 
				Power = 34
			}, 
			Right = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Right.RightEnd), 
				Direction = Vector3.new(0, 0, 0), 
				BoostHeight = Vector3.new(0, 0.35, 0), 
				BoostDir = Vector3.new(1, 0, 0), 
				Power = 31
			}, 
			Left = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Right.LeftEnd), 
				Direction = Vector3.new(-1, 0, 0), 
				BoostHeight = Vector3.new(0, 0.35, 0), 
				BoostDir = Vector3.new(1, 0, 0), 
				Power = 18
			}, 
			Front = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Right.FrontEnd), 
				Direction = Vector3.new(0, 0, -1), 
				BoostHeight = Vector3.new(0, 0.35, 0), 
				BoostDir = Vector3.new(0.6, 0, -0.4), 
				Power = 31
			}, 
			Back = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Right.BackEnd), 
				Direction = Vector3.new(0, 0, 1), 
				BoostHeight = Vector3.new(0, 0.35, 0), 
				BoostDir = Vector3.new(0.6, 0, 0.4), 
				Power = 31
			}
		}
	}, 
	Left = {
		Direction = Vector3.new(-1, 0, 0), 
		States = {
			Start = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Left.Start), 
				BoostHeight = Vector3.new(0, 0.725, 0), 
				Power = 29
			}, 
			Air = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Left.AirEnd), 
				BoostHeight = Vector3.new(0, 0.275, 0), 
				Power = 30
			}, 
			LateAir = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Left.LateAirEnd), 
				BoostHeight = Vector3.new(0, -0.3, 0), 
				Power = 20
			}, 
			Jump = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Left.JumpEnd), 
				BoostHeight = Vector3.new(0, 0.6, 0), 
				Power = 34
			}, 
			Right = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Left.RightEnd), 
				Direction = Vector3.new(1, 0, 0), 
				BoostHeight = Vector3.new(0, 0.35, 0), 
				BoostDir = Vector3.new(-1, 0, 0), 
				Power = 18
			}, 
			Left = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Left.LeftEnd), 
				Direction = Vector3.new(0, 0, 0), 
				BoostHeight = Vector3.new(0, 0.35, 0), 
				BoostDir = Vector3.new(-1, 0, 0), 
				Power = 31
			}, 
			Front = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Left.FrontEnd), 
				Direction = Vector3.new(0, 0, -1), 
				BoostHeight = Vector3.new(0, 0.35, 0), 
				BoostDir = Vector3.new(-0.6, 0, -0.4), 
				Power = 31
			}, 
			Back = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Left.BackEnd), 
				Direction = Vector3.new(0, 0, 1), 
				BoostHeight = Vector3.new(0, 0.35, 0), 
				BoostDir = Vector3.new(-0.6, 0, 0.4), 
				Power = 31
			}
		}
	}, 
	Front = {
		Direction = Vector3.new(0, 0, -1.5), 
		States = {
			Start = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Front.Start), 
				BoostHeight = Vector3.new(0, 0.5, 0), 
				Power = 28
			}, 
			Front = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Front.FrontEnd), 
				Direction = Vector3.new(0, 0, -1), 
				BoostHeight = Vector3.new(0, 0.55, 0), 
				BoostDir = Vector3.new(0, 0, -1), 
				Power = 31
			}, 
			Right = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Front.FrontRightEnd), 
				Direction = Vector3.new(0.2, 0, -0.8), 
				BoostHeight = Vector3.new(0, 0.55, 0), 
				BoostDir = Vector3.new(0.2, 0, -0.8), 
				Power = 31
			}, 
			Left = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Front.FrontLeftEnd), 
				Direction = Vector3.new(-0.2, 0, -0.8), 
				BoostHeight = Vector3.new(0, 0.55, 0), 
				BoostDir = Vector3.new(-0.2, 0, -0.8), 
				Power = 31
			}, 
			Air = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Front.FrontEnd), 
				BoostDir = Vector3.new(0, 0, -1), 
				BoostHeight = Vector3.new(0, 0.45, 0), 
				Power = 30
			}, 
			LateAir = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Front.LateAirEnd), 
				BoostDir = Vector3.new(0, 0, -1), 
				Power = 24
			}
		}
	}, 
	Back = {
		Direction = Vector3.new(0, 0, 1.5), 
		States = {
			Right = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Back.BackRightEnd), 
				Direction = Vector3.new(0.1, 0, 0.9), 
				BoostHeight = Vector3.new(0, 0.725, 0), 
				BoostDir = Vector3.new(0.05, 0, 0.95), 
				Power = 29
			}, 
			Left = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Back.BackLeftEnd), 
				Direction = Vector3.new(-0.1, 0, 0.9), 
				BoostHeight = Vector3.new(0, 0.725, 0), 
				BoostDir = Vector3.new(-0.05, 0, 0.95), 
				Power = 29
			}, 
			LateAir = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Back.LateAirEnd), 
				BoostDir = Vector3.new(0, 0, 1), 
				Power = 23
			}
		}
	}, 
	Stand = {
		Direction = Vector3.new(0, 0, 0), 
		States = {
			Stand = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Stand.AirEnd), 
				Direction = Vector3.new(0, 0, 0), 
				BoostHeight = Vector3.new(0, 1, 0), 
				BoostDir = Vector3.new(0, 1, 0), 
				Power = 25
			}, 
			Air = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Stand.AirEnd), 
				BoostHeight = Vector3.new(0, 1, 0), 
				BoostDir = Vector3.new(0, 1, 0), 
				Power = 25, 
				NoJumpBoost = true
			}, 
			LateAir = {
				Anim = l_Humanoid_0:LoadAnimation(Animations.Clear.HighDive.Back.LateAirEnd), 
				BoostHeight = Vector3.new(0, -1, 0), 
				BoostDir = Vector3.new(0, -1, 0), 
				Power = 20
			}
		}
	}
};
local l_Keybinds_0 = l_ReplicatedStorage_0:WaitForChild("PlayerData"):WaitForChild(l_LocalPlayer_0.UserId):WaitForChild("Keybinds");
local v41 = {
	CatchUp = {
		Used = false, 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("LowDive"):WaitForChild("KeepUp")
	}, 
	CatchDown = {
		Used = false, 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("LowDive"):WaitForChild("KeepDown")
	}
};
local function v49(v42, v43) --[[ Line: 161 ]]
	local v44 = nil;
	local v45 = 9999;
	for _, v47 in pairs(v42) do
		if v47.Direction then
			local l_Magnitude_0 = (v47.Direction - v43).Magnitude;
			if l_Magnitude_0 < v45 then
				v45 = l_Magnitude_0;
				v44 = v47;
			end;
		end;
	end;
	return v44;
end;
local function v52(v50, v51) --[[ Line: 176 ]]
	if v51 then
		if v50 == v41.CatchUp then
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v27, 0.05, Enum.AnimationPriority.Action3);
		elseif v50 == v41.CatchDown then
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(ArmsLowCatch, 0.05, Enum.AnimationPriority.Action3);
		end;
		l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivateCombo(v35);
		return;
	elseif v50 == v41.CatchUp then
		l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v27, 0.1);
		return;
	else
		if v50 == v41.CatchDown then
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(ArmsLowCatch, 0.1);
		end;
		return;
	end;
end;
local function v57(v53, v54) --[[ Line: 193 ]]
	if v54 == Enum.UserInputState.Begin then
		for v55, v56 in pairs(v41) do
			if v53 == v55 then
				v56.Used = true;
				v52(v56, true);
			else
				v56.Used = false;
				v52(v56, false);
			end;
		end;
		return Enum.ContextActionResult.Sink;
	else
		return Enum.ContextActionResult.Pass;
	end;
end;
local function v62(v58, _) --[[ Line: 209 ]]
	local l_Magnitude_1 = (l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Left Arm"].Position - v58).Magnitude;
	local l_Magnitude_2 = (l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Right Arm"].Position - v58).Magnitude;
	if v41.CatchDown.Used then
		if l_Magnitude_1 < 3 and l_Magnitude_2 < 3 then
			if l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.Position.Y - 1 > v58.Y then
				l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(LowPickup, 0, Enum.AnimationPriority.Action4);
				return;
			else
				l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v24, 0, Enum.AnimationPriority.Action4);
				return;
			end;
		elseif l_Magnitude_2 < l_Magnitude_1 then
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v25, 0, Enum.AnimationPriority.Action4);
			return;
		else
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v26, 0, Enum.AnimationPriority.Action4);
			return;
		end;
	else
		if v41.CatchUp.Used then
			if l_Magnitude_1 < 3 and l_Magnitude_2 < 3 then
				if l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.Position.Y + 2.5 > v58.Y then
					l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v28, 0, Enum.AnimationPriority.Action4);
					return;
				else
					l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v29, 0, Enum.AnimationPriority.Action4);
					return;
				end;
			elseif l_Magnitude_2 < l_Magnitude_1 then
				l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v30, 0, Enum.AnimationPriority.Action4);
				return;
			else
				l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v31, 0, Enum.AnimationPriority.Action4);
			end;
		end;
		return;
	end;
end;
local v63 = Vector3.new(0, 0, 0);
local function v75(v64, v65)
	local l_CFrame_0 = v65.CFrame;
	local l_CFrame_1 = v64.CFrame;
	local l_Velocity_0 = v65.Velocity;
	local l_CFrame_2 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame;
	local l_Velocity_1 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.Velocity;
	local v71 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckIfPlayer(v65);
	if not v71 then
		if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ReactBallCheck(v64, v65, l_CFrame_0.p) and v38 then
			v38 = false;
			if (v41.CatchDown.Used or v41.CatchUp.Used) and (not (v64 ~= l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Right Arm"]) or v64 == l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Left Arm"]) then
				if l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity") then
					l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy();
				end;
				for _, v73 in pairs(v37) do
					l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v73, 0);
				end;
				v62(l_CFrame_0.p);
				l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(ArmsLowCatch, 0);
				l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v27, 0);
				l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:Catch({
					Character = l_Character_0, 
					Ball = v65, 
					Limb = v64, 
					LimbCF = l_CFrame_1, 
					BallPos = l_CFrame_0.p, 
					Timer = true
				});
				return;
			else
				local v74 = {
					Limb = v64, 
					Ball = v65, 
					MaxForce = Vector3.new(4000000000, 4000000000, 4000000000), 
					Velocity = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:Deflect(l_CFrame_0, l_Velocity_0, l_CFrame_1, v63 * l_Velocity_1.Magnitude, l_CFrame_2) * l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MinMaxValue(28 + l_Velocity_0.Magnitude / 2.75, 90, 28), 
					Time = 0.3, 
					GK = true, 
					BallPos = l_CFrame_0.p
				};
				if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ServerReact(v74, l_CFrame_0.p) then
					l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ClientReact(v74);
					return;
				end;
			end;
		end;
	elseif v36[v71] == nil then
		l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:TripPlayer(v71);
		v36[v71] = v71;
	end;
end;
v8.Activate = function(_, InputState, _)
	if InputState == Enum.UserInputState.Begin and l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckState() and not l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckDebounce() then
		v37 = {};
		l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:SetDebounce(true);
		v33 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_LegSwitch_0.Value;
		local l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_CameraZX_0 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetCameraZX(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart);
		local v80 = v49(v39, l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:NullVectorCheck(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_CameraZX_0:VectorToObjectSpace(l_Humanoid_0.MoveDirection).Unit));
		local v81 = false;
		local v82 = false;
		if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckIfInAir(l_Humanoid_0) then
			v82 = true;
		end;
		l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:FallClient({
			Type = "UTrip"
		});
		l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_CameraZX_0;
		v36 = {};
		v34 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateReact({
			ReactLimbs = {
				l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Right Leg"], 
				l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Left Leg"], 
				l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Right Arm"], 
				l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Left Arm"], 
				l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.Torso, 
				l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.Head
			}, 
			ReactFunc = v75
		});
		v38 = true;
		local l_BodyVelocity_0 = Instance.new("BodyVelocity");
		l_BodyVelocity_0.P = 1500;
		l_BodyVelocity_0.MaxForce = Vector3.new(0, 0, 0);
		l_BodyVelocity_0.Parent = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart;
		do
			local l_v81_0 = v81;
			if not v82 and v80 ~= v39.Stand and v80 ~= v39.Back then
				local v85 = l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayTorsoAnim({
					CFrame = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_CameraZX_0, 
					Animation = v80.States.Start.Anim.Animation, 
					Root = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart, 
					Humanoid = l_Humanoid_0
				});
				task.spawn(function()
					l_Humanoid_0:GetPropertyChangedSignal("Jump"):Wait();
					l_v81_0 = true;
				end);
				l_BodyVelocity_0.MaxForce = Vector3.new(100000, 100000, 100000);
				l_BodyVelocity_0.Velocity = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:NullVectorCheck((l_Humanoid_0.MoveDirection + v80.States.Start.BoostHeight).Unit) * v80.States.Start.Power;
				v80.States.Start.Anim:Play(0.1, 1, 1.1);
				v85:Play(0.1, 1, 1.1);
				v80.States.Start.Anim.Stopped:Wait();
			end;
			local v86 = v49(v80.States, l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:NullVectorCheck(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_CameraZX_0:VectorToObjectSpace(l_Humanoid_0.MoveDirection).Unit));
			local v87 = Vector3.new(100000, 100000, 100000);
			local l_BoostDir_0 = v86.BoostDir;
			if l_v81_0 and v80.States.Jump then
				v86 = v80.States.Jump;
			elseif v82 then
				l_BoostDir_0 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:NullVectorCheck(l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:NullVectorCheck(v80.Direction.Unit / 1.5 + l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_CameraZX_0:VectorToObjectSpace(l_Humanoid_0.MoveDirection).Unit)).Unit;
				if l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.Velocity.Y > 10 then
					if v80.States.Air and v86 ~= v80.States.Back and v86 ~= v80.States.Front then
						v86 = v80.States.Air;
					end;
					v87 = Vector3.new(100000, 10000, 100000);
				elseif v80.States.LateAir then
					v86 = v80.States.LateAir;
					v87 = Vector3.new(100000, 0, 100000);
				end;
			end;
			if v86.NoJumpBoost then
				v87 = Vector3.new(100000, 2500, 100000);
			end;
			local v89 = v86.BoostDir or l_BoostDir_0;
			local v90 = v86.BoostHeight or Vector3.zero;
			local v91 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:NullVectorCheck(l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:NullVectorCheck(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_CameraZX_0:VectorToWorldSpace(v89) + v90).Unit);
			local l_Power_0 = v86.Power;
			local v93 = l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayTorsoAnim({
				CFrame = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame, 
				Animation = v86.Anim.Animation, 
				Root = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart, 
				Humanoid = l_Humanoid_0
			});
			v37 = {
				v93, 
				v86.Anim
			};
			local v94 = tick();
			l_BodyVelocity_0.MaxForce = v87;
			l_BodyVelocity_0.Velocity = v91 * l_Power_0;
			if v80 == v39.Stand then
				l_Power_0 = l_Power_0 * 1.2;
				v94 = v94 - 0.5;
			end;
			task.delay(0.1, function() --[[ Line: 408 ]]
				if l_BodyVelocity_0 then
					l_TweenService_0:Create(l_BodyVelocity_0, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
						MaxForce = Vector3.new(1000, 0, 1000)
					}):Play();
				end;
			end);
			local function v95() --[[ Line: 414 ]]
				l_TweenService_0:Create(l_BodyVelocity_0, TweenInfo.new(1.2 - (tick() - v94) * 1.6, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
					Velocity = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:NullVectorCheck((Vector3.new(0, v91.Y, 0) + l_Humanoid_0.MoveDirection).Unit) * l_Power_0
				}):Play();
			end;
			local v96 = nil;
			v96 = l_Humanoid_0:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 419 ]]
				v95();
			end);
			v35 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateCombo({
				Table = v41, 
				Func = v57
			});
			v86.Anim:Play(0.1);
			v93:Play(0.1);
			v86.Anim.Stopped:Wait();
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(ArmsLowCatch, 0);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v27, 0);
			if v96 then
				v96:Disconnect();
				v96 = nil;
			end;
			l_BodyVelocity_0:Destroy();
			l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivateCombo(v35);
			l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ComboReset(v41);
			l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:FallClient({
				Type = "Trip", 
				Ragdoll = true, 
				Time = 0.2
			});
			task.wait(0.1);
			v37 = {};
			v38 = false;
			l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivateReact(v34);
			task.wait(0.2);
			l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:SetDebounce(false);
		end
	end
end
return v8
