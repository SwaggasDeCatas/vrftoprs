-- Safe compatibility shim replacing T's Humanoid WalkSpeed editor.
-- Tool calls remain valid, but this module never writes WalkSpeed or JumpPower.
local Speed = {}
local NeutralSpeed = 19

function Speed.Init()
	return nil
end

function Speed.Speed()
	return nil
end

function Speed.GetNeutralSpeed()
	return NeutralSpeed
end

return Speed
