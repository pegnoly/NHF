--NHF_E---------------Рашка--------------------
rashka_spec =
{
    heroes = {'Rashka', 'Rashka_copy_1', 'Rashka_copy_2', 'Rashka_copy_3', 'Rashka_copy_4', 'Rashka_copy_5', 'Rashka_copy_6', 'Rashka_copy_7', 'Rashka_copy_8'},
    grow_per_lvl = 0.2
}

function  error_NHF_Rashka_F ()
	print("error:NHF_Rashka_F");
end;

AddEvent(new_day_events, 'NHF_rashka_spec_new_day',
function(day)
    if mod(day, 7) == 1 and day ~= 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(rashka_spec.heroes, hero) then
                startThread(DefaultCreatureGrow, hero, TOWN_INFERNO, 6, 1 + floor(GetHeroLevel(hero) * rashka_spec.grow_per_lvl))
            end
        end
    end
end)