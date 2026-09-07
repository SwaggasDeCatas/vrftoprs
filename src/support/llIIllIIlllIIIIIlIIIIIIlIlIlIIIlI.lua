-- Animation compatibility shim for the exported T tools.
local Animation = {}

function Animation.StopAnimations(_, humanoid, includeCore)
	for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
		if includeCore or (not string.find(track.Name, "Anim", 1, true) and track.Name ~= "HoldingAnim") then
			track:Stop(0.0001)
		end
	end
end

function Animation.SetAnimationsWeight(_, humanoid, includeCore, weight)
	for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
		if includeCore or (not string.find(track.Name, "Anim", 1, true) and track.Name ~= "HoldingAnim") then
			track:AdjustWeight(weight)
		end
	end
end

function Animation.PlayAnim(_, track, fade, priority)
	if priority then track.Priority = priority end
	track:Play(fade == 0 and 0.0001 or fade)
end

function Animation.StopAnim(_, track, fade)
	if track and track.IsPlaying then
		track:Stop(fade == 0 and 0.0001 or fade)
	end
end

function Animation.PlayServerAnim(_, track, fade, priority)
	if priority then track.Priority = priority end
	track:Play(fade == 0 and 0.0001 or fade)
end

function Animation.PlayTorsoAnim(_, data)
	local humanoid = data and data.Humanoid
	local animation = data and data.Animation
	if humanoid and animation then
		local track = humanoid:LoadAnimation(animation)
		track:Play(0.0001)
		return track
	end
	return nil
end

Animation.PlayTorsoMovementAnim = Animation.PlayTorsoAnim

return Animation

