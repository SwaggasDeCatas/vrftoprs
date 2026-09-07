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
local v80 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Scissor.RightScissor);
local v81 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Scissor.LeftScissor);
local l_v75_LegSwitch_0 = v75:GetLegSwitch();
local v83 = nil;
local v84 = false;
local function v91(v85, v86) --[[ Line: 115 ]]
    local l_Position_0 = v86.Position;
    if v75:ReactBallCheck(v85, v86, l_Position_0) and v84 then
        v84 = false;
        local l_v75_HeightAngle_0 = v75:GetHeightAngle(30, -10);
        if l_v75_HeightAngle_0 > 0 then
            l_v75_HeightAngle_0 = l_v75_HeightAngle_0 / 2;
        end;
        local v89 = 30;
        if v83 then
            v89 = -30;
        end;
        local v90 = {
            Limb = v85, 
            Ball = v86, 
            MaxForce = l_Vector3_0.new(4000000, 4000000, 4000000), 
            Velocity = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(l_v75_HeightAngle_0), l_math_0.rad(v89), 0)).lookVector * 74, 
            Time = 0.3
        };
        if v75:ServerReact(v90, l_Position_0) then
            v75:ClientReact(v90);
        end;
    end;
end;
v69.Activate = function(_, v93, _) --[[ Line: 143 ]]
    if v93 == l_Enum_0.UserInputState.Begin and v75:CheckState() and not v75:CheckDebounce() then
        v75:SetDebounce(true, 2);
        v83 = l_v75_LegSwitch_0.Value;
        v75:FallClient({
            Type = "UTrip", 
            Movement = true
        });
        local v95 = nil;
        if not v83 then
            v80:Play(0, 1, 1.5);
            v95 = v75:ActivateReact({
                ReactLimbs = {
                    l_v75_Limbs_0["Right Leg"]
                }, 
                ReactFunc = v91
            });
            v75:ActivateAngler({
                Root = l_v75_Limbs_0.Torso, 
                Custom = l_CFrame_0.fromOrientation(0, 0, l_math_0.rad(45)), 
                TweenCFrame = l_CFrame_0.fromOrientation(0, 0, l_math_0.rad(55)), 
                TweenTime = 0.4, 
                TweenES = l_Enum_0.EasingStyle.Sine, 
                TweenED = l_Enum_0.EasingDirection.In
            });
        else
            v81:Play(0, 1, 1.5);
            v95 = v75:ActivateReact({
                ReactLimbs = {
                    l_v75_Limbs_0["Left Leg"]
                }, 
                ReactFunc = v91
            });
            v75:ActivateAngler({
                Root = l_v75_Limbs_0.Torso, 
                Custom = l_CFrame_0.fromOrientation(0, 0, l_math_0.rad(-45)), 
                TweenCFrame = l_CFrame_0.fromOrientation(0, 0, l_math_0.rad(-55)), 
                TweenTime = 0.4, 
                TweenES = l_Enum_0.EasingStyle.Sine, 
                TweenED = l_Enum_0.EasingDirection.In
            });
        end;
        task.wait(0.1);
        v84 = true;
        task.wait(0.3);
        v75:DeactivateAngler(l_v75_Limbs_0.HumanoidRootPart);
        v84 = false;
        v75:DeactivateReact(v95);
        v75:FallClient({
            Type = "Trip", 
            Ragdoll = true, 
            Time = 0.5
        });
        v76:StopAnim(v80, 0.1);
        v76:StopAnim(v81, 0.1);
        task.wait(1);
        v75:SetDebounce(false, 2);
    end;
end;
return v69;
