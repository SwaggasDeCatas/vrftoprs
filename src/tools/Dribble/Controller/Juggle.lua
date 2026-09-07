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
local v80 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleQ.RightDribbleQ);
local v81 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleQ.LeftDribbleQ);
local l_v75_LegSwitch_0 = v75:GetLegSwitch();
local v83 = nil;
local v84 = false;
local function v89(v85, v86) --[[ Line: 118 ]]
    local l_Position_0 = v86.Position;
    if v75:ReactBallCheck(v85, v86, l_Position_0) and v84 then
        v84 = false;
        local v88 = {
            Limb = v85, 
            Ball = v86, 
            MaxForce = l_Vector3_0.new(0, 5000000, 0), 
            Velocity = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.Angles(l_math_0.rad(30), 0, 0)).lookVector * 15.5, 
            Time = 0.3
        };
        if v75:ServerReact(v88, l_Position_0) then
            v75:ClientReact(v88);
        end;
    end;
end;
v69.Activate = function(v90, v91, v92) --[[ Line: 137 ]]
    if v91 == l_Enum_0.UserInputState.Begin then
        if v75:CheckState() and not v75:CheckDebounce() then
            v75:SetDebounce(true);
            v83 = l_v75_LegSwitch_0.Value;
            local v93 = nil;
            if not v83 then
                v76:PlayAnim(v80, 0, l_Enum_0.AnimationPriority.Movement);
                v93 = v75:ActivateReact({
                    ReactLimbs = {
                        l_v75_Limbs_0["Right Leg"]
                    }, 
                    ReactFunc = v89
                });
            else
                v76:PlayAnim(v81, 0, l_Enum_0.AnimationPriority.Movement);
                v93 = v75:ActivateReact({
                    ReactLimbs = {
                        l_v75_Limbs_0["Left Leg"]
                    }, 
                    ReactFunc = v89
                });
            end;
            v84 = true;
            task.wait(0.3);
            v84 = false;
            v75:DeactivateReact(v93);
            v76:StopAnim(v80, 0.1);
            v76:StopAnim(v81, 0.1);
            v75:SetDebounce(false);
            v75:PlayQueue();
            return;
        else
            v75:DelayQueue(v69.Activate, v90, v92);
        end;
    end;
end;
return v69;
