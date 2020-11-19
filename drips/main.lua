local mod = RegisterMod("Drips", 1)

-- Set Item ENUM
mod.COLLECTIBLE_DRIP_SALINE = Isaac.GetItemIdByName("Saline")
mod.COLLECTIBLE_DRIP_POTASSIUM = Isaac.GetItemIdByName("Potassium")
mod.COLLECTIBLE_DRIP_GLUCOSE = Isaac.GetItemIdByName("Glucose")
mod.COLLECTIBLE_DRIP_DEW = Isaac.GetItemIdByName("Dew")
mod.COLLECTIBLE_DRIP_HELIUM = Isaac.GetItemIdByName("Helium")
mod.COLLECTIBLE_DRIP_SLUDGE = Isaac.GetItemIdByName("Sludge")

-- Saline, Passive Item
function mod:PassiveItemSaline()
	-- Beginning of run initialization
	if Game():GetFrameCount() == 1 then
		Isaac.Spawn(
			EntityType.ENTITY_PICKUP,
			PickupVariant.PICKUP_COLLECTIBLE,
			mod.COLLECTIBLE_DRIP_SALINE,
			Vector(100, 150),
			Vector(0, 0),
			nil
		)
	end
end

-- Potassium, Passive Item
function mod:PassiveItemPotassium()
	-- Beginning of run initialization
	if Game():GetFrameCount() == 1 then
		Isaac.Spawn(
			EntityType.ENTITY_PICKUP,
			PickupVariant.PICKUP_COLLECTIBLE,
			mod.COLLECTIBLE_DRIP_POTASSIUM,
			Vector(150, 150),
			Vector(0, 0),
			nil
		)
	end
end

-- Callbacks
-- TODO Check how to use Item Pools and add the item there.
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.PassiveItemSaline)
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.PassiveItemPotassium)
