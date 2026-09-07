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
local l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetLimbs(l_Character_0, l_Humanoid_0);
local l_Animations_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations");
local v20 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.RightChargeStart);
local v21 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.RightChargeLoop);
local v22 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Shoot.RightShoot);
local v23 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftChargeStart);
local v24 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftChargeLoop);
local v25 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Shoot.LeftShoot);
local v26 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.FakePass.RightFakePass);
local v27 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.FakePass.LeftFakePass);
local v28 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.RightToRight);
local v29 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.LeftToRight);
local v30 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.RightToLeft);
local v31 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.LeftToLeft);
local v32 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Shoot.RightBackSpin);
local v33 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Shoot.LeftBackSpin);
local v34 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Shoot.RightFrontSpin);
local v35 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Shoot.LeftFrontSpin);
local l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_LegSwitch_0 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetLegSwitch();
local v37 = nil;
local v38 = false;
local v39 = 0;
local v40 = false;
local v41 = nil;
local v42 = nil;
local l_Keybinds_0 = l_ReplicatedStorage_0:WaitForChild("PlayerData"):WaitForChild(l_LocalPlayer_0.UserId):WaitForChild("Keybinds");
local v44 = {
    FrontSpinCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Long"):WaitForChild("Long"):WaitForChild("FrontSpin"), 
        Overlay = {
            "FakeRrpsCombo", 
            "FakeLrpsCombo"
        }
    }, 
    BackSpinCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Long"):WaitForChild("Long"):WaitForChild("BackSpin"), 
        Overlay = {
            "FakeRrpsCombo", 
            "FakeLrpsCombo"
        }
    }, 
    BallStopCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Long"):WaitForChild("Long"):WaitForChild("StopBall")
    }, 
    FakeRrpsCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Long"):WaitForChild("Long"):WaitForChild("FakeRrps"), 
        Overlay = {
            "FrontSpinCombo", 
            "BackSpinCombo"
        }
    }, 
    FakeLrpsCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Long"):WaitForChild("Long"):WaitForChild("FakeLrps"), 
        Overlay = {
            "FrontSpinCombo", 
            "BackSpinCombo"
        }
    }
};
local function v47(v45, v46) --[[ Line: 131 ]]
    l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:InputCombo(v45, v46, v44);
end;
local v48 = 0;
local function v60(v49, v50, v51, v52, v53, v54, v55) --[[ Line: 136 ]]
	if game:GetService("UserInputService").TouchEnabled then
		local SpinType = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetSpinType()
		local TableToLookIn = v44
		
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
	
    local v56 = v54.lookVector * v53;
    if v44.BallStopCombo.Used then
        if v51.Velocity.Magnitude > 70 then
            return Vector3.new(0, 0, 0, 0), v51.Velocity / 4.5, (Vector3.new(400000, 400000, 400000, 0));
        else
            return Vector3.new(0, 0, 0, 0), Vector3.new(0, 0, 0, 0), (Vector3.new(400000, 400000, 400000, 0));
        end;
    else
        if v44.FakeLrpsCombo.Used then
            v56 = (v54 * CFrame.fromOrientation(math.rad(v55 / 3), 0.9250245035569946, 0)).lookVector * v53 / 1.175;
        elseif v44.FakeRrpsCombo.Used then
            v56 = (v54 * CFrame.fromOrientation(math.rad(v55 / 3), -0.9250245035569946, 0)).lookVector * v53 / 1.175;
        end;
        local l_Unit_0 = v56.Unit;
        local l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0, v59 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetSpin((v50 * CFrame.new(0, -0.5, 0)).p, v52, -v49.CFrame.upVector, v53, 150);
        if v44.BackSpinCombo.Used then
            l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 / 1.25 + Vector3.new(l_Unit_0.Z, 0, -l_Unit_0.X) * -math.clamp(v53, 80, 180) / (1 + l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0.Magnitude / 600);
            v56 = v56 * 0.985;
        elseif v44.FrontSpinCombo.Used then
            l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 / 1.25 + Vector3.new(l_Unit_0.Z, 0, -l_Unit_0.X) * (80 + v39 / 3.5) / (1 + l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0.Magnitude / 600);
            v56 = v56 * 0.985;
        elseif v48 + 0.4 < tick() and v59 < 12 then
            l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 + Vector3.new(0, l_Unit_0.Y, 0) * math.clamp(-2 + v59 * 2, 0, 30);
        elseif l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 == Vector3.zero then
            l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 + Vector3.new(l_Unit_0.Z, 0, -l_Unit_0.X) * (10 + v53 / 3.75);
        end;
        return l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0, v56, (Vector3.new(400000, 400000, 400000, 0));
    end;
