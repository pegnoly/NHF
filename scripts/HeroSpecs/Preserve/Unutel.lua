--NHF---------------Унутель-------------------
unutel_spec =
{
    heroes = {'Unutel', 'Unutel_copy_1', 'Unutel_copy_2', 'Unutel_copy_3', 'Unutel_copy_4', 'Unutel_copy_5', 'Unutel_copy_6', 'Unutel_copy_7', 'Unutel_copy_8'},
    stats_to_add = 1
}

function  error_NHF_Unutel_F ()
	print("error:NHF_Unutel_F")
end

AddEvent(add_hero_events, 'NHF_unutel_spec_add_hero',
function(hero)
    if contains(unutel_spec.heroes, hero) then
		GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_SPEED, unutel_spec.stats_to_add)
		GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_INITIATIVE, unutel_spec.stats_to_add)
    end
end)

AddEvent(respawn_hero_events, 'NHF_unutel_spec_respawn',
function(hero)
    if contains(unutel_spec.heroes, hero) then
		GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_SPEED, unutel_spec.stats_to_add)
		GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_INITIATIVE, unutel_spec.stats_to_add)
    end
end)

AddEvent(combat_results_events, 'NHF_unutel_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(unutel_spec.heroes, winner) then
        GiveHeroBattleBonus(winner, HERO_BATTLE_BONUS_SPEED, unutel_spec.stats_to_add)
        GiveHeroBattleBonus(winner, HERO_BATTLE_BONUS_INITIATIVE, unutel_spec.stats_to_add)
    end
end)