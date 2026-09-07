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
local v82 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.RightOneLegCharge);
local v83 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.RightOneLegChargeLoop);
local v84 = l_Humanoid_0:LoadAnimation(l_Animations_0.LongTool.Rabona.RightRabona);
local v85 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftOneLegCharge);
local v86 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftOneLegChargeLoop);
local v87 = l_Humanoid_0:LoadAnimation(l_Animations_0.LongTool.Rabona.LeftRabona);
local v88 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.RightToRight);
local v89 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.LeftToRight);
local v90 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.RightToLeft);
local v91 = l_Humanoid_0:LoadAnimation(l_Animations_0.DribbleTool.DribbleRT.LeftToLeft);
local l_v77_LegSwitch_0 = v77:GetLegSwitch();
local v93 = nil;
local v94 = false;
local v95 = 0;
local v96 = false;
local v97 = nil;
local v98 = nil;
local l_Keybinds_0 = l_ReplicatedStorage_0:WaitForChild("PlayerData"):WaitForChild(l_LocalPlayer_0.UserId):WaitForChild("Keybinds");
local v100 = {
    FrontSpinCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Long"):WaitForChild("AdvRabona"):WaitForChild("FrontSpin")
    }, 
    BackSpinCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Long"):WaitForChild("AdvRabona"):WaitForChild("BackSpin")
    }, 
    FakeRrpsCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Long"):WaitForChild("AdvRabona"):WaitForChild("FakeRrps")
    }, 
    FakeLrpsCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Long"):WaitForChild("AdvRabona"):WaitForChild("FakeLrps")
    }, 
    StopBallCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Long"):WaitForChild("AdvRabona"):WaitForChild("StopBall")
    }
};
local function v103(v101, v102) --[[ Line: 144 ]]
    if v96 and v101 ~= "FrontSpinCombo" and v101 ~= "BackSpinCombo" then
        return;
    else
        v77:InputCombo(v101, v102, v100);
        return;
    end;
end;
local function v116(_, _, v106, _, v108, v109, v110) --[[ Line: 151 ]]
    local v111 = -5;
    if v93 then
        v111 = 5;
	end;
	
	if game:GetService("UserInputService").TouchEnabled then
		local SpinType = v77:GetSpinType()
		local TableToLookIn = v100

		if SpinType == "B" then
			TableToLookIn.BackSpinCombo.Used = true
			TableToLookIn.FrontSpinCombo.Used = false
		elseif SpinType == "T" then
			TableToLookIn.FrontSpinCombo.Used = true
			TableToLookIn.BackSpinCombo.Used = false
		elseif SpinType == "" or SpinType == "N" then
			TableToLookIn.FrontSpinCombo.Used = false
			TableToLookIn.BackSpinCombo.Used = false
		end
	end
	
    local v112 = l_Vector3_0.new(4000000, 8000000, 4000000);
    local v113 = (v109 * l_CFrame_0.fromOrientation(l_math_0.rad(v110), l_math_0.rad(v111), 0)).lookVector * v108;
    local l_Unit_0 = v113.Unit;
    local v115 = l_Vector3_0.new(l_Unit_0.Z, 0, -l_Unit_0.X) * (8 + v108 / 6);
    if v100.FakeLrpsCombo.Used then
        v113 = (v109 * l_CFrame_0.fromOrientation(l_math_0.rad(10), l_math_0.rad(53), 0)).lookVector * 21.5;
        v112 = l_Vector3_0.new(400000, 400000, 400000);
        v115 = nil;
    elseif v100.FakeRrpsCombo.Used then
        v113 = (v109 * l_CFrame_0.fromOrientation(l_math_0.rad(10), l_math_0.rad(-53), 0)).lookVector * 21.5;
        v112 = l_Vector3_0.new(400000, 400000, 400000);
    elseif v100.StopBallCombo.Used then
        v113 = (v109 * l_CFrame_0.fromOrientation(0, 0, 0)).lookVector * 0;
        if v106.Velocity.Magnitude > 60 then
            v113 = v106.Velocity / 4;
        end;
        v112 = l_Vector3_0.new(9000000000, 30000, 9000000000);
        v115 = l_Vector3_0.new(0, 0, 0);
    elseif v100.BackSpinCombo.Used then
        v115 = l_Vector3_0.new(l_Unit_0.Z, 0, -l_Unit_0.X) * -v108 / (1 + v115.Magnitude / 600);
        v113 = v113 * 0.985;
    elseif v100.FrontSpinCombo.Used then
        v115 = l_Vector3_0.new(l_Unit_0.Z, 0, -l_Unit_0.X) * (80 + v95 / 3.5) / (1 + v115.Magnitude / 600);
        v113 = v113 * 0.985;
    end;
    if v113.Magnitude < 30 then
        v79:Speed({
            ReturnTime = 0
        });
    end;
    return v115, v113, v112;
