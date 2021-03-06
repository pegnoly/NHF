--NHF--------------Надия---------------------
nadia_spec =
{
    heroes = {'Nadia', 'Nadia_copy_1', 'Nadia_copy_2', 'Nadia_copy_3', 'Nadia_copy_4', 'Nadia_copy_5', 'Nadia_copy_6', 'Nadia_copy_7', 'Nadia_copy_8'},
    town_for_hero = {},
    saved_know_for_hero = {}
    know_per_guild_lvl = 2
}

function  error_NHF_Nadia_F ()
	print("error:NHF_Nadia_F")
end

AddEvent(add_hero_events, 'NHF_nadia_spec_add_hero',
function(hero)
    if contains(nadia_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    errorHook(error_NHF_Nadia_F)
                    if not nadia_spec.town_for_hero[%hero] then
                        for i, town in GetPlayerTowns(GetObjectOwner(%hero)) do
                            if IsHeroInTown(%hero, town, 1, 0) or (GetHeroTown(town) == %hero) then
                                nadia_spec.town_for_hero[%hero] = town
                                local know_to_add = ceil(GetTownBuildingLevel(town, TOWN_BUILDING_MAGIC_GUILD) * nadia_spec.know_per_guild_lvl)
                                if know_to_add ~= 0 then
                                    startThread(MCCS_ChangeHeroStat, %hero, STAT_KNOWLEDGE, know_to_add)
                                    nadia_spec.saved_know_for_hero[%hero] = know_to_add
                                end
                                break
                            end
                        end
                    else
                        if not (IsHeroInTown(%hero, nadia_spec.town_for_hero[%hero], 1, 0) or (GetHeroTown(nadia_spec.town_for_hero[%hero]) == %hero)) then
                            startThread(MCCS_ChangeHeroStat, %hero, STAT_KNOWLEDGE, -nadia_spec.saved_know_for_hero[%hero])
                            nadia_spec.town_for_hero[%hero] = nil
                            nadia_spec.saved_know_for_hero[%hero] = 0
                        else
                            -- чек, если уровень гильдии изменился, пока герой был в городе
                            local know_to_add = ceil(GetTownBuildingLevel(town, TOWN_BUILDING_MAGIC_GUILD) * nadia_spec.know_per_guild_lvl)
                            if know_to_add ~= nadia_spec.saved_know_for_hero[%hero]
                                local know_difference = know_to_add - nadia_spec.saved_know_for_hero[%hero]
                                startThread(MCCS_ChangeHeroStat, %hero, STAT_KNOWLEDGE, know_difference)
                                nadia_spec.saved_know_for_hero[%hero] = nadia_spec.saved_know_for_hero[%hero] + know_difference
                            end
                        end
                    end
                end
                sleep()
            end
        end)
    end
end)