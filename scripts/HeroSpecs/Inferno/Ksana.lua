--NHF----------------Ксана---------------------
ksana_spec =
{
    heroes = {'Ksana', 'Ksana_copy_1', 'Ksana_copy_2', 'Ksana_copy_3', 'Ksana_copy_4', 'Ksana_copy_5', 'Ksana_copy_6', 'Ksana_copy_7', 'Ksana_copy_8'},
    lvls_for_sp = 3,
}

function  error_NHF_Ksana_F ()
	print("error:NHF_Ksana_F");
end;

AddEvent(level_up_events, 'NHF_ksana_spec_lvl_up',
function(hero)
    if contains(ksana_spec.heroes, hero) then
        if mod(GetHeroLevel(hero), ksana_spec.lvls_for_sp) == 0 then
  	        NHF_ChangeHeroStat(hero, STAT_SPELL_POWER, 1)
  	        sleep(NHF_slep_singl)
        end
    end
end)