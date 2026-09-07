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
local l_LocalPlayer_0 = l_game_0:GetService("Players").LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or not l_Character_0.Parent then
    l_Character_0 = l_LocalPlayer_0.CharacterAdded:wait();
end;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local l_ClientModules_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules");
local v75 = l_require_0(l_ClientModules_0:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"));
local v76 = l_require_0(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local _ = l_require_0(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_v75_Limbs_0 = v75:GetLimbs(l_Character_0, l_Humanoid_0);
local l_Animations_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations");
local v80 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.FakeExit.RightFakeExitStart);
local v81 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.FakeExit.RightFakeExitEnd);
local v82 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.FakeExit.LeftFakeExitStart);
local v83 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.FakeExit.LeftFakeExitEnd);
local v84 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.LeftToLeft);
local v85 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.LeftToRight);
local v86 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleQ.LeftDribbleQ);
local v87 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.BackFlickUp.RightBackFlickUp);
local v88 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.Backheel.LeftBackHeelStart);
local _ = v75:GetLegSwitch();
local v90 = nil;
local v91 = false;
local l_Keybinds_0 = l_ReplicatedStorage_0:WaitForChild("PlayerData"):WaitForChild(l_LocalPlayer_0.UserId):WaitForChild("Keybinds");
local v93 = {
    SwitchCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Dribble"):WaitForChild("FakeExitLeft"):WaitForChild("FakeExitRight")
    }, 
    FakeRrpsCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Dribble"):WaitForChild("FakeExitLeft"):WaitForChild("FakeRrps")
    }, 
    FakeLrpsCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Dribble"):WaitForChild("FakeExitLeft"):WaitForChild("FakeLrps")
    }, 
    FlickUpCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Dribble"):WaitForChild("FakeExitLeft"):WaitForChild("FlickUp")
    }, 
    BackheelFlickUpCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Dribble"):WaitForChild("FakeExitLeft"):WaitForChild("BackheelFlickUp")
    }, 
    PrecisionCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Dribble"):WaitForChild("FakeExitLeft"):WaitForChild("Precision")
    }, 
    BackheelCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Dribble"):WaitForChild("FakeExitLeft"):WaitForChild("Backheel")
    }
};
local _ = function() --[[ Line: 140 ]]
    for _, v95 in l_pairs_0(v93) do
        v95.Used = false;
    end;
end;
local function v99(v97, v98) --[[ Line: 146 ]]
    v75:InputCombo(v97, v98, v93);
end;
local v100 = false;
local function v107(v101, v102) --[[ Line: 152 ]]
    local l_Position_0 = v102.Position;
    if v75:ReactBallCheck(v101, v102, l_Position_0) and v100 then
        v100 = false;
        local v104 = nil;
        local v105 = l_Vector3_0.new(300000, 2000, 300000);
        if v101 == l_v75_Limbs_0["Left Leg"] then
            if v93.SwitchCombo.Used then
                v104 = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(5), l_math_0.rad(-90), 0)).lookVector * 24;
            elseif v93.FakeRrpsCombo.Used then
                v104 = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(15), l_math_0.rad(-55), 0)).lookVector * 21.5;
            elseif v93.FakeLrpsCombo.Used then
                v104 = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(15), l_math_0.rad(55), 0)).lookVector * 21.5;
            elseif v93.FlickUpCombo.Used then
                v105 = l_Vector3_0.new(10, 5000000, 10);
                v104 = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.Angles(l_math_0.rad(30), 0, 0)).lookVector * 70;
            elseif v93.PrecisionCombo.Used then
                v104 = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.Angles(l_math_0.rad(30), 0, 0)).lookVector * 23;
            elseif v93.BackheelCombo.Used then
                v105 = l_Vector3_0.new(6000000, 2000, 6000000);
                v104 = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(30), l_math_0.rad(0), 0)).lookVector * -25;
            else
                v104 = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(30), l_math_0.rad(40), 0)).lookVector * 22.25;
            end;
        elseif v93.SwitchCombo.Used then
            v104 = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(30), l_math_0.rad(-40), 0)).lookVector * 22.25;
        elseif v93.BackheelFlickUpCombo.Used then
            v105 = l_Vector3_0.new(1500, 25000, 1500);
            v104 = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.Angles(l_math_0.rad(42.5), 0, 0)).lookVector * 40;
        else
            v104 = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(5), l_math_0.rad(90), 0)).lookVector * 24;
        end;
        local v106 = {
            Limb = v101, 
            Ball = v102, 
            MaxForce = v105, 
            Velocity = v104, 
            Time = 0.3
        };
        if v93.BackheelFlickUpCombo.Used or v93.BackheelCombo.Used then
            v106.Delays = 0;
        end;
        if v75:ServerReact(v106, l_Position_0) then
            v75:ClientReact(v106);
        end;
    end;
