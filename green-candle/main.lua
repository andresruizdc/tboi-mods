local mod = RegisterMod("Green Candle", 1)

-- Set Item ENUM
mod.COLLECTIBLE_GREEN_CANDLE = Isaac.GetItemIdByName("Green Candle")

-- Green Candle, Passive Item
function mod:onUpdate()
	-- Beginning of run initialization
	if Game():GetFrameCount() == 1 then
		mod.HasGreenCandle = false
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, mod.COLLECTIBLE_GREEN_CANDLE, Vector(320, 280), Vector(0, 0), nil)
	end

	-- Green Candle functionality
	for playerNum = 1, Game():GetNumPlayers() do
		local player = Game():GetPlayer(playerNum)
		if player:HasCollectible(mod.COLLECTIBLE_GREEN_CANDLE) then
			-- Add Sould Hearts
			if not mod.HasGreenCandle then
				player:AddSoulHearts(2)
				mod.HasGreenCandle = true
			end

			-- Loop trough room entities to apply the poison
			for i, entity in pairs(Isaac.GetRoomEntities()) do
				if entity:IsVulnerableEnemy() and math.random(500) <= 7 then
					entity:AddPoison(EntityRef(player), 100, 3.5)
				end
			end
		end
	end
end

-- Green Candle Callback
-- TODO Check how to use Item Pools and add the item there.
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.onUpdate)
