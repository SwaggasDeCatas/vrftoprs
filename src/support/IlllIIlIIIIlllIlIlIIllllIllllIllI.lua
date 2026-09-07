local v17 = {}
local v18 = game:GetService("Workspace")
local v_u_19 = game:GetService("RunService")
local v_u_20 = game:GetService("Players").LocalPlayer
local v_u_21 = v18:WaitForChild("Balls")
local v_u_22 = nil
local v_u_23 = false
local function v_u_26(p24, p25)
	-- upvalues: (copy) Vector3
	return (Vector3.new(p24.X, 0, p24.Z) - Vector3.new(p25.X, 0, p25.Z)).Magnitude
end
local function v_u_32(p27)
	-- upvalues: (copy) pairs, (copy) v_u_21
	local v28 = 9999
	local v29 = nil
	for _, v30 in pairs(v_u_21:GetChildren()) do
		if v30.Locked == false and (v30.Anchored == false and (v30.Name == "Perius" and not v30.Welded.Value)) then
			local v31 = (p27.Position - v30.Position).Magnitude
			if v31 < v28 then
				v29 = v30
				v28 = v31
			end
		end
	end
	return v29
end
local function v_u_33()
	-- upvalues: (ref) v_u_22
	if v_u_22 ~= nil then
		v_u_22:Disconnect()
		v_u_22 = nil
	end
end
local v_u_34 = Vector3.new(0, 0, 0)
local function v_u_43(p35, p36)
	-- upvalues: (copy) math, (copy) Vector3
	local v37 = p35.Unit.X
	local v38 = p35.Unit.Y
	local v39 = p35.Unit.Z
	local v40 = p36.Unit.X
	local v41 = p36.Unit.Y
	local v42 = p36.Unit.Z
	if math.abs(p35.Y) < 20 then
		if (Vector3.new(v37, 0, v39) - Vector3.new(v40, 0, v42)).Magnitude > 0.7 then
			return true
		end
	elseif (Vector3.new(v37, math.abs(v38 / 1.5), v39) - Vector3.new(v40, math.abs(v41 / 1.5), v42)).Magnitude > 0.7 then
		return true
	end
end
local function v_u_47(p_u_44, p_u_45, p_u_46)
	-- upvalues: (copy) pcall, (copy) v_u_26, (copy) v_u_20, (copy) v_u_43, (ref) v_u_34, (ref) v_u_23, (copy) v_u_33
	pcall(function()
		-- upvalues: (ref) v_u_26, (copy) p_u_44, (copy) p_u_45, (ref) v_u_20, (ref) v_u_43, (ref) v_u_34, (copy) p_u_46, (ref) v_u_23, (ref) v_u_33
		if v_u_26(p_u_44.Position, p_u_45.Position) < 25 and (p_u_45.NetworkOwner.Value ~= v_u_20 and (p_u_45.Welded.Value == false and (p_u_45.NetworkOwner.Value ~= nil and not p_u_45.Server.Value))) then
			if v_u_43(p_u_45.Velocity, v_u_34) and (v_u_26(p_u_44.Position, p_u_45.Position) < 8 and p_u_46.MoveDirection.Magnitude > 0.1) then
				if p_u_45.NetworkOwner.Value.Character and (p_u_45.NetworkOwner.Value.Character.HumanoidRootPart.Position - p_u_44.Position).Magnitude < 20 then
					v_u_23 = true
					v_u_33()
				else
					v_u_23 = false
					v_u_33()
				end
			end
			if p_u_45.Velocity.Magnitude > 0.5 then
				v_u_34 = p_u_45.Velocity
				return
			end
		else
			v_u_23 = false
			v_u_33()
		end
	end)
end
local v_u_48 = tick()
function v17.StartCalculation(_, p_u_49, p_u_50)
	-- upvalues: (ref) v_u_22, (ref) v_u_23, (copy) v_u_32, (copy) v_u_20, (ref) v_u_34, (copy) v_u_19, (ref) v_u_48, (copy) v_u_47
	pcall(function()
		-- upvalues: (ref) v_u_22, (ref) v_u_23, (ref) v_u_32, (copy) p_u_49, (ref) v_u_20, (ref) v_u_34, (ref) v_u_19, (ref) v_u_48, (ref) v_u_47, (copy) p_u_50
		if v_u_22 ~= nil then
			v_u_22:Disconnect()
			v_u_22 = nil
		end
		v_u_23 = false
		local v_u_51 = v_u_32(p_u_49)
		if v_u_51.NetworkOwner.Value ~= v_u_20 and (not v_u_51.Server.Value and (v_u_51.NetworkOwner.Value ~= nil and v_u_51.NetworkOwner.Value.Character)) then
			v_u_34 = v_u_51.Velocity
			v_u_22 = v_u_19.Heartbeat:Connect(function()
				-- upvalues: (ref) v_u_48, (ref) v_u_47, (ref) p_u_49, (copy) v_u_51, (ref) p_u_50
				if v_u_48 + 0.1 < tick() then
					v_u_48 = tick()
					v_u_47(p_u_49, v_u_51, p_u_50)
				end
			end)
		end
	end)
end
function v17.StopCalculation(_)
	-- upvalues: (ref) v_u_23, (copy) v_u_33
	local v52 = v_u_23
	v_u_33()
	v_u_23 = false
	return v52
end
return v17
