local mod = RegisterMod("Drips", 1)

-- Set Item ENUM
mod.COLLECTIBLE_DRIP_SALINE = Isaac.GetItemIdByName("Saline Drip")
mod.COLLECTIBLE_DRIP_POTASSIUM = Isaac.GetItemIdByName("Potassium Drip")
mod.COLLECTIBLE_DRIP_GLUCOSE = Isaac.GetItemIdByName("Glucose Drip")
mod.COLLECTIBLE_DRIP_DEW = Isaac.GetItemIdByName("Dew Drip")
mod.COLLECTIBLE_DRIP_HELIUM = Isaac.GetItemIdByName("Helium Drip")
mod.COLLECTIBLE_DRIP_SLUDGE = Isaac.GetItemIdByName("Sludge Drip")

-- Game Init
function mod:GameInit()
	-- Spawn items
	if Game():GetFrameCount() == 1 then
		Isaac.Spawn(
			EntityType.ENTITY_PICKUP,
			PickupVariant.PICKUP_COLLECTIBLE,
			mod.COLLECTIBLE_DRIP_SALINE,
			Vector(100, 250),
			Vector(0, 0),
			nil
		)
		Isaac.Spawn(
			EntityType.ENTITY_PICKUP,
			PickupVariant.PICKUP_COLLECTIBLE,
			mod.COLLECTIBLE_DRIP_POTASSIUM,
			Vector(150, 250),
			Vector(0, 0),
			nil
		)
		Isaac.Spawn(
			EntityType.ENTITY_PICKUP,
			PickupVariant.PICKUP_COLLECTIBLE,
			mod.COLLECTIBLE_DRIP_GLUCOSE,
			Vector(200, 250),
			Vector(0, 0),
			nil
		)
		Isaac.Spawn(
			EntityType.ENTITY_PICKUP,
			PickupVariant.PICKUP_COLLECTIBLE,
			mod.COLLECTIBLE_DRIP_DEW,
			Vector(250, 250),
			Vector(0, 0),
			nil
		)
		Isaac.Spawn(
			EntityType.ENTITY_PICKUP,
			PickupVariant.PICKUP_COLLECTIBLE,
			mod.COLLECTIBLE_DRIP_HELIUM,
			Vector(300, 250),
			Vector(0, 0),
			nil
		)
		Isaac.Spawn(
			EntityType.ENTITY_PICKUP,
			PickupVariant.PICKUP_COLLECTIBLE,
			mod.COLLECTIBLE_DRIP_SLUDGE,
			Vector(350, 250),
			Vector(0, 0),
			nil
		)
	end
end

-- Saline, Passive Item
function mod:PassiveItemSaline()
end

-- Potassium, Passive Item
function mod:PassiveItemPotassium()
end

-- Glucose, Passive Item
function mod:PassiveItemGlucose()
end

-- Dew, Passive Item
function mod:PassiveItemDew()
end

-- Helium, Passive Item
function mod:PassiveItemHelium()
end

-- Sludge, Passive Item
function mod:PassiveItemSludge()
end

-- Callbacks
-- TODO Check how to use Item Pools and add the item there.
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.GameInit)
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.PassiveItemSaline)
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.PassiveItemPotassium)
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.PassiveItemGlucose)
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.PassiveItemDew)
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.PassiveItemHelium)
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.PassiveItemSludge)