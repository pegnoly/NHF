------------------------Таланар(эльфийская ярость)--------------------
function  error_NHF_Nadaur_F ()
	print("error:NHF_Nadaur_F")
end

AddEvent(new_day_events, 'NHF_nadaur_new_day',
function(day)
    if mod(day, 7) == 1 and day ~= 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and GetHeroSpec(hero) == HERO_SPEC_ELVEN_FURY then
                for tier = 2, 4 do
                    startThread(DefaultCreatureGrow, hero, TOWN_PRESERVE, tier, ceil(GetHeroLevel(hero) * GetCreatureGrow(TIER_TABLES[TOWN_PRESERVE][tier][1])))
                end
            end
        end
    end
end)