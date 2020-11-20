local mod = RegisterMod("Drips", 1)
local game = Game()
local MIN_TEAR_DELAY = 5

-- Set Item ENUMS.
local DripId = {
	SALINE = Isaac.GetItemIdByName("Saline Drip"),
	POTASSIUM = Isaac.GetItemIdByName("Potassium Drip"),
	GLUCOSE = Isaac.GetItemIdByName("Glucose Drip"),
	DEW = Isaac.GetItemIdByName("Dew Drip"),
	HELIUM = Isaac.GetItemIdByName("Helium Drip"),
	SLUDGE = Isaac.GetItemIdByName("Sludge Drip")
}

-- This is for checking once in the game whether or
-- not the player has any of our items.
local HasDrip = {
	saline = false,
	potassium = false,
	glucose = false,
	dew = false,
	helium = false,
	sludge = false
}

-- This is the stat's changes that every item has to do
-- when the player picks it out.
local DripBonus = {
	SALINE = 3,
	POTASSIUM = 0.5,
	GLUCOSE_TEAR_HEIGHT = 1,
	GLUCOSE_FALL_SPEED = 1,
	GLUCOSE_SPEED = 0.5,
	DEW = 5,
	SLUDGE = 5
}

-- Game Init
function mod:GameInit()
	-- Spawn items
	if game:GetFrameCount() == 1 then
		Isaac.Spawn(
			EntityType.ENTITY_PICKUP,
			PickupVariant.PICKUP_COLLECTIBLE,
			DripId.SALINE,
			Vector(100, 250),
			Vector(0, 0),
			nil
		)
		Isaac.Spawn(
			EntityType.ENTITY_PICKUP,
			PickupVariant.PICKUP_COLLECTIBLE,
			DripId.POTASSIUM,
			Vector(150, 250),
			Vector(0, 0),
			nil
		)
		Isaac.Spawn(
			EntityType.ENTITY_PICKUP,
			PickupVariant.PICKUP_COLLECTIBLE,
			DripId.GLUCOSE,
			Vector(200, 250),
			Vector(0, 0),
			nil
		)
		Isaac.Spawn(
			EntityType.ENTITY_PICKUP,
			PickupVariant.PICKUP_COLLECTIBLE,
			DripId.DEW,
			Vector(250, 250),
			Vector(0, 0),
			nil
		)
		Isaac.Spawn(
			EntityType.ENTITY_PICKUP,
			PickupVariant.PICKUP_COLLECTIBLE,
			DripId.HELIUM,
			Vector(300, 250),
			Vector(0, 0),
			nil
		)
		Isaac.Spawn(
			EntityType.ENTITY_PICKUP,
			PickupVariant.PICKUP_COLLECTIBLE,
			DripId.SLUDGE,
			Vector(350, 250),
			Vector(0, 0),
			nil
		)
	end
end

-- Saline, Passive Item
function mod:PassiveItemSalineDrip()
end

-- Potassium, Passive Item
function mod:PassiveItemPotassiumDrip()
end

-- Glucose, Passive Item
function mod:PassiveItemGlucoseDrip()
end

-- Dew, Passive Item
function mod:PassiveItemDewDrip()
end

-- Helium, Passive Item
function mod:PassiveItemHeliumDrip()
end

-- Sludge, Passive Item
function mod:PassiveItemSludgeDrip()
end

-- Callbacks
-- TODO Check how to use Item Pools and add the item there.
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.GameInit)
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.PassiveItemSalineDrip)
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.PassiveItemPotassiumDrip)
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.PassiveItemGlucoseDrip)
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.PassiveItemDewDrip)
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.PassiveItemHeliumDrip)
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.PassiveItemSludgeDrip)
