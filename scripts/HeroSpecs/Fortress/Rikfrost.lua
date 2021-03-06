--NHF----------------Рикфрост----------------------
NHF_Rikfrost_textPath = "/MapObjects/Dwarves/NewHeroes/Rikfrost/";
NHF_Rikfrost_index_battle_next = -1;
NHF_Rikfrost_get_mana = 0;
function  error_NHF_Rikfrost_F ()
	print("error:NHF_Rikfrost_F");
end;

AddEvent(combat_results_events, 'NHF_rikfrost_combat_result',
function(fight_id)
	if (GetSavedCombatArmyHero(fight_id, 1)== "Rikfrost") and (NHF_Rikfrost_index_battle_next ~= fight_id) then
		NHF_Rikfrost_index_battle_next = fight_id;
		local temp_name = NHF_tempName_F("Rikfrost");
    errorHook(error_NHF_Rikfrost_F);
  	local get_mana = NHF_Rikfrost_get_mana;
		local count_pribavka_mana =  ceil((get_mana-GetHeroStat("Rikfrost", STAT_MANA_POINTS))/2);
		if count_pribavka_mana > 0 then
			local temp_knowledge = GetHeroStat("Rikfrost", STAT_KNOWLEDGE)*10;
			ChangeHeroStat("Rikfrost", STAT_KNOWLEDGE, temp_knowledge);
			sleep(NHF_slep_singl);
			ChangeHeroStat("Rikfrost", STAT_MANA_POINTS, count_pribavka_mana);
			sleep(NHF_slep_singl);
			ChangeHeroStat("Rikfrost", STAT_KNOWLEDGE, -temp_knowledge);
			sleep(NHF_slep_singl);			
			startThread(NHF_ShowFlyMessage,{NHF_Rikfrost_textPath.."message.txt";p=count_pribavka_mana}, temp_name,5);
			--startThread(NHF_ShowFlyMessage, NHF_rawtext_standart("����: +"..count_pribavka_mana), temp_name,5);
		end;
	end;
	NHF_Rikfrost_get_mana = GetHeroStat("Rikfrost", STAT_MANA_POINTS);
end)