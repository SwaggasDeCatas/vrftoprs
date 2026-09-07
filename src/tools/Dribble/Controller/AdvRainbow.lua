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
local v76 = l_require_0(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local _ = l_require_0(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_v75_Limbs_0 = v75:GetLimbs(l_Character_0, l_Humanoid_0);
local l_Animations_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations");
local v80 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.Rainbow.RightRainbow);
local v81 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.AdvRainbow.RightAdvRainbowEnd);
local v82 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.Rainbow.LeftRainbow);
local v83 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.AdvRainbow.LeftAdvRainbowEnd);
local l_v75_LegSwitch_0 = v75:GetLegSwitch();
local v85 = nil;
local v86 = false;
local v87 = {
    CancelCombo = {
        Used = false, 
        Keybind = l_ReplicatedStorage_0:WaitForChild("PlayerData"):WaitForChild(l_LocalPlayer_0.UserId):WaitForChild("Keybinds"):WaitForChild("Dribble"):WaitForChild("AdvRainbow"):WaitForChild("Cancel")
    }
};
local function v90(v88, v89) --[[ Line: 126 ]]
    v75:InputCombo(v88, v89, v87);
end;
local function v97(v91, v92) --[[ Line: 130 ]]
    local l_Position_0 = v92.Position;
    if v75:ReactBallCheck(v91, v92, l_Position_0) and v86 then
        v86 = false;
        local v94 = nil;
        v94 = not v85 and 6 or -6;
        local v95 = {
            Limb = v91, 
            Ball = v92, 
            MaxForce = l_Vector3_0.new(1000, 6000000000, 1000), 
            Velocity = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.Angles(l_math_0.rad(37), l_math_0.rad(v94), 0)).lookVector * 34, 
            Time = 0.3, 
            Delays = 0.1
        };
        if v75:ServerReact(v95, l_Position_0) then
            task.wait(0.1);
            local v96 = {
                Limb = v91, 
                Ball = v92, 
                MaxForce = l_Vector3_0.new(1000, 6000000000, 1000), 
                Velocity = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.Angles(l_math_0.rad(37), l_math_0.rad(v94), 0)).lookVector * 34, 
                Time = 0.3, 
                Delays = 0.1
            };
            if v75:GetXZMag(v91.Position, v92.Position) > 6 then
                v96 = {
                    Limb = v91, 
                    Ball = v92, 
                    MaxForce = l_Vector3_0.new(1000, 400000, 1000), 
                    Velocity = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(41), l_math_0.rad(v94), 0)).lookVector * 20, 
                    Time = 0.3, 
                    Delays = 0.1
                };
            end;
            v75:ClientReact(v96);
        end;
    end;
end;
local function v104(v98, v99) --[[ Line: 177 ]]
    local l_Position_1 = v99.Position;
    if v75:ReactBallCheck(v98, v99, l_Position_1) and v86 then
        v86 = false;
        local v101 = nil;
        v101 = not v85 and 6 or -6;
        local v102 = {
            Limb = v98, 
            Ball = v99, 
            MaxForce = l_Vector3_0.new(1000, 400000, 1000), 
            Velocity = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(45), l_math_0.rad(v101), 0)).lookVector * 42, 
            Time = 0.3, 
            Delays = 0.1
        };
        if v75:ServerReact(v102, l_Position_1) then
            task.wait(0.1);
            local v103 = {
                Limb = v98, 
                Ball = v99, 
                MaxForce = l_Vector3_0.new(1000, 400000, 1000), 
                Velocity = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(45), l_math_0.rad(v101), 0)).lookVector * 42, 
                Time = 0.3, 
                Delays = 0.1
            };
            if v75:GetXZMag(v98.Position, v99.Position) > 6 then
                v103 = {
                    Limb = v98, 
                    Ball = v99, 
                    MaxForce = l_Vector3_0.new(1000, 400000, 1000), 
                    Velocity = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(41), l_math_0.rad(v101), 0)).lookVector * 20, 
                    Time = 0.3, 
                    Delays = 0.1
                };
            end;
            v75:ClientReact(v103);
        end;
    end;
end;
v69.Activate = function(v105, v106, v107) --[[ Line: 224 ]]
    if v106 == l_Enum_0.UserInputState.Begin then
        if v75:CheckState() and not v75:CheckDebounce() then
            v75:SetDebounce(true);
            v75:EditSharedCooldown("NoPrecharge", true);
            v85 = l_v75_LegSwitch_0.Value;
            local v108 = nil;
            if not v85 then
                v80:Play(0);
                v108 = v75:ActivateReact({
                    ReactLimbs = {
                        l_v75_Limbs_0["Right Leg"]
                    }, 
                    ReactFunc = v97
                });
            else
                v82:Play(0);
                v108 = v75:ActivateReact({
                    ReactLimbs = {
                        l_v75_Limbs_0["Left Leg"]
                    }, 
                    ReactFunc = v97
                });
            end;
            local v109 = v75:ActivateCombo({
                Table = v87, 
                Func = v90
            });
            v75:AnkleActivation(l_v75_Limbs_0.HumanoidRootPart, l_Humanoid_0);
            v86 = true;
            task.wait(0.3);
            v75:AnkleDeactivation(v86);
            v86 = false;
            v75:DeactivateReact(v108);
            task.wait(0.3);
            v76:StopAnim(v80, 0.1);
            v76:StopAnim(v82, 0.1);
            if not v87.CancelCombo.Used then
                task.wait(0.3);
            end;
            v75:DeactivateCombo(v109);
            if not v87.CancelCombo.Used then
                v85 = l_v75_LegSwitch_0.Value;
                if not v85 then
                    v81:Play(0);
                    v108 = v75:ActivateReact({
                        ReactLimbs = {
                            l_v75_Limbs_0["Right Leg"]
                        }, 
                        ReactFunc = v104
                    });
                else
                    v83:Play(0);
                    v108 = v75:ActivateReact({
                        ReactLimbs = {
                            l_v75_Limbs_0["Left Leg"]
                        }, 
                        ReactFunc = v104
                    });
                end;
                v75:AnkleActivation(l_v75_Limbs_0.HumanoidRootPart, l_Humanoid_0);
                v86 = true;
                task.wait(0.5);
            end;
            v75:AnkleDeactivation(v86);
            v86 = false;
            v75:DeactivateReact(v108);
            v76:StopAnim(v81, 0.1);
            v76:StopAnim(v83, 0.1);
            v75:ComboReset(v87);
            v75:EditSharedCooldown("TackleChest", true);
            task.delay(0.4, function() --[[ Line: 311 ]]
                v75:EditSharedCooldown("TackleChest", false);
            end);
            v75:EditSharedCooldown("NoPrecharge", false);
            task.wait(0.2);
            v75:SetDebounce(false);
            v75:PlayQueue();
            return;
        else
            v75:DelayQueue(v69.Activate, v105, v107);
        end;
    end;
end;
return v69;
