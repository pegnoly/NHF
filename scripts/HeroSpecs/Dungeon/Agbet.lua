--NHF_E----------------Агбет-------------------
agbet_spec =
{
    heroes = {'Agbet', 'Agbet_copy_1', 'Agbet_copy_2', 'Agbet_copy_3', 'Agbet_copy_4', 'Agbet_copy_5', 'Agbet_copy_6', 'Agbet_copy_7', 'Agbet_copy_8'},

}

function  error_NHF_Agbet_F ()
	print("error:NHF_Agbet_F");
end;

AddEvent(add_hero_events, 'NHF_agbet_add_hero',
function(hero)
  if hero == 'Agbet' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Agbet') then
        	errorHook(error_NHF_Agbet_F);
        	local temp_name = NHF_tempName_F("Agbet");
        	local count = 0;
        	local j = 3;
        	for  i, id in NHF_Agbet_mass_spell_tma do
        		if id ~= nil then
        			if (KnowHeroSpell("Agbet", id) == true) then
        				TeachHeroSpell("Agbet", id);
        				count = count + 1;
        				NHF_Agbet_mass_spell_tma = NHF_del_data_mass(NHF_Agbet_mass_spell_tma, id);
        			end;
        		else
        			break;
        		end;
        	end;
        	if count > 0 then
        		for k = 1, count do
        			if length(NHF_Agbet_mass_spell_tma) > 0 then
        				local shans = 0.5;
        				for  i, id in NHF_Agbet_mass_spell_tma  do
        					if id ~= nil then
        						if (random(100)+1 <= shans*100) or (length(NHF_Agbet_mass_spell_tma) == 1) then
        							TeachHeroSpell("Agbet", id);
        							NHF_Agbet_mass_spell_tma = NHF_del_data_mass(NHF_Agbet_mass_spell_tma, id);
        							j = j + 3;
        							sleep(NHF_slep_singl);
        							startThread(NHF_ShowFlyMessage, NHF_GetSpellName(id,"+ "), temp_name,j);
        							break;
        						else
        							shans = 1;
        						end;
        					else
        						break;
        					end;
        				end;
        			end;
        		end;
        	end;
        end
        sleep()
      end
    end)
  end
end)