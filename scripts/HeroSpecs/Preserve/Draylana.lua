--NHF_E--------------��������-----------------------
NHF_Draylana_textPath = "/MapObjects/Preserve/NewHeroes/Draylana/";
NHF_Draylana_index_battle_next = -1;
NHF_Draylana_mana_temp = 0;
function  error_NHF_Draylana_F ()
	print("error:NHF_Draylana_F");
end;

AddEvent(combat_results_events, 'NHF_draylana_combat_result',
function(fight_id)
  errorHook(error_NHF_Draylana_F);
  if (GetSavedCombatArmyHero(fight_id, 1)== "Draylana") and (NHF_Draylana_index_battle_next ~= fight_id) then
    NHF_Draylana_index_battle_next = fight_id;
	local temp_name = NHF_tempName_F("Draylana");
    local mana_trata = NHF_Draylana_mana_temp - GetHeroStat("Draylana", STAT_MANA_POINTS);
    if mana_trata >0 then
       local mana_prirost =  ceil(mana_trata*NHF_Draylana_persent);
       local temp_knowledge = GetHeroStat("Draylana", STAT_KNOWLEDGE)*10;
       ChangeHeroStat("Draylana", STAT_KNOWLEDGE, temp_knowledge);
       sleep(NHF_slep_singl);
       ChangeHeroStat("Draylana", STAT_MANA_POINTS, mana_prirost);
	   sleep(NHF_slep_singl);
       ChangeHeroStat("Draylana", STAT_KNOWLEDGE, -temp_knowledge);
	   sleep(NHF_slep_singl);
	   startThread(NHF_ShowFlyMessage,{NHF_Draylana_textPath.."message.txt";p=mana_prirost}, temp_name,5);
	   --startThread(NHF_ShowFlyMessage, NHF_rawtext_standart("���� + "..mana_prirost),temp_name,5);
    end;
  else
    if IsHeroAlive('Draylana') then
      NHF_Draylana_mana_temp = GetHeroStat("Draylana", STAT_MANA_POINTS);
    end
  end;
end)