--NHF----------------Халфас--------------------
halfas_spec =
{
    path = "/MapObjects/Inferno/NewHeroes/Halfas/",
    heroes = {'Halfas', 'Halfas_copy_1', 'Halfas_copy_2', 'Halfas_copy_3', 'Halfas_copy_4', 'Halfas_copy_5', 'Halfas_copy_6', 'Halfas_copy_7', 'Halfas_copy_8'},
    lvl_divisor = 5,
    saved_attack_for_hero = {}
}

function  error_NHF_Halfas_F ()
	print("error:NHF_Halfas_F");
end;

AddEvent(map_loading_events, 'NHF_halfas_spec_init',
function()
    for i, hero in halfas_spec.heroes do
        halfas_spec.saved_attack_for_hero[hero] = 0
    end
end)

AddEvent(add_hero_events, 'NHF_halfas_spec_add_hero',
function(hero)
    if contains(halfas_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    errorHook(error_NHF_Halfas_F)
                    local temp_name = NHF_tempName_F(%hero)
                    local lvls_count = 0
                    for player = PLAYER_1, PLAYER_8 do
                        if IsActivePlayer(player) and (GetPlayerTeam(player) == GetPlayerTeam(GetObjectOwner(temp_name))) then
                            for i, phero in GetPlayerHeroes(player) do
                                if GetHeroClass(phero) == HERO_CLASS_DEMON_LORD then
                                    lvls_count = lvls_count + GetHeroLevel(phero)
                                end
                            end
                        end
                    end
                    --
                    local temp_bonus = ceil(lvls_count / halfas_spec.lvl_divisor)
                    if temp_bonus ~= halfas_spec.saved_attack_for_hero[%hero] then
                        ChangeHeroStat(%hero, STAT_ATTACK, halfas_spec.saved_attack_for_hero[%hero] - temp_bonus)
                        sleep(NHF_slep_singl)
                        startThread(ShowFlyingSign, {halfas_spec.path.."message.txt"; p = (halfas_spec.saved_attack_for_hero[%hero] - temp_bonus)}, %hero, GetObjectOwner(%hero), 5.0)
                        halfas_spec.saved_attack_for_hero[%hero] = temp_bonus
                    end
                end
                sleep()
            end
        end)
    end
end)