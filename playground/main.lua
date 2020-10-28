-- Register the mod in the API (dont change anything here, except the name)
local mod = RegisterMod("Dark Matter tears", 1)

function mod:onTear(tear)
	local player = Isaac.GetPlayer(0) --get the player entity
	player:AddCoins(1) -- add a coin
	player:AddBombs(1) -- add a bomb
	tear.TearFlags = tear.TearFlags |TearFlags.TEAR_SLOW  -- add slowing effect to the tear
	tear:ChangeVariant(TearVariant.DARK_MATTER ) -- change appearance of the tear
	Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, 0, Vector(320, 280), Vector(0, 0), nil)
end

-- Trigger the function "onTear()", when the "POST_FIRE_TEAR" callback is triggered.
mod:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR , mod.onTear)
