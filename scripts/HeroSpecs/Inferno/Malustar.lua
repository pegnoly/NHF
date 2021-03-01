--NHF----------------Малустар-----------------------
malustar_spec =
{
    heroes = {'Malustar', 'Malustar_copy_1', 'Malustar_copy_2', 'Malustar_copy_3', 'Malustar_copy_4', 'Malustar_copy_5', 'Malustar_copy_6', 'Malustar_copy_7', 'Malustar_copy_8'},
    sulfur_per_know = 2,
}

function  error_NHF_Malustar_F ()
	print("error:NHF_Malustar_F");
end;

AddEvent(new_day_events, 'NHF_malustar_spec_new_day',
function(day)
    if mod(day,  7) == 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(malustar_spec.heroes, hero) then
                errorHook(error_NHF_Malustar_F)
                NHF_ChangeResourceHero(SULFUR, ceil(malustar_spec.sulfur_per_know * GetHeroStat(hero, STAT_KNOWLEDGE)), hero)
                sleep(NHF_slep_singl)
            end
	    end
	end
end)