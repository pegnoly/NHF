--NHF----------------Гейрмунд------------------
geyrmund_spec =
{
    heroes = {'Geyrmund', 'Geyrmund_copy_1', 'Geyrmund_copy_2', 'Geyrmund_copy_3', 'Geyrmund_copy_4', 'Geyrmund_copy_5', 'Geyrmund_copy_6', 'Geyrmund_copy_7', 'Geyrmund_copy_8'},
    frac_to_res =
    {
        [TOWN_HEAVEN] = CRYSTAL,
        [TOWN_INFERNO] = SULFUR,
        [TOWN_NECROPOLIS] = MERCURY,
        [TOWN_PRESERVE] = GEM,
        [TOWN_ACADEMY] = GEM,
        [TOWN_DUNGEON] = SULFUR,
        [TOWN_FORTRESS] = CRYSTAL,
        [TOWN_STRONGHOLD] = MERCURY,
        [TOWN_NO_TYPE] = GOLD,
    },
    res_per_month = 10,
    gold_multiplier = 500
}

function  error_NHF_Geyrmund_F ()
	print("error:NHF_Geyrmund_F")
end

AddEvent(combat_results_events, 'NHF_geyrmund_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(geyrmund_spec.heroes, winner) then
        local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id,0);
            for i = 0, count_stacks - 1 do
                local id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id, 0, i)
                if dead_count > 0 then
                    local res_to_add = geyrmund_spec.frac_to_res[GetCreatureTown(id_creatures)]
                    local count = ceil(GetDate(MONTH) * GetHeroLevel(winner) / geyrmund_spec.res_per_month)
                    count = (res_to_add == GOLD) and (count * geyrmund_spec.gold_multiplier) or count
                    startThread(MCCS_ChangeHeroResource, winner, res_to_add, count)
                end
            end
        end
    end
end)