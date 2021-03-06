--NHF----------------Фьётра--------------------
fyotra_spec =
{
    heroes = {'Fyotra', 'Fyotra_copy_1', 'Fyotra_copy_2', 'Fyotra_copy_3', 'Fyotra_copy_4', 'Fyotra_copy_5', 'Fyotra_copy_6', 'Fyotra_copy_7', 'Fyotra_copy_8'},
    runes_learned_by_hero = {},
    bonus_per_rune = 1
}

function  error_NHF_Fyotra_F ()
	print("error:NHF_Fyotra_F")
end;

AddEvent(map_loading_events, 'NHF_fyotra_spec_init',
function()
    for i, hero in fyotra_spec.heroes do
        fyotra_spec.runes_learned_by_hero[hero] = {}
    end
end)

AddEvent(add_hero_events, 'NHF_fyotra_spec_add_hero',
function(hero)
    if contains(fyotra_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    for i, rune in SPELLS_BY_SCHOOLS[MAGIC_SCHOOL_RUNIC] do
                        if not fyotra_spec.runes_learned_by_hero[%hero][rune] and KnowHeroSpell(%hero, rune) then
                            fyotra_spec.runes_learned_by_hero[%hero][rune] = 1
                            startThread(MCCS_ChangeHeroStat, %hero, STAT_KNOWLEDGE, fyotra_spec.bonus_per_rune)
                        end
                    end
                end
                sleep()
            end
        end)
    end
end)

AddEvent(new_day_events, 'NHF_fyotra_spec_new_day',
function(day)
    if mod(day, 7) == 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(fyotra_spec.heroes, hero) then
                local known_runes = len(GetKnownSpellsBySchool(hero, MAGIC_SCHOOL_RUNIC))
                if known_runes ~= 0 then
                    startThread(MCCS_ChangeHeroResource, hero, CRYSTAL, known_runes * fyotra_spec.bonus_per_rune)
                end
            end
        end
    end
end)