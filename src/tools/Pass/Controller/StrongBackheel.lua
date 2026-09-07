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
local l_RunService_0 = l_game_0:GetService("RunService");
local l_ReplicatedStorage_0 = l_game_0:GetService("ReplicatedStorage");
local _ = l_game_0:GetService("UserInputService");
local l_LocalPlayer_0 = l_game_0:GetService("Players").LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or not l_Character_0.Parent then
    l_Character_0 = l_LocalPlayer_0.CharacterAdded:wait();
end;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local l_ClientModules_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules");
local v77 = l_require_0(l_ClientModules_0:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"));
local v78 = l_require_0(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local v79 = l_require_0(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_v77_Limbs_0 = v77:GetLimbs(l_Character_0, l_Humanoid_0);
local l_Animations_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations");
local v82 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.Backheel.RightBackHeelStart);
local v83 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.Backheel.RightBackHeelEnd);
local v84 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.Backheel.LeftBackHeelStart);
local v85 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.Backheel.LeftBackHeelEnd);
local v86 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.Backheel.RightBackHeelLoop);
local v87 = l_Humanoid_0:LoadAnimation(l_Animations_0.PassTool.Backheel.LeftBackHeelLoop);
local l_v77_LegSwitch_0 = v77:GetLegSwitch();
local v89 = nil;
local v90 = false;
local v91 = 0;
local v92 = false;
local v93 = nil;
local function v99(v94, v95) --[[ Line: 126 ]]
    local l_Position_0 = v95.Position;
    if v77:ReactBallCheck(v94, v95, l_Position_0) and v92 then
        v92 = false;
        local v97 = -57.5 - v91 / 3.75;
        local v98 = {
            Limb = v94, 
            Ball = v95, 
            MaxForce = l_Vector3_0.new(6000000, 0, 6000000), 
            Velocity = (v77:MakeFowardCFrame(l_v77_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.Angles(l_math_0.rad(-35), 0, 0)).lookVector * v97, 
            Time = 0.3
        };
        if v77:ServerReact(v98, l_Position_0) then
            v77:ClientReact(v98);
        end;
    end;
end;
local v100 = false;
local v101 = l_tick_0();
v69.Activate = function(v102, v103, v104) --[[ Line: 148 ]]
    if v103 == l_Enum_0.UserInputState.Begin then
        if v77:CheckState() and not v77:CheckDebounce(2) then
            if v102 == "Delayed" and not v100 then
                return;
            elseif v77:CheckDebounce2(1) and v102 ~= "Delayed" then
                v100 = true;
                v77:DelayReleaseQueue(v69.Activate, 1, v103);
                return;
            else
                v77:SetDebounce(true, 2);
                v89 = l_v77_LegSwitch_0.Value;
                v90 = true;
                v77:ActivatePowerBar({
                    {
                        Time = 0.6, 
                        ES = l_Enum_0.EasingStyle.Linear, 
                        ED = l_Enum_0.EasingDirection.Out, 
                        To = 100
                    }
                });
                if v93 ~= nil then
                    v93:Disconnect();
                    v93 = nil;
                end;
                v93 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 173 ]]
                    v79:Speed({
                        Set = v79:GetNeutralSpeed() - v77:GetPowerBar() / 100, 
                        ReturnTime = 0.6
                    });
                end);
                v101 = l_tick_0();
                if v104 ~= nil and not v77:IsKeyDown(v104) then
                    task.spawn(function() --[[ Line: 183 ]]
                        v69.Activate(v102, l_Enum_0.UserInputState.End, v104);
                    end);
                end;
                if not v89 then
                    v82:Play(0);
                    v82.Stopped:Wait();
                    if v90 then
                        v86:Play(0);
                        return;
                    end;
                else
                    v84:Play(0);
                    v84.Stopped:Wait();
                    if v90 then
                        v87:Play(0);
                        return;
                    end;
                end;
            end;
        end;
    elseif v103 == l_Enum_0.UserInputState.End and (v90 or v100) then
        if v100 and not v90 then
            v100 = false;
            return;
        else
            v100 = false;
            v90 = false;
            v77:StopPowerBar();
            v91 = v77:GetPowerBar();
            if l_tick_0() < v101 + 0.2 then
                task.wait(v101 + 0.2 - l_tick_0());
            end;
            if v93 ~= nil then
                v93:Disconnect();
                v93 = nil;
            end;
            v78:StopAnim(v82, 0);
            v78:StopAnim(v86, 0);
            v78:StopAnim(v84, 0);
            v78:StopAnim(v87, 0);
            local v105 = nil;
            if not v89 then
                v78:PlayAnim(v83, 0, l_Enum_0.AnimationPriority.Action2);
                v105 = v77:ActivateReact({
                    ReactLimbs = {
                        l_v77_Limbs_0["Right Leg"]
                    }, 
                    ReactFunc = v99
                });
            else
                v78:PlayAnim(v85, 0, l_Enum_0.AnimationPriority.Action2);
                v105 = v77:ActivateReact({
                    ReactLimbs = {
                        l_v77_Limbs_0["Left Leg"]
                    }, 
                    ReactFunc = v99
                });
            end;
            v77:AnkleActivation(l_v77_Limbs_0.HumanoidRootPart, l_Humanoid_0);
            v92 = true;
            task.wait(0.3);
            v77:AnkleDeactivation(v92);
            v92 = false;
            v77:DeactivateReact(v105);
            v77:DeactivatePowerBar();
            v78:StopAnim(v83, 0.1);
            v78:StopAnim(v85, 0.1);
            task.wait(0.2);
            v77:SetDebounce(false, 2);
            v77:PlayQueue();
        end;
    end;
end;
return v69;
