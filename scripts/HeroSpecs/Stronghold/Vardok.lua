--NHF----------------Вардок--------------------
vardok_spec =
{
    heroes = {'Vardok', 'Vardok_copy_1', 'Vardok_copy_2', 'Vardok_copy_3', 'Vardok_copy_4', 'Vardok_copy_5', 'Vardok_copy_6', 'Vardok_copy_7', 'Vardok_copy_8'},
    lvls_for_morale = 6
}

function  error_NHF_Vardok_F ()
	print("error:NHF_Vardok_F")
end

AddEvent(add_hero_events, 'NHF_vardok_spec_add_hero',
function(hero)
    if contains(vardok_spec.heroes, hero) then
        GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_MORALE, 1 + floor(GetHeroLevel(hero) / vardok_spec.lvls_for_morale))
    end
end)

AddEvent(respawn_hero_events, 'NHF_vardok_spec_respawn',
function(hero)
    if contains(vardok_spec.heroes, hero) then
        GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_MORALE, 1 + floor(GetHeroLevel(hero) / vardok_spec.lvls_for_morale))
    end
end)

AddEvent(combat_results_events, 'NHF_vardok_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(vardok_spec.heroes, winner) then
        GiveHeroBattleBonus(winner, HERO_BATTLE_BONUS_MORALE, 1 + floor(GetHeroLevel(winner) / vardok_spec.lvls_for_morale))
    end    
end)

AddEvent(level_up_events, 'NHF_vardok_spec_lvl_up',
function(hero)
    if contains(vardok_spec.heroes, hero) then
        if mod(GetHeroLevel(hero), vardok_spec.lvls_for_morale) == 0 then
            GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_MORALE, 1)
        end
    end
end)