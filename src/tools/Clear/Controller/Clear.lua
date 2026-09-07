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
local v8 = {};
local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or not l_Character_0.Parent then
	l_Character_0 = l_LocalPlayer_0.CharacterAdded:wait();
end;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local l_ClientModules_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules");
local l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0 = require(l_ClientModules_0:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"));
local l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0 = require(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local l_IlllIlIIIlIlllIIlIlIlIllllIIllIII_0 = require(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_HumanoidStateRemote_0 = l_ReplicatedStorage_0:WaitForChild("Remotes"):WaitForChild("HumanoidStateRemote");
local l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetLimbs(l_Character_0, l_Humanoid_0);
local l_Animations_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations");
local v21 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.RightChargeStart);
local v22 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.RightChargeLoop);
local v23 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Shoot.RightShoot);
local v24 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftChargeStart);
local v25 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftChargeLoop);
local v26 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Shoot.LeftShoot);
local v27 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Clear.ClearRightStart);
local v28 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Clear.ClearLeftStart);
local v29 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Clear.ClearRightLoop);
local v30 = l_Humanoid_0:LoadAnimation(l_Animations_0.Clear.Clear.ClearLeftLoop);
local v31 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.FakePass.RightFakePass);
local v32 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.FakePass.LeftFakePass);
local v33 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.RightToRight);
local v34 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.LeftToRight);
local v35 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.RightToLeft);
local v36 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.LeftToLeft);
local v37 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Shoot.RightBackSpin);
local v38 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Shoot.LeftBackSpin);
local v39 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Shoot.RightFrontSpin);
local v40 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Shoot.LeftFrontSpin);
local l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_LegSwitch_0 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetLegSwitch();
local v42 = nil;
local v43 = false;
local v44 = 0;
local v45 = false;
local v46 = nil;
local v47 = nil;
local l_Keybinds_0 = l_ReplicatedStorage_0:WaitForChild("PlayerData"):WaitForChild(l_LocalPlayer_0.UserId):WaitForChild("Keybinds");
local v49 = {
	FrontSpinCombo = {
		Used = false, 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("Clear"):WaitForChild("FrontSpin"), 
		Overlay = {
			"FakeRrpsCombo", 
			"FakeLrpsCombo"
		}
	}, 
	BackSpinCombo = {
		Used = false, 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("Clear"):WaitForChild("BackSpin"), 
		Overlay = {
			"FakeRrpsCombo", 
			"FakeLrpsCombo"
		}
	}, 
	BallStopCombo = {
		Used = false, 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("Clear"):WaitForChild("StopBall")
	}, 
	FakeRrpsCombo = {
		Used = false, 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("Clear"):WaitForChild("FakeRrps"), 
		Overlay = {
			"FrontSpinCombo", 
			"BackSpinCombo"
		}
	}, 
	FakeLrpsCombo = {
		Used = false, 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("Clear"):WaitForChild("FakeLrps"), 
		Overlay = {
			"FrontSpinCombo", 
			"BackSpinCombo"
		}
	}, 
	CancelCombo = {
		Used = false, 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("Clear"):WaitForChild("Cancel")
	}
};
local function v52(v50, v51) --[[ Line: 140 ]]
	if v51 == Enum.UserInputState.Begin and v50 == "CancelCombo" then
		v49.CancelCombo.Used = true;
		v8.Activate("Cancel", Enum.UserInputState.End, "Cancel");
		return Enum.ContextActionResult.Sink;
	else
		l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:InputCombo(v50, v51, v49);
		return;
	end;
