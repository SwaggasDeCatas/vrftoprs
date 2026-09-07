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
local l_pcall_0 = pcall;
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
local l_BrickColor_0 = BrickColor;
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
local _ = Vector3;
local _ = Region3;
local _ = CFrame;
local _ = Ray;
local _ = delay;
local v69 = {};
local l_ReplicatedStorage_0 = l_game_0:GetService("ReplicatedStorage");
local l_Players_0 = l_game_0:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or not l_Character_0.Parent then
	l_Character_0 = l_LocalPlayer_0.CharacterAdded:wait();
end;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local l_ClientModules_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("ClientModules");
local v76 = l_require_0(l_ClientModules_0:WaitForChild("llllIllIllIIIlllIIIIlIllIIIlIIlII"));
local _ = l_require_0(l_ClientModules_0:WaitForChild("llIIllIIlllIIIIIlIIIIIIlIlIlIIIlI"));
local _ = l_require_0(l_ClientModules_0:WaitForChild("IlllIlIIIlIlllIIlIlIlIllllIIllIII"));
local l_HumanoidStateRemote_0 = l_ReplicatedStorage_0:WaitForChild("Remotes"):WaitForChild("HumanoidStateRemote");
local l_v76_Limbs_0 = v76:GetLimbs(l_Character_0, l_Humanoid_0);
local v81 = l_Humanoid_0:LoadAnimation(l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Animations").Clear.Bounce.BallBounce);
local _ = v76:GetLegSwitch();
local v83 = {
	Away = {
		l_BrickColor_0.new("Bright green"), 
		l_BrickColor_0.new("Camo"), 
		l_BrickColor_0.new("Pastel green")
	}, 
	Home = {
		l_BrickColor_0.new("Bright blue"), 
		l_BrickColor_0.new("Really blue"), 
		l_BrickColor_0.new("Pastel Blue")
	}
};
local function v92(v84, v85) --[[ Line: 121 ]]
	for _, v87 in l_pairs_0(v83) do
		local v88 = false;
		local v89 = false;
		for _, v91 in l_pairs_0(v87) do
			if v84.TeamColor == v91 then
				v88 = true;
			elseif v85.TeamColor == v91 then
				v89 = true;
			end;
		end;
		if v88 and v89 then
			return true;
		end;
	end;
end;
function CheckForClosePlayers(v93) --[[ Line: 138 ]]
	for _, v95 in l_pairs_0(l_Players_0:GetPlayers()) do
		if v95 ~= l_LocalPlayer_0 and not v92(l_LocalPlayer_0, v95) then
			local v96, v97 = l_pcall_0(function() --[[ Line: 141 ]]
				if v95.Character and (v93.Position - v95.Character.HumanoidRootPart.Position).Magnitude < 30 then
					return true;
				else
					return;
				end;
			end);
			if v96 then
				return v97;
			end;
		end;
	end;
end;
v69.Activate = function(_, v99, _) --[[ Line: 155 ]]
	if v99 == l_Enum_0.UserInputState.Begin then
		local l_LocalBWeld_0 = l_Character_0:FindFirstChild("LocalBWeld");
		if not v76:CheckHold() and not l_HumanoidStateRemote_0:Invoke() and l_LocalBWeld_0 and not v76:CheckDebounce() and not v76:CheckIfInAir(l_Humanoid_0) and l_LocalBWeld_0.Part0 then
			v76:SetDebounce(true);
			-- vrftoprs: removed Humanoid WalkSpeed/JumpPower editor
			v81:Play(0.2);
			if CheckForClosePlayers(l_v76_Limbs_0.HumanoidRootPart) then
				v76:DropTimer({
					Character = l_Character_0, 
					BallWeld = l_LocalBWeld_0
				});
			end;
			v81.Stopped:Wait();
			-- vrftoprs: removed Humanoid WalkSpeed/JumpPower editor
			v76:SetDebounce(false);
			v76:PlayQueue();
		end;
	end;
end;
return v69;
