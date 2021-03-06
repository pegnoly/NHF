--NHF-----------------Кеннент--------------------
kennent_spec =
{
    heroes = {'Kennent', 'Kennent_copy_1', 'Kennent_copy_2', 'Kennent_copy_3', 'Kennent_copy_4', 'Kennent_copy_5', 'Kennent_copy_6', 'Kennent_copy_7', 'Kennent_copy_8'},
    saved_attack_for_hero = {},
    attack_per_luck = 2
}

AddEvent(map_loading_events, 'NHF_kennent_spec_init',
function()
    for i, hero in kennent_spec.heroes do
        kennent_spec.saved_attack_for_hero[hero] = 0
    end
end)

AddEvent(add_hero_events, 'NHF_kennent_spec_add_hero',
function(hero)
    if contains(kennent_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    errorHook(error_NHF_Kennent_F)
                    local temp_attack = kennent_spec.attack_per_luck * GetHeroStat(%hero, STAT_LUCK)
                    if temp_attack ~= kennent_spec.saved_attack_for_hero[%hero] then
                        MCCS_ChangeHeroStat(%hero, STAT_ATTACK, temp_attack - kennent_spec.saved_attack_for_hero[%hero])
                        kennent_spec.saved_attack_for_hero[%hero] = temp_attack
                    end
                end
                sleep()
            end
        end)
    end
end)