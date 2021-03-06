--NHF_E--------------Вайнирис-----------------------
vyneeris_spec =
{
    heroes = {'Vyneeris', 'Vyneeris_copy_1', 'Vyneeris_copy_2', 'Vyneeris_copy_3', 'Vyneeris_copy_4', 'Vyneeris_copy_5', 'Vyneeris_copy_6', 'Vyneeris_copy_7', 'Vyneeris_copy_8'},
    saved_ini_for_hero = {},
    uni_for_ini = 30
}

NHF_Vyneeris_week_temp = -1;
NHF_Vyneeris_index_battle_next = -1;
NHF_Vyneeris_bonus_temp = 0;
function  error_NHF_Vyneeris_F ()
	print("error:NHF_Vyneeris_F");
end;

AddEvent(map_loading_events, 'NHF_vyneeris_spec_new_day',
function()
    for i, hero in vyneeris_spec.heroes do
        vyneeris_spec.saved_ini_for_hero[hero] = 0
    end
end)

AddEvent(new_day_events, 'NHF_vyneeris_spec_new_day',
function(day)
    if mod(day, 7) == 1 and day ~= 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(vyneeris_spec.heroes, hero) then
                startThread(DefaultCreatureGrow, hero, TOWN_PRESERVE, 5, GetHeroLevel(hero) * GetCreatureGrow(TIER_TABLES[TOWN_PRESERVE][5][1]))
  		    end
    	end
    end
end)

AddEvent(combat_results_events, 'NHF_vyneeris_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(vyneeris_spec.heroes, winner) then
        vyneeris_spec.saved_ini_for_hero[winner] = 0
    end
end)

AddEvent(add_hero_events, 'NHF_vyneeris_spec_add_hero',
function(hero)
    if contains(vyneeris_spec) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    local count = 0
                    local unicorns = GetHeroCreaturesByTier(%hero, TOWN_PRESERVE, 5)
                    if unicorns then
                        for i, unicorn in unicorns do
                            count = count + GetHeroCreatures(%hero, unicorn)
                        end
                    end
                    count = floor(count / vyneeris_spec.uni_for_ini)
                    if count ~= vyneeris_spec.saved_ini_for_hero[%hero] then
                        GiveHeroBattleBonus(%hero, HERO_BATTLE_BONUS_INITIATIVE, count - vyneeris_spec.saved_ini_for_hero[%hero])
                        vyneeris_spec.saved_ini_for_hero[%hero] = count
                    end
                end
                sleep()
            end
        end)
    end
end)
