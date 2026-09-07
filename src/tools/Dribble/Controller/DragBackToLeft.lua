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
local v79 = l_Humanoid_0:LoadAnimation(l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations").DribbleTool.DragTo.RightSideDrag);
local l_v75_LegSwitch_0 = v75:GetLegSwitch();
local v81 = nil;
local v82 = false;
local function v90(v83, v84) --[[ Line: 114 ]]
    local l_Position_0 = v84.Position;
    if v75:ReactBallCheck(v83, v84, l_Position_0) and v82 then
        v82 = false;
        local v86 = l_Vector3_0.new(400000, 1000, 400000);
        local v87 = 5;
        local v88 = 25.5;
        if not (v75:CheckIfInAir(l_Humanoid_0) and not v75:IsBallGrounded(v84)) or v84.NetworkOwner.Value ~= l_LocalPlayer_0 then
            v87 = -3;
            v86 = l_Vector3_0.new(40000, 1000, 40000);
            v88 = 27.5;
        end;
        local v89 = {
            Limb = v83, 
            Ball = v84, 
            MaxForce = v86, 
            Velocity = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(v87), l_math_0.rad(90), 0)).lookVector * v88, 
            Time = 0.3
        };
        if v75:ServerReact(v89, l_Position_0) then
            v75:ClientReact(v89);
        end;
    end;
end;
v69.Activate = function(v91, v92, v93) --[[ Line: 142 ]]
    if v92 == l_Enum_0.UserInputState.Begin then
        if v75:CheckState() and not v75:CheckDebounce() then
            v75:SetDebounce(true);
            v81 = l_v75_LegSwitch_0.Value;
            v79:Play(0);
            local v94 = v75:ActivateReact({
                ReactLimbs = {
                    l_v75_Limbs_0["Right Leg"]
                }, 
                ReactFunc = v90
            });
            v82 = true;
            task.wait(0.225);
            v82 = false;
            v75:DeactivateReact(v94);
            v76:StopAnim(v79, 0.075);
            task.wait(0.075);
            v75:SetDebounce(false);
            v75:PlayQueue();
            return;
        else
            v75:DelayQueue(v69.Activate, v91, v93);
        end;
    end;
end;
return v69;
