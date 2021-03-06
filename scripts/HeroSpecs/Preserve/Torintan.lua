--NHF---------------Торинтан------------------
torintan_spec =
{
    heroes = {'Torintan', 'Torintan_copy_1', 'Torintan_copy_2', 'Torintan_copy_3', 'Torintan_copy_4', 'Torintan_copy_5', 'Torintan_copy_6', 'Torintan_copy_7', 'Torintan_copy_8'},
    wood_per_lvl = 3
}

function  error_NHF_Torintan_F ()
	print("error:NHF_Torintan_F");
end;

AddEvent(new_day_events, 'NHF_torintan_spec_new_day',
function(day)
    if mod(day, 7) == 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(torintan_spec.heroes, hero) then
                NHF_ChangeResourceHero(WOOD, ceil(torintan_spec.wood_per_lvl * GetHeroLevel(hero)), hero)    
            end
        end
    end
end)