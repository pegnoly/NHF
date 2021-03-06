--NHF----------------Сеф--------------------
sef_spec =
{
    heroes = {'Sef', 'Sef_copy_1', 'Sef_copy_2', 'Sef_copy_3', 'Sef_copy_4', 'Sef_copy_5', 'Sef_copy_6', 'Sef_copy_7', 'Sef_copy_8'},
    after_fight_update_for_hero = {},
    saved_def_for_hero = {},
    treants_for_def = 2
}

function  error_NHF_Sef_F ()
	print("error:NHF_Sef_F");
end;

AddEvent(map_loading_events, 'NHF_sef_spec_init'
function()
    for i, hero in sef_spec.heroes do
        sef_spec.saved_def_for_hero[hero] = 0
    end
end)

AddEvent(combat_results_events, 'NHF_sef_spec_combat_result',
function(fight_id)
    local winner  = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(sef_spec.heroes, winner) then
      sef_spec.saved_def_for_hero[winner] = 0
    end
end

AddEvent(add_hero_events, 'NHF_set_add_hero',
function(hero)
    if contains(sef_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    local treants = GetHeroCreaturesByTier(%hero, TOWN_PRESERVE, 6)
                    if treants then
                        local count = 0
                        for i, treant in treants do
                            count = count + GetHeroCreatures(%hero, treant)
                        end
                        count = count / sef_spec.treants_for_def
                        if count > ceil(GetHeroLevel(%hero) / 2) then
                            count = ceil(GetHeroLevel(%hero) / 2)
                        end
                        if (count ~= sef_spec.saved_def_for_hero[%hero]) then
                            GiveHeroBattleBonus(%hero, HERO_BATTLE_BONUS_DEFENCE, sef_spec.saved_def_for_hero[%hero] - count)
                            sef_spec.saved_def_for_hero[%hero] = count
                        end
                    end
                end
                sleep()
            end
        end)
    end
end)
