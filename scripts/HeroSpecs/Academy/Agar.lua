--NHF_E--------------Агар---------------------
agar_spec =
{
    heroes = {'Agar', 'Agar_copy_1', 'Agar_copy_2', 'Agar_copy_3', 'Agar_copy_4', 'Agar_copy_5', 'Agar_copy_6', 'Agar_copy_7', 'Agar_copy_8'},
    grow_coeff = 1/6
}

function  error_NHF_Agar_F ()
	print("error:NHF_Agar_F")
end

AddEvent(new_day_events, 'NHF_agar_new_day',
function(day)
    if mod(day, 7) == 1 and day ~= 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(agar_spec.heroes, hero) then
                startThread(DefaultCreatureGrow, hero, TOWN_ACADEMY, 6, GetHeroLevel(hero) * agar_spec.grow_coeff)
            end
        end
    end
end)