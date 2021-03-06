--NHF----------------Торефин-------------------
torefin_spec =
{
    heroes = {'Torefin', 'Torefin_copy_1', 'Torefin_copy_2', 'Torefin_copy_3', 'Torefin_copy_4', 'Torefin_copy_5', 'Torefin_copy_6', 'Torefin_copy_7', 'Torefin_copy_8'},
    lvls_for_hp = 2,
    base_hp = 10,
}

NHF_Torefin_lvl_temp = 0;
NHF_Torefin_flag = 0;
NHF_Torefin_index_battle_next = -1;
function  error_NHF_Torefin_F ()
	print("error:NHF_Torefin_F");
end;

AddEvent(add_hero_events, 'NHF_torefin_spec_add_hero',
function(hero)
    if contains(torefin_spec.heroes, hero) then
        GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_HITPOINTS, torefin_spec.base_hp + floor(GetHeroLevel(hero) / torefin_spec.lvls_for_hp))
    end
end)

AddEvent(respawn_hero_events, 'NHF_torefin_spec_respawn',
function(hero)
    if contains(torefin_spec.heroes, hero) then
        GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_HITPOINTS, torefin_spec.base_hp + floor(GetHeroLevel(hero) / torefin_spec.lvls_for_hp))
    end
end)

AddEvent(combat_results_events, 'NHF_torefin_spec__combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(torefin_spec.heroes, winner) then
        GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_HITPOINTS, torefin_spec.base_hp + floor(GetHeroLevel(hero) / torefin_spec.lvls_for_hp))
    end    
end)

AddEvent(level_up_events, 'NHF_torefin_spec_lvl_up',
function(hero)
    if contains(torefin_spec.heroes, hero) then
        if mod(GetHeroLevel(hero), torefin_spec.lvls_for_hp) == 0 then
            GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_HITPOINTS, 1)
        end
    end
end)