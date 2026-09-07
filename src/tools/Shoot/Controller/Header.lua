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
local l_LocalPlayer_0 = l_game_0:GetService("Players").LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or not l_Character_0.Parent then
    l_Character_0 = l_LocalPlayer_0.CharacterAdded:wait();
end;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local l_ClientModules_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules");
local v76 = l_require_0(l_ClientModules_0:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"));
local v77 = l_require_0(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local _ = l_require_0(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_v76_Limbs_0 = v76:GetLimbs(l_Character_0, l_Humanoid_0);
local l_Animations_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations");
local v81 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Header.HeaderStart);
local v82 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Header.HeaderEnd);
local v83 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Header.HeaderRight);
local v84 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Header.HeaderLeft);
local v85 = l_Humanoid_0:LoadAnimation(l_Animations_0.ShootTool.Header.HeaderLoop);
local l_v76_LegSwitch_0 = v76:GetLegSwitch();
local v87 = nil;
local v88 = false;
local v89 = nil;
local v90 = nil;
local l_Keybinds_0 = l_ReplicatedStorage_0:WaitForChild("PlayerData"):WaitForChild(l_LocalPlayer_0.UserId):WaitForChild("Keybinds");
local v92 = {
    HeaderRight = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Shoot"):WaitForChild("Header"):WaitForChild("HeaderRight")
    }, 
    HeaderLeft = {
        Used = false, 
        Keybind = l_Keybinds_0:WaitForChild("Shoot"):WaitForChild("Header"):WaitForChild("HeaderLeft")
    }
};
local _ = function() --[[ Line: 133 ]]
    for _, v94 in l_pairs_0(v92) do
        v94.Used = false;
    end;
end;
local function v98(v96, v97) --[[ Line: 139 ]]
    v76:InputCombo(v96, v97, v92);
end;
local l_zero_0 = l_Vector3_0.zero;
local v100 = l_tick_0();
local v101 = l_tick_0();
local v102 = l_tick_0();
local v103 = false;
local function v106() --[[ Line: 147 ]]
    if v89 ~= nil then
        v89:Disconnect();
        v89 = nil;
    end;
    v100 = 0;
    v101 = l_tick_0();
    local v104 = 0;
    local v105 = false;
    v102 = v104;
    v103 = v105;
    l_zero_0 = l_Vector3_0.zero;
    v89 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 157 ]]
        if l_tick_0() - v100 > 0.25 then
            if l_Humanoid_0.MoveDirection == l_Vector3_0.zero and not v103 then
                v102 = l_tick_0();
                v103 = true;
            elseif l_Humanoid_0.MoveDirection ~= l_Vector3_0.zero then
                v103 = false;
            end;
            if not v103 or l_tick_0() - v102 > 0.25 then
                if not ((l_zero_0 - l_Humanoid_0.MoveDirection).Magnitude <= 1.5) or v103 then
                    v101 = l_tick_0();
                    v100 = l_tick_0();
                    l_zero_0 = l_Humanoid_0.MoveDirection;
                end;
                if (l_zero_0 - l_Humanoid_0.MoveDirection).Magnitude > 0.3 and l_tick_0() - v100 > 0.25 then
                    v100 = l_tick_0();
                    l_zero_0 = l_Humanoid_0.MoveDirection;
                end;
            end;
        end;
        v76:GetPowerBar();
    end);
end;
local function v107() --[[ Line: 187 ]]
    if v89 ~= nil then
        v89:Disconnect();
        v89 = nil;
    end;
    l_zero_0 = l_Vector3_0.zero;
    v100 = l_tick_0();
    v101 = l_tick_0();
