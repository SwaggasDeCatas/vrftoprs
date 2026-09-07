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
local v20 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.RightOneLegCharge);
local v21 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.RightOneLegChargeLoop);
local v22 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.Pass.RightPass);
local v23 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftOneLegCharge);
local v24 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftOneLegChargeLoop);
local v25 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.Pass.LeftPass);
local v26 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.FakePass.RightFakePass);
local v27 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.FakePass.LeftFakePass);
local v28 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.RightToRight);
local v29 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.LeftToRight);
local v30 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.RightToLeft);
local v31 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.LeftToLeft);
local l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_LegSwitch_0 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetLegSwitch();
local v33 = nil;
local v34 = false;
local v35 = 0;
local v36 = false;
local v37 = nil;
local v38 = nil;
local l_Keybinds_0 = l_ReplicatedStorage_0:WaitForChild("PlayerData"):WaitForChild(l_LocalPlayer_0.UserId):WaitForChild("Keybinds");
local v40 = {
    FrontSpinCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Pass"):WaitForChild("Pass"):WaitForChild("FrontSpin"), 
        Overlay = {
            "FakeRrpsCombo", 
            "FakeLrpsCombo"
        }
    }, 
    BackSpinCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Pass"):WaitForChild("Pass"):WaitForChild("BackSpin"), 
        Overlay = {
            "FakeRrpsCombo", 
            "FakeLrpsCombo"
        }
    }, 
    BallStopCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Pass"):WaitForChild("Pass"):WaitForChild("StopBall")
    }, 
    FakeRrpsCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Pass"):WaitForChild("Pass"):WaitForChild("FakeRrps"), 
        Overlay = {
            "FrontSpinCombo", 
            "BackSpinCombo"
        }
    }, 
    FakeLrpsCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Pass"):WaitForChild("Pass"):WaitForChild("FakeLrps"), 
        Overlay = {
            "FrontSpinCombo", 
            "BackSpinCombo"
        }
    }
};
local function v43(v41, v42) --[[ Line: 125 ]]
    if v36 and v41 ~= "FrontSpinCombo" and v41 ~= "BackSpinCombo" then
        return;
    else
        l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:InputCombo(v41, v42, v40);
        return;
    end;
end;
local v44 = 0;
local function v56(v45, v46, v47, v48, v49, v50, v51) --[[ Line: 133 ]]
	local v52 = v50.lookVector * v49;
	
	if game:GetService("UserInputService").TouchEnabled then
		local SpinType = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetSpinType()
		local TableToLookIn = v40

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
	
    if v40.BallStopCombo.Used then
        if v47.Velocity.Magnitude > 70 then
            return Vector3.new(0, 0, 0, 0), v47.Velocity / 4.5, (Vector3.new(400000, 400000, 400000, 0));
        else
            return Vector3.new(0, 0, 0, 0), Vector3.new(0, 0, 0, 0), (Vector3.new(400000, 400000, 400000, 0));
        end;
    else
        if v40.FakeLrpsCombo.Used then
            v52 = (v50 * CFrame.fromOrientation(math.rad(v51 / 3), 0.9250245035569946, 0)).lookVector * v49 / 1.1;
        elseif v40.FakeRrpsCombo.Used then
            v52 = (v50 * CFrame.fromOrientation(math.rad(v51 / 3), -0.9250245035569946, 0)).lookVector * v49 / 1.1;
        end;
        local l_Unit_0 = v52.Unit;
        local l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0, _ = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetSpin((v46 * CFrame.new(0, -0.5, 0)).p, v48, -v45.CFrame.upVector, v49, 150);
        if v40.BackSpinCombo.Used then
            l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 / 1.25 + Vector3.new(l_Unit_0.Z, 0, -l_Unit_0.X) * -v49 / (1 + l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0.Magnitude / 600);
            v52 = v52 * 0.985;
        elseif v40.FrontSpinCombo.Used then
            l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 / 1.25 + Vector3.new(l_Unit_0.Z, 0, -l_Unit_0.X) * (80 + v35 / 3.5) / (1 + l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0.Magnitude / 600);
            v52 = v52 * 0.985;
        elseif l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 == Vector3.zero then
            l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0 + Vector3.new(l_Unit_0.Z, 0, -l_Unit_0.X) * (8 + v49 / 6);
        end;
        return l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Spin_0, v52, (Vector3.new(400000, 400000, 400000, 0));
    end;
