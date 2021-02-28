--NHF_E---------------Фабрис--------------------
fabris_spec =
{
    heroes = {'Fabris', 'Fabris_copy_1', 'Fabris_copy_2', 'Fabris_copy_3', 'Fabris_copy_4', 'Fabris_copy_5', 'Fabris_copy_6', 'Fabris_copy_7', 'Fabris_copy_8'},
    ini_coeff = 5
}

function  error_NHF_Fabris_F ()
	print("error:NHF_Fabris_F");
end;

AddEvent(add_hero_events, 'NHF_fabris_spec_add_hero',
function(hero)
    if contains(fabris_spec.heroes, hero) then
        errorHook(error_NHF_Fabris_F)
        GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_INITIATIVE, fabris_spec.ini_coeff)
    end
end)

AddEvent(respawn_hero_events, 'NHF_fabris_spec_respawn',
function(hero)
    if contains(fabris_spec.heroes, hero) then
        errorHook(error_NHF_Fabris_F)
        GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_INITIATIVE, fabris_spec.ini_coeff)
    end
end)

AddEvent(combat_results_events, 'NHF_fabris_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(fabris_spec.heroes, winner) then
        errorHook(error_NHF_Fabris_F)
        GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_INITIATIVE, fabris_spec.ini_coeff)
    end
end)