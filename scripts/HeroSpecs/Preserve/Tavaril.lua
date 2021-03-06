--NHF---------------Тавэриль------------------
tavaril_spec = 
{
    heroes = {'Tavaril', 'Tavaril_copy_1', 'Tavaril_copy_2', 'Tavaril_copy_3', 'Tavaril_copy_4', 'Tavaril_copy_5', 'Tavaril_copy_6', 'Tavaril_copy_7', 'Tavaril_copy_8'},
    faeries_per_treant = 5
}

function  error_NHF_Tavaril_F ()
	print("error:NHF_Tavaril_F")
end

AddEvent(new_day_events, 'NHF_tavaril_spec_new_day',
function(day)
    if mod(day, 7) == 1 and day ~= 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(tavaril_spec.heroes, hero) then
                local treants = GetHeroCreaturesByTier(hero, TOWN_PRESERVE, 6)
                if treants then
                    local count = 0
                    for i, treant in treants do
                        count = count + GetHeroCreatures(hero, treant)
                    end
                    count = ceil(count / tavaril_spec.faeries_per_treant)
                    if count > ceil(GetHeroLevel(hero) * 2) then
                        count = ceil(GetHeroLevel(hero) * 2)
                    end
                    startThread(DefaultCreatureGrow, hero, TOWN_PRESERVE, 6, count)
                else
                    return
                end
            end
        end
    end
end)