end;
local v108 = false;
local v109 = l_tick_0();
v69.Activate = function(v110, v111, v112) --[[ Line: 208 ]]
    if v111 == l_Enum_0.UserInputState.Begin then
        if v75:CheckState() and not v75:CheckDebounce() then
            if v110 == "Delayed" and not v108 then
                return;
            elseif v75:CheckDebounce2(1) and v110 ~= "Delayed" then
                v108 = true;
                v75:DelayReleaseQueue(v69.Activate, 1, v111);
                return;
            else
                v75:SetDebounce(true);
                v91 = true;
                v90 = v75:ActivateCombo({
                    Table = v93, 
                    Func = v99
                });
                v109 = l_tick_0();
                if v112 ~= nil and not v75:IsKeyDown(v112) then
                    task.spawn(function() --[[ Line: 233 ]]
                        v69.Activate(v110, l_Enum_0.UserInputState.End, v112);
                    end);
                end;
                v80:Play(0);
                local v113 = false;
                local v114 = true;
                while true do
                    if not v113 then
                        v80:Play(0, 1, 1.5);
                    else
                        v82:Play(0, 1, 1.5);
                    end;
                    v113 = not v113;
                    if v114 then
                        v114 = false;
                        task.wait(0.3);
                    else
                        task.wait(0.4);
                    end;
                    if not (v75:IsKeyDown(v112) and v91) then
                        break;
                    end;
                end;
            end;
        else
            v75:DelayQueue(v69.Activate, v110, v112);
            return;
        end;
    elseif v111 == l_Enum_0.UserInputState.End and (v91 or v108) then
        if v108 and not v91 then
            v108 = false;
            return;
        else
            v108 = false;
            v91 = false;
            if l_tick_0() < v109 + 0.3 then
                task.wait(v109 + 0.3 - l_tick_0());
            end;
            v76:StopAnim(v82, 0);
            v76:StopAnim(v80, 0);
            v75:DeactivateCombo(v90);
            local v115 = false;
            if v93.SwitchCombo.Used then
                v76:PlayAnim(v83, 0, l_Enum_0.AnimationPriority.Action2);
            else
                v76:PlayAnim(v81, 0, l_Enum_0.AnimationPriority.Action2);
                if v93.FakeRrpsCombo.Used then
                    v76:PlayAnim(v85, 0, l_Enum_0.AnimationPriority.Action3);
                    v76:PlayServerAnim(v85, 0.3, l_Enum_0.AnimationPriority.Action3);
                elseif v93.FakeLrpsCombo.Used then
                    v76:PlayAnim(v84, 0, l_Enum_0.AnimationPriority.Action3);
                    v76:PlayServerAnim(v84, 0.3, l_Enum_0.AnimationPriority.Action3);
                elseif v93.FlickUpCombo.Used or v93.PrecisionCombo.Used then
                    v76:PlayAnim(v86, 0, l_Enum_0.AnimationPriority.Action3);
                    v76:PlayServerAnim(v86, 0.3, l_Enum_0.AnimationPriority.Action3);
                elseif v93.BackheelFlickUpCombo.Used then
                    v76:PlayAnim(v87, 0, l_Enum_0.AnimationPriority.Action3);
                    v76:PlayServerAnim(v87, 0.3, l_Enum_0.AnimationPriority.Action3);
                elseif v93.BackheelCombo.Used then
                    v76:PlayAnim(v88, 0, l_Enum_0.AnimationPriority.Action3);
                    v75:AnkleActivation(l_v75_Limbs_0.HumanoidRootPart, l_Humanoid_0);
                    v115 = true;
                end;
            end;
            local v116 = v75:ActivateReact({
                ReactLimbs = {
                    l_v75_Limbs_0["Right Leg"], 
                    l_v75_Limbs_0["Left Leg"]
                }, 
                ReactFunc = v107
            });
            v100 = true;
            task.wait(0.3);
            if v115 then
                v75:AnkleDeactivation(v100);
            end;
            v100 = false;
            v75:DeactivateReact(v116);
            v76:StopAnim(v83, 0.1);
            v76:StopAnim(v81, 0.1);
            v76:StopAnim(v84, 0.1);
            v76:StopAnim(v85, 0.1);
            v76:StopAnim(v86, 0.1);
            v76:StopAnim(v87, 0.1);
            v76:StopAnim(v88, 0.1);
            if v93.BackheelFlickUpCombo.Used then
                task.wait(0.15);
            elseif v93.BackheelCombo.Used then
                task.wait(0.2);
            else
                task.wait(0.1);
            end;
            v75:ComboReset(v93);
            v75:SetDebounce(false);
            v75:PlayQueue();
        end;
    end;
end;
return v69;
