--NHF----------------Умберто-----------------------	
umberto_spec =
{
    path = "/MapObjects/Haven/NewHeroes/Umberto/",
    heroes = {'Umberto', 'Umberto_copy_1', 'Umberto_copy_2', 'Umberto_copy_3', 'Umberto_copy_4', 'Umberto_copy_5', 'Umberto_copy_6', 'Umberto_copy_7', 'Umberto_copy_8'},
}
NHF_Umberto_textPath = "/MapObjects/Haven/NewHeroes/Umberto/";
NHF_Umberto_ostatok_temp = 0;
NHF_Umberto_def_max = 0;
function  error_NHF_Umberto_F ()
	print("error:NHF_Umberto_F");
end;
AddEvent(add_hero_events, 'NHF_umberto_thread_start',
function(hero)
  if hero == 'Umberto' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Umberto') then
        	local temp_name = NHF_tempName_F("Umberto");
        	local NHF_Umberto_def_max_temp = GetHeroStat("Umberto", STAT_DEFENCE);
        	if NHF_Umberto_def_max < NHF_Umberto_def_max_temp then
        	   local delta_def = NHF_Umberto_def_max_temp - NHF_Umberto_def_max + NHF_Umberto_ostatok_temp;
        	   NHF_Umberto_def_max = NHF_Umberto_def_max_temp;
        	   NHF_Umberto_ostatok_temp = mod(delta_def,NHF_Umberto_percent);
        	   local delta_spell_power = floor(delta_def/NHF_Umberto_percent);
        	   if delta_spell_power > 0 then
        		 ChangeHeroStat("Umberto", STAT_SPELL_POWER,delta_spell_power );
        		 sleep(NHF_slep_singl);
        		 startThread(NHF_ShowFlyMessage, {NHF_Umberto_textPath.."NHF_Umberto_prirost.txt";prirost=delta_spell_power},temp_name , 5);
        	   end;
        	end;
        end
      	sleep()
      end
    end)
  end
end)