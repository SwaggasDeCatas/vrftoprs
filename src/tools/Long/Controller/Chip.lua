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
local l_pairs_0 = pairs;
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
local _ = l_game_0:GetService("UserInputService");
local l_LocalPlayer_0 = l_game_0:GetService("Players").LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or not l_Character_0.Parent then
    l_Character_0 = l_LocalPlayer_0.CharacterAdded:wait();
end;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local l_ClientModules_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules");
local v76 = l_require_0(l_ClientModules_0:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"));
local v77 = l_require_0(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local _ = l_require_0(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_v76_Limbs_0 = v76:GetLimbs(l_Character_0, l_Humanoid_0);
local l_Animations_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations");
local v81 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.RightOneLegCharge);
local v82 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.RightOneLegChargeLoop);
local v83 = l_Humanoid_0:LoadAnimation(l_Animations_0.LongTool.Chip.RightChip);
local v84 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftOneLegCharge);
local v85 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftOneLegChargeLoop);
local v86 = l_Humanoid_0:LoadAnimation(l_Animations_0.LongTool.Chip.LeftChip);
local v87 = l_Humanoid_0:LoadAnimation(l_Animations_0.LongTool.Chip.RightChipToLeft);
local v88 = l_Humanoid_0:LoadAnimation(l_Animations_0.LongTool.Chip.RightChipToRight);
local v89 = l_Humanoid_0:LoadAnimation(l_Animations_0.LongTool.Chip.LeftChipToLeft);
local v90 = l_Humanoid_0:LoadAnimation(l_Animations_0.LongTool.Chip.LeftChipToRight);
local l_v76_LegSwitch_0 = v76:GetLegSwitch();
local v92 = nil;
local v93 = nil;
local v94 = false;
local l_Keybinds_0 = l_ReplicatedStorage_0:WaitForChild("PlayerData"):WaitForChild(l_LocalPlayer_0.UserId):WaitForChild("Keybinds");
local v96 = {
    FakeRrpsCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Long"):WaitForChild("Chip"):WaitForChild("ChipRight")
    }, 
    FakeLrpsCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Long"):WaitForChild("Chip"):WaitForChild("ChipLeft")
    }
};
local _ = function() --[[ Line: 137 ]]
    for _, v98 in l_pairs_0(v96) do
        v98.Used = false;
    end;
end;
local function v102(v100, v101) --[[ Line: 143 ]]
    v76:InputCombo(v100, v101, v96);
end;
local v103 = false;
local function v110(v104, v105) --[[ Line: 149 ]]
    local l_Position_0 = v105.Position;
    if v76:ReactBallCheck(v104, v105, l_Position_0) and v103 then
        v103 = false;
        local v107 = (v76:MakeFowardCFrame(l_v76_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(50), 0, 0)).lookVector * 35;
        local v108 = l_Vector3_0.new(4000000, 8000000, 4000000);
        if v96.FakeRrpsCombo.Used then
            v108 = l_Vector3_0.new(4000000, 8000000, 4000000);
            v107 = (v76:MakeFowardCFrame(l_v76_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(47.5), l_math_0.rad(-45), 0)).lookVector * 35;
        elseif v96.FakeLrpsCombo.Used then
            v108 = l_Vector3_0.new(4000000, 8000000, 4000000);
            v107 = (v76:MakeFowardCFrame(l_v76_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(47.5), l_math_0.rad(45), 0)).lookVector * 35;
        end;
        local v109 = {
            Limb = v104, 
            Ball = v105, 
            MaxForce = v108, 
            Velocity = v107, 
            Time = 0.3
        };
        if v76:ServerReact(v109, l_Position_0) then
            v76:ClientReact(v109);
        end;
    end;
end;
local v111 = false;
local v112 = l_tick_0();
v69.Activate = function(v113, v114, v115) --[[ Line: 181 ]]
    if v114 == l_Enum_0.UserInputState.Begin then
        if v76:CheckState() and not v76:CheckDebounce() then
            if v113 == "Delayed" and not v111 then
                return;
            elseif v76:CheckDebounce2(1) and v113 ~= "Delayed" then
                v111 = true;
                v76:DelayReleaseQueue(v69.Activate, 1, v114);
                return;
            else
                v76:SetDebounce(true);
                v92 = l_v76_LegSwitch_0.Value;
                v94 = true;
                v93 = v76:ActivateCombo({
                    Table = v96, 
                    Func = v102
                });
                v112 = l_tick_0();
                if v115 ~= nil and not v76:IsKeyDown(v115) then
                    task.spawn(function() --[[ Line: 206 ]]
                        v69.Activate(v113, l_Enum_0.UserInputState.End, v115);
                    end);
                end;
                if not v92 then
                    v81:Play(0);
                    v81.Stopped:Wait();
                    if v94 then
                        v82:Play(0);
                        return;
                    end;
                else
                    v84:Play(0);
                    v84.Stopped:Wait();
                    if v94 then
                        v85:Play(0);
                        return;
                    end;
                end;
            end;
        else
            v76:DelayQueue(v69.Activate, v113, v115);
            return;
        end;
    elseif v114 == l_Enum_0.UserInputState.End and (v94 or v111) then
        if v111 and not v94 then
            v111 = false;
            return;
        else
            v111 = false;
            if l_tick_0() < v112 + 0.3 then
                task.wait(v112 + 0.3 - l_tick_0());
            end;
            v94 = false;
            v76:DeactivateCombo(v93);
            v77:StopAnim(v81, 0);
            v77:StopAnim(v84, 0);
            v77:StopAnim(v82, 0);
            v77:StopAnim(v85, 0);
            if not v92 then
                if v96.FakeRrpsCombo.Used then
                    v77:PlayAnim(v88, 0, l_Enum_0.AnimationPriority.Action2);
                elseif v96.FakeLrpsCombo.Used then
                    v77:PlayAnim(v87, 0, l_Enum_0.AnimationPriority.Action2);
                else
                    v77:PlayAnim(v83, 0, l_Enum_0.AnimationPriority.Action2);
                end;
            else
                if v96.FakeRrpsCombo.Used then
                    v77:PlayAnim(v89, 0, l_Enum_0.AnimationPriority.Action2);
                elseif v96.FakeLrpsCombo.Used then
                    v77:PlayAnim(v90, 0, l_Enum_0.AnimationPriority.Action2);
                end;
                v77:PlayAnim(v86, 0, l_Enum_0.AnimationPriority.Action2);
            end;
            local v116 = nil;
            v116 = if not v92 then v76:ActivateReact({
                ReactLimbs = {
                    l_v76_Limbs_0["Right Leg"]
                }, 
                ReactFunc = v110
            }) else v76:ActivateReact({
                ReactLimbs = {
                    l_v76_Limbs_0["Left Leg"]
                }, 
                ReactFunc = v110
            });
            v103 = true;
            task.wait(0.5);
            v76:EditSharedCooldown("TackleChest", true);
            task.delay(0.5, function() --[[ Line: 280 ]]
                v76:EditSharedCooldown("TackleChest", false);
            end);
            v76:AnkleDeactivation(v103);
            v103 = false;
            v76:DeactivateReact(v116);
            v77:StopAnim(v87, 0.1);
            v77:StopAnim(v88, 0.1);
            v77:StopAnim(v89, 0.1);
            v77:StopAnim(v90, 0.1);
            v77:StopAnim(v83, 0.1);
            v77:StopAnim(v86, 0.1);
            v76:ComboReset(v96);
            task.wait(0.25);
            v76:SetDebounce(false);
            v76:PlayQueue();
        end;
    end;
end;
return v69;
