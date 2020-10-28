local mod = RegisterMod("Dark Matter tears", 1) -- Register the mod in the API (dont change anything here, except the name)

function mod:onTear(tear)
	local player = Isaac.GetPlayer(0) --get the player entity
	player:AddCoins(1) -- add a coin
	tear.TearFlags = tear.TearFlags |TearFlags.TEAR_SLOW  -- add slowing effect to the tear
	tear:ChangeVariant(TearVariant.DARK_MATTER ) -- change appearance of the tear
end

mod:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR , mod.onTear) -- Trigger the function "onTear()", when the "POST_FIRE_TEAR" callback is triggered.
