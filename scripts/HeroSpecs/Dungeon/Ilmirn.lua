--NHF----------------Илмирн--------------------
ilmirn_spec =
{
    path = "/MapObjects/Dungeon/NewHeroes/Ilmirn/",
    heroes = {'Ilmirn', 'Ilmirn_copy_1', 'Ilmirn_copy_2', 'Ilmirn_copy_3', 'Ilmirn_copy_4', 'Ilmirn_copy_5', 'Ilmirn_copy_6', 'Ilmirn_copy_7', 'Ilmirn_copy_8'},
    grow_coeff = 2
}

function  error_NHF_Ilmirn_F ()
	print("error:NHF_Ilmirn_F")
end

AddEvent(combat_results_events, 'NHF_ilmirn_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(ilmirn_spec.heroes, winner) then
        local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id,1)
        local count = 0
        for i = 0, count_stacks - 1 do
            local id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id, 1, i)
            if  dead_count > 0 then
                if contains(TIER_TABLES[TOWN_DUNGEON][5], id_creatures) then
                    count = dead_count +  count
                end;
            end
        end
        if count > 0 then
            count = floor(count * ilmirn_spec.grow_coeff)
            if GetHeroLevel(winner) < count then
                count = GetHeroLevel(winner)
            end
            for i, town in GetPlayerTowns(GetObjectOwner(winner)) do
                if (GetTownRace(town) == TOWN_DUNGEON) and (GetTownBuildingLevel(town, TOWN_BUILDING_DWELLING_5) ~= 0) then
                    SetObjectDwellingCreatures(town, CREATURE_HYDRA, GetObjectDwellingCreatures(town, CREATURE_HYDRA) + count)
                    startThread(ShowFlyingSign, {ilmirn_spec.path.."message.txt"; p = count}, town, GetObjectOwner(town), 5.0)
                end
            end
        end
    end
end)