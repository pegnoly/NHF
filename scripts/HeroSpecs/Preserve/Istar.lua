--NHF_E---------------�����---------------------
NHF_Istar_textPath = "/MapObjects/Preserve/NewHeroes/Istar/";
NHF_Istar_index_battle_next = -1;
NHF_Istar_mana_points = 0;
NHF_Istar_mana_temp = 0;
function  error_NHF_Istar_F ()
	print("error:NHF_Istar_F");
end;

AddEvent(combat_results_events, 'NHF_istar_combat_result',
function(fight_id)
  errorHook(error_NHF_Istar_F);
  if (GetSavedCombatArmyHero(fight_id, 1)== "Istar") and (NHF_Istar_index_battle_next ~= fight_id) then
    NHF_Istar_index_battle_next = fight_id;
    local prirost =  ceil((NHF_Istar_mana_points - GetHeroStat("Istar", STAT_MANA_POINTS) + NHF_Istar_mana_temp)/NHF_Istar_percent)-1;
       if prirost < 1 then
          prirost = 0;
          NHF_Istar_mana_temp = mod((NHF_Istar_mana_points-GetHeroStat("Istar", STAT_MANA_POINTS)),NHF_Istar_percent)+ NHF_Istar_mana_temp ;
       else
          NHF_Istar_mana_temp = mod((NHF_Istar_mana_points-GetHeroStat("Istar", STAT_MANA_POINTS)),NHF_Istar_percent);
          NHF_creatures_prirost_F("Istar",prirost,NHF_mass_creatures.Preserve.L4);
    end;
  else
    if IsHeroAlive('Istar') then
      NHF_Istar_mana_points = GetHeroStat("Istar", STAT_MANA_POINTS);
    end
  end;
end)