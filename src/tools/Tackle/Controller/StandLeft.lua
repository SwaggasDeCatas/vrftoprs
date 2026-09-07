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
local l_Instance_0 = Instance;
local l_TweenInfo_0 = TweenInfo;
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
local _ = l_game_0:GetService("Debris");
local l_TweenService_0 = l_game_0:GetService("TweenService");
local l_LocalPlayer_0 = l_game_0:GetService("Players").LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or not l_Character_0.Parent then
    l_Character_0 = l_LocalPlayer_0.CharacterAdded:wait();
end;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local l_ClientModules_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules");
local v77 = l_require_0(l_ClientModules_0:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"));
local _ = l_require_0(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local _ = l_require_0(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_v77_Limbs_0 = v77:GetLimbs(l_Character_0, l_Humanoid_0);
local v81 = l_Humanoid_0:LoadAnimation(l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations").TackleTool.Stand.LeftStand);
local v82 = false;
local function v87(v83, v84) --[[ Line: 113 ]]
    local l_Position_0 = v84.Position;
    if v77:ReactBallCheck(v83, v84, l_Position_0) and v82 then
        v82 = false;
        local v86 = {
            Limb = v83, 
            Ball = v84, 
            MaxForce = l_Vector3_0.new(4000000, 4000000, 4000000), 
            Velocity = (v77:MakeFowardCFrame(l_v77_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(50), l_math_0.rad(60), 0)).lookVector * 33, 
            Time = 0.3
        };
        if v77:ServerReact(v86, l_Position_0) then
            v77:ClientReact(v86);
        end;
    end;
end;
v69.Activate = function(v88, v89, v90) --[[ Line: 132 ]]
    if v89 == l_Enum_0.UserInputState.Begin then
        if v77:CheckState() and not v77:CheckDebounce() and not v77:GetSharedCooldown("TackleStandTackle") then
            v77:SetDebounce(true);
            v77:EditSharedCooldown("NoPrecharge", true);
            v81:Play(0);
            local v91 = v77:ActivateReact({
                ReactLimbs = {
                    l_v77_Limbs_0["Left Leg"]
                }, 
                ReactFunc = v87
            });
            local v92 = l_Instance_0.new("BodyVelocity");
            v92.Velocity = l_Humanoid_0.MoveDirection * l_Humanoid_0.WalkSpeed;
            v92.Parent = l_v77_Limbs_0.HumanoidRootPart;
            v92.MaxForce = l_Vector3_0.new(30000, 0, 30000);
            task.spawn(function() --[[ Line: 148 ]]
                local v93 = l_TweenService_0:Create(v92, l_TweenInfo_0.new(0.4, l_Enum_0.EasingStyle.Linear, l_Enum_0.EasingDirection.Out), {
                    MaxForce = l_Vector3_0.new(0, 0, 0)
                });
                v93:Play();
                v93.Completed:Wait();
                v92:Destroy();
            end);
            v82 = true;
            task.wait(0.4);
            v82 = false;
            v77:DeactivateReact(v91);
            v81:Stop(0.1);
            v77:EditSharedCooldown("NoPrecharge", false);
            task.wait(0.15);
            v77:EditSharedCooldown("TackleStandTackle", true);
            task.delay(0.4, function() --[[ Line: 169 ]]
                v77:EditSharedCooldown("TackleStandTackle", false);
            end);
            v77:SetDebounce(false);
            v77:PlayQueue();
            return;
        else
            v77:DelayQueue(v69.Activate, v88, v90);
        end;
    end;
end;
return v69;
