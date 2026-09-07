-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game
local v_u_2 = Vector3
local v_u_3 = CFrame
return function(p_u_4)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_3
	v_u_1:GetService("Debris")
	v_u_1:GetService("UserInputService")
	local v_u_5 = v_u_1:GetService("ReplicatedStorage")
	local v6 = v_u_1:GetService("Players").LocalPlayer
	local v_u_7 = v6.Backpack
	local v8 = v6.Character
	if not (v8 and v8.Parent) then
		v8 = v6.CharacterAdded:wait()
	end
	local v_u_9 = v8:WaitForChild("Humanoid")
	local v_u_10 = v8:FindFirstChild("Right Arm")
	v8:FindFirstChild("Torso")
	local v_u_11 = nil
	task.wait(0.25)
	local v_u_12 = v6.PlayerGui:WaitForChild("Animations")
	local v_u_13 = v_u_5:WaitForChild("PlayerData"):WaitForChild(v6.UserId):WaitForChild("Inventory"):WaitForChild("BallHold")
	local function v_u_14()
		-- upvalues: (copy) v_u_13, (copy) v_u_12, (copy) p_u_4, (ref) v_u_2, (ref) v_u_11, (copy) v_u_9, (copy) v_u_5
		if v_u_13.Value == 4958889 then
			v_u_12.Holding.HoldingAnim.AnimationId = "rbxassetid://" .. 100526153137785
			p_u_4.Parent.WeldVector.Value = v_u_2.new(1.2, 1.4, 0.1)
		elseif v_u_13.Value == 4959180 then
			v_u_12.Holding.HoldingAnim.AnimationId = "rbxassetid://" .. 92804612471780
			p_u_4.Parent.WeldVector.Value = v_u_2.new(0.8, 1.4, 0.1)
		elseif v_u_13.Value == 4959338 then
			v_u_12.Holding.HoldingAnim.AnimationId = "rbxassetid://" .. 130259777352565
			p_u_4.Parent.WeldVector.Value = v_u_2.new(0.725, 1.4, 0.1)
		elseif v_u_13.Value == 4959339 then
			v_u_12.Holding.HoldingAnim.AnimationId = "rbxassetid://" .. 94675843674426
			p_u_4.Parent.WeldVector.Value = v_u_2.new(1, 1.15, -0.55)
		elseif v_u_13.Value == 4959341 then
			v_u_12.Holding.HoldingAnim.AnimationId = "rbxassetid://" .. 130295833300040
			p_u_4.Parent.WeldVector.Value = v_u_2.new(1, 1.4, 0.1)
		elseif v_u_13.Value == 5044570 then
			v_u_12.Holding.HoldingAnim.AnimationId = "rbxassetid://" .. 72868543849638
			p_u_4.Parent.WeldVector.Value = v_u_2.new(1.7, 1.4, -0.4)
		elseif v_u_13.Value == 5065827 then
			v_u_12.Holding.HoldingAnim.AnimationId = "rbxassetid://" .. 139298484632667
			p_u_4.Parent.WeldVector.Value = v_u_2.new(2, -2, -0.3)
		elseif v_u_13.Value == 5172275 then
			v_u_12.Holding.HoldingAnim.AnimationId = "rbxassetid://" .. 109419167750544
			p_u_4.Parent.WeldVector.Value = v_u_2.new(1, 1.2, 0.3)
		elseif v_u_13.Value == 5303618 then
			v_u_12.Holding.HoldingAnim.AnimationId = "rbxassetid://" .. 114622048390802
			p_u_4.Parent.WeldVector.Value = v_u_2.new(0.9, 1.5, 0.1)
		elseif v_u_13.Value == 5303619 then
			v_u_12.Holding.HoldingAnim.AnimationId = "rbxassetid://" .. 123447854708121
			p_u_4.Parent.WeldVector.Value = v_u_2.new(0.1, 0.9, 0.8)
		else
			v_u_12.Holding.HoldingAnim.AnimationId = "rbxassetid://" .. 72861601282709
			p_u_4.Parent.WeldVector.Value = v_u_2.new(0.8, 1.4, 0.1)
		end
		v_u_11 = v_u_9:LoadAnimation(v_u_12.Holding.HoldingAnim)
		v_u_5.Remotes.lllIllIllIlllllIlIlIlllIIIIlllIII:FireServer(p_u_4.Parent.WeldVector, p_u_4.Parent.WeldVector.Value)
	end
	v_u_13.Changed:Connect(function()
		-- upvalues: (copy) v_u_14
		v_u_14()
	end)
	v_u_14()
	task.wait(0.25)
	v_u_11 = v_u_9:LoadAnimation(v_u_12.Holding.HoldingAnim)
	local v_u_15 = nil
	v_u_7.Ball.Changed:connect(function()
		-- upvalues: (copy) v_u_7, (ref) v_u_1, (copy) v_u_10, (ref) v_u_11, (ref) v_u_3, (ref) v_u_15
		if v_u_7.Ball.Value == true then
			if v_u_1:GetService("RunService").RenderStepped:wait() and (v_u_10:FindFirstChild("Keep") or v_u_10:FindFirstChild("ServerKeep")) then
				v_u_11:Play(0.4)
				v_u_10.Keep.C1 = v_u_3.new(v_u_7.Ball.WeldVector.Value)
				v_u_15 = v_u_10.Keep.Part1:GetPropertyChangedSignal("Parent"):Connect(function()
					-- upvalues: (ref) v_u_11, (ref) v_u_7, (ref) v_u_10, (ref) v_u_15
					v_u_11:Stop()
					v_u_7.Ball.Value = false
					if v_u_10:FindFirstChild("Keep") then
						v_u_10.Keep:Destroy()
					end
					if v_u_10:FindFirstChild("ServerKeep") then
						v_u_10.ServerKeep:Destroy()
					end
					v_u_15:Disconnect()
				end)
				return
			end
		else
			v_u_11:Stop()
		end
	end)
end
