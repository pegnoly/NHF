--NHF--------------ВИЛЬГЕЛЬМ----------------------
wilhelm_spec =
{
  -- таблица героев, использующих спецу
  heroes = {'Wilhelm', 'Wilhelm_copy_1', 'Wilhelm_copy_2', 'Wilhelm_copy_3', 'Wilhelm_copy_4', 'Wilhelm_copy_5', 'Wilhelm_copy_6', 'Wilhelm_copy_7', 'Wilhelm_copy_8'},
  -- добавочное колдовство
  sp_to_add = 1
}

NHF_mass_Wilhelm =
{
["SKILL_DARK_MAGIC"]={{11,"Ослабление"},{12,"Замедление"},{13,"Разрушащий луч"},{14,"Чума"},{15,"Немощность"}},
["LIGHT_MAGIC"]={{23,"Божественная сила"},{24,"Ускорение"},{25,"Каменная кожа"},{280,"Регенерация"},{28,"Карающий удар"}}
};
function  error_NHF_Wilhelm_F ()
	print("error:NHF_Wilhelm_F");
end;

AddEvent(add_hero_events, 'NHF_wilhelm_thread_start',
function(hero)
  if contains(wilhelm_spec_heroes, hero) then
    startThread(
    function()
      while 1 do
        if IsHeroAlive(%hero) then
          errorHook(error_NHF_Wilhelm_F);
          local temp_name = NHF_tempName_F(%hero);
          local mass_spell_ShowFlyMessage = {};
        	for i, spell in  NHF_mass_Wilhelm.SKILL_DARK_MAGIC do
        		if not((KnowHeroSpell(%hero, NHF_mass_Wilhelm.SKILL_DARK_MAGIC[i][1]) == true) and (KnowHeroSpell(%hero, NHF_mass_Wilhelm.LIGHT_MAGIC[i][1]) == true)) then
        			if (KnowHeroSpell(%hero, NHF_mass_Wilhelm.SKILL_DARK_MAGIC[i][1]) == true) or (KnowHeroSpell(%hero, NHF_mass_Wilhelm.LIGHT_MAGIC[i][1]) == true) then
        				local temp_name = NHF_tempName_F(%hero);
        				if (KnowHeroSpell(%hero, NHF_mass_Wilhelm.SKILL_DARK_MAGIC[i][1]) == true) then
        					TeachHeroSpell(%hero, NHF_mass_Wilhelm.LIGHT_MAGIC[i][1]);
        					mass_spell_ShowFlyMessage[NHF_mass_Wilhelm.LIGHT_MAGIC[i][1]] = 1;
        					NHF_ChangeHeroStat(%hero, STAT_SPELL_POWER, wilhelm_spec.sp_to_add);
        					sleep(NHF_slep_singl);
        				else
        					TeachHeroSpell(%hero, NHF_mass_Wilhelm.SKILL_DARK_MAGIC[i][1]);
        					mass_spell_ShowFlyMessage[NHF_mass_Wilhelm.SKILL_DARK_MAGIC[i][1]] = 1;
        					NHF_ChangeHeroStat(%hero, STAT_SPELL_POWER, wilhelm_spec.sp_to_add);
        					sleep(NHF_slep_singl);
        				end;
        			end;
        		end;
        	end;
        	local j = 2;
        	for i, value in mass_spell_ShowFlyMessage do
        		j = j + 2;
        		sleep(NHF_slep_singl+j);
        		startThread(NHF_ShowFlyMessage, NHF_GetSpellName(i,"+ "), temp_name , j);
        	end;
        end
        sleep()
      end
    end)
  end
end)