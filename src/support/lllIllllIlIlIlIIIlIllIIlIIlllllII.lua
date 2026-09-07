-- Network compatibility shim.
-- T's original network transport is replaced by runtime/KickoffAdapter.lua.
local Network = {}

function Network.HitBall()
	return nil
end

return Network