end;
local v108 = false;
local v109 = nil;
local function v123(v110, v111) --[[ Line: 200 ]]
    local l_Position_0 = v111.Position;
    local l_Velocity_0 = v111.Velocity;
    local _ = v110.CFrame;
    if v76:ReactBallCheck(v110, v111, l_Position_0) and v108 then
        if v110 == l_v76_Limbs_0.Torso and v110.Position.Y + 0.5 > v111.Position.Y then
            return false;
        else
            v108 = false;
            v109 = (v76:GetHeightAngle(45, -45) - 30) * 1.2;
            if v109 > 10 then
                v109 = 10;
            elseif v109 < -50 then
                v109 = -50;
            end;
            local v115 = v76:MakeFowardCFrame(l_v76_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(v109), 0, 0);
            local l_lookVector_0 = v115.lookVector;
            local v117 = l_Vector3_0.new(4000000000, 4000000000, 4000000000);
            if v92.HeaderLeft.Used then
                l_lookVector_0 = (v115 * l_CFrame_0.fromOrientation(0, l_math_0.rad(70), 0)).lookVector;
            elseif v92.HeaderRight.Used then
                l_lookVector_0 = (v115 * l_CFrame_0.fromOrientation(0, l_math_0.rad(-70), 0)).lookVector;
            end;
            local v118 = -l_math_0.clamp(0.5 - (l_tick_0() - v101), 0, 0.5);
            local v119 = l_math_0.clamp((l_zero_0 + v76:NullVectorCheck((l_lookVector_0 - l_Vector3_0.new(0, l_lookVector_0.Y, 0)).Unit)).Magnitude / 1.2, 0.675, 1.5 + v118);
            local v120 = l_math_0.clamp(l_Velocity_0.Magnitude * 1.1, 60, 82);
            local v121 = l_math_0.clamp(54 * v119, 58, v120);
            v76:DebugPrint((("Speed Max Limit: %*\n\t\t\tMovement Multiplier: %*\n\t\t\tFinal Movement Multiplier: %*\n\t\t\tSpeed: %*"):format(v120, v118, v119, v121)));
            local v122 = {
                Limb = v110, 
                Ball = v111, 
                MaxForce = v117, 
                Velocity = l_lookVector_0 * v121, 
                Time = 0.3
            };
            if v76:ServerReact(v122, l_Position_0) then
                v76:ClientReact(v122);
            end;
        end;
    end;
end;
local v124 = false;
local v125 = l_tick_0();
v69.Activate = function(v126, v127, v128) --[[ Line: 257 ]]
    if v127 == l_Enum_0.UserInputState.Begin then
        if v76:CheckState() and (not v76:CheckDebounce(2) or v126 == "Delayed") then
            if v126 == "Delayed" and not v124 then
                return;
            elseif v76:CheckDebounce2(1) and v126 ~= "Delayed" then
                v124 = true;
                v76:DelayReleaseQueue(v69.Activate, 1, v127);
                return;
            else
                v76:SetDebounce(true, 2);
                v87 = l_v76_LegSwitch_0.Value;
                v88 = true;
                v90 = v76:ActivateCombo({
                    Table = v92, 
                    Func = v98
                });
                v106();
                v125 = l_tick_0();
                if v128 ~= nil and not v76:IsKeyDown(v128) then
                    task.spawn(function() --[[ Line: 284 ]]
                        v69.Activate(v126, l_Enum_0.UserInputState.End, v128);
                    end);
                end;
                if not v87 then
                    v81:Play(0);
                    v81.Stopped:Wait();
                    if v88 then
                        v85:Play(0);
                        return;
                    end;
                else
                    v81:Play(0);
                    v81.Stopped:Wait();
                    if v88 then
                        v85:Play(0);
                        return;
                    end;
                end;
            end;
        end;
    elseif v127 == l_Enum_0.UserInputState.End and (v88 or v124) then
        if v124 and not v88 then
            v124 = false;
            return;
        else
            v124 = false;
            v88 = false;
            if l_tick_0() < v125 + 0.25 then
                task.wait(v125 + 0.25 - l_tick_0());
            end;
            v76:DeactivateCombo(v90);
            v77:StopAnim(v81, 0);
            v77:StopAnim(v85, 0);
            if v92.HeaderRight.Used then
                v77:PlayAnim(v83, 0, l_Enum_0.AnimationPriority.Action2);
            elseif v92.HeaderLeft.Used then
                v77:PlayAnim(v84, 0, l_Enum_0.AnimationPriority.Action2);
            else
                v77:PlayAnim(v82, 0, l_Enum_0.AnimationPriority.Action2);
            end;
            local v129 = v76:ActivateReact({
                ReactLimbs = {
                    l_v76_Limbs_0.Head, 
                    l_v76_Limbs_0.Torso
                }, 
                ReactFunc = v123
            });
            v108 = true;
            task.wait(0.4);
            v108 = false;
            v76:DeactivateReact(v129);
            v107();
            v77:StopAnim(v83, 0.1);
            v77:StopAnim(v84, 0.1);
            v77:StopAnim(v82, 0.1);
            v76:ComboReset(v92);
            task.wait(0.6);
            v76:SetDebounce(false, 2);
            v76:PlayQueue();
        end;
    end;
end;
return v69;