end;
local function v128(v117, v118) --[[ Line: 197 ]]
    local l_Position_0 = v118.Position;
    local l_CFrame_1 = v117.CFrame;
    if v77:ReactBallCheck(v117, v118, l_Position_0) and v96 then
        v96 = false;
        local v121 = 62 + v95 / 3.5;
        local v122 = l_math_0.clamp(v77:GetHeightAngle(30, -10) * 1.5, 0, 30);
        local v123 = v77:MakeFowardCFrame(l_v77_Limbs_0.HumanoidRootPart.CFrame);
        local v124, v125, v126 = v116(v117, l_CFrame_1, v118, l_Position_0, v121, v123, v122);
        local v127 = {
            Limb = v117, 
            Ball = v118, 
            MaxForce = v126, 
            Velocity = v125, 
            Spin = v124, 
            Time = 0.3
        };
        if v77:ServerReact(v127, l_Position_0) then
            v77:ClientReact(v127);
        end;
    end;
end;
local v129 = false;
local v130 = l_tick_0();
v69.Activate = function(v131, v132, v133) --[[ Line: 226 ]]
    if v132 == l_Enum_0.UserInputState.Begin then
        if v77:CheckState() and not v77:CheckDebounce(2) then
            if v131 == "Delayed" and not v129 then
                return;
            elseif v77:CheckDebounce2(1) and v131 ~= "Delayed" then
                v129 = true;
                v77:DelayReleaseQueue(v69.Activate, 1, v132);
                return;
            else
                v77:SetDebounce(true, 2);
                v93 = l_v77_LegSwitch_0.Value;
                v94 = true;
                v77:ActivatePowerBar({
                    {
                        Time = 0.6, 
                        ES = l_Enum_0.EasingStyle.Linear, 
                        ED = l_Enum_0.EasingDirection.Out, 
                        To = 100, 
                        NoHoldReset = true
                    }
                });
                v98 = v77:ActivateCombo({
                    Table = v100, 
                    Func = v103
                });
                if v97 ~= nil then
                    v97:Disconnect();
                    v97 = nil;
                end;
                v97 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 256 ]]
                    v79:Speed({
                        Set = v79:GetNeutralSpeed() - v77:GetPowerBar() / 100, 
                        ReturnTime = 0.6
                    });
                end);
                v130 = l_tick_0();
                if v133 ~= nil and not v77:IsKeyDown(v133) then
                    task.spawn(function() --[[ Line: 266 ]]
                        v69.Activate(v131, l_Enum_0.UserInputState.End, v133);
                    end);
                end;
                if not v93 then
                    v82:Play(0);
                    v82.Stopped:Wait();
                    if v94 then
                        v83:Play(0);
                        return;
                    end;
                else
                    v85:Play(0);
                    v85.Stopped:Wait();
                    if v94 then
                        v86:Play(0);
                        return;
                    end;
                end;
            end;
        end;
    elseif v132 == l_Enum_0.UserInputState.End and (v94 or v129) then
        if v129 and not v94 then
            v129 = false;
            return;
        else
            v129 = false;
            v94 = false;
            v77:StopPowerBar();
            v95 = v77:GetPowerBar();
            if l_tick_0() < v130 + 0.2 then
                task.wait(v130 + 0.2 - l_tick_0());
            end;
            if v97 ~= nil then
                v97:Disconnect();
                v97 = nil;
            end;
            v77:EditSharedCooldown("BoostTrip", true);
            v78:StopAnim(v82, 0);
            v78:StopAnim(v83, 0);
            v78:StopAnim(v85, 0);
            v78:StopAnim(v86, 0);
            if not v93 then
                if v100.FakeLrpsCombo.Used then
                    v78:PlayAnim(v90, 0, l_Enum_0.AnimationPriority.Action2);
                elseif v100.FakeRrpsCombo.Used then
                    v78:PlayAnim(v88, 0, l_Enum_0.AnimationPriority.Action2);
                else
                    v78:PlayAnim(v84, 0, l_Enum_0.AnimationPriority.Action2);
                end;
            elseif v100.FakeLrpsCombo.Used then
                v78:PlayAnim(v91, 0, l_Enum_0.AnimationPriority.Action2);
            elseif v100.FakeRrpsCombo.Used then
                v78:PlayAnim(v89, 0, l_Enum_0.AnimationPriority.Action2);
            else
                v78:PlayAnim(v87, 0, l_Enum_0.AnimationPriority.Action2);
            end;
            local v134 = nil;
            v134 = if not v93 then v77:ActivateReact({
                ReactLimbs = {
                    l_v77_Limbs_0["Right Leg"]
                }, 
                ReactFunc = v128
            }) else v77:ActivateReact({
                ReactLimbs = {
                    l_v77_Limbs_0["Left Leg"]
                }, 
                ReactFunc = v128
            });
            v77:AnkleActivation(l_v77_Limbs_0.HumanoidRootPart, l_Humanoid_0);
            v96 = true;
            task.wait(0.5);
            v77:AnkleDeactivation(v96);
            v96 = false;
            v77:DeactivateReact(v134);
            v77:DeactivateCombo(v98);
            v77:DeactivatePowerBar();
            v78:StopAnim(v90, 0.1);
            v78:StopAnim(v88, 0.1);
            v78:StopAnim(v91, 0.1);
            v78:StopAnim(v89, 0.1);
            v78:StopAnim(v84, 0.1);
            v78:StopAnim(v87, 0.1);
            v77:ComboReset(v100);
            task.wait(0.2);
            v77:EditSharedCooldown("BoostTrip", false);
            v77:SetDebounce(false, 2);
            v77:PlayQueue();
        end;
    end;
end;
return v69;