end;
local v53 = 0;
local function v66(v54, v55, v56, v57, v58, v59, v60) --[[ Line: 153 ]]
	local v61 = Vector3.new(400000, 400000, 400000);
	local v62 = v59.lookVector * v58;
	
	if game:GetService("UserInputService").TouchEnabled then
		local SpinType = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetSpinType()
		local TableToLookIn = v49

		if SpinType == "B" then
			TableToLookIn.BackSpinCombo.Used = true
			TableToLookIn.FrontSpinCombo.Used = false
		elseif SpinType == "T" then
			TableToLookIn.FrontSpinCombo.Used = true
			TableToLookIn.BackSpinCombo.Used = false
		elseif SpinType == "" or SpinType == "N" then
			TableToLookIn.FrontSpinCombo.Used = false
			TableToLookIn.BackSpinCombo.Used = false
		end
	end
	
	if v49.BallStopCombo.Used then
		if v56.Velocity.Magnitude > 70 then
			return Vector3.new(0, 0, 0), v56.Velocity / 4.5, v61;
		else
			return Vector3.new(0, 0, 0), Vector3.new(0, 0, 0), v61;
		end;
	else
		if v49.FakeLrpsCombo.Used then
			v62 = (v59 * CFrame.fromOrientation(math.rad(v60 / 3), 0.9250245035569946, 0)).lookVector * v58 / 1.175;
		elseif v49.FakeRrpsCombo.Used then
			v62 = (v59 * CFrame.fromOrientation(math.rad(v60 / 3), -0.9250245035569946, 0)).lookVector * v58 / 1.175;
		end;
		local l_Unit_0 = v62.Unit;
		local l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0, _ = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetSpin((v55 * CFrame.new(0, -0.5, 0)).p, v57, -v54.CFrame.upVector, v58, 150);
		if v49.BackSpinCombo.Used then
			l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 / 1.25 + Vector3.new(l_Unit_0.Z, 0, -l_Unit_0.X) * -v58 / (1 + l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0.Magnitude / 600);
			v62 = v62 * 0.985;
		elseif v49.FrontSpinCombo.Used then
			l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 / 1.25 + Vector3.new(l_Unit_0.Z, 0, -l_Unit_0.X) * (80 + v44 / 3.5) / (1 + l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0.Magnitude / 600);
			v62 = v62 * 0.985;
		elseif l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 == Vector3.zero then
			l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 + Vector3.new(l_Unit_0.Z, 0, -l_Unit_0.X) * (8 + v58 / 6);
		end;
		return l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0, v62, v61;
	end;
end;
local function v78(v67, v68) --[[ Line: 183 ]]
	local l_Position_0 = v68.Position;
	local l_CFrame_0 = v67.CFrame;
	if not l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ReactBallCheck(v67, v68, l_Position_0) or not v45 then
		return;
	else
		v45 = false;
		local v71 = 50 + v44 * 1.125;
		local v72 = 25 + l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetHeightAngle(30, 0) / 3;
		local v73 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(math.rad(v72), 0, 0);
		local v74, v75, v76 = v66(v67, l_CFrame_0, v68, l_Position_0, v71, v73, v72);
		local v77 = {
			Limb = v67, 
			Ball = v68, 
			MaxForce = v76, 
			Velocity = v75 * math.clamp(0.7 + math.clamp((v72 - 15) * 2, 0, 30) / 100, 0.7, 1), 
			Spin = v74, 
			Time = 0.3
		};
		if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ServerReact(v77, l_Position_0) then
			l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ClientReact(v77);
		end;
		return;
	end;
