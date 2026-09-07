local v8 = {};
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("UserInputService");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or not l_Character_0.Parent then
    l_Character_0 = l_LocalPlayer_0.CharacterAdded:wait();
end;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local l_ClientModules_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules");
local l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0 = require(l_ClientModules_0:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"));
local l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0 = require(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local _ = require(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetLimbs(l_Character_0, l_Humanoid_0);
local l_Animations_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations");
local v20 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.RightChargeStart);
local v21 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.RightChargeLoop);
local v22 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.FakeShoot.RightFakeShoot);
local v23 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftChargeStart);
local v24 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftChargeLoop);
local v25 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.FakeShoot.LeftFakeShoot);
local v26 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.RightToLeft);
local v27 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.LeftToRight);
local v28 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleQ.RightDribbleQ);
local v29 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleQ.LeftDribbleQ);
local v30 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleC.RightComboZ);
local v31 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleC.LeftComboZ);
local v32 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DragTo.RightSideDrag);
local v33 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DragTo.LeftSideDrag);
local v34 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleC.RightDribbleCNormalEnd);
local v35 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleC.LeftDribbleCNormalEnd);
local v36 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.Backheel.RightBackHeelStart);
local v37 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.Backheel.LeftBackHeelStart);
local l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_LegSwitch_0 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:GetLegSwitch();
local v39 = nil;
local v40 = nil;
local v41 = false;
local l_Keybinds_0 = l_ReplicatedStorage_0:WaitForChild("PlayerData"):WaitForChild(l_LocalPlayer_0.UserId):WaitForChild("Keybinds");
local v43 = {
    FakeRrpsCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Dribble"):WaitForChild("DribbleFS"):WaitForChild("FakeRrps")
    }, 
    FakeLrpsCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Dribble"):WaitForChild("DribbleFS"):WaitForChild("FakeLrps")
    }, 
    FakeRrpsLowCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Dribble"):WaitForChild("DribbleFS"):WaitForChild("FakeRrpsLow")
    }, 
    FakeLrpsLowCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Dribble"):WaitForChild("DribbleFS"):WaitForChild("FakeLrpsLow")
    }, 
    FlickUpCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Dribble"):WaitForChild("DribbleFS"):WaitForChild("FlickUp")
    }, 
    PrecisionCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Dribble"):WaitForChild("DribbleFS"):WaitForChild("Precision")
    }, 
    DragBackToRightCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Dribble"):WaitForChild("DribbleFS"):WaitForChild("DragBackToRight")
    }, 
    DragBackToLeftCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Dribble"):WaitForChild("DribbleFS"):WaitForChild("DragBackToLeft")
    }, 
    BackheelCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Dribble"):WaitForChild("DribbleFS"):WaitForChild("Backheel")
    }
};
local function v46(v44, v45) --[[ Line: 135 ]]
    l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:InputCombo(v44, v45, v43);
end;
local v47 = false;
local function v54(v48, v49) --[[ Line: 141 ]]
    local l_Position_0 = v49.Position;
    if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ReactBallCheck(v48, v49, l_Position_0) and v47 then
        v47 = false;
        local v51 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0, 0, 0)).lookVector * 0;
        if v49.Velocity.Magnitude > 60 then
            v51 = v49.Velocity / 4;
        end;
        local v52 = Vector3.new(8999999488, 30000, 8999999488, 0);
        if v43.FakeRrpsCombo.Used then
            v52 = Vector3.new(8999999488, 30000, 8999999488, 0);
            v51 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0.4363323129985824, -0.8726646259971648, 0)).lookVector * 22.5;
        elseif v43.FakeLrpsCombo.Used then
            v52 = Vector3.new(8999999488, 30000, 8999999488, 0);
            v51 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0.4363323129985824, 0.8726646259971648, 0)).lookVector * 22.5;
        elseif v43.FakeRrpsLowCombo.Used then
            v52 = Vector3.new(8999999488, 30000, 8999999488, 0);
            v51 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0.17453292519943295, -0.8726646259971648, 0)).lookVector * 22;
        elseif v43.FakeLrpsLowCombo.Used then
            v52 = Vector3.new(8999999488, 30000, 8999999488, 0);
            v51 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0.17453292519943295, 0.8726646259971648, 0)).lookVector * 22;
        elseif v43.FlickUpCombo.Used then
            v52 = Vector3.new(10, 5000000, 10, 0);
            v51 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0.5235987755982988, 0, 0)).lookVector * 70;
        elseif v43.PrecisionCombo.Used then
            v52 = Vector3.new(8999999488, 30000, 8999999488, 0);
            v51 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0.5235987755982988, 0, 0)).lookVector * 23;
        elseif v43.DragBackToRightCombo.Used then
            v52 = Vector3.new(400000, 1000, 400000, 0);
            v51 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0.08726646259971647, -1.5707963267948966, 0)).lookVector * 24.5;
        elseif v43.DragBackToLeftCombo.Used then
            v52 = Vector3.new(400000, 1000, 400000, 0);
            v51 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0.08726646259971647, 1.5707963267948966, 0)).lookVector * 24.5;
        elseif v43.BackheelCombo.Used then
            v52 = Vector3.new(6000000, 2000, 6000000, 0);
            v51 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0.5235987755982988, 0, 0)).lookVector * -25;
        end;
        local v53 = {
            Limb = v48, 
            Ball = v49, 
            MaxForce = v52, 
            Velocity = v51, 
            Time = 0.3
        };
        if v43.BackheelCombo.Used then
            v53.Delays = 0;
        end;
        if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ServerReact(v53, l_Position_0) then
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ClientReact(v53);
        end;
    end;
end;
local v55 = false;
local v56 = tick();
v8.Activate = function(v57, v58, v59) --[[ Line: 200 ]]
    if v58 == Enum.UserInputState.Begin then
        if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckState() and not l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckDebounce() then
            if v57 == "Delayed" and not v55 then
                return;
            elseif l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckDebounce2(1) and v57 ~= "Delayed" then
                v55 = true;
                l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DelayReleaseQueue(v8.Activate, 1, v58);
                return;
            else
                l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:SetDebounce(true);
                l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:EditSharedCooldown("NoPrecharge", true);
                v39 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_LegSwitch_0.Value;
                v41 = true;
                v40 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateCombo({
                    Table = v43, 
                    Func = v46
                });
                v56 = tick();
                if v59 ~= nil and not l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:IsKeyDown(v59) then
                    task.spawn(function() --[[ Line: 226 ]]
                        v8.Activate(v57, Enum.UserInputState.End, v59);
                    end);
                end;
                if not v39 then
                    v20:Play(0);
                    v20.Stopped:Wait();
                    if v41 then
                        v21:Play(0);
                        return;
                    end;
                else
                    v23:Play(0);
                    v23.Stopped:Wait();
                    if v41 then
                        v24:Play(0);
                        return;
                    end;
                end;
            end;
        else
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DelayQueue(v8.Activate, v57, v59);
            return;
        end;
    elseif v58 == Enum.UserInputState.End and (v41 or v55) then
        if v55 and not v41 then
            v55 = false;
            return;
        else
            v55 = false;
            v41 = false;
            if tick() < v56 + 0.3 then
                task.wait(v56 + 0.3 - tick());
            end;
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:EditSharedCooldown("NoPrecharge", false);
            local v60 = false;
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v20, 0);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v23, 0);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v21, 0);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v24, 0);
            if not v39 then
                l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v22, 0, Enum.AnimationPriority.Action2);
                if v43.FakeRrpsCombo.Used or v43.FakeRrpsLowCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v34, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v34, 0.3, Enum.AnimationPriority.Action3);
                elseif v43.FakeLrpsCombo.Used or v43.FakeLrpsLowCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v26, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v26, 0.3, Enum.AnimationPriority.Action3);
                elseif v43.FlickUpCombo.Used or v43.PrecisionCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v28, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v28, 0.3, Enum.AnimationPriority.Action3);
                elseif v43.DragBackToRightCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v30, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v30, 0.3, Enum.AnimationPriority.Action3);
                elseif v43.DragBackToLeftCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v32, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v32, 0.3, Enum.AnimationPriority.Action3);
                elseif v43.BackheelCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v36, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v36, 0.3, Enum.AnimationPriority.Action3);
                    l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:AnkleActivation(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart, l_Humanoid_0);
                    v60 = true;
                end;
            else
                l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v25, 0, Enum.AnimationPriority.Action2);
                if v43.FakeRrpsCombo.Used or v43.FakeRrpsLowCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v27, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v27, 0.3, Enum.AnimationPriority.Action3);
                elseif v43.FakeLrpsCombo.Used or v43.FakeLrpsLowCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v35, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v35, 0.3, Enum.AnimationPriority.Action3);
                elseif v43.FlickUpCombo.Used or v43.PrecisionCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v29, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v29, 0.3, Enum.AnimationPriority.Action3);
                elseif v43.DragBackToRightCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v31, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v31, 0.3, Enum.AnimationPriority.Action3);
                elseif v43.DragBackToLeftCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v33, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v33, 0.3, Enum.AnimationPriority.Action3);
                elseif v43.BackheelCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v37, 0, Enum.AnimationPriority.Action3);
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayServerAnim(v37, 0.3, Enum.AnimationPriority.Action3);
                    l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:AnkleActivation(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart, l_Humanoid_0);
                    v60 = true;
                end;
            end;
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivateCombo(v40);
            local v61 = nil;
            v61 = if not v39 then l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateReact({
                ReactLimbs = {
                    l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Right Leg"]
                }, 
                ReactFunc = v54
            }) else l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateReact({
                ReactLimbs = {
                    l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Left Leg"]
                }, 
                ReactFunc = v54
            });
            v47 = true;
            task.wait(0.25);
            if v60 then
                l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:AnkleDeactivation(v47);
            end;
            v47 = false;
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivateReact(v61);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v26, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v28, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v30, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v32, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v34, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v36, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v27, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v29, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v31, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v33, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v35, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v37, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v22, 0.1);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v25, 0.1);
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ComboReset(v43);
            task.wait(0.15);
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:SetDebounce(false);
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:PlayQueue();
        end;
    end;
end;
return v8;
