--NHF_E----------------Олхар---------------------
olhar_spec =
{
    heroes = {'Olhar', 'Olhar_copy_1', 'Olhar_copy_2', 'Olhar_copy_3', 'Olhar_copy_4', 'Olhar_copy_5', 'Olhar_copy_6', 'Olhar_copy_7', 'Olhar_copy_8'},
    stat_active_on_hero = {},
    lvl_divisor = 3
}

function  error_NHF_Olhar_F ()
	print("error:NHF_Olhar_F")
end

AddEvent(map_loading_events, 'NHF_olhar_spec_init',
function()
    for i, hero in olhar_spec.heroes do
        olhar_spec.stat_active_on_hero[hero] = {}
    end
end)

AddEvent(add_hero_events, 'NHF_olhar_spec_add_hero',
function(hero)
    if contains(olhar_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    local temp_name = NHF_tempName_F(%hero)
                    --
                    if not olhar_spec.stat_active_on_hero[%hero][STAT_DEFENCE] then
                        if GetHeroTown(%hero) or IsInDungeon(temp_name) then
                            local def_to_add = ceil(GetHeroLevel(%hero) / olhar_spec.lvl_divisor)
                            ChangeHeroStat(%hero, STAT_DEFENCE, def_to_add)
                            olhar_spec.stat_active_on_hero[%hero][STAT_DEFENCE] = def_to_add
                        end
                    else
                        if not (GetHeroTown(%hero) or IsInDungeon(temp_name)) then
                            ChangeHeroStat(%hero, STAT_DEFENCE, -olhar_spec.stat_active_on_hero[%hero][STAT_DEFENCE])
                            olhar_spec.stat_active_on_hero[%hero][STAT_DEFENCE] = nil
                        end
                    end
                    --
                    if not olhar_spec.stat_active_on_hero[%hero][STAT_ATTACK] then
                        if not (GetHeroTown(%hero) or IsInDungeon(temp_name)) then
                            local atk_to_add = ceil(GetHeroLevel(%hero) / olhar_spec.lvl_divisor)
                            ChangeHeroStat(%hero, STAT_ATTACK, atk_to_add)
                            olhar_spec.stat_active_on_hero[%hero][STAT_ATTACK] = atk_to_add
                        end
                    else
                        if GetHeroTown(%hero) or IsInDungeon(temp_name) then
                            ChangeHeroStat(%hero, STAT_ATTACK, -olhar_spec.stat_active_on_hero[%hero][STAT_ATTACK])
                            olhar_spec.stat_active_on_hero[%hero][STAT_ATTACK] = nil
                        end
                    end    
                    sleep()
                end
            end
        end)
    end
end)

AddEvent(level_up_events, 'NHF_olhar_spec_lvl_up',
function(hero)
    if contains(olhar_spec.heroes, hero) and mod(GetHeroLevel(hero), olhar_spec.lvl_divisor) then
        if olhar_spec.stat_active_on_hero[hero][STAT_ATTACK] then
            ChangeHeroStat(hero, STAT_ATTACK, 1)
            olhar_spec.stat_active_on_hero[hero][STAT_ATTACK] = olhar_spec.stat_active_on_hero[hero][STAT_ATTACK] + 1
        else
            ChangeHeroStat(hero, STAT_DEFENCE, 1)
            olhar_spec.stat_active_on_hero[hero][STAT_DEFENCE] = olhar_spec.stat_active_on_hero[hero][STAT_DEFENCE] + 1
        end
    end   
end)