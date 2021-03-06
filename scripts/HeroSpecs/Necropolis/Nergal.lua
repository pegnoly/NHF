--NHF_E----------------Нергал-------------------
MCCS_HERO_CUSTOM_NERGAL = 2
nergal_spec = 
{
    path = "/MapObjects/Necropolis/NewHeroes/NergalNHF/",
    heroes = {'NergalNHF', 'NergalNHF_copy_1', 'NergalNHF_copy_2', 'NergalNHF_copy_3', 'NergalNHF_copy_4', 'NergalNHF_copy_5', 'NergalNHF_copy_6', 'NergalNHF_copy_7', 'NergalNHF_copy_8'},
    town_to_transform = {}
}

function  error_NHF_NergalNHF_F ()
	print("error:NHF_NergalNHF_F")
end

AddEvent(map_loading_events, 'NHF_nergal_spec_init',
function()
    for i, hero in nergal_spec.heroes do
        mccs_hero_custom[hero] =
        function(hero)
            TransformTown(nergal_spec.town_to_transform[hero], TOWN_NECROMANCY)
            startThread(ShowFlyingSign, nergal_spec.path.."NHF_NergalNHF_Transform_yes.txt", town, GetObjectOwner(town), 5.0)
        end
    end         
end)

AddEvent(add_hero_events, 'NHF_nergal_spec_add_hero',
function(hero)
    if contains(nergal_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    errorHook(error_NHF_NergalNHF_F)
                    local mass_building_non = {{15,16,19,22},{15,17,19,22},{15,16,21,22},{15,16,18,21},{-1,-1,-1,-1},{15,16,19,22},{15,16,22,-1},{15,16,22,-1}}
                    if not nergal_spec.town_to_transform[%hero] then
                        for i_town, town in GetPlayerTowns(GetObjectOwner(%hero)) do
                            if IsHeroInTown(%hero, town, 1, 0) then
                                if GetTownRace(town) ~= TOWN_NECROMANCY  then
                                    local level_town = 0;
                                    for  i_building = 0,22 do
                                        if ((i_building ~= mass_building_non[GetTownRace(town)+1][1])and(i_building ~= mass_building_non[GetTownRace(town)+1][2])and(i_building ~= mass_building_non[GetTownRace(town)+1][3])and(i_building ~= mass_building_non[GetTownRace(town)+1][4])) then
                                            if GetTownBuildingLevel(town,i_building) ~= nil then
                                                level_town = level_town + GetTownBuildingLevel(town,i_building);
                                            end
                                        end
                                    end
                                    --
                                    if (GetHeroLevel(%hero) >= level_town) then
                                        mccs_custom_ability.hero_custom_affected_heroes[%hero][MCCS_HERO_CUSTOM_NERGAL] = 1
                                        nergal_spec.town_to_transform[%hero] = town
                                    end
                                end
                            end
                        end
                    else
                        if not IsHeroInTown(%hero, nergal_spec.town_to_transform[%hero], 0) then
                            mccs_custom_ability.hero_custom_affected_heroes[%hero][MCCS_HERO_CUSTOM_NERGAL] = nil
                            nergal_spec.town_to_transform[%hero] = nil
                        end
                    end
                end
                sleep()
            end
        end)
    end
end)