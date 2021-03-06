--NHF----------------Иона-----------------------
iona_spec =
{
    heroes = {'Iona', 'Iona_copy_1', 'Iona_copy_2', 'Iona_copy_3', 'Iona_copy_4', 'Iona_copy_5', 'Iona_copy_6', 'Iona_copy_7', 'Iona_copy_8'},
    saved_sp_for_hero = {},
    know_to_sp = 3
}	

function  error_NHF_Iona_F ()
	print("error:NHF_Iona_F")
end

AddEvent(map_loading_events, 'NHF_iona_spec_init',
function()
    for i, hero in iona_spec.heroes do
        iona_spec.saved_sp_for_hero[hero] = 0
    end
end)

AddEvent(add_hero_events, 'NHF_iona_spec_add_hero',
function(hero)
    if contains(iona_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    local temp_sp = floor(GetHeroStat(%hero, STAT_KNOWLEDGE) / iona_spec.know_to_sp)
                    if temp_sp ~= iona_spec.saved_sp_for_hero[%hero] then
                        startThread(MCCS_ChangeHeroStat, %hero, STAT_SPELL_POWER, temp_sp - iona_spec.saved_sp_for_hero[%hero])
                        iona_spec.saved_sp_for_hero[%hero] = temp_sp
                    end
                end
                sleep()
            end
        end)
    end
end)