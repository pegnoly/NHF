--NHF--------------Олотан--------------------
olotan_spec =
{
    heroes = {'Olotan', 'Olotan_copy_1', 'Olotan_copy_2', 'Olotan_copy_3', 'Olotan_copy_4', 'Olotan_copy_5', 'Olotan_copy_6', 'Olotan_copy_7', 'Olotan_copy_8'},
    saved_def_for_hero = {},
    creatures_for_def = 100
}

function  error_NHF_Olotan_F ()
	print("error:NHF_Olotan_F")
end

AddEvent(map_loading_events, 'NHF_olotan_spec_init',
function()
    for i, hero in olotan_spec.heroes do
        olotan_spec.saved_def_for_hero[hero] = 0
    end
end)

AddEvent(add_hero_events, 'NHF_olotan_spec_add_hero',
function(hero)
    if contains(olotan_spec.heroes, hero) then
        startThread(
        function()
        while 1 do
            if IsHeroAlive(%hero) then
                errorHook(error_NHF_Olotan_F)
                local inf_count = 0
                for slot = 0, 6 do
                    local creature, count = GetObjectArmySlotCreature(%hero, slot)
                    if not (creature == 0 or count == 0) then
                        if GetCreatureTown(creature) == TOWN_INFERNO then
                            inf_count = inf_count + count
                        end
                    end
                end
                local temp_def = floor(inf_count / olotan_spec.creatures_for_def)
                if temp_def ~= olotan_spec.saved_def_for_hero[%hero] then
                    NHF_ChangeHeroStat(%hero, STAT_DEFENCE, temp_def - olotan_spec.saved_def_for_hero[%hero], 5.0)
                    olotan_spec.saved_def_for_hero[%hero] = temp_def
                end
                sleep()
            end
        end)
    end
end)