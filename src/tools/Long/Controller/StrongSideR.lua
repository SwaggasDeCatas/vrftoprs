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
local v82 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftOneLegCharge);
local v83 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftOneLegChargeLoop);
local v84 = l_Humanoid_0:LoadAnimation(l_Animations_0.LongTool.PowerSideLong.LongC);
local v85 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.LeftToRight);
local v86 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.LeftToLeft);
local l_v77_LegSwitch_0 = v77:GetLegSwitch();
local v88 = nil;
local v89 = false;
local v90 = 0;
local v91 = false;
local v92 = nil;
local v93 = nil;
local l_Keybinds_0 = l_ReplicatedStorage_0:WaitForChild("PlayerData"):WaitForChild(l_LocalPlayer_0.UserId):WaitForChild("Keybinds");
local v95 = {
    FakeRrpsCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Long"):WaitForChild("StrongSideL"):WaitForChild("FakeRrps")
    }, 
    FakeLrpsCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Long"):WaitForChild("StrongSideL"):WaitForChild("FakeLrps")
    }
};
local function v98(v96, v97) --[[ Line: 135 ]]
    v77:InputCombo(v96, v97, v95);
end;
local function v109(v99, v100) --[[ Line: 139 ]]
    local l_Position_0 = v100.Position;
    local _ = v99.CFrame;
    if v77:ReactBallCheck(v99, v100, l_Position_0) and v91 then
        v91 = false;
        local v103 = 70 + v90 / 3.6;
        local v104 = (v77:MakeFowardCFrame(l_v77_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(30 - v90 / 20), l_math_0.rad(-80), 0)).lookVector * v103;
        local v105 = l_Vector3_0.new(4000000, 8000000, 4000000);
        local l_Unit_0 = v104.Unit;
        local v107 = l_Vector3_0.new(l_Unit_0.Z, 0, -l_Unit_0.X) * (8 + v103 / 5);
        if v95.FakeLrpsCombo.Used then
            v104 = (v77:MakeFowardCFrame(l_v77_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(10), l_math_0.rad(53), 0)).lookVector * 23;
            v105 = l_Vector3_0.new(400000, 400000, 400000);
            v79:Speed({
                ReturnTime = 0
            });
            v107 = nil;
        elseif v95.FakeRrpsCombo.Used then
            v104 = (v77:MakeFowardCFrame(l_v77_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(10), l_math_0.rad(-53), 0)).lookVector * 23;
            v105 = l_Vector3_0.new(400000, 400000, 400000);
            v79:Speed({
                ReturnTime = 0
            });
            v107 = nil;
        end;
        local v108 = {
            Limb = v99, 
            Ball = v100, 
            MaxForce = v105, 
            Velocity = v104, 
            Spin = v107, 
            Time = 0.3
        };
        if v77:ServerReact(v108, l_Position_0) then
            v77:ClientReact(v108);
        end;
    end;
end;
local v110 = false;
local v111 = l_tick_0();
v69.Activate = function(v112, v113, v114) --[[ Line: 186 ]]
    if v113 == l_Enum_0.UserInputState.Begin then
        if v77:CheckState() and not v77:CheckDebounce(2) then
            if v112 == "Delayed" and not v110 then
                return;
            elseif v77:CheckDebounce2(1) and v112 ~= "Delayed" then
                v110 = true;
                v77:DelayReleaseQueue(v69.Activate, 1, v113);
                return;
            else
                v77:SetDebounce(true, 2);
                v88 = l_v77_LegSwitch_0.Value;
                v89 = true;
                v77:ActivatePowerBar({
                    {
                        Time = 0.7, 
                        ES = l_Enum_0.EasingStyle.Sine, 
                        ED = l_Enum_0.EasingDirection.Out, 
                        To = 100
                    }
                });
                v93 = v77:ActivateCombo({
                    Table = v95, 
                    Func = v98
                });
                if v92 ~= nil then
                    v92:Disconnect();
                    v92 = nil;
                end;
                v92 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 216 ]]
                    v79:Speed({
                        Set = v79:GetNeutralSpeed() - v77:GetPowerBar() / 100, 
                        ReturnTime = 0.6
                    });
                end);
                v111 = l_tick_0();
                if v114 ~= nil and not v77:IsKeyDown(v114) then
                    task.spawn(function() --[[ Line: 226 ]]
                        v69.Activate(v112, l_Enum_0.UserInputState.End, v114);
                    end);
                end;
                v82:Play(0);
                v82.Stopped:Wait();
                if v89 then
                    v83:Play(0);
                    return;
                end;
            end;
        end;
    elseif v113 == l_Enum_0.UserInputState.End and (v89 or v110) then
        if v110 and not v89 then
            v110 = false;
            return;
        else
            v110 = false;
            v89 = false;
            v77:StopPowerBar();
            v90 = v77:GetPowerBar();
            if l_tick_0() < v111 + 0.3 then
                task.wait(v111 + 0.3 - l_tick_0());
            end;
            if v92 ~= nil then
                v92:Disconnect();
                v92 = nil;
            end;
            v77:DeactivateCombo(v93);
            v78:StopAnim(v82, 0);
            v78:StopAnim(v83, 0);
            if v95.FakeLrpsCombo.Used then
                v78:PlayAnim(v86, 0, l_Enum_0.AnimationPriority.Action2);
            elseif v95.FakeRrpsCombo.Used then
                v78:PlayAnim(v85, 0, l_Enum_0.AnimationPriority.Action2);
            else
                v78:PlayAnim(v84, 0, l_Enum_0.AnimationPriority.Action2);
            end;
            local v115 = v77:ActivateReact({
                ReactLimbs = {
                    l_v77_Limbs_0["Left Leg"]
                }, 
                ReactFunc = v109
            });
            v77:AnkleActivation(l_v77_Limbs_0.HumanoidRootPart, l_Humanoid_0);
            v91 = true;
            task.wait(0.5);
            v77:AnkleDeactivation(v91);
            v91 = false;
            v77:DeactivateReact(v115);
            v77:DeactivatePowerBar();
            v78:StopAnim(v86, 0.1);
            v78:StopAnim(v85, 0.1);
            v78:StopAnim(v84, 0.1);
            v77:ComboReset(v95);
            task.wait(0.2);
            v77:SetDebounce(false, 2);
            v77:PlayQueue();
        end;
    end;
end;
return v69;
