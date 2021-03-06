--NHF----------------Рива-----------------------
reeva_spec =
{
    heroes = {'Reeva', 'Reeva_copy_1', 'Reeva_copy_2', 'Reeva_copy_3', 'Reeva_copy_4', 'Reeva_copy_5', 'Reeva_copy_6', 'Reeva_copy_7', 'Reeva_copy_8'},
    gem_per_lvl = 2
}

function  error_NHF_Reeva_F ()
	print("error:NHF_Reeva_F")
end

AddEvent(level_up_events, 'NHF_reeva_spec_lvl_up',
function(hero)
    if contains(reeva_spec.heroes, hero) then
  	    errorHook(error_NHF_Reeva_F)
  		NHF_ChangeResourceHero(GEM, GetHeroLevel(hero) * reeva_spec.gem_per_lvl, hero)
  		sleep(NHF_slep_singl)
  	end
end)