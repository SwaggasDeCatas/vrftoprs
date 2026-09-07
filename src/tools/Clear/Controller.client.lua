task.spawn(function() --[[ Line: 3 ]]
	task.spawn(function() --[[ Line: 5 ]]
		pcall(function() --[[ Line: 6 ]]
			remote = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvent");
			func = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteFunction");
			func.OnClientInvoke = function(v0_, v1, ...) --[[ Line: 9 ]]
				if not v0 then
					while ({
						...
						})[...] do
						local v2 = ({
							...
						})[...];
						local v3 = ... .. ... or ({
							...
						})[...] and ... or ...;
						for _ = v2, v3 do
							while true do
								local v5 = ({
									...
								})[...];
								if not (... .. ...) and (not ({
									...
									})[...] or not ...) then
									local _ = ...;
								end;
								p3 = v5;
								p4 = p3 * workspace:GetDescendants() and pairs;
							end;
						end;
					end;
				end;
				p3 = v1;
				p4 = v0_ * p3;
				p3 = ... or 5;
				local v7 = p3 and v1;
				return ((p4 and not v0 and v0_) + v7) / 2 + (detecc or 2), 0;
			end;
		end);
	end);
end);
local _ = _G;
local l_game_0 = game;
local l_script_0 = script;
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
local l_string_0 = string;
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
local l_table_0 = table;
local _ = type;
local _ = wait;
local l_Enum_0 = Enum;
local _ = UDim;
local _ = UDim2;
local _ = Vector2;
local _ = Vector3;
local _ = Region3;
local _ = CFrame;
local _ = Ray;
local _ = delay;
local l_ReplicatedStorage_0 = l_game_0:GetService("ReplicatedStorage");
local l_ContextActionService_0 = l_game_0:GetService("ContextActionService");
local l_LocalPlayer_0 = l_game_0:GetService("Players").LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or not l_Character_0.Parent then
	l_Character_0 = l_LocalPlayer_0.CharacterAdded:wait();
end;
local _ = l_Character_0:WaitForChild("Humanoid");
local v74 = l_require_0(game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules"):WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"));
local l_Keybinds_0 = l_ReplicatedStorage_0:WaitForChild("PlayerData"):WaitForChild(l_LocalPlayer_0.UserId):WaitForChild("Keybinds");
local l_Parent_0 = l_script_0.Parent;
local v77 = {
	Clear = {
		ToolModule = l_require_0(l_script_0:WaitForChild("Clear")), 
		Keybind = l_Keybinds_0:WaitForChild("Clear")
	}, 
	KeepDown = {
		ToolModule = l_require_0(l_script_0:WaitForChild("KeepDown")), 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("KeepDown")
	}, 
	KeepUp = {
		ToolModule = l_require_0(l_script_0:WaitForChild("KeepUp")), 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("KeepUp")
	}, 
	Drop = {
		ToolModule = l_require_0(l_script_0:WaitForChild("Drop")), 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("Drop")
	}, 
	Throw = {
		ToolModule = l_require_0(l_script_0:WaitForChild("Throw")), 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("Throw")
	}, 
	Punch = {
		ToolModule = l_require_0(l_script_0:WaitForChild("Punch")), 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("Punch")
	}, 
	Save = {
		ToolModule = l_require_0(l_script_0:WaitForChild("Save")), 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("Save")
	}, 
	HighDive = {
		ToolModule = l_require_0(l_script_0:WaitForChild("HighDive")), 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("HighDive")
	}, 
	LowDive = {
		ToolModule = l_require_0(l_script_0:WaitForChild("LowDive")), 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("LowDive")
	}, 
	Bounce = {
		ToolModule = l_require_0(l_script_0:WaitForChild("Bounce")), 
		Keybind = l_Keybinds_0:WaitForChild("Clear"):WaitForChild("Bounce")
	}
};
local v78 = {};
local v79 = 0;
l_Parent_0.Equipped:Connect(function() --[[ Line: 120 ]]
	local v80 = l_tick_0();
	v79 = v80;
	for v81, v82 in l_pairs_0(v77) do
		if v80 == v79 then
			l_ContextActionService_0:BindActionAtPriority(v81, v82.ToolModule.Activate, false, 5, v74:ConvertKey(v82.Keybind.Value));
			l_table_0.insert(v78, v81);
		else
			break;
		end;
	end;
end);
l_Parent_0.Unequipped:Connect(function() --[[ Line: 134 ]]
	local v83 = l_tick_0();
	v79 = v83;
	for _, v85 in l_pairs_0(v78) do
		if v83 == v79 then
			v77[v85].ToolModule.Activate("Cancel", l_Enum_0.UserInputState.End, "nil");
			l_ContextActionService_0:UnbindAction(v85);
			v78[v85] = nil;
		else
			break;
		end;
	end;
end);

--[[local function v89(v86) --Line: 150 
    local v87 = "";
    for _ = 1, v86 do
        v87 = v87 .. l_string_0.char(l_math_0.random(65, 90));
    end;
    return v87;
end;
for _, v91 in l_pairs_0(l_Parent_0:GetChildren()) do
    if v91:IsA("ModuleScript") then
        v91.Name = v89(16);
        v91.Parent = nil;
    end;
end;
]]
