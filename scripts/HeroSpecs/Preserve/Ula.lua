--NHF--------------------���--------------------
ula_spec =
{
    heroes = {'Ula', 'Ula_copy_1', 'Ula_copy_2', 'Ula_copy_3', 'Ula_copy_4', 'Ula_copy_5', 'Ula_copy_6', 'Ula_copy_7', 'Ula_copy_8'},
    saved_mana_for_hero = {}
}

NHF_Ula_textPath = "/MapObjects/Preserve/NewHeroes/Ula/";
NHF_Ula_index_battle_next = -1;
NHF_Ula_mana_temp = 0;
function  error_NHF_Ula_F ()
	print("error:NHF_Ula_F");
end;

AddEvent(combat_results_events, 'NHF_ula_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(ula_spec.heroes, winner) then
		local temp_name = NHF_tempName_F(winner)
		local gems = GetPlayerResource(GetObjectOwner(temp_name), GEM)
		if mana_plus > (NHF_Ula_mana_temp - GetHeroStat("Ula", STAT_MANA_POINTS)) then 
			mana_plus = NHF_Ula_mana_temp - GetHeroStat("Ula", STAT_MANA_POINTS); 
		end;			
		if mana_plus > 0 then
			local mana_prirost =  ceil(mana_plus*NHF_Ula_persent);
			local temp_knowledge = GetHeroStat("Ula", STAT_KNOWLEDGE)*10;
			ChangeHeroStat("Ula", STAT_KNOWLEDGE, temp_knowledge);
			sleep(NHF_slep_singl);
			ChangeHeroStat("Ula", STAT_MANA_POINTS, mana_prirost);
			sleep(NHF_slep_singl);
			ChangeHeroStat("Ula", STAT_KNOWLEDGE, -temp_knowledge);
			sleep(NHF_slep_singl);
			startThread(NHF_ShowFlyMessage,{NHF_Ula_textPath.."message.txt";p=mana_prirost}, temp_name,5);
			--startThread(NHF_ShowFlyMessage, NHF_rawtext_standart("���� + "..mana_prirost),temp_name,5);
		end;
	else
		NHF_Ula_mana_temp  = GetHeroStat("Ula", STAT_MANA_POINTS);
	end;	   
end)