-- Register the mod in the API (dont change anything here, except the name)
local mod = RegisterMod("Playground", 1)
local game = Game()

-- local functions
local function GiveItemToPlayer()
	if game:GetFrameCount() == 1 then
		-- Random number between 1 and 552
		-- Give random item to player
		local player = game:GetPlayer(0)
		local item = math.random(1, 552)
		Isaac.DebugString(item)
		player:AddCollectible(item, 300, false)
	end
end

-- Add consumables to player.
-- And change tear effect.
function mod:onTear(tear)
	local player = Isaac.GetPlayer(0) -- get the player entity
	player:AddCoins(1) -- add a coin
	player:AddBombs(1) -- add a bomb
	player:AddKeys(1) -- add a key
	tear.TearFlags = tear.TearFlags |TearFlags.TEAR_SLOW  -- add slowing effect to the tear
	tear:ChangeVariant(TearVariant.DARK_MATTER ) -- change appearance of the tear
end

-- Prints the player position.
function mod:renderPlayerPosition()
	local player = Isaac.GetPlayer(0) -- get the player entity
	local pos = player.Position
	Isaac.RenderText("Player - X: " ..pos.X.. " Y: " ..pos.Y, 50, 50, 1, 1, 1, 1)
end

-- Prints the tear position.
function mod:renderTearPosition(tear)
	local pos = tear.Position
	Isaac.RenderText("Tear - X: "..pos.X.." Y: "..pos.Y, 50, 60, 1, 1, 1, 1)
end

-- Make explotions all the tear trajectory.
function mod:makeExplosiveTrajectory(tear)
	local player = Isaac.GetPlayer(0) -- get the player entity
	local pos = tear.Position
	-- Isaac.Explode(pos, player, 100)
end

-- Check room ID, if it's a Store it'll spawn an item.
-- Also it changes the wall and floor color.
function mod:onPlayerEnterRoom()
	local player = Isaac.GetPlayer(0)
	Game():GetRoom():SetWallColor(Color(1,1,1,1,0,255,0))
	Game():GetRoom():SetFloorColor(Color(1,1,1,1,0,0,255))
	if Game():GetRoom():GetType() == RoomType.ROOM_SHOP then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, 0, Vector(320, 280), Vector(0, 0), nil)
	else
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_LIL_BATTERY, 0, player.Position, Vector(0, 0), nil)
	end
end

-- Spawn a Monstro when active item is used
function mod:onItemUsed()
	local player = Isaac.GetPlayer(0)
	Isaac.Spawn(EntityType.ENTITY_MONSTRO, 1, 0, Vector(320, 280), Vector(0, 0), player)
end

function mod:onUpdate()
	GiveItemToPlayer()
end

-- Trigger the function "onTear()", when the "POST_FIRE_TEAR" callback is triggered.
mod:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, mod.onTear)
-- Trigger the function "renderPlayerPosition()", when the "POST_PLAYER_RENDER" callback is triggered.
mod:AddCallback(ModCallbacks.MC_POST_PLAYER_RENDER, mod.renderPlayerPosition)
-- Trigger the function "renderTearPosition()", when the "POST_TEAR_RENDER" callback is triggered.
mod:AddCallback(ModCallbacks.MC_POST_TEAR_RENDER, mod.renderTearPosition)
-- Trigger the function "makeExplosiveTrajectory()", when the "POST_TEAR_UPDATE" callback is triggered.
mod:AddCallback(ModCallbacks.MC_POST_TEAR_UPDATE, mod.makeExplosiveTrajectory)
-- Trigger the function "onPlayerEnterRoom()", when the "POST_NEW_ROOM" callback is triggered.
mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.onPlayerEnterRoom)
-- Trigger the function "onItemUsed()", when the "USE_ITEM" callback is triggered.
mod:AddCallback(ModCallbacks.MC_USE_ITEM, mod.onItemUsed)
-- Trigger the function "onUpdate()"
mod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, mod.onUpdate)
