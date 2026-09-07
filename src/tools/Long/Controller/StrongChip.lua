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
local v84 = l_Humanoid_0:LoadAnimation(l_Animations_0.LongTool.Chip.RightChip);
local v85 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftOneLegCharge);
local v86 = l_Humanoid_0:LoadAnimation(l_Animations_0.KickCharge.LeftOneLegChargeLoop);
local v87 = l_Humanoid_0:LoadAnimation(l_Animations_0.LongTool.Chip.LeftChip);
local v88 = l_Humanoid_0:LoadAnimation(l_Animations_0.LongTool.Chip.RightChipToLeft);
local v89 = l_Humanoid_0:LoadAnimation(l_Animations_0.LongTool.Chip.RightChipToRight);
local v90 = l_Humanoid_0:LoadAnimation(l_Animations_0.LongTool.Chip.LeftChipToLeft);
local v91 = l_Humanoid_0:LoadAnimation(l_Animations_0.LongTool.Chip.LeftChipToRight);
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
        Keybind = l_Keybinds_0:WaitForChild("Long"):WaitForChild("StrongChip"):WaitForChild("FrontSpin"), 
        Overlay = {
            "FakeRrpsCombo", 
            "FakeLrpsCombo"
        }
    }, 
    BackSpinCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Long"):WaitForChild("StrongChip"):WaitForChild("BackSpin"), 
        Overlay = {
            "FakeRrpsCombo", 
            "FakeLrpsCombo"
        }
    }, 
    FakeRrpsCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Long"):WaitForChild("StrongChip"):WaitForChild("ChipRight"), 
        Overlay = {
            "FrontSpinCombo", 
            "BackSpinCombo"
        }
    }, 
    FakeLrpsCombo = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Long"):WaitForChild("StrongChip"):WaitForChild("ChipLeft"), 
        Overlay = {
            "FrontSpinCombo", 
            "BackSpinCombo"
        }
    }
};
local function v103(v101, v102) --[[ Line: 143 ]]
    if v96 and v101 ~= "FrontSpinCombo" and v101 ~= "BackSpinCombo" then
        return;
    else
        v77:InputCombo(v101, v102, v100);
        return;
    end;
end;
local function v114(_, _, _, _, v108, v109) --[[ Line: 150 ]]
	if game:GetService("UserInputService").TouchEnabled then
		local SpinType = v77:GetSpinType()
		
		if SpinType == "B" then
			v100.BackSpinCombo.Used = true
			v100.FrontSpinCombo.Used = false
		elseif SpinType == "T" then
			v100.FrontSpinCombo.Used = true
			v100.BackSpinCombo.Used = false
		elseif SpinType == "" or SpinType == "N" then
			v100.FrontSpinCombo.Used = false
			v100.BackSpinCombo.Used = false
		end
	end
	
    local v110 = l_Vector3_0.new(4000000, 8000000, 4000000);
    local v111 = (v109 * l_CFrame_0.fromOrientation(l_math_0.rad(45), 0, 0)).lookVector * v108;
    if v100.FakeLrpsCombo.Used then
        v111 = (v109 * l_CFrame_0.fromOrientation(l_math_0.rad(42.5), l_math_0.rad(45), 0)).lookVector * v108 / 1.1;
    elseif v100.FakeRrpsCombo.Used then
        v111 = (v109 * l_CFrame_0.fromOrientation(l_math_0.rad(42.5), l_math_0.rad(-45), 0)).lookVector * v108 / 1.1;
    end;
    local l_Unit_0 = v111.Unit;
    local v113 = l_Vector3_0.new(l_Unit_0.Z, 0, -l_Unit_0.X) * (8 + v108 / 6);
    if v100.BackSpinCombo.Used then
        v113 = l_Vector3_0.new(l_Unit_0.Z, 0, -l_Unit_0.X) * -v108 / (1 + v113.Magnitude / 600);
        v111 = v111 * 0.985;
    elseif v100.FrontSpinCombo.Used then
        v113 = l_Vector3_0.new(l_Unit_0.Z, 0, -l_Unit_0.X) * (80 + v95 / 3.5) / (1 + v113.Magnitude / 600);
        v111 = v111 * 0.985;
    end;
    return v113, v111, v110;