end;
local function v68(v57, v58) --[[ Line: 163 ]]
    local l_Position_0 = v58.Position;
    local l_CFrame_0 = v57.CFrame;
    if not l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ReactBallCheck(v57, v58, l_Position_0) or not v36 then
        return;
    else
        v36 = false;
        local v61 = 48 + v35 / 2.1;
        local l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_HeightAngle_0 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetHeightAngle(5, -25);
        local v63 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(math.rad(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_HeightAngle_0), 0, 0);
        local v64, v65, v66 = v56(v57, l_CFrame_0, v58, l_Position_0, v61, v63, l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_HeightAngle_0);
        local v67 = {
            Limb = v57, 
            Ball = v58, 
            MaxForce = v66, 
            Velocity = v65 * math.clamp(0.975 + math.clamp(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_HeightAngle_0, -5, 5) / 100, 0.975, 1), 
            Spin = v64, 
            Time = 0.3
        };
        if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ServerReact(v67, l_Position_0) then
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ClientReact(v67);
        end;
        return;
    end;
end;
local v69 = false;
v8.Activate = function(v70, v71, _) --[[ Line: 194 ]]
    if v71 == Enum.UserInputState.Begin then
        if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckState() and (not l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckDebounce(2) or v70 == "Delayed") then
            local v73 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckDebounce2(1);
            if v70 == "Delayed" and not v69 then
                return;
            else
                l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:SetDebounce(true, 2);
                v33 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_LegSwitch_0.Value;
                v34 = true;
                if v70 ~= "Delayed" then
                    l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivatePowerBar({
                        {
                            Time = 0.6, 
                            ES = Enum.EasingStyle.Linear, 
                            ED = Enum.EasingDirection.In, 
                            To = 100, 
                            NoHoldReset = true
                        }
                    });
                    v38 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateCombo({
                        Table = v40, 
                        Func = v43
                    });
                    if v37 ~= nil then
                        v37:Disconnect();
                        v37 = nil;
                    end;
                    v37 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 222 ]]
                        l_IlllIlIIIlIlllIIlIlIlIllllIIllIII_0:Speed({
                            Set = l_IlllIlIIIlIlllIIlIlIlIllllIIllIII_0:GetNeutralSpeed() - math.clamp(l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetPowerBar() / 100 - 0.5, 0, 1), 
                            ReturnTime = 0.6
                        });
                    end);
                end;
                if v73 and v70 ~= "Delayed" then
                    v69 = true;
                    l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DelayReleaseQueue(v8.Activate, 1, v71);
                    return;
                elseif not v33 then
                    v20:Play(0);
                    v20.Stopped:Wait();
                    if v34 then
                        v21:Play(0);
                        return;
                    end;
                else
                    v23:Play(0);
                    v23.Stopped:Wait();
                    if v34 then
                        v24:Play(0);
                        return;
                    end;
                end;
            end;
        end;
    elseif v71 == Enum.UserInputState.End and (not (not v34 and not v69) or v70 == "Delayed") then
        l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:StopPowerBar();
        if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckDebounce2(1) and v70 ~= "Delayed" then
            v69 = false;
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DelayReleaseQueue(v8.Activate, 1, Enum.UserInputState.End);
            return;
        else
            v69 = false;
            v34 = false;
            v44 = tick();
            v35 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetPowerBar();
            if v37 ~= nil then
                v37:Disconnect();
                v37 = nil;
            end;
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v20, 0);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v23, 0);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v21, 0);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v24, 0);
            if not v33 then
                l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v22, 0, Enum.AnimationPriority.Action2);
            else
                l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v25, 0, Enum.AnimationPriority.Action2);
            end;
            local v74 = nil;
            v74 = if not v33 then l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateReact({
                ReactLimbs = {
                    l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Right Leg"]
                }, 
                ReactFunc = v68
            }) else l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateReact({
                ReactLimbs = {
                    l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Left Leg"]
                }, 
                ReactFunc = v68
            });
            if not v33 then
                if v40.BallStopCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v26, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v26, 0.6, Enum.AnimationPriority.Action3);
                elseif v40.FakeLrpsCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v30, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v30, 0.6, Enum.AnimationPriority.Action3);
                elseif v40.FakeRrpsCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v28, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v28, 0.6, Enum.AnimationPriority.Action3);
                end;
            elseif v40.BallStopCombo.Used then
                l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v27, 0, Enum.AnimationPriority.Action3);
                l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v27, 0.6, Enum.AnimationPriority.Action3);
            elseif v40.FakeLrpsCombo.Used then
                l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v31, 0, Enum.AnimationPriority.Action3);
                l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v31, 0.6, Enum.AnimationPriority.Action3);
            elseif v40.FakeRrpsCombo.Used then
                l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v29, 0, Enum.AnimationPriority.Action3);
                l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v29, 0.6, Enum.AnimationPriority.Action3);
            end;
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:AnkleActivation(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart, l_Humanoid_0);
            v36 = true;
            task.wait(0.6);
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:AnkleDeactivation(v36);
            v36 = false;
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivateReact(v74);
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivateCombo(v38);
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivatePowerBar();
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v26, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v30, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v28, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v27, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v31, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v29, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v22, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v25, 0.1);
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ComboReset(v40);
            task.wait(0.2);
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:SetDebounce(false, 2);
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:PlayQueue();
        end;
    end;
end;
return v8;
