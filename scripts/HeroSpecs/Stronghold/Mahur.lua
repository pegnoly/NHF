--NHF--------------Махур---------------------
mahur_spec =
{
    heroes = {'Mahur', 'Mahur_copy_1', 'Mahur_copy_2', 'Mahur_copy_3', 'Mahur_copy_4', 'Mahur_copy_5', 'Mahur_copy_6', 'Mahur_copy_7', 'Mahur_copy_8'},
    lvl_divisor = 6
}

function  error_NHF_Mahur_F ()
	print("error:NHF_Mahur_F")
end

AddEvent(new_day_events, 'NHF_mahur_spec_new_day',
function(day)
    for hero, alive in HEROES_ALIVE do
        if hero and alive and contains(mahur_spec.heroes, hero) then
            local tier = ceil(GetHeroLevel(hero) / mahur_spec.lvl_divisor)
            startThread(DefaultCreatureGrow, hero, TOWN_STRONGHOLD, tier, 1)
        end
    end
end)