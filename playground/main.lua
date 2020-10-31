-- Register the mod in the API (dont change anything here, except the name)
local mod = RegisterMod("Dark Matter tears", 1)
player = Isaac.GetPlayer(0) -- get the player entity

function mod:onTear(tear)
	player:AddCoins(1) -- add a coin
	player:AddBombs(1) -- add a bomb
	player:AddKeys(1) -- add a key
	tear.TearFlags = tear.TearFlags |TearFlags.TEAR_SLOW  -- add slowing effect to the tear
	tear:ChangeVariant(TearVariant.DARK_MATTER ) -- change appearance of the tear
	-- Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, 0, Vector(320, 280), Vector(0, 0), nil)
	Isaac.Explode(Isaac.GetRandomPosition(), player, 100)
end

-- prints the player position.
function mod:onPlayerMoved()
	local pos = player.Position
	Isaac.RenderText("X: "..pos.X.." Y: "..pos.Y, 50, 50, 1, 1, 1, 1)
end

-- Room
function mod:onPlayerEnterRoom()
	Game():GetRoom():SetWallColor(Color(1,1,1,1,255,0,0))
	local roomId = Game():GetRoom().GetType()
	Isaac.RenderText("Game"..roomId, 50, 75, 1, 1, 1, 1)
end

-- Trigger the function "onTear()", when the "POST_FIRE_TEAR" callback is triggered.
mod:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, mod.onTear)
-- Trigger the function "onPlayerMoved()" whtn the "POST_PLAYER_RENDER" callback is triggered.
mod:AddCallback(ModCallbacks.MC_POST_PLAYER_RENDER, mod.onPlayerMoved)
-- Trigger the function "onPlayerEnterRoom()" with the "POST_NEW_ROOM" callback is triggered.
mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.onPlayerEnterRoom)
