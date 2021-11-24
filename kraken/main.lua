local mod = RegisterMod("Kraken", 1)

function mod:onUpdate()
	Isaac.RenderText("Kraken Character", 50, 50, 1, 1, 1, 1)
end

mod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, mod.onUpdate)