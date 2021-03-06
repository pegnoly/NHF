--NHF----------------Сигрун----------------------
seegrun_spec =
{
    heroes = {'Seegrun', 'Seegrun_copy_1', 'Seegrun_copy_2', 'Seegrun_copy_3', 'Seegrun_copy_4', 'Seegrun_copy_5', 'Seegrun_copy_6', 'Seegrun_copy_7', 'Seegrun_copy_8'},
	affected_heroes_for_hero = {},
	ms_reduction_for_hero = {}
}

NHF_Seegrun_textPath = "/MapObjects/Dwarves/NewHeroes/Seegrun/";
NHF_Seegrun_day = 1;
function  error_NHF_Seegrun_F ()
	print("error:NHF_Seegrun_F");
end;

AddEvent(map_loading_events, 'NHF_seegrun_spec_init',
function()
    for i, hero in seegrun_spec.heroes do
        seegrun_spec.affected_heroes_for_hero[hero] = {}
        seegrun_spec.ms_reduction_for_hero[hero] = 1
    end
end)

AddEvent(level_up_events, 'NHF_seegrun_spec_lvl_up',
function(hero)
    if contains(seegrun_spec.heroes, hero) then
        seegrun_spec.ms_reduction_for_hero[hero] = ceil(GetHeroLevel(hero) / 10)
    end
end)

AddEvent(add_hero_events, 'NHF_seegrun_spec_add_hero',
function(hero)
    if contains(seegrun_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    local temp_name = NHF_tempName_F(%hero)
                    for player = PLAYER_1, PLAYER_8 do
                        if IsActivePlayer(player) and (GetObjectOwner(%hero) ~= player) and (GetPlayerTeam(GetObjectOwner(%hero)) ~= GetPlayerTeam(player)) then
                            for i, c_hero in GetPlayerHeroes(player) do
                                if not seegrun_spec.affected_heroes_for_hero[%hero][c_hero] then
                                    if GetDistance(c_hero, temp_name) <= seegrun_spec_params.base_distance then
                                        seegrun_spec.affected_heroes_for_hero[%hero][c_hero] = 1
                                        GiveHeroBattleBonus(c_hero, HERO_BATTLE_BONUS_SPEED, -seegrun_spec.ms_reduction_for_hero[%hero])
                                    end
                                else
                                    if GetDistance(c_hero, temp_name) > seegrun_spec_params.base_distance then
                                        seegrun_spec.affected_heroes_for_hero[%hero][c_hero] = nil
                                        GiveHeroBattleBonus(c_hero, HERO_BATTLE_BONUS_SPEED, seegrun_spec.ms_reduction_for_hero[%hero])
                                    end
                                end
                            end
                        end
                    end
                end
                sleep()
            end
        end)
    end
end)