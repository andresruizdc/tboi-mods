local mod = RegisterMod("DottinDips", 1)
local game = Game()

local DipVariant = {
	DOT = Isaac.GetEntityVariantByName("Dot")
}
local DOT_CHANCE = 50
local Dots = {}

function hsb2rgb(hue, saturation, brightness, alpha)
	while hue > 1 do
		hue = hue -1
	end

	if (saturation <= 0) then
		return Color(brightness, brightness, brightness, alpha, 0, 0, 0)
	end

	local H = hue * 6
	local I = math.floor(H)
	local F = H - I
	local P = brightness * (1.0 - saturation)
	local Q = brightness * (1.0 - (saturation * F))
	local T = brightness * (1.0 - (saturation * (1.0 -F)))

	if I == 0 then
		return Color(brightness, T, P, alpha, 0, 0, 0)
	elseif I == 1 then
		return Color(Q, brightness, P, alpha, 0, 0, 0)
	elseif I == 2 then
		return Color(P, brightness, T, alpha, 0, 0, 0)
	elseif I == 3 then
		return Color(P, Q, brightness, alpha, 0, 0, 0)
	elseif I == 4 then
		return Color(T, P, brightness, alpha, 0, 0, 0)
	else
		return Color(brightness, P, Q, alpha, 0, 0, 0)
	end
end

function Dots:onUpdate(player)
	if game:GetFrameCount() == 1 then
		for x = 0,2 do
			for y = 0,2 do
				Isaac.Spawn(EntityType.ENTITY_DIP, 0, 0, Vector(270 + 50 * x, 200 + 50 * y), Vector(0,0), nil)
			end
		end
	end
end

mod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, Dots.onUpdate)