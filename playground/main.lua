-- Register the mod in the API (dont change anything here, except the name)
local mod = RegisterMod("Dark Matter tears", 1)
player = Isaac.GetPlayer(0) -- get the player entity

-- Add consumables to player.
-- And change tear effect.
function mod:onTear(tear)
	player:AddCoins(1) -- add a coin
	player:AddBombs(1) -- add a bomb
	player:AddKeys(1) -- add a key
	tear.TearFlags = tear.TearFlags |TearFlags.TEAR_SLOW  -- add slowing effect to the tear
	tear:ChangeVariant(TearVariant.DARK_MATTER ) -- change appearance of the tear
	Isaac.Explode(Isaac.GetRandomPosition(), player, 100)
end

-- Prints the tear position.
function mod:onTearTrajectory(tear)
	local pos = tear.Position
	Isaac.RenderText("Tear - X: "..pos.X.." Y: "..pos.Y, 50, 60, 1, 1, 1, 1)
end

-- Prints the player position.
function mod:onPlayerMoved()
	local pos = player.Position
	Isaac.RenderText("Player - X: " ..pos.X.. " Y: " ..pos.Y, 50, 50, 1, 1, 1, 1)
end

-- Check room ID, if it's a Store it'll spawn an item.
-- Also it changes the wall and floor color.
function mod:onPlayerEnterStore()
	Game():GetRoom():SetWallColor(Color(1,1,1,1,0,255,0))
	Game():GetRoom():SetFloorColor(Color(1,1,1,1,0,0,255))
	if Game():GetRoom():GetType() == RoomType.ROOM_SHOP then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, 0, Vector(320, 280), Vector(0, 0), nil)
	end
end

-- Trigger the function "onTear()", when the "POST_FIRE_TEAR" callback is triggered.
mod:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, mod.onTear)
-- Trigger the function "onTearTrajectory()", when the "POST_TEAR_RENDER" callback is triggered.
mod:AddCallback(ModCallbacks.MC_POST_TEAR_RENDER, mod.onTearTrajectory)
-- Trigger the function "onPlayerMoved()", when the "POST_PLAYER_RENDER" callback is triggered.
mod:AddCallback(ModCallbacks.MC_POST_PLAYER_RENDER, mod.onPlayerMoved)
-- Trigger the function "onPlayerEnterStore()", when the "POST_NEW_ROOM" callback is triggered.
mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.onPlayerEnterStore)
