--NHF---------------Шаграт--------------------
shagrat_spec =
{
    heroes = {'Shagrat', 'Shagrat_copy_1', 'Shagrat_copy_2', 'Shagrat_copy_3', 'Shagrat_copy_4', 'Shagrat_copy_5', 'Shagrat_copy_6', 'Shagrat_copy_7', 'Shagrat_copy_8'},
    kills_needed_for_hero = {},
    curr_kills_for_hero = {}
}

function  error_NHF_Shagrat_F ()
	print("error:NHF_Shagrat_F");
end;

AddEvent(map_loading_event, 'NHF_shagrat_spec_init',
function()
    for i, hero in shagrat_spec.heroes do
        shagrat_spec.kills_needed_for_hero[hero] = 100
        shagrat_spec.curr_kills_for_hero[hero] = 0
    end
end)

AddEvent(combat_results_events, 'NHF_shagrat_spec_combat_result',
function(fight_id)
    for party = 0, 1 do
        local hero = GetSavedCombatArmyHero(fight_id, party)
        if hero and contains(shagrat_spec.heroes, hero) then
            local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id, 1 - party)
            for i = 0, count_stacks - 1 do
                local id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id, 1 - party, i)
                shagrat_spec.curr_kills_for_hero[hero] = shagrat_spec.curr_kills_for_hero[hero] + dead_count
            end
            --
            while shagrat_spec.curr_kills_for_hero[hero] >= shagrat_spec.kills_needed_for_hero[hero] do
                startThread(MCCS_ChangeHeroStat, hero, STAT_ATTACK, 1)
                shagrat_spec.kills_needed_for_hero[hero] = shagrat_spec.kills_needed_for_hero[hero] + (100 * (1 + ceil(shagrat_spec.kills_needed_for_hero[hero] / 100)))
                sleep()
            end
        end
    end
end)