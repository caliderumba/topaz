-----------------------------------
-- Area: Konschtat Highlands
--   NM: Bendigeit Vran
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobRoam(mob)
    local hour = VanadielHour()
    if hour >= 5 and hour < 17 then
        DespawnMob(mob:getID())
    end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.EVA_DOWN)
end

function onMobDeath(mob, player, isKiller)
    if player:getCharVar("TutorialProgress") == 7 then
        player:setCharVar("TutorialProgress", 8)
    end
end

function onMobDespawn(mob)
    mob:setLocalVar("cooldown", os.time() + (144 * 13)) -- 13 vanadiel hours guarantees it will not spawn twice in the same night
end
