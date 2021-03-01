--NHF----------------Фагус---------------------
fagus_spec =
{
    path = "/MapObjects/Inferno/NewHeroes/Fagus/bonus",
    heroes = {'Fagus', 'Fagus_copy_1', 'Fagus_copy_2', 'Fagus_copy_3', 'Fagus_copy_4', 'Fagus_copy_5', 'Fagus_copy_6', 'Fagus_copy_7', 'Fagus_copy_8'},
    lvls_for_stat = 2,
    saved_bonus_for_hero = {},
}



function  error_NHF_Fagus_F ()
	print("error:NHF_Fagus_F");
end;

AddEvent(map_loading_events, 'NHF_fagus_spec_init',
function()
    for i, hero in fagus_spec.heroes do
        fagus_spec.saved_bonus_for_hero[hero] = {}
        for stat = STAT_ATTACK, STAT_KNOWLEDGE do
            fagus_spec.saved_bonus_for_hero[hero][stat] = -1
        end
    end
end)

AddEvent(new_day_events, 'NHF_fagus_spec_new_day',
function(day)
    for hero, alive in HEROES_ALIVE do
        if hero and alive and contains(fagus_spec.heroes, hero) then
            -- убрать старую прибавку
            for stat, change in fagus_spec.saved_bonus_for_hero[hero] do
                if change ~= -1 then
                    ChangeHeroStat(hero, stat, -change)
                    if stat == STAT_KNOWLEDGE then
                        ChangeHeroStat(hero, STAT_MANA_POINTS, - (change * (10 + (5 * HasHeroSkill(hero, PERK_INTELLIGENCE) and 1 or 0))))
                    end
                    fagus_spec.saved_bonus_for_hero[hero][stat] = -1
                end
            end
            --
            local new_stat = random(STAT_KNOWLEDGE) + 1
            local new_bonus = ceil(GetHeroLevel(hero) / fagus_spec.lvls_for_stat)
            fagus_spec.saved_bonus_for_hero[hero][new_stat] = new_bonus
            ChangeHeroStat(hero, new_stat, new_bonus)
            local mana = 0
            if new_stat == STAT_KNOWLEDGE then
                mana = new_bonus * (10 + 5 * (HasHeroSkill(hero, PERK_INTELLIGENCE) and 1 or 0))
                ChangeHeroStat(hero, STAT_MANA_POINTS, mana)
            end
            startThread(ShowFlyingSign, {fagus_spec.path..new_stat..".txt"; prirost = new_bonus, prirost_mana = mana}, hero, GetObjectOwner(hero), 5.0)
        end
    end
end)