end;
local v79 = false;
local v80 = false;
v8.Activate = function(v81, v82, _) --[[ Line: 215 ]]
	if v82 == Enum.UserInputState.Begin then
		if not l_HumanoidStateRemote_0:Invoke() and not l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckDebounce(2) then
			if v81 == "Delayed" and not v80 then
				return;
			elseif l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckDebounce2(1) and v81 ~= "Delayed" then
				v80 = true;
				l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DelayReleaseQueue(v8.Activate, 1, v82);
				return;
			else
				l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:SetDebounce(true, 2);
				v42 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_LegSwitch_0.Value;
				v43 = true;
				l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivatePowerBar({
					{
						Time = 0.8, 
						ES = Enum.EasingStyle.Sine, 
						ED = Enum.EasingDirection.Out, 
						To = 100
					}
				});
				v47 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateCombo({
					Table = v49, 
					Func = v52
				});
				if v46 ~= nil then
					v46:Disconnect();
					v46 = nil;
				end;
				v46 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 245 ]]
					l_IlllIlIIIlIlllIIlIlIlIllllIIllIII_0:Speed({
						Set = l_IlllIlIIIlIlllIIlIlIlIllllIIllIII_0:GetNeutralSpeed() - l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetPowerBar() / 50, 
						ReturnTime = 0.6
					});
				end);
				v79 = false;
				local l_LocalBWeld_0 = l_Character_0:FindFirstChild("LocalBWeld");
				local _ = nil;
				if not l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckHold() and l_LocalBWeld_0.Part0 then
					v79 = true;
				end;
				if not v79 then
					if not v42 then
						v21:Play(0);
						v21.Stopped:Wait();
						if v43 then
							v22:Play(0);
							return;
						end;
					else
						v24:Play(0);
						v24.Stopped:Wait();
						if v43 then
							v25:Play(0);
							return;
						end;
					end;
				elseif not v42 then
					v27:Play(0);
					v27.Stopped:Wait();
					if v43 then
						v29:Play(0);
						return;
					end;
				else
					v28:Play(0);
					v28.Stopped:Wait();
					if v43 then
						v30:Play(0);
						return;
					end;
				end;
			end;
		end;
	elseif v82 == Enum.UserInputState.End and (v43 or v80) then
		if v80 and not v43 then
			v80 = false;
			return;
		else
			v80 = false;
			v43 = false;
			v53 = tick();
			l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:StopPowerBar();
			v44 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetPowerBar();
			l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivateCombo(v47);
			if v46 ~= nil then
				v46:Disconnect();
				v46 = nil;
			end;
			if v79 and not v49.CancelCombo.Used then
				l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DropBall({
					Character = l_Character_0
				});
			end;
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v21, 0);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v24, 0);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v22, 0);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v25, 0);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v27, 0);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v28, 0);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v29, 0);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v30, 0);
			if not v49.CancelCombo.Used then
				if not v42 then
					if v49.BallStopCombo.Used then
						l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v31, 0, Enum.AnimationPriority.Action3);
						l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v31, 0.6, Enum.AnimationPriority.Action3);
					elseif v49.FakeLrpsCombo.Used then
						l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v35, 0, Enum.AnimationPriority.Action3);
						l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v35, 0.6, Enum.AnimationPriority.Action3);
					elseif v49.FakeRrpsCombo.Used then
						l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v33, 0, Enum.AnimationPriority.Action3);
						l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v33, 0.6, Enum.AnimationPriority.Action3);
					end;
					if v49.FrontSpinCombo.Used then
						l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v39, 0, Enum.AnimationPriority.Action2);
						v39:Play(0);
					elseif v49.BackSpinCombo.Used then
						l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v37, 0, Enum.AnimationPriority.Action2);
					else
						l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v23, 0, Enum.AnimationPriority.Action2);
					end;
				else
					if v49.BallStopCombo.Used then
						l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v32, 0, Enum.AnimationPriority.Action3);
						l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v32, 0.6, Enum.AnimationPriority.Action3);
					elseif v49.FakeLrpsCombo.Used then
						l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v36, 0, Enum.AnimationPriority.Action3);
						l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v36, 0.6, Enum.AnimationPriority.Action3);
					elseif v49.FakeRrpsCombo.Used then
						l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v34, 0, Enum.AnimationPriority.Action3);
						l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v34, 0.6, Enum.AnimationPriority.Action3);
					end;
					if v49.FrontSpinCombo.Used then
						l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v40, 0, Enum.AnimationPriority.Action2);
					elseif v49.BackSpinCombo.Used then
						l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v38, 0, Enum.AnimationPriority.Action2);
					else
						l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v26, 0, Enum.AnimationPriority.Action2);
					end;
				end;
				local v86 = nil;
				v86 = if not v42 then l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateReact({
					ReactLimbs = {
						l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Right Leg"]
					}, 
					ReactFunc = v78
				}) else l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateReact({
						ReactLimbs = {
							l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Left Leg"]
						}, 
						ReactFunc = v78
					});
				l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:AnkleActivation(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart, l_Humanoid_0);
				v45 = true;
				task.wait(0.6);
				l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:AnkleDeactivation(v45);
				v45 = false;
				l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivateReact(v86);
			end;
			l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivatePowerBar();
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v31, 0.1);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v35, 0.1);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v33, 0.1);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v32, 0.1);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v36, 0.1);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v34, 0.1);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v23, 0.1);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v26, 0.1);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v39, 0.1);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v40, 0.1);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v37, 0.1);
			l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v38, 0.1);
			l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ComboReset(v49);
			task.wait(0.2);
			l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:SetDebounce(false, 2);
			l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:PlayQueue();
		end;
	end;
end;
return v8;
