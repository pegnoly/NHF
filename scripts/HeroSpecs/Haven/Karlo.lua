--NHF_E-----------Карл----------------------------
karl_spec =
{
    heroes = {'KarloffNHF', 'KarloffNHF_copy_1', 'KarloffNHF_copy_2', 'KarloffNHF_copy_3', 'KarloffNHF_copy_4', 'KarloffNHF_copy_5', 'KarloffNHF_copy_6', 'KarloffNHF_copy_7', 'KarloffNHF_copy_8'},
    ore_per_lvl = 1, -- (3?)
}

function  error_NHF_KarloffNHF_F ()
	print("error:NHF_KarloffNHF_F");
end;

AddEvent(new_day_events, 'NHF_karlo_spec_new_day',
function(day)
    if mod(day, 7) == 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(karl_spec.heroes, hero) then
                errorHook(error_NHF_KarloffNHF_F)
                NHF_ChangeResourceHero(ORE, ceil(karl_spec.ore_per_lvl * GetHeroLevel(hero)), hero)
                sleep(NHF_slep_singl)
            end
        end
    end
end)