end;
local function v125(v115, v116) --[[ Line: 173 ]]
    local l_Position_0 = v116.Position;
    local l_CFrame_1 = v115.CFrame;
    if v77:ReactBallCheck(v115, v116, l_Position_0) and v96 then
        v96 = false;
        local v119 = 52 + v95 / 3.4;
        local v120 = v77:MakeFowardCFrame(l_v77_Limbs_0.HumanoidRootPart.CFrame);
        local v121, v122, v123 = v114(v115, l_CFrame_1, v116, l_Position_0, v119, v120);
        local v124 = {
            Limb = v115, 
            Ball = v116, 
            MaxForce = v123, 
            Velocity = v122, 
            Spin = v121, 
            Time = 0.3
        };
        if v77:ServerReact(v124, l_Position_0) then
            v77:ClientReact(v124);
        end;
    end;
end;
local v126 = false;
local v127 = l_tick_0();
v69.Activate = function(v128, v129, v130) --[[ Line: 201 ]]
    if v129 == l_Enum_0.UserInputState.Begin then
        if v77:CheckState() and not v77:CheckDebounce(2) then
            if v128 == "Delayed" and not v126 then
                return;
            elseif v77:CheckDebounce2(1) and v128 ~= "Delayed" then
                v126 = true;
                v77:DelayReleaseQueue(v69.Activate, 1, v129);
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
                        To = 100
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
                v97 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 231 ]]
                    v79:Speed({
                        Set = v79:GetNeutralSpeed() - v77:GetPowerBar() / 100, 
                        ReturnTime = 0.6
                    });
                end);
                v127 = l_tick_0();
                if v130 ~= nil and not v77:IsKeyDown(v130) then
                    task.spawn(function() --[[ Line: 241 ]]
                        v69.Activate(v128, l_Enum_0.UserInputState.End, v130);
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
    elseif v129 == l_Enum_0.UserInputState.End and (v94 or v126) then
        if v126 and not v94 then
            v126 = false;
            return;
        else
            v126 = false;
            v94 = false;
            v77:StopPowerBar();
            v95 = v77:GetPowerBar();
            if l_tick_0() < v127 + 0.15 then
                task.wait(v127 + 0.15 - l_tick_0());
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
                    v78:PlayAnim(v88, 0, l_Enum_0.AnimationPriority.Action2);
                elseif v100.FakeRrpsCombo.Used then
                    v78:PlayAnim(v89, 0, l_Enum_0.AnimationPriority.Action2);
                else
                    v78:PlayAnim(v84, 0, l_Enum_0.AnimationPriority.Action2);
                end;
            elseif v100.FakeLrpsCombo.Used then
                v78:PlayAnim(v90, 0, l_Enum_0.AnimationPriority.Action2);
            elseif v100.FakeRrpsCombo.Used then
                v78:PlayAnim(v91, 0, l_Enum_0.AnimationPriority.Action2);
            else
                v78:PlayAnim(v87, 0, l_Enum_0.AnimationPriority.Action2);
            end;
            local v131 = nil;
            v131 = if not v93 then v77:ActivateReact({
                ReactLimbs = {
                    l_v77_Limbs_0["Right Leg"]
                }, 
                ReactFunc = v125
            }) else v77:ActivateReact({
                ReactLimbs = {
                    l_v77_Limbs_0["Left Leg"]
                }, 
                ReactFunc = v125
            });
            v77:AnkleActivation(l_v77_Limbs_0.HumanoidRootPart, l_Humanoid_0);
            v96 = true;
            task.wait(0.5);
            v77:AnkleDeactivation(v96);
            v96 = false;
            v77:DeactivateReact(v131);
            v77:DeactivateCombo(v98);
            v77:DeactivatePowerBar();
            v78:StopAnim(v88, 0.1);
            v78:StopAnim(v89, 0.1);
            v78:StopAnim(v90, 0.1);
            v78:StopAnim(v91, 0.1);
            v78:StopAnim(v84, 0.1);
            v78:StopAnim(v87, 0.1);
            v77:ComboReset(v100);
            task.wait(0.4);
            v77:EditSharedCooldown("BoostTrip", false);
            v77:SetDebounce(false, 2);
            v77:PlayQueue();
        end;
    end;
end;
return v69;
