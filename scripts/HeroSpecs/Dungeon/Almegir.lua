----------------�����--------------------------
NHF_Almegir_k = -1;
NHF_Almegir_mp = -1;
NHF_Almegir_mana = -1;
function  error_NHF_Almegir_F ()
	print("error:NHF_Almegir_F");
end;

AddEvent(add_hero_events, 'NHF_almegir_add_hero',
function(hero)
  if hero == 'Almegir' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Almegir') then
        	errorHook(error_NHF_Almegir_F);
        	local temp_k = GetHeroStat("Almegir", STAT_KNOWLEDGE);
        	local temp_mp = GetHeroStat("Almegir", STAT_MOVE_POINTS);
        	local temp_mana = GetHeroStat("Almegir", STAT_MANA_POINTS);
        	local temp_mana_max = temp_k*10;
        	if GetHeroSkillMastery("Almegir", PERK_INTELLIGENCE) == true then
        		temp_mana_max = temp_k*15;
        	end;
        	if  (temp_k == NHF_Almegir_k) and ((temp_mp == 0) and (temp_mp < NHF_Almegir_mp) and (NHF_Almegir_mp >= 2500 )) and ((temp_mana > NHF_Almegir_mana) and (temp_mana == temp_mana_max) ) then --and (NHF_Almegir_mana < temp_mana_max)
        		local temp_knowledge = GetHeroStat("Almegir", STAT_KNOWLEDGE)*10;
        		ChangeHeroStat("Almegir", STAT_KNOWLEDGE, temp_knowledge);
        		sleep(NHF_slep_singl);
        		local count_pribavka_mana = ceil(GetHeroStat("Almegir", STAT_MANA_POINTS)*NHF_Almegir_percent);
        		ChangeHeroStat("Almegir",STAT_MANA_POINTS, count_pribavka_mana);
        		sleep(NHF_slep_singl);
        		ChangeHeroStat("Almegir", STAT_KNOWLEDGE, -temp_knowledge);
        		sleep(NHF_slep_singl);
        		local temp_name = NHF_tempName_F("Almegir");
        		startThread(NHF_ShowFlyMessage, {NHF_Add_mana_textPath;add_mana=count_pribavka_mana},temp_name,5);
        	end;
        	NHF_Almegir_k = temp_k;
        	NHF_Almegir_mp = temp_mp;
        	NHF_Almegir_mana = temp_mana;
        end
      	sleep()
      end
    end)
  end
end)