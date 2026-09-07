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
local l_RunService_0 = l_game_0:GetService("RunService");
local l_ReplicatedStorage_0 = l_game_0:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_game_0:GetService("Players").LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or not l_Character_0.Parent then
    l_Character_0 = l_LocalPlayer_0.CharacterAdded:wait();
end;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local l_ClientModules_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules");
local v76 = l_require_0(l_ClientModules_0:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"));
local v77 = l_require_0(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local v78 = l_require_0(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_v76_Limbs_0 = v76:GetLimbs(l_Character_0, l_Humanoid_0);
local l_Animations_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations");
local v81 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Volley.RightVolleyStart);
local v82 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Volley.RightVolleyLoop);
local v83 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Volley.RightVolleyEnd);
local v84 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Volley.LeftVolleyStart);
local v85 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Volley.LeftVolleyLoop);
local v86 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Volley.LeftVolleyEnd);
local l_v76_LegSwitch_0 = v76:GetLegSwitch();
local v88 = nil;
local v89 = false;
local v90 = 0;
local v91 = false;
local v92 = nil;
local function v105(v93, v94) --[[ Line: 124 ]]
    local l_Position_0 = v94.Position;
    local l_CFrame_1 = v93.CFrame;
    if not v76:ReactBallCheck(v93, v94, l_Position_0) or not v91 then
        return;
    else
        v91 = false;
        local v97 = 75 + v90 / 5;
        local l_v76_HeightAngle_0 = v76:GetHeightAngle(5 + v90 / 10, -20);
        local v99 = v76:MakeFowardCFrame(l_v76_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(l_v76_HeightAngle_0), 0, 0);
        local v100 = (v99 * l_CFrame_0.fromOrientation(0, l_math_0.rad(35), 0)).lookVector * v97;
        if v88 then
            v100 = (v99 * l_CFrame_0.fromOrientation(0, l_math_0.rad(-35), 0)).lookVector * v97;
        end;
        local v101 = l_Vector3_0.new(4000000, 4000000, 4000000);
        local l_Unit_0 = v100.Unit;
        local l_v76_Spin_0 = v76:GetSpin((l_CFrame_1 * l_CFrame_0.new(0, -0.5, 0)).p, l_Position_0, -v93.CFrame.upVector, v97, 150);
        if l_v76_Spin_0 == l_Vector3_0.zero then
            l_v76_Spin_0 = l_v76_Spin_0 + l_Vector3_0.new(l_Unit_0.Z, 0, -l_Unit_0.X) * (8 + v97 / 6);
        end;
        local v104 = {
            Limb = v93, 
            Ball = v94, 
            MaxForce = v101, 
            Velocity = v100, 
            Spin = l_v76_Spin_0, 
            Time = 0.3
        };
        if v76:ServerReact(v104, l_Position_0) then
            v76:ClientReact(v104);
        end;
        return;
    end;
end;
local v106 = false;
v69.Activate = function(v107, v108, _) --[[ Line: 166 ]]
    if v108 == l_Enum_0.UserInputState.Begin then
        if v76:CheckState() and not v76:CheckDebounce(2) then
            if v107 == "Delayed" and not v106 then
                return;
            elseif v76:CheckDebounce2(1) and v107 ~= "Delayed" then
                v106 = true;
                v76:DelayReleaseQueue(v69.Activate, 1, v108);
                return;
            else
                v76:SetDebounce(true, 2);
                v88 = l_v76_LegSwitch_0.Value;
                v89 = true;
                v76:ActivatePowerBar({
                    {
                        Time = 0.5, 
                        ES = l_Enum_0.EasingStyle.Linear, 
                        ED = l_Enum_0.EasingDirection.Out, 
                        To = 100
                    }
                });
                if v92 ~= nil then
                    v92:Disconnect();
                    v92 = nil;
                end;
                v92 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 191 ]]
                    v78:Speed({
                        Set = v78:GetNeutralSpeed() - v76:GetPowerBar() / 50, 
                        ReturnTime = 0.6
                    });
                end);
                if not v88 then
                    v81:Play(0);
                    v81.Stopped:Wait();
                    if v89 then
                        v82:Play(0);
                        return;
                    end;
                else
                    v84:Play(0);
                    v84.Stopped:Wait();
                    if v89 then
                        v85:Play(0);
                        return;
                    end;
                end;
            end;
        end;
    elseif v108 == l_Enum_0.UserInputState.End and (v89 or v106) then
        if v106 and not v89 then
            v106 = false;
            return;
        else
            v106 = false;
            v89 = false;
            v76:StopPowerBar();
            v90 = v76:GetPowerBar();
            if v92 ~= nil then
                v92:Disconnect();
                v92 = nil;
            end;
            v77:StopAnim(v81, 0);
            v77:StopAnim(v84, 0);
            v77:StopAnim(v82, 0);
            v77:StopAnim(v85, 0);
            if not v88 then
                v77:PlayAnim(v83, 0, l_Enum_0.AnimationPriority.Action2);
            else
                v77:PlayAnim(v86, 0, l_Enum_0.AnimationPriority.Action2);
            end;
            local v110 = nil;
            v110 = if not v88 then v76:ActivateReact({
                ReactLimbs = {
                    l_v76_Limbs_0["Right Leg"]
                }, 
                ReactFunc = v105
            }) else v76:ActivateReact({
                ReactLimbs = {
                    l_v76_Limbs_0["Left Leg"]
                }, 
                ReactFunc = v105
            });
            v76:AnkleActivation(l_v76_Limbs_0.HumanoidRootPart, l_Humanoid_0);
            v91 = true;
            task.wait(0.6);
            v76:AnkleDeactivation(v91);
            v91 = false;
            v76:DeactivateReact(v110);
            v76:DeactivatePowerBar();
            v77:StopAnim(v83, 0.1);
            v77:StopAnim(v86, 0.1);
            task.wait(0.2);
            v76:SetDebounce(false, 2);
            v76:PlayQueue();
        end;
    end;
end;
return v69;
