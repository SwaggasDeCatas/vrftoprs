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
local v80 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.RightToLeft);
local v81 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.RightOneLegCharge);
local v82 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.LeftToLeft);
local v83 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftOneLegCharge);
local l_v75_LegSwitch_0 = v75:GetLegSwitch();
local v85 = nil;
local v86 = false;
local function v92(v87, v88) --[[ Line: 118 ]]
    local l_Position_0 = v88.Position;
    local _ = v87.CFrame;
    if v75:ReactBallCheck(v87, v88, l_Position_0) and v86 then
        v86 = false;
        local v91 = {
            Limb = v87, 
            Ball = v88, 
            MaxForce = l_Vector3_0.new(5000000, 5000000, 5000000), 
            Velocity = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(30), l_math_0.rad(60), 0)).lookVector * 70, 
            Time = 0.15
        };
        if v75:ServerReact(v91, l_Position_0) then
            v75:ClientReact(v91);
        end;
    end;
end;
v69.Activate = function(v93, v94, v95) --[[ Line: 138 ]]
    if v94 == l_Enum_0.UserInputState.Begin then
        if v75:CheckState() and not v75:CheckDebounce() then
            v75:SetDebounce(true);
            v85 = l_v75_LegSwitch_0.Value;
            if not v85 then
                v76:PlayAnim(v81, 0);
            else
                v76:PlayAnim(v83, 0);
            end;
            task.wait(0.3);
            v76:StopAnim(v81, 0);
            v76:StopAnim(v83, 0);
            local v96 = nil;
            if not v85 then
                v76:PlayAnim(v80, 0, l_Enum_0.AnimationPriority.Action2);
                v96 = v75:ActivateReact({
                    ReactLimbs = {
                        l_v75_Limbs_0["Right Leg"]
                    }, 
                    ReactFunc = v92
                });
            else
                v76:PlayAnim(v82, 0, l_Enum_0.AnimationPriority.Action2);
                v96 = v75:ActivateReact({
                    ReactLimbs = {
                        l_v75_Limbs_0["Left Leg"]
                    }, 
                    ReactFunc = v92
                });
            end;
            v75:AnkleActivation(l_v75_Limbs_0.HumanoidRootPart, l_Humanoid_0);
            v86 = true;
            task.wait(0.5);
            v75:AnkleDeactivation(v86);
            v86 = false;
            v75:DeactivateReact(v96);
            v76:StopAnim(v80, 0.1);
            v76:StopAnim(v82, 0.1);
            task.wait(0.2);
            v75:SetDebounce(false);
            v75:PlayQueue();
            return;
        else
            v75:DelayQueue(v69.Activate, v93, v95);
        end;
    end;
end;
return v69;
