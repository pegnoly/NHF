--NHF----------------------Менан--------------------
menan_spec =
{
    heroes = {'Menan', 'Menan_copy_1', 'Menan_copy_2', 'Menan_copy_3', 'Menan_copy_4', 'Menan_copy_5', 'Menan_copy_6', 'Menan_copy_7', 'Menan_copy_8'}
}

function  error_NHF_Menan_F ()
	print("error:NHF_Menan_F")
end

AddEvent(new_day_events, 'NHF_menan_spec_new_day',
function(day)
    if mod(day, 7) == 1 and day ~= 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(menan_spec.heroes, hero) then
                for tier = 1, 3 do
                    startThread(DefaultCreatureGrow, hero, TOWN_DUNGEON, tier, ceil(GetHeroLevel(hero) * GetCreatureGrow(TIER_TABLES[TOWN_DUNGEON][4][1])))
                end
            end
        end
    end
end