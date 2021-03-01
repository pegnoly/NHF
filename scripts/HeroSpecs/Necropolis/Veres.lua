--NHF----------------Верес---------------------
veres_spec = 
{
    heroes = {'Veres', 'Veres_copy_1', 'Veres_copy_2', 'Veres_copy_3', 'Veres_copy_4', 'Veres_copy_5', 'Veres_copy_6', 'Veres_copy_7', 'Veres_copy_8'},
    base_coeff = 0.01,
    lvl_coeff = 1/3,
    riders = {11,12,111,23,24,135,51,52,149,77,78,141,96,97,168,89, 90, 183, 337, 346, 349, 351, 372, 360, 223, 224, 248, 282, 284, 387, 400, 428, 277, 605},
}

function  error_NHF_Veres_F ()
	print("error:NHF_Veres_F");
end;

AddEvent(combat_results_events, 'NHF_veres_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(veres_spec.heroes, winner) then
        errorHook(error_NHF_Veres_F)
        local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id,0)
        local dead_riders_count = 0
        for i_kill = 0, count_stacks - 1 do
            local id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id, 0, i_kill)
            if contains(veres_spec.riders, id_creatures) do
                dead_riders_count = dead_riders_count + dead_count
            end
        end
        local knights_to_add = dead_riders_count * (veres_spec.base_coeff + floor(veres_spec.lvl_coeff * GetHeroLevel(winner) / 100))
        if knights_to_add > 0 and knights_to_add < 1 then
            knights_to_add = 1
        else
            knights_to_add = floor(knights_to_add)
        end
        if knights_to_add > 0 then
            AddCreatures(winner, 90, knights_to_add)
        end
        if itogo_dead_stacs > 0 then
            AddHeroCreatures("Veres", 90, itogo_dead_stacs )
        end
    end
end)