--NHF_E---------------Моандер--------------------
moander_spec =
{
    heroes = {'Moander', 'Moander_copy_1', 'Moander_copy_2', 'Moander_copy_3', 'Moander_copy_4', 'Moander_copy_5', 'Moander_copy_6', 'Moander_copy_7', 'Moander_copy_8'},
    grow_percent = 1.5 *3 / 15
}

function  error_NHF_Moander_F ()
	print("error:NHF_Moander_F")
end

AddEvent(new_day_events, 'NHF_moander_spec_new_day',
function(day)
    if mod(day, 7) == 1 and day ~= 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(moander_spec.heroes, hero) then
                startThread(DefaultCreatureGrow, hero, TOWN_NECROMANCY, 5, GetHeroLevel(hero) * moander_spec.grow_percent)
            end
	    end
	end
end)