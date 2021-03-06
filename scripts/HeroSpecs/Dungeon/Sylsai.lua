--NHF----------------------Силсай--------------------
sylsai_spec = 
{
    heroes = {'Sylsai', 'Sylsai_copy_1', 'Sylsai_copy_2', 'Sylsai_copy_3', 'Sylsai_copy_4', 'Sylsai_copy_5', 'Sylsai_copy_6', 'Sylsai_copy_7', 'Sylsai_copy_8'},
    speed_to_add = 2
}

function  error_NHF_Sylsai_F ()
	print("error:NHF_Sylsai_F")
end

AddEvent(add_hero_events, 'NHF_sylsai_spec_add_hero',
function(hero)
    if contains(sylsai_spec.heroes, hero) then
        GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_SPEED, sylsai_spec.speed_to_add)
    end
end)

AddEvent(respawn_hero_events, 'NHF_sylsai_spec_respawn',
function(hero)
    if contains(sylsai_spec.heroes, hero) then
        GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_SPEED, sylsai_spec.speed_to_add)
    end
end)

AddEvent(combat_results_events, 'NHF_sylsai_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(sylsai_spec.heroes, winner) then
        GiveHeroBattleBonus(winner, HERO_BATTLE_BONUS_SPEED, sylsai_spec.speed_to_add)
    end
end)