--NHF--------------Фарид----------------------
farid_spec = 
{
    heroes = {'Farid', 'Farid_copy_1', 'Farid_copy_2', 'Farid_copy_3', 'Farid_copy_4', 'Farid_copy_5', 'Farid_copy_6', 'Farid_copy_7', 'Farid_copy_8'},
    ore_per_garg = 1
}

function  error_NHF_Farid_F ()
	print("error:NHF_Farid_F")
end

AddEvent(combat_results_events, 'NHF_farid_spec_combat_result',
function(fight_id)
    for i, party  in {1, 0} do
        local hero = GetSavedCombatArmyHero(fight_id, i)
        if hero and contains(farid_spec.heroes, hero) then
            local count = 0
            local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id, party)
            for i = 0, count_stacks - 1 do
                local id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id, party, i)
                if dead_count > 0 and contains(TIER_TABLES[TOWN_ACADEMY][2], id_creatures) then
                    count = count + dead_count
                end
            end
            if count ~= 0 then
			    NHF_ChangeResourceHero(ORE, floor(count * farid_spec.ore_per_garg), hero)
			    sleep(NHF_slep_singl)
            end
		end
	end
end)

AddEvent(new_day_events, 'NHF_farid_new_day',
function(hero, day)
    if mod(day, 7) == 1 and day ~= 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(farid_spec.heroes, hero) then
                startThread(DefaultCreatureGrow, hero, TOWN_ACADEMY, 2, ceil(GetHeroLevel(hero) * GetCreatureGrow(TIER_TABLES[TOWN_ACADEMY][2][1])))
            end
        end
    end
end)