--NHF_E--------------------Геральда--------------------
geralda_spec =
{
    path = "/MapObjects/Necropolis/NewHeroes/Geralda/",
    heroes = {'Geralda', 'Geralda_copy_1', 'Geralda_copy_2', 'Geralda_copy_3', 'Geralda_copy_4', 'Geralda_copy_5', 'Geralda_copy_6', 'Geralda_copy_7', 'Geralda_copy_8'},
    grow_percent = 0.1
}

function  error_NHF_Geralda_F ()
	print("error:NHF_Geralda_F")
end

AddEvent(combat_results_events, 'NHF_geralda_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(geralda_spec.heroes, winner) then
        local creatures_per_tier = {}
        local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id,0)
        for i = 0, count_stacks - 1 do
            local id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo (fight_id, 0, i)
            if dead_count > 0 and IsAlive(id_creatures) then		
                local tier = GetCreatureTier(id_creatures)
                if not creatures_per_tier[tier] then
                    creatures_per_tier[tier] = 0
                end
                creatures_per_tier[tier] = creatures_per_tier[tier] + dead_count
            end
        end
        --
        local temp_name = NHF_tempName_F(winner)
        for i, town in GetPlayerTowns(GetObjectOwner(temp_name)) do
            if GetTownRace(town) == TOWN_NECROMANCY then
                for dwell = TOWN_BUILDING_DWELLING_1, TOWN_BUILDING_DWELLING_7 do
                    if GetTownBuildingLevel(town, dwell) ~= 0 then
                        if creatures_per_tier[dwell - 6] and creatures_per_tier[dwell - 6] ~= 0 then
                            SetObjectDwellingCreatures(town, TIER_TABLES[TOWN_NECROMANCY][dwell - 6][1], GetObjectDwellingCreatures(TIER_TABLES[TOWN_NECROMANCY][dwell - 6][1]) + creatures_per_tier[dwell - 6] * geralda_spec.grow_percent)
                            startThread(ShowFlyingSign, {geralda_spec.path..'message'..(dwell - 6)..'.txt'; p = (creatures_per_tier[dwell - 6] * geralda_spec.grow_percent)}, temp_name, GetObjectOwner(temp_name), 5.0)
                        end
                    end
                end
            end
        end  
    end
end)