--NHF--------------Фахим----------------------
fahim_spec =
{
    heroes = {'Fahim', 'Fahim_copy_1', 'Fahim_copy_2', 'Fahim_copy_3', 'Fahim_copy_4', 'Fahim_copy_5', 'Fahim_copy_6', 'Fahim_copy_7', 'Fahim_copy_8'},

}

function  error_NHF_Fahim_F ()
    print("error:NHF_Fahim_F")
end

AddEvent(combat_results_events, 'NHF_fahim_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(fahim_spec.heroes, winner) then
        local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id, 1)
        for i = 0, count_stacks - 1 do
            local id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id,1,i);
            if dead_count > 0 and contains(TIER_TABLES[TOWN_ACADEMY][5], id_creatures) then
                if dead_count > GetHeroStat(winner, STAT_KNOWLEDGE) then
                    dead_count = GetHeroStat(winner, STAT_KNOWLEDGE)
                end
                startThread(AddCreatures, winner, id_creatures, dead_count)
            end
        end
    end
end)