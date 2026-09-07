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
local v20 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.RightOneLegCharge);
local v21 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.RightOneLegChargeLoop);
local v22 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.FakePass.RightFakePass);
local v23 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftOneLegCharge);
local v24 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftOneLegChargeLoop);
local v25 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.FakePass.LeftFakePass);
local v26 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.RightToLeft);
local v27 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.LeftToRight);
local v28 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleQ.RightDribbleQ);
local v29 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleQ.LeftDribbleQ);
local v30 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleC.RightComboZ);
local v31 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleC.LeftComboZ);
local v32 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DragTo.RightSideDrag);
local v33 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DragTo.LeftSideDrag);
local v34 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.RightToRight);
local v35 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.LeftToLeft);
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
        Keybind = l_Keybinds_0:WaitForChild("Pass"):WaitForChild("PassFP"):WaitForChild("FakeRrps")
    }, 
    FakeLrpsCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Pass"):WaitForChild("PassFP"):WaitForChild("FakeLrps")
    }, 
    FakeRrpsLowCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Pass"):WaitForChild("PassFP"):WaitForChild("FakeRrpsLow")
    }, 
    FakeLrpsLowCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Pass"):WaitForChild("PassFP"):WaitForChild("FakeLrpsLow")
    }, 
    FlickUpCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Pass"):WaitForChild("PassFP"):WaitForChild("FlickUp")
    }, 
    PrecisionCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Pass"):WaitForChild("PassFP"):WaitForChild("Precision")
    }, 
    DragBackToRightCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Pass"):WaitForChild("PassFP"):WaitForChild("DragBackToRight")
    }, 
    DragBackToLeftCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Pass"):WaitForChild("PassFP"):WaitForChild("DragBackToLeft")
    }, 
    BackheelCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Pass"):WaitForChild("PassFP"):WaitForChild("Backheel")
    }
};
local _ = function() --[[ Line: 135 ]]
    for _, v45 in pairs(v43) do
        v45.Used = false;
    end;
end;
local function v49(v47, v48) --[[ Line: 141 ]]
    l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:InputCombo(v47, v48, v43);
end;
local v50 = false;
local function v57(v51, v52) --[[ Line: 147 ]]
    local l_Position_0 = v52.Position;
    if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ReactBallCheck(v51, v52, l_Position_0) and v50 then
        v50 = false;
        local v54 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0, 0, 0)).lookVector * 0;
        if v52.Velocity.Magnitude > 60 then
            v54 = v52.Velocity / 4;
        end;
        local v55 = Vector3.new(8999999488, 30000, 8999999488, 0);
        if v43.FakeRrpsCombo.Used then
            v55 = Vector3.new(8999999488, 30000, 8999999488, 0);
            v54 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0.4363323129985824, -0.8726646259971648, 0)).lookVector * 22.5;
        elseif v43.FakeLrpsCombo.Used then
            v55 = Vector3.new(8999999488, 30000, 8999999488, 0);
            v54 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0.4363323129985824, 0.8726646259971648, 0)).lookVector * 22.5;
        elseif v43.FakeRrpsLowCombo.Used then
            v55 = Vector3.new(8999999488, 30000, 8999999488, 0);
            v54 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0.17453292519943295, -0.8726646259971648, 0)).lookVector * 22;
        elseif v43.FakeLrpsLowCombo.Used then
            v55 = Vector3.new(8999999488, 30000, 8999999488, 0);
            v54 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0.17453292519943295, 0.8726646259971648, 0)).lookVector * 22;
        elseif v43.FlickUpCombo.Used then
            v55 = Vector3.new(10, 5000000, 10, 0);
            v54 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0.5235987755982988, 0, 0)).lookVector * 70;
        elseif v43.PrecisionCombo.Used then
            v55 = Vector3.new(8999999488, 30000, 8999999488, 0);
            v54 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0.5235987755982988, 0, 0)).lookVector * 23;
        elseif v43.DragBackToRightCombo.Used then
            v55 = Vector3.new(400000, 1000, 400000, 0);
            v54 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0.08726646259971647, -1.5707963267948966, 0)).lookVector * 24.5;
        elseif v43.DragBackToLeftCombo.Used then
            v55 = Vector3.new(400000, 1000, 400000, 0);
            v54 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0.08726646259971647, 1.5707963267948966, 0)).lookVector * 24.5;
        elseif v43.BackheelCombo.Used then
            v55 = Vector3.new(6000000, 2000, 6000000, 0);
            v54 = (l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:MakeFowardCFrame(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart.CFrame) * CFrame.fromOrientation(0.5235987755982988, 0, 0)).lookVector * -25;
        end;
        local v56 = {
            Limb = v51, 
            Ball = v52, 
            MaxForce = v55, 
            Velocity = v54, 
            Time = 0.3
        };
        if v43.BackheelCombo.Used then
            v56.Delays = 0;
        end;
        if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ServerReact(v56, l_Position_0) then
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ClientReact(v56);
        end;
    end;
