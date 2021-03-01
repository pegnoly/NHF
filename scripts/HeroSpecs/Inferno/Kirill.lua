--NHF_E-------------Кирилл--------------------
kirill_spec = 
{
    heroes = {'Kiril', 'Kiril_copy_1', 'Kiril_copy_2', 'Kiril_copy_3', 'Kiril_copy_4', 'Kiril_copy_5', 'Kiril_copy_6', 'Kiril_copy_7', 'Kiril_copy_8'},
    luck_to_add = 5
}

function  error_NHF_Kiril_F ()
	print("error:NHF_Kiril_F");
end;

AddEvent(add_hero_events, 'NHF_kiril_spec_add_hero',
function(hero)
    if contains(kirill_spec.heroes, hero) then
        GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_LUCK, kirill_spec.luck_to_add)
    end
end)

AddEvent(respawn_hero_events, 'NHF_kiril_spec_respawn',
function(hero)
    if contains(kirill_spec.heroes, hero) then
        GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_LUCK, kirill_spec.luck_to_add)
    end
end)

AddEvent(combat_results_events, 'NHF_kiril_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(kirill_spec.heroes, winner) then
        GiveHeroBattleBonus(winner, HERO_BATTLE_BONUS_LUCK, kirill_spec.luck_to_add)  
    end
 end)