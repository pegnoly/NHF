--NHF----------------Зана--------------------
zana_spec = 
{
    heroes = {'Zana', 'Zana_copy_1', 'Zana_copy_2', 'Zana_copy_3', 'Zana_copy_4', 'Zana_copy_5', 'Zana_copy_6', 'Zana_copy_7', 'Zana_copy_8'},
    percent_per_luck = 0.1
}
NHF_Zana_index_battle_next = -1;
function  error_NHF_Zana_F ()
	print("error:NHF_Zana_F");
end;

AddEvent(combat_results_events, 'NHF_zana_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(zana_spec.heroes, winner) then
        local percent = GetHeroStat(winner, STAT_LUCK) * zana_spec.percent_per_luck * 100
        if percent > 50 then
            percent = 50
        end
        for party = 0, 1 do
            local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id, party)
            for i_stacks = 0, count_stacks - 1 do
                local id, count, dead_count = GetSavedCombatArmyCreatureInfo(fight_id, party, i_stacks)
                if dead_count > 0 and GetCreatureTown(id) == TOWN_INFERNO then
                    local grow = floor((dead_count * percent) / 100)
                    if grow > 1 then
                        AddCreatures(winner, id, grow)
                    end
                end
            end
        end
    end
end)