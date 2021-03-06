----------------Соргалл-------------------	
ferigl_spec =
{
    res_coeff = 0.5
}

function  error_NHF_Ferigl_F ()
	print("error:NHF_Ferigl_F")
end

AddEvent(combat_results_events, 'NHF_ferigl_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and GetHeroSpec(winner) == HERO_SPEC_RIDERS then
        local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id,1);
        for i = 0, count_stacks - 1 do
            local id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id, 1, i)
            if  dead_count > 0 then
                for i, creature in TIER_TABLES[TOWN_DUNGEON][4] do
                    if id_creatures == creature then
                        local riders_to_res = floor(dead_count * ferigl_spec.res_coeff)
                        if riders_to_res > dead_count then
                            riders_to_res = dead_count
                        end
                        if riders_to_res > 0 then
                            AddCreatures(hero, id_creatures, riders_to_res)
                        end
                    end
                end
            end
        end
    end
end)