end;
local function v72(v61, v62) --[[ Line: 168 ]]
    local l_Position_0 = v62.Position;
    local l_CFrame_0 = v61.CFrame;
    if not l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ReactBallCheck(v61, v62, l_Position_0) or not v40 then
        return;
    else
        v40 = false;
        local v65 = 55 + math.pow(math.max(v39, 1), 1.6) / 14.5;
        local v66 = 35 + l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetHeightAngle(30, 0) / 6;
        local v67 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(math.rad(v66), 0, 0);
        local v68, v69, v70 = v60(v61, l_CFrame_0, v62, l_Position_0, v65, v67, v66);
        local v71 = {
            Limb = v61, 
            Ball = v62, 
            MaxForce = v70, 
            Velocity = v69, 
            Spin = v68, 
            Time = 0.3
        };
        if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ServerReact(v71, l_Position_0) then
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ClientReact(v71);
        end;
        return;
    end;
end;
local v73 = false;
v8.Activate = function(v74, v75, _) --[[ Line: 199 ]]
    if v75 == Enum.UserInputState.Begin then
        if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckState() and (not l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckDebounce(2) or v74 == "Delayed") and not l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetSharedCooldown("NoPrecharge") then
            local v77 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckDebounce2(1);
            if v74 == "Delayed" and not v73 then
                return;
            else
                l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:SetDebounce(true, 2);
                v37 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_LegSwitch_0.Value;
                v38 = true;
                if v74 ~= "Delayed" then
                    l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivatePowerBar({
                        {
                            Time = 0.75, 
                            ES = Enum.EasingStyle.Linear, 
                            ED = Enum.EasingDirection.Out, 
                            To = 100
                        }
                    });
                    v42 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateCombo({
                        Table = v44, 
                        Func = v47
                    });
                    if v41 ~= nil then
                        v41:Disconnect();
                        v41 = nil;
                    end;
                    v41 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 227 ]]
                        l_IlllIlIIIlIlllIIlIlIlIllllIIllIII_0:Speed({
                            Set = l_IlllIlIIIlIlllIIlIlIlIllllIIllIII_0:GetNeutralSpeed() - math.clamp(l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetPowerBar() / 75 - 0.5, 0, 1), 
                            ReturnTime = 0.6
                        });
                    end);
                end;
                if v77 and v74 ~= "Delayed" then
                    v73 = true;
                    l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DelayReleaseQueue(v8.Activate, 1, v75);
                    return;
                elseif not v37 then
                    v20:Play(0);
                    v20.Stopped:Wait();
                    if v38 then
                        v21:Play(0);
                        return;
                    end;
                else
                    v23:Play(0);
                    v23.Stopped:Wait();
                    if v38 then
                        v24:Play(0);
                        return;
                    end;
                end;
            end;
        end;
    elseif v75 == Enum.UserInputState.End and (not (not v38 and not v73) or v74 == "Delayed") then
        l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:StopPowerBar();
        if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckDebounce2(1) and v74 ~= "Delayed" then
            v73 = false;
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DelayReleaseQueue(v8.Activate, 1, Enum.UserInputState.End);
            return;
        else
            v73 = false;
            v38 = false;
            v48 = tick();
            v39 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetPowerBar();
            if v41 ~= nil then
                v41:Disconnect();
                v41 = nil;
            end;
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivateCombo(v42);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v20, 0);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v23, 0);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v21, 0);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v24, 0);
            if not v37 then
                if v44.BallStopCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v26, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v26, 0.6, Enum.AnimationPriority.Action3);
                elseif v44.FakeLrpsCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v30, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v30, 0.6, Enum.AnimationPriority.Action3);
                elseif v44.FakeRrpsCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v28, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v28, 0.6, Enum.AnimationPriority.Action3);
                end;
                if v44.FrontSpinCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v34, 0, Enum.AnimationPriority.Action2);
                    v34:Play(0);
                elseif v44.BackSpinCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v32, 0, Enum.AnimationPriority.Action2);
                else
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v22, 0, Enum.AnimationPriority.Action2);
                end;
            else
                if v44.BallStopCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v27, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v27, 0.6, Enum.AnimationPriority.Action3);
                elseif v44.FakeLrpsCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v31, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v31, 0.6, Enum.AnimationPriority.Action3);
                elseif v44.FakeRrpsCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v29, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v29, 0.6, Enum.AnimationPriority.Action3);
                end;
                if v44.FrontSpinCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v35, 0, Enum.AnimationPriority.Action2);
                elseif v44.BackSpinCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v33, 0, Enum.AnimationPriority.Action2);
                else
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v25, 0, Enum.AnimationPriority.Action2);
                end;
            end;
            local v78 = nil;
            v78 = if not v37 then l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateReact({
                ReactLimbs = {
                    l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Right Leg"]
                }, 
                ReactFunc = v72
            }) else l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateReact({
                ReactLimbs = {
                    l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Left Leg"]
                }, 
                ReactFunc = v72
            });
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:AnkleActivation(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart, l_Humanoid_0);
            v40 = true;
            task.wait(0.6);
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:AnkleDeactivation(v40);
            v40 = false;
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivateReact(v78);
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivatePowerBar();
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v26, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v30, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v28, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v27, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v31, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v29, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v22, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v25, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v34, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v35, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v32, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v33, 0.1);
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ComboReset(v44);
            task.wait(0.2);
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:SetDebounce(false, 2);
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:PlayQueue();
        end;
    end;
end;
return v8;
