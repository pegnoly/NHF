--NHF-------------Муадгир---------------------
muadgir_spec = 
{
    heroes = {'Muadgir', 'Muadgir_copy_1', 'Muadgir_copy_2', 'Muadgir_copy_3', 'Muadgir_copy_4', 'Muadgir_copy_5', 'Muadgir_copy_6', 'Muadgir_copy_7', 'Muadgir_copy_8'},
    lvls_for_def = 4
}

function  error_NHF_Muadgir_F ()
	  print("error:NHF_Muadgir_F")
end

AddEvent(level_up_events, 'NHF_muadgir_spec_lvl_up',
function(hero)
    if contains(muadgir_spec.heroes, hero) and (mod(GetHeroLevel(hero), muadgir_spec.lvls_for_def) == 0) then
        startThread(MCCS_ChangeHeroStat, hero, STAT_DEFENCE, 1)
    end
end)