--NHF----------------Урика---------------------
urika_spec =
{
    heroes = {'Urika', 'Urika_copy_1', 'Urika_copy_2', 'Urika_copy_3', 'Urika_copy_4', 'Urika_copy_5', 'Urika_copy_6', 'Urika_copy_7', 'Urika_copy_8'},
    grow_per_know = 1.5
}

NHF_Urika_week_temp = -1;
function  error_NHF_Urika_F ()
	print("error:NHF_Urika_F");
end;

AddEvent(new_day_events, 'NHF_urika_spec_new_day',
function(day)
    if mod(day, 7) == 1 and day ~= 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(urika_spec.heroes, hero) then
                startThread(DefaultCreatureGrow, hero, TOWN_STRONGHOLD, 4, ceil(GetHeroStat(hero, STAT_KNOWLEDGE) * urika_spec.grow_per_know))
            end
        end
    end
end)

AddEvent(add_hero_events, 'NHF_urika_spec_add_hero',
function(hero)
    if contains(urika_spec.heroes, hero) then
        consoleCmd("@SetGameVar('"..hero.."_goblins_killed', 0)")
    end
end)

combat_scripts_paths[length(combat_scripts_paths) + 1] = '/scripts/combat/HeroSpecs/Stronghold/Shamans.lua'