-- Saved by UniversalSynSaveInstance https://discord.gg/wx4ThpAsmw


local l_game_0 = game;
local l_math_0 = math;
local l_pairs_0 = pairs;
local l_UDim2_0 = UDim2;
local l_Vector3_0 = Vector3;
local l_CFrame_0 = CFrame;
return function(v69) --[[ Line: 85 ]]
	local _ = l_game_0:GetService("Debris");
	local l_ReplicatedStorage_0 = l_game_0:GetService("ReplicatedStorage");
	local l_Players_0 = l_game_0:GetService("Players");
	local l_Remotes_0 = l_ReplicatedStorage_0:WaitForChild("Remotes");
	local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
	local v75 = l_ReplicatedStorage_0:WaitForChild("PlayerData"):WaitForChild(l_LocalPlayer_0.UserId);
	local l_MainColor_0 = v75:WaitForChild("Environment"):WaitForChild("Colors"):WaitForChild("MainColor");
	local l_SecondColor_0 = v75:WaitForChild("Environment"):WaitForChild("Colors"):WaitForChild("SecondColor");
	local l_Markers_0 = v75:WaitForChild("Environment"):WaitForChild("UI"):WaitForChild("Markers");
	local v79 = {};
	local v80 = nil;
	local l_CurrentCamera_0 = l_game_0:GetService("Workspace").CurrentCamera;
	local function v84(v82) --[[ Line: 106 ]]
		local l_unit_0 = (l_CFrame_0.new(l_CurrentCamera_0.CFrame.p, l_CurrentCamera_0.CFrame.p + l_CurrentCamera_0.CFrame.lookVector * l_Vector3_0.new(1, 0, 1)):pointToObjectSpace(v82) * l_Vector3_0.new(1, 0, 1)).unit;
		return l_math_0.deg(l_math_0.atan2(l_unit_0.Z, l_unit_0.X));
	end;
	local function v85() --[[ Line: 112 ]]
		if v80 ~= nil then
			v80:Disconnect();
			v80 = nil;
		end;
	end;
	local function v96() --[[ Line: 119 ]]
		local v86 = 0;
		for _, v88 in l_pairs_0(v79) do
			v86 = v86 + 1;
			local l_GUIMark_0 = v88.GUIMark;
			local v90, v91 = l_CurrentCamera_0:WorldToViewportPoint(v88.WorldMark);
			if not v91 and (not (v90.Z < 0 and v90.X <= l_CurrentCamera_0.ViewportSize.X * 1.1 and v90.X * (l_CurrentCamera_0.ViewportSize.X * 0.1) >= 0 and v90.Y <= l_CurrentCamera_0.ViewportSize.Y * 1.2) or v90.Y * (l_CurrentCamera_0.ViewportSize.Y * 0.2) < 0) then
				l_GUIMark_0.Visible = true;
				v88.WorldMarker.Gui.Enabled = false;
				local v92 = 0;
				local v93 = 0;
				local l_X_0 = v90.X;
				local l_Y_0 = v90.Y;
				if v90.Z <= 0 then
					l_X_0 = if l_X_0 < l_CurrentCamera_0.ViewportSize.X then l_CurrentCamera_0.ViewportSize.X else 0;
					l_Y_0 = if l_Y_0 < l_CurrentCamera_0.ViewportSize.Y then l_CurrentCamera_0.ViewportSize.Y else 0;
				end;
				if l_X_0 - l_CurrentCamera_0.ViewportSize.X * 0.025 <= 0 then
					l_X_0 = 0;
					v92 = 0.025;
				end;
				if l_Y_0 - l_CurrentCamera_0.ViewportSize.Y * 0.05 <= 0 then
					l_Y_0 = 0;
					v93 = 0.05;
				end;
				if l_X_0 * 1.025 >= l_CurrentCamera_0.ViewportSize.X then
					l_X_0 = l_CurrentCamera_0.ViewportSize.X;
					v92 = -0.025;
				end;
				if l_Y_0 * 1.05 >= l_CurrentCamera_0.ViewportSize.Y then
					l_Y_0 = l_CurrentCamera_0.ViewportSize.Y;
					v93 = -0.05;
				end;
				l_GUIMark_0.Position = l_UDim2_0.new(-0.025 + v92, l_X_0, -0.05 + v93, l_Y_0);
				l_GUIMark_0.Arrow.Rotation = 90 + v84(v88.WorldMark);
				l_GUIMark_0.Distance.Text = l_math_0.floor((l_CurrentCamera_0.CFrame.p - v88.WorldMark).Magnitude);
			else
				v88.WorldMarker.Gui.Enabled = true;
				l_GUIMark_0.Visible = false;
			end;
		end;
		if v86 == 0 then
			v85();
		end;
	end;
	local function v97() --[[ Line: 179 ]]
		if v80 == nil then
			v80 = l_game_0:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 181 ]]
				v96();
			end);
		end;
	end;
	l_Remotes_0.MarkPointClient.Event:Connect(function(v98, v99) --[[ Line: 187 ]]
		if l_Markers_0.Value then
			local v100 = l_ReplicatedStorage_0.Storage.Markers.Marker:Clone();
			v100.Gui.PlayerName.Text = v99 or l_LocalPlayer_0.Name;
			v100.CFrame = l_CFrame_0.new(v98);
			v100.Gui.Ring.ImageColor3 = l_MainColor_0.Value;
			v100.Gui.Arrow.ImageColor3 = l_SecondColor_0.Value;
			v100.Parent = l_game_0:GetService("Workspace");
			local v101 = l_ReplicatedStorage_0.Storage.Markers.Main:Clone();
			v101.Ring.ImageColor3 = l_MainColor_0.Value;
			v101.Arrow.ImageColor3 = l_SecondColor_0.Value;
			v101.PlayerName.Text = v99;
			v101.Parent = v69;
			v79[v98] = {
				GUIMark = v101, 
				WorldMark = v98, 
				WorldMarker = v100
			};
			task.delay(2, function() --[[ Line: 202 ]]
				v79[v98] = nil;
				v101:Destroy();
				v100:Destroy();
			end);
			v97();
		end;
	end);
end;
