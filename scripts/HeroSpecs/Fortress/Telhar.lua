--NHF----------------Телхар--------------------
telhar_spec = 
{
    heroes = {'Telhar', 'Telhar_copy_1', 'Telhar_copy_2', 'Telhar_copy_3', 'Telhar_copy_4', 'Telhar_copy_5', 'Telhar_copy_6', 'Telhar_copy_7', 'Telhar_copy_8'},
    saved_def_for_hero = {},
    lvl_multiplier = 2
}

function  error_NHF_Telhar_F ()
	print("error:NHF_Telhar_F")
end

AddEvent(map_loading_events, 'NHF_telhar_spec_init',
function()
    for i, hero in telhar_spec.heroes do
        telhar_spec.saved_def_for_hero[hero] = 0
    end
end)

AddEvent(combat_results_events, 'NHF_telhar_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(telhar_spec.heroes, winner) then
        telhar_spec.saved_def_for_hero[winner] = 0
    end
end)

AddEvent(add_hero_events, 'NHF_telhar_spec_add_hero',
function(hero)
    if contains(telhar_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    local stacks_count = len(table.pack(GetHeroCreaturesTypes(%hero)))
                    local temp_def = ceil(GetHeroLevel(%hero) * telhar_spec.lvl_multiplier / stacks_count)
                    if temp_def ~= telhar_spec.saved_def_for_hero[%hero] then
                        GiveHeroBattleBonus(%hero, HERO_BATTLE_BONUS_DEFENCE, temp_def - telhar_spec.saved_def_for_hero[%hero])
                        telhar_spec.saved_def_for_hero[%hero] = temp_def
                    end
                end
                sleep()
            end
        end)
    end
end)