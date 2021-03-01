----------------Ниброс--------------------
jazaz_spec = 
{
    levels_for_luck = 6
}

function  error_NHF_Jazaz_F ()
	print("error:NHF_Jazaz_F");
end;

AddEvent(add_hero_events, 'NHF_jazaz_spec_add_hero',
function(hero)
    if GetHeroSpec(hero) == HERO_SPEC_FLAGBEARER_OF_DARKNESS then
        errorHook(error_NHF_Jazaz_F)
        GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_LUCK, floor(GetHeroLevel(hero) / jazaz_spec.levels_for_luck))
    end
end)

AddEvent(respawn_hero_events, 'NHF_jazaz_spec_respawn_hero',
function(hero)
    if GetHeroSpec(hero) == HERO_SPEC_FLAGBEARER_OF_DARKNESS then
        errorHook(error_NHF_Jazaz_F)
        GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_LUCK, floor(GetHeroLevel(hero) / jazaz_spec.levels_for_luck))
    end
end)

AddEvent(combat_results_events, 'NHF_jazaz_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and (GetHeroSpec(winner) == HERO_SPEC_FLAGBEARER_OF_DARKNESS) then
        GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_LUCK, floor(GetHeroLevel(hero) / jazaz_spec.levels_for_luck))
    end
end)

AddEvent(level_up_events, 'NHF_jazaz_spec_lvl_up',
function(hero)
    if GetHeroSpec(hero) == HERO_SPEC_FLAGBEARER_OF_DARKNESS then    
        local level = GetHeroLevel(hero)
        if floor(level / jazaz_spec.levels_for_luck) > floor((level - 1) / jazaz_spec.levels_for_luck) then
            GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_LUCK, 1)
        end
    end
end)