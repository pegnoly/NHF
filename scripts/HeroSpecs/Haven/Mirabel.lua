mirabel_spec =
{
    heroes = {'Mirabel', 'Mirabel_copy_1', 'Mirabel_copy_2', 'Mirabel_copy_3', 'Mirabel_copy_4', 'Mirabel_copy_5', 'Mirabel_copy_6', 'Mirabel_copy_7', 'Mirabel_copy_8'},
    base_grow = 2 * 12 / 20,
}

AddEvent(new_day_events, 'NHF_mirabel_new_day',
function(day)
    if mod(day, 7) == 0 and day ~= 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(mirabel_spec.heroes, hero) then
                errorHook(error_NHF_Mirabel_F)
                local grow = ceil(GetHeroLevel(hero) * NHF_Mirabel_percent)
                if IsObjectExists(hero) and IsHeroInBoat(hero) then
                    grow = grow * 2
                end;
                local temp_name = NHF_tempName_F(hero)
                AddCreatures(hero, CREATURE_PIRATE, grow)
            end;
        end
    end
end)