end;
local v58 = false;
local v59 = tick();
v8.Activate = function(v60, v61, v62) --[[ Line: 207 ]]
    if v61 == Enum.UserInputState.Begin then
        if l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckState() and not l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckDebounce() then
            if v60 == "Delayed" and not v58 then
                return;
            elseif l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:CheckDebounce2(1) and v60 ~= "Delayed" then
                v58 = true;
                l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DelayReleaseQueue(v8.Activate, 1, v61);
                return;
            else
                l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:SetDebounce(true);
                v39 = l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_LegSwitch_0.Value;
                v41 = true;
                v40 = l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateCombo({
                    Table = v43, 
                    Func = v49
                });
                v59 = tick();
                if v62 ~= nil and not l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:IsKeyDown(v62) then
                    task.spawn(function() --[[ Line: 232 ]]
                        v8.Activate(v60, Enum.UserInputState.End, v62);
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
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DelayQueue(v8.Activate, v60, v62);
            return;
        end;
    elseif v61 == Enum.UserInputState.End and (v41 or v58) then
        if v58 and not v41 then
            v58 = false;
            return Enum.ContextActionResult.Pass;
        else
            v58 = false;
            v41 = false;
            if tick() < v59 + 0.3 then
                task.wait(v59 + 0.3 - tick());
            end;
            local v63 = false;
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v20, 0);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v23, 0);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v21, 0);
            l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:StopAnim(v24, 0);
            if not v39 then
                if v43.FakeRrpsCombo.Used or v43.FakeRrpsLowCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v34, 0, Enum.AnimationPriority.Action2);
                elseif v43.FakeLrpsCombo.Used or v43.FakeLrpsLowCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v26, 0, Enum.AnimationPriority.Action2);
                elseif v43.FlickUpCombo.Used or v43.PrecisionCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v28, 0, Enum.AnimationPriority.Action2);
                elseif v43.DragBackToRightCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v30, 0, Enum.AnimationPriority.Action2);
                elseif v43.DragBackToLeftCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v32, 0, Enum.AnimationPriority.Action2);
                elseif v43.BackheelCombo.Used then
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v36, 0, Enum.AnimationPriority.Action2);
                    l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:AnkleActivation(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart, l_Humanoid_0);
                    v63 = true;
                else
                    l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v22, 0, Enum.AnimationPriority.Action2);
                end;
            elseif v43.FakeRrpsCombo.Used or v43.FakeRrpsLowCombo.Used then
                l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v27, 0, Enum.AnimationPriority.Action2);
            elseif v43.FakeLrpsCombo.Used or v43.FakeLrpsLowCombo.Used then
                l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v35, 0, Enum.AnimationPriority.Action2);
            elseif v43.FlickUpCombo.Used or v43.PrecisionCombo.Used then
                l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v29, 0, Enum.AnimationPriority.Action2);
            elseif v43.DragBackToRightCombo.Used then
                l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v31, 0, Enum.AnimationPriority.Action2);
            elseif v43.DragBackToLeftCombo.Used then
                l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v33, 0, Enum.AnimationPriority.Action2);
            elseif v43.BackheelCombo.Used then
                l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v37, 0, Enum.AnimationPriority.Action2);
                l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:AnkleActivation(l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0.HumanoidRootPart, l_Humanoid_0);
                v63 = true;
            else
                l_llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI_0:PlayAnim(v25, 0, Enum.AnimationPriority.Action2);
            end;
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivateCombo(v40);
            local v64 = nil;
            v64 = if not v39 then l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateReact({
                ReactLimbs = {
                    l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Right Leg"]
                }, 
                ReactFunc = v57
            }) else l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:ActivateReact({
                ReactLimbs = {
                    l_l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0_Limbs_0["Left Leg"]
                }, 
                ReactFunc = v57
            });
            v50 = true;
            if v43.FakeRrpsCombo.Used or v43.FakeLrpsCombo.Used then
                task.wait(0.225);
            else
                task.wait(0.25);
            end;
            if v63 then
                l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:AnkleDeactivation(v50);
            end;
            v50 = false;
            l_llllIllIllIIIlllIIIIlIllIIIlIIlII_0:DeactivateReact(v64);
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
