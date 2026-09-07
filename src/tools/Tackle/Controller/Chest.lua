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
local v77 = l_require_0(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_v75_Limbs_0 = v75:GetLimbs(l_Character_0, l_Humanoid_0);
local v79 = l_Humanoid_0:LoadAnimation(l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations").TackleTool.Chest.Chest);
local v80 = false;
local l_Balls_0 = l_game_0:GetService("Workspace"):WaitForChild("Balls");
local function v86(v82) --[[ Line: 112 ]]
    for _, v84 in l_pairs_0(l_Balls_0:GetChildren()) do
        if v84:IsA("BasePart") and v84.Name == "Perius" and v84.Anchored == false and v84.Locked == false and v84.Transparency == 0 then
            local l_v75_XZMag_0 = v75:GetXZMag(v82.Position, v84.Position);
            if v84.NetworkOwner.Value == l_LocalPlayer_0 and l_v75_XZMag_0 < 15 then
                return true;
            end;
        end;
    end;
end;
local function v92(v87, v88) --[[ Line: 125 ]]
    local l_Position_0 = v88.Position;
    if v75:ReactBallCheck(v87, v88, l_Position_0) and v80 then
        if v87 == l_v75_Limbs_0.Torso and v87.Position.Y - 0.25 > v88.Position.Y and (not v75:CheckIfInAir(l_Humanoid_0) or l_v75_Limbs_0.HumanoidRootPart.Velocity.Y < -8) then
            return false;
        else
            v80 = false;
            local v90 = (v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame) * l_CFrame_0.fromOrientation(l_math_0.rad(12), 0, 0)).lookVector * 22;
            if v87 == l_v75_Limbs_0.Torso then
                v90 = v75:MakeFowardCFrame(l_v75_Limbs_0.HumanoidRootPart.CFrame).LookVector * 26;
            end;
            local v91 = {
                Limb = v87, 
                Ball = v88, 
                MaxForce = l_Vector3_0.new(4000000, 4000000, 4000000), 
                Velocity = v90, 
                Time = 0.3
            };
            if v75:ServerReact(v91, l_Position_0) then
                v75:ClientReact(v91);
            end;
        end;
    end;
end;
v69.Activate = function(v93, v94, v95) --[[ Line: 152 ]]
    if v94 == l_Enum_0.UserInputState.Begin then
        if v75:CheckState() and not v75:CheckDebounce() and not v75:GetSharedCooldown("TackleChest") then
            v75:SetDebounce(true);
            v75:EditSharedCooldown("NoPrecharge", true);
            if v86(l_v75_Limbs_0.HumanoidRootPart) then
                v77:Speed({
                    Slowdown = 0.5, 
                    ReturnTime = 1
                });
            end;
            v76:PlayAnim(v79, 0, l_Enum_0.AnimationPriority.Action);
            local v96 = v75:ActivateReact({
                ReactLimbs = {
                    l_v75_Limbs_0.Head, 
                    l_v75_Limbs_0.Torso
                }, 
                ReactFunc = v92
            });
            v80 = true;
            task.wait(0.5);
            v80 = false;
            v75:DeactivateReact(v96);
            v75:EditSharedCooldown("NoPrecharge", false);
            v76:StopAnim(v79, 0.1);
            task.wait(0.4);
            v75:SetDebounce(false);
            v75:PlayQueue();
            return;
        else
            v75:DelayQueue(v69.Activate, v93, v95);
        end;
    end;
end;
return v69;
