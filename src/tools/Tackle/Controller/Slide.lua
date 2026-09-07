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
local l_RunService_0 = l_game_0:GetService("RunService");
local l_ReplicatedStorage_0 = l_game_0:GetService("ReplicatedStorage");
local l_TweenService_0 = l_game_0:GetService("TweenService");
local l_Debris_0 = l_game_0:GetService("Debris");
local l_LocalPlayer_0 = l_game_0:GetService("Players").LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or not l_Character_0.Parent then
    l_Character_0 = l_LocalPlayer_0.CharacterAdded:wait();
end;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local l_ClientModules_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules");
local v78 = l_require_0(l_ClientModules_0:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"));
local v79 = l_require_0(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local v80 = l_require_0(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_v78_Limbs_0 = v78:GetLimbs(l_Character_0, l_Humanoid_0);
local l_Animations_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations");
local v83 = l_Humanoid_0:LoadAnimation(l_Animations_0.TackleTool.Slide.RightSlide);
local v84 = l_Humanoid_0:LoadAnimation(l_Animations_0.TackleTool.Slide.LeftSlide);
local v85 = l_Humanoid_0:LoadAnimation(l_Animations_0.TackleTool.Slide.RightSlideY);
local v86 = l_Humanoid_0:LoadAnimation(l_Animations_0.TackleTool.Slide.LeftSlideY);
local l_v78_LegSwitch_0 = v78:GetLegSwitch();
local v88 = nil;
local v89 = false;
local v90 = false;
local v91 = 0;
local v92 = nil;
local v93 = {};
local v94 = nil;
local v95 = nil;
local l_Keybinds_0 = l_ReplicatedStorage_0:WaitForChild("PlayerData"):WaitForChild(l_LocalPlayer_0.UserId):WaitForChild("Keybinds");
local v97 = {
    StopBallCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Tackle"):WaitForChild("Tackle"):WaitForChild("StopBall")
    }, 
    FlickUpCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Tackle"):WaitForChild("Tackle"):WaitForChild("FlickUp")
    }, 
    CancelCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Tackle"):WaitForChild("Tackle"):WaitForChild("Cancel")
    }
};
local _ = function() --[[ Line: 139 ]]
    for _, v99 in l_pairs_0(v97) do
        v99.Used = false;
    end;
end;
local function v105(v101, v102) --[[ Line: 145 ]]
    if v102 == l_Enum_0.UserInputState.Begin then
        for v103, v104 in l_pairs_0(v97) do
            if v101 == v103 then
                v104.Used = true;
                if v104 == v97.CancelCombo then
                    v69.Activate("Cancel", l_Enum_0.UserInputState.End, "Cancel");
                end;
            else
                v104.Used = false;
            end;
        end;
        return l_Enum_0.ContextActionResult.Sink;
    else
        return l_Enum_0.ContextActionResult.Pass;
    end;
