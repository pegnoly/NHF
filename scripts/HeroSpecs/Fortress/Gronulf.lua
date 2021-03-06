--NHF----------------Гронульф--------------------
gronulf_spec =
{
    heroes = {'Gronulf', 'Gronulf_copy_1', 'Gronulf_copy_2', 'Gronulf_copy_3', 'Gronulf_copy_4', 'Gronulf_copy_5', 'Gronulf_copy_6', 'Gronulf_copy_7', 'Gronulf_copy_8'},
    wolves_divisor = 2
}

function  error_NHF_Gronulf_F ()
	print("error:NHF_Gronulf_F")
end

AddEvent(new_day_events, 'NHF_gronulf_spec_new_day',
function(day)
    if mod(day, 7) == 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(gronulf_spec.heroes, hero) then
                local wolves_count = GetHeroCreatures(hero, CREATURE_WOLF) / gronulf_spec.wolves_divisor
                if wolves_count < GetHeroLevel(hero) then
                    wolves_count = GetHeroLevel(hero)
                end
                startThread(DefaultCreatureGrow, hero, CREATURE_WOLF, wolves_count)
            end
        end
    end
end)