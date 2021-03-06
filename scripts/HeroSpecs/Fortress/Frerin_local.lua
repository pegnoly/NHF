--NHF---------------Фрерин(+ Халмогар)--------------------
frerin_spec =
{
    heroes = {'Frerin', 'Frerin_copy_1', 'Frerin_copy_3', 'Frerin_copy_4', 'Frerin_copy_5', 'Frerin_copy_6', 'Frerin_copy_7', 'Frerin_copy_8'},
    grow_coeff = 2 * 14 / 15
}

function  error_NHF_Frerin_F ()
	print("error:NHF_Frerin_F")
end

AddEvent(new_day_events, 'NHF_frerin_spec_new_day',
function(day)
    if mod(day, 7) == 1 and day ~= 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(frerin_spec.heroes, hero) then
                startThread(DefaultCreatureGrow, hero, TOWN_FORTRESS, 4, ceil(GetHeroLevel(hero) * frerin_spec.grow_coeff))
            end
        end
    end
end)

AddEvent(add_hero_events, 'NHF_frerin_spec_add_hero',
function(hero)
    if contains(frerin_spec.heroes, hero) then
        consoleCmd("@SetGameVar('"..hero.."_bers_curr_lvl', 0)")
        consoleCmd("@SetGameVar('"..hero.."_bers_curr_kills', 0)")
        consoleCmd("@spec_bers_adv.lvl_saved_for_hero['"..hero.."'] = 0")
    end
end)