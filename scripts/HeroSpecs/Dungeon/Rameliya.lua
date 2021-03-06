--NHF_E----------------------Рамелия---------------------
rameliya_spec =
{
    heroes = {'Rameliya', 'Rameliya_copy_1', 'Rameliya_copy_2', 'Rameliya_copy_3', 'Rameliya_copy_4', 'Rameliya_copy_5', 'Rameliya_copy_6', 'Rameliya_copy_7', 'Rameliya_copy_8'},
    res_per_lvl = 1
}

function  error_NHF_Rameliya_F ()
	print("error:NHF_Rameliya_F")
end

AddEvent(new_day_events, 'NHF_rameliya_spec_new_day',
function(day)
    if mod(day, 7) == 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(rameliya_spec.heroes, hero) then
                NHF_ChangeResourceHero(MERCURY, ceil(rameliya_spec.res_per_lvl * GetHeroLevel(hero)), hero)
                sleep(NHF_slep_singl)
                NHF_ChangeResourceHero(SULFUR, ceil(rameliya_spec.res_per_lvl * GetHeroLevel(hero)), hero)
                sleep(NHF_slep_singl)
            end
        end
    end
end)