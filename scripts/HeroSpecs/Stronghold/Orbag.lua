--NHF----------------Орбаг--------------------
orbag_spec =
{
    heroes = {'Orbag', 'Orbag_copy_1', 'Orbag_copy_2', 'Orbag_copy_3', 'Orbag_copy_4', 'Orbag_copy_5', 'Orbag_copy_6', 'Orbag_copy_7', 'Orbag_copy_8'},
    gold_per_kill = 5
}

function  error_NHF_Orbag_F ()
	print("error:NHF_Orbag_F")
end

AddEvent(combat_results_events, 'NHF_orbag_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(orbag_spec.heroes, winner) then
        errorHook(error_NHF_Orbag_F);
        local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id, 0)
        local count
        for i = 0, count_stacks - 1 do
            local id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id, 0, i)
            count = count + dead_count
        end
        if count > 0 then
            startThread(MCCS_ChangeHeroResource, hero, GOLD, ceil(count * orbag_spec.gold_per_kill))
        end
    end
end)