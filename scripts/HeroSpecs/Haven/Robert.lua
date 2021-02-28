--NHF---------------Роберт--------------------

robert_spec =
{
    heroes = {'Robert', 'Robert_copy_1', 'Robert_copy_2', 'Robert_copy_3', 'Robert_copy_4', 'Robert_copy_5', 'Robert_copy_6', 'Robert_copy_7', 'Robert_copy_8'},
    gold_per_lvl = 50
}

function  error_NHF_Robert_F ()
	print("error:NHF_Robert_F");
end;

AddEvent(new_day_events, 'NHF_robert_spec_new_day',
function(day)
    for hero, alive in HEROES_ALIVE do
        errorHook(error_NHF_Robert_F);
        if hero and alive and contains(robert_spec.heroes, hero) then
            NHF_ChangeResourceHero(GOLD, GetHeroLevel(hero) * robert_spec.gold_per_lvl, hero)
  		    sleep(NHF_slep_singl)
        end
	end
end)

AddEvent(combat_results_events, 'NHF_robert_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(robert_spec.heroes, winner) then
    	errorHook(error_NHF_Robert_F);
        NHF_ChangeResourceHero(GOLD, GetHeroLevel(winner) * robert_spec.gold_per_lvl, winner)
        sleep(NHF_slep_singl)
    end
end)