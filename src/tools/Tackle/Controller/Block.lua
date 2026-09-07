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
local _ = math;
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
local _ = CFrame;
local _ = Ray;
local _ = delay;
local v69 = {};
local l_RunService_0 = l_game_0:GetService("RunService");
local l_ReplicatedStorage_0 = l_game_0:GetService("ReplicatedStorage");
local _ = l_game_0:GetService("TweenService");
local _ = l_game_0:GetService("Debris");
local l_LocalPlayer_0 = l_game_0:GetService("Players").LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or not l_Character_0.Parent then
    l_Character_0 = l_LocalPlayer_0.CharacterAdded:wait();
end;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local l_ClientModules_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules");
local v78 = l_require_0(l_ClientModules_0:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"));
local _ = l_require_0(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local v80 = l_require_0(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_v78_Limbs_0 = v78:GetLimbs(l_Character_0, l_Humanoid_0);
local v82 = l_Humanoid_0:LoadAnimation(l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations").TackleTool.Block.Block);
local v83 = false;
local v84 = false;
local v85 = nil;
local v86 = nil;
local function v97(v87, v88) --[[ Line: 118 ]]
    local l_CFrame_1 = v88.CFrame;
    local l_CFrame_2 = v87.CFrame;
    local l_Velocity_0 = v88.Velocity;
    local l_CFrame_3 = l_v78_Limbs_0.HumanoidRootPart.CFrame;
    local l_Velocity_1 = l_v78_Limbs_0.HumanoidRootPart.Velocity;
    if v78:ReactBallCheck(v87, v88, l_CFrame_1.p) and v83 then
        v83 = false;
        task.spawn(function() --[[ Line: 131 ]]
            v69.Activate("End", l_Enum_0.UserInputState.End, "End");
        end);
        local v94 = v78:Deflect(l_CFrame_1, l_Velocity_0, l_CFrame_2, l_Velocity_1, l_CFrame_3);
        local v95 = v78:MinMaxValue(12 + l_Velocity_0.Magnitude / 2, 80, 12);
        local v96 = {
            Limb = v87, 
            Ball = v88, 
            MaxForce = l_Vector3_0.new(90000000000, 1.0E33, 90000000000), 
            Velocity = v94 * v95, 
            Time = 0.2
        };
        if v78:ServerReact(v96, l_CFrame_1.p) then
            v78:ClientReact(v96);
        end;
    end;
end;
v69.Activate = function(_, v99, _) --[[ Line: 151 ]]
    if v99 == l_Enum_0.UserInputState.Begin then
        if v78:CheckState() and not v78:CheckDebounce() and not v84 then
            v78:SetDebounce(true, 2);
            v84 = true;
            v82:Play(0.2);
            if v86 ~= nil then
                v86:Disconnect();
                v86 = nil;
            end;
            v86 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 163 ]]
                v80:Speed({
                    Set = 11, 
                    ReturnTime = 0.6
                });
            end);
            v85 = v78:ActivateReact({
                ReactLimbs = {
                    l_v78_Limbs_0.Torso, 
                    l_v78_Limbs_0.Head
                }, 
                ReactFunc = v97
            });
            task.wait(0.05);
            if not v84 then
                return;
            else
                v83 = true;
                return;
            end;
        end;
    elseif v99 == l_Enum_0.UserInputState.End and v84 then
        v84 = false;
        if v86 ~= nil then
            v86:Disconnect();
            v86 = nil;
        end;
        v83 = false;
        v78:DeactivateReact(v85);
        v85 = nil;
        v82:Stop(0.2);
        task.wait(0.6);
        v78:SetDebounce(false, 2);
    end;
end;
return v69;
