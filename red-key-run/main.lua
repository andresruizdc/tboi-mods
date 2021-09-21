local RedKeyRun = RegisterMod("Red Key Run", 1)

-- local functions
local function GiveItemsToPlayer()
    local SCHOOLBAG = 534
    local REDKEY = 580

    local player = Isaac.GetPlayer(0) -- get the player entity
    player:AddCollectible(SCHOOLBAG, 0, true)
    player:AddCollectible(REDKEY, 4, true)
end

function RedKeyRun:giveItemsToPlayer(IsContinued)
    -- Only give player the items if its a new run
    if IsContinued == false then
        GiveItemsToPlayer()
    end
end

RedKeyRun:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, RedKeyRun.giveItemsToPlayer, IsContinued)