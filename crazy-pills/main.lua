local mod = RegisterMod("CrazyPills", 1)
local game = Game()

local ImAlwaysAngry = {
	ID = Isaac.GetPillEffectByName("I'm Always Angry"),
	BONUS_DAMAGE = 5,
	BONUS_TEAR_HEIGHT = 50,
	PLAYER_SCALE = Vector(1, 1),
	IsAngry = false
}

ImAlwaysAngry.Color = Isaac.AddPillEffectToPool(ImAlwaysAngry.ID)

function ImAlwaysAngry:Proc(_PillEffectNumber)
	local player = game:GetPlayer(0)
	
	player:SetColor(Color(0.0, 0.7, 0.0, 1.0, 0.0, 0.0, 0.0), 0, 0, false, false)
	
	ImAlwaysAngry.FormerScale = player.SpriteScale
	player.SpriteScale = ImAlwaysAngry.FormerScale + ImAlwaysAngry.PLAYER_SCALE

	ImAlwaysAngry.Room = game:GetLevel():GetCurrentRoomIndex()
	ImAlwaysAngry.IsAngry = true

	player:AddCacheFlags(CacheFlag.CACHE_DAMAGE)
	player:AddCacheFlags(CacheFlag.CACHE_RANGE)
end

local function UpdateEffects(player)
	if ImAlwaysAngry.Room ~= nil and game:GetLevel():GetCurrentRoomIndex() ~= ImAlwaysAngry.Room then
		ImAlwaysAngry.IsAngry = false
		ImAlwaysAngry.Room = nil
		
		player:SetColor(Color(1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0), 0, 0, false, false)
		player.SpriteScale = ImAlwaysAngry.FormerScale

		player:AddCacheFlags(CacheFlag.CACHE_DAMAGE)
		player:AddCacheFlags(CacheFlag.CACHE_RANGE)
		player:EvaluateItems()
	end
end

function mod:onUpdate(player)
	UpdateEffects(player)
end

function mod:onCacheDamage(player, cacheFlag)
	if ImAlwaysAngry.IsAngry then
		player.Damage = player.Damage + ImAlwaysAngry.BONUS_DAMAGE
	end
end

function mod:onCacheRange(player, cacheFlag)
	if ImAlwaysAngry.IsAngry then
		player.TearHeight = player.TearHeight - ImAlwaysAngry.BONUS_TEAR_HEIGHT
	end
end

mod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, mod.onUpdate)
mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.onCacheDamage, CacheFlag.CACHE_DAMAGE)
mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.onCacheRange, CacheFlag.CACHE_RANGE)
mod:AddCallback(ModCallbacks.MC_USE_PILL, ImAlwaysAngry.Proc, ImAlwaysAngry.ID)