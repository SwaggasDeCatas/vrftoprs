local v12 = game
local v_u_13 = pairs
local v_u_14 = Vector3
local v_u_15 = {}
local v_u_16 = v12:GetService("Players")
local v17 = v12:GetService("ReplicatedStorage")
local v_u_18 = v17:WaitForChild("CornerFlags")
local v_u_19 = v12:GetService("Workspace"):WaitForChild("CornerFlags")
local v20 = v_u_16.LocalPlayer
local v21 = v17:WaitForChild("PlayerData"):WaitForChild(v20.UserId, 10)
if v21 == nil then
	v20:Kick("Failed to fetch user data")
end
local v_u_22 = {}
local v_u_23 = v21:WaitForChild("Environment"):WaitForChild("Pitch"):WaitForChild("FlagTextureId")
local function v_u_26(p24)
	-- upvalues: (copy) v_u_23
	local v25 = p24:FindFirstChild("Flag")
	if v25 then
		v25.TextureID = "rbxassetid://" .. v_u_23.Value
	end
end
local function v_u_29()
	-- upvalues: (copy) v_u_13, (copy) v_u_18, (copy) v_u_26, (copy) v_u_19
	for _, v27 in v_u_13(v_u_18:GetChildren()) do
		v_u_26(v27)
	end
	for _, v28 in v_u_13(v_u_19:GetChildren()) do
		v_u_26(v28)
	end
end
v_u_23:GetPropertyChangedSignal("Value"):Connect(function()
	-- upvalues: (copy) v_u_29
	v_u_29()
end)
v_u_29()
function GetXZ(p30)
	-- upvalues: (copy) v_u_14
	return v_u_14.new(p30.X, 0, p30.Z)
end
local function v_u_34(p31, p32)
	-- upvalues: (copy) v_u_13, (copy) v_u_14, (copy) v_u_15
	for _, v_u_33 in v_u_13(p31:GetDescendants()) do
		if v_u_33:IsA("WeldConstraint") or v_u_33:IsA("AlignOrientation") then
			v_u_33:Destroy()
		elseif v_u_33:IsA("AngularVelocity") or v_u_33:IsA("LinearVelocity") and not p32 then
			v_u_33.Enabled = true
		end
		if v_u_33:IsA("BasePart") then
			v_u_33.CollisionGroup = "RagHitbox"
			if p32 then
				task.spawn(function()
					-- upvalues: (copy) v_u_33, (ref) v_u_14
					v_u_33.AssemblyLinearVelocity = v_u_33.AssemblyLinearVelocity / 3 + v_u_14.new(0, 40, 0)
				end)
			else
				task.spawn(function()
					-- upvalues: (copy) v_u_33, (ref) v_u_14
					v_u_33.AssemblyLinearVelocity = v_u_33.AssemblyLinearVelocity / 3
					task.wait()
					v_u_33.AssemblyLinearVelocity = v_u_33.AssemblyLinearVelocity / 3 + v_u_14.new(0, 30, 0)
				end)
			end
		end
	end
	task.wait(30)
	v_u_15:RespawnFlag(p31)
end
local function v_u_41(p_u_35)
	-- upvalues: (copy) v_u_16, (copy) v_u_34
	local v_u_36 = false
	p_u_35.Pole.Touched:Connect(function(p37)
		-- upvalues: (copy) p_u_35, (ref) v_u_16, (ref) v_u_36, (ref) v_u_34
		local v38 = GetXZ(p37.AssemblyLinearVelocity).Magnitude
		local v39 = GetXZ(p_u_35.Base.AssemblyLinearVelocity).Magnitude
		local v40 = v_u_16:GetPlayerFromCharacter(p37.Parent)
		if not v_u_36 and v38 * (v40 and 4 or 0.5) + v39 > 150 then
			v_u_36 = true
			v_u_34(p_u_35, v40)
		end
	end)
end
local function v_u_46(p42)
	-- upvalues: (copy) v_u_13, (copy) v_u_22, (copy) v_u_19, (copy) v_u_41
	for v43, v44 in v_u_13(v_u_22) do
		if v44 == p42 then
			v_u_22[v43] = nil
			v43:Destroy()
		end
	end
	local v45 = p42:Clone()
	v45.Parent = v_u_19
	v_u_41(v45)
	v_u_22[v45] = p42
end
function v_u_15.RespawnFlag(_, p47)
	-- upvalues: (copy) v_u_22, (copy) v_u_46
	local v48 = v_u_22[p47]
	if v48 then
		p47:Destroy()
		v_u_46(v48)
	end
end
function v_u_15.Initialize(_)
	-- upvalues: (copy) v_u_13, (copy) v_u_18, (copy) v_u_46, (copy) v_u_15
	for _, v49 in v_u_13(v_u_18:GetChildren()) do
		if v49.Name == "Flag" then
			v_u_46(v49)
		end
	end
	return v_u_15
end
return v_u_15