end;
local function v113(v106, v107) --[[ Line: 162 ]]
    local l_Position_0 = v107.Position;
    if v78:GetXZMag(v106.Position, l_Position_0) > 5 then
        return;
    else
        local v109 = v78:CheckIfPlayer(v107);
        if not v109 then
            if v78:ReactBallCheck(v106, v107, l_Position_0) and v89 then
                v89 = false;
                local v110 = (l_v78_Limbs_0.HumanoidRootPart.CFrame * l_CFrame_0.Angles(l_math_0.rad(7.5), 0, 0)).lookVector * (40 + v91 / 8);
                local v111 = l_Vector3_0.new(90000000000, 1.0E33, 90000000000);
                if v97.StopBallCombo.Used then
                    v110 = (l_v78_Limbs_0.HumanoidRootPart.CFrame * l_CFrame_0.Angles(0, 0, 0)).lookVector * 0;
                    if v107.Velocity.Magnitude > 70 then
                        v110 = v107.Velocity / 4;
                    end;
                elseif v97.FlickUpCombo.Used then
                    v110 = l_Vector3_0.new(0, 1, 0) * 35;
                    v111 = l_Vector3_0.new(10, 5000000, 10);
                end;
                local v112 = {
                    Limb = v106, 
                    Ball = v107, 
                    MaxForce = v111, 
                    Velocity = v110, 
                    Time = 0.3
                };
                if v78:ServerReact(v112, l_Position_0) then
                    v78:ClientReact(v112);
                    return;
                end;
            end;
        elseif v93[v109] == nil and (v89 or #v93 > 0) then
            v89 = false;
            v93[v109] = v109;
            v78:TripPlayer(v109);
        end;
        return;
    end;
end;
local v114 = false;
v69.Activate = function(v115, v116, _) --[[ Line: 206 ]]
    if v116 == l_Enum_0.UserInputState.Begin then
        if not v78:CheckIfInAir(l_Humanoid_0) and v78:CheckState() and not v78:CheckDebounce(2) and v78:CheckClosestBall(l_v78_Limbs_0.HumanoidRootPart, 50) then
            if v115 == "Delayed" and not v114 then
                return;
            elseif v78:CheckDebounce2(1) and v115 ~= "Delayed" then
                v114 = true;
                v78:DelayReleaseQueue(v69.Activate, 1, v116);
                return;
            else
                v78:SetDebounce(true, 2);
                v90 = true;
                v78:ActivatePowerBar({
                    {
                        Time = 0.5, 
                        ES = l_Enum_0.EasingStyle.Sine, 
                        ED = l_Enum_0.EasingDirection.Out, 
                        To = 100
                    }
                });
                v95 = v78:ActivateCombo({
                    Table = v97, 
                    Func = v105
                });
                if v94 ~= nil then
                    v94:Disconnect();
                    v94 = nil;
                end;
                v94 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 235 ]]
                    v80:Speed({
                        Set = v80:GetNeutralSpeed() - v78:GetPowerBar() / 100, 
                        ReturnTime = 0.6
                    });
                end);
                return;
            end;
        end;
    elseif v116 == l_Enum_0.UserInputState.End and (v90 or v114) then
        if v114 and not v90 then
            v114 = false;
            return;
        else
            v114 = false;
            v90 = false;
            v88 = l_v78_LegSwitch_0.Value;
            v78:StopPowerBar();
            v91 = v78:GetPowerBar();
            if v94 ~= nil then
                v94:Disconnect();
                v94 = nil;
            end;
            if not v78:CheckIfInAir(l_Humanoid_0) and not v97.CancelCombo.Used then
                local v118 = 21 + v91 / 18;
                local v119 = l_Instance_0.new("BodyVelocity");
                v119.Velocity = v78:GetCameraZX(l_v78_Limbs_0.HumanoidRootPart).lookVector * v118;
                v119.Parent = l_v78_Limbs_0.HumanoidRootPart;
                v119.MaxForce = l_Vector3_0.new(4000000, 4000000, 4000000);
                v92 = v119;
                local v120 = v119.Velocity / 3;
                l_TweenService_0:Create(v119, l_TweenInfo_0.new(0.5, l_Enum_0.EasingStyle.Quad, l_Enum_0.EasingDirection.In), {
                    Velocity = v120
                }):Play();
                l_Debris_0:AddItem(v119, 0.5);
                v78:DeactivateCombo(v95);
                v78:FallClient({
                    Type = "UTrip"
                });
                l_v78_Limbs_0.Torso.CFrame = l_v78_Limbs_0.Torso.CFrame + l_Vector3_0.new(0, -1.2, 0);
                if not v88 then
                    if v97.FlickUpCombo.Used then
                        v85:Play(0);
                    else
                        v83:Play(0);
                    end;
                    v78:ActivateAngler({
                        Root = l_v78_Limbs_0.Torso, 
                        Custom = l_CFrame_0.Angles(l_math_0.rad(75), l_math_0.rad(60), l_math_0.rad(0))
                    });
                else
                    if v97.FlickUpCombo.Used then
                        v86:Play(0);
                    else
                        v84:Play(0);
                    end;
                    v78:ActivateAngler({
                        Root = l_v78_Limbs_0.Torso, 
                        Custom = l_CFrame_0.Angles(l_math_0.rad(75), l_math_0.rad(-60), l_math_0.rad(0))
                    });
                end;
                task.wait();
                v93 = {};
                local v121 = v78:ActivateReact({
                    ReactLimbs = {
                        l_v78_Limbs_0["Right Leg"], 
                        l_v78_Limbs_0["Left Leg"]
                    }, 
                    ReactFunc = v113
                });
                v89 = true;
                task.wait(0.5);
                v89 = false;
                v78:DeactivateReact(v121);
                v78:DeactivateAngler(l_v78_Limbs_0.HumanoidRootPart);
                v79:StopAnim(v83, 0);
                v79:StopAnim(v84, 0);
                v79:StopAnim(v85, 0);
                v79:StopAnim(v86, 0);
                v78:FallClient({
                    Type = "Trip", 
                    Ragdoll = true, 
                    Time = 0.5
                });
                v78:DeactivatePowerBar();
                task.wait(1);
            else
                v78:DeactivatePowerBar();
            end;
            v78:DeactivateCombo(v95);
            v78:ComboReset(v97);
            v78:SetDebounce(false, 2);
        end;
    end;
end;
return v69;
