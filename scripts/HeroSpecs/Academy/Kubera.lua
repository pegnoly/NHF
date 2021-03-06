--NHF----------------Кубера---------------------
kubera_spec =
{
    heroes = {'Kubera', 'Kubera_copy_1', 'Kubera_copy_2', 'Kubera_copy_3', 'Kubera_copy_4', 'Kubera_copy_5', 'Kubera_copy_6', 'Kubera_copy_7', 'Kubera_copy_8'},
    saved_bonus_for_hero = {},
    power_base = 5
}

function  error_NHF_Kubera_F ()
	print("error:NHF_Kubera_F")
end

AddEvent(map_loading_events, 'NHF_kubera_spec_init',
function()
    for i, hero in kubera_spec.heroes do
        kubera_spec.saved_bonus_for_hero[hero] = 0
    end
end)

AddEvent(combat_results_events, 'NHF_kubera_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(kubera_spec.heroes, winner) then
        kubera_spec.saved_bonus_for_hero[winner] = 0
    end
end)

AddEvent(add_hero_events, 'NHF_kubera_spec_add_hero',
function(hero)
    if contains(kubera_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    local count = 0
                    local rakshasas = GetHeroCreaturesByTier(%hero, TOWN_ACADEMY, 6)
                    if creatures then
                        for i, rakshasa in rakshasas do
                            count = count + GetHeroCreatures(%hero, rakshasa)
                        end
                    end
                    --
                    local temp_bonus = 0
                    while 1 do
                        if count >= NHF_ceil_stepen(kubera_spec.power_base, temp_bonus) then
                            temp_bonus = temp_bonus + 1
                        else
                            break
                        end
                        sleep()
                    end
                    --
                    if temp_bonus ~= kubera_spec.saved_bonus_for_hero[%hero] then
                        GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_INITIATIVE, temp_bonus - kubera_spec.saved_bonus_for_hero[%hero])
                        GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_ATTACK, temp_bonus - kubera_spec.saved_bonus_for_hero[%hero])
                        kubera_spec.saved_bonus_for_hero[%hero] = temp_bonus
                    end
                end
                sleep()
            end
        end)
    end
end)