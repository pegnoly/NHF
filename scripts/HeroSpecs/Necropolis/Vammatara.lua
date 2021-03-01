--NHF----------------Вамматара-----------------???
vamma_spec =
{
    heroes = {'Vamma', 'Vamma_copy_1', 'Vamma_copy_2', 'Vamma_copy_3', 'Vamma_copy_4', 'Vamma_copy_5', 'Vamma_copy_6', 'Vamma_copy_7', 'Vamma_copy_8'},
    targets_for_hero = {},
    base_distance = 10,
    lvl_divisor = 5
}

function  error_NHF_Vamma_F ()
	print("error:NHF_Vamma_F")
end

AddEvent(map_loading_events, 'NHF_vamma_spec_init',
function()
    for i, hero in vamma_spec.heroes do
        vamma_spec.targets_for_hero[hero] = {}
    end
end)

AddEvent(add_hero_events, 'NHF_vamma_spec_add_hero',
function(hero)
    if contains(vamma_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    errorHook(error_NHF_Vamma_F);
                    local  temp_name = NHF_tempName_F(%hero)
                    for player = PLAYER_1, PLAYER_8 do
                        if IsActivePlayer(player) and (GetPlayerTeam(player) ~= GetPlayerTeam(GetObjectOwner(temp_name))) then
                            for i, phero in GetPlayerHeroes(player) do
                                if not vamma_spec.targets_for_hero[%hero][phero] then
                                    local dist = GetDistance(phero, temp_name)
                                    if dist and dist <= vamma_spec.base_distance then
                                        vamma_spec.targets_for_hero[%hero][phero] = 1
                                        GiveHeroBattleBonus(phero, HERO_BATTLE_BONUS_LUCK, -ceil((GetHeroLevel(%hero)) / vamma_spec.lvl_divisor))
                                        startThread(PlayVisualEffect,"/Effects/_(Effect)/Spells/LuckBad.xdb#xpointer(/Effect)", phero, "", 0, 0, 0, 0, 0);
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

AddEvent(combat_results_events, 'NHF_vamma_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    local loser = GetSavedCombatArmyHero(fight_id, 0)
    --
    for i, party in {winner, loser} do
        if party then
            for j, hero in vamma_spec.heroes do
                for target, active in vamma_spec.targets_for_hero[hero] 
                    if target == party and active then
                        vamma_spec.targets_for_hero[hero][target] = nil
                    end
                end
            end
        end
    end
    --
end)