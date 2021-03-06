--NHF----------------Танна---------------------
tanna_spec = 
{
    heroes = {'Tanna', 'Tanna_copy_1', 'Tanna_copy_2', 'Tanna_copy_3', 'Tanna_copy_4', 'Tanna_copy_5', 'Tanna_copy_6', 'Tanna_copy_7', 'Tanna_copy_8'},
    chance_to_learn = 0.5,
    spells_for_know = 3,
    spells_known_by_heroes = {}
}

function  error_NHF_Tanna_F ()
	print("error:NHF_Tanna_F")
end

AddEvent(map_loading_events, 'NHF_tanna_spec_init',
function()
    for i, hero in tanna_spec.heroes do
        tanna_spec.spells_known_by_heroes[hero] = {}
    end
end)

AddEvent(level_up_events, 'NHF_tanna_lvl_up',
function(hero)
    if contains(tanna_spec.heroes, hero) then
        if len(GetKnownSpellsBySchool(hero, MAGIC_SCHOOL_DARK)) == len(SPELLS_BY_SCHOOLS[MAGIC_SCHOOL_DARK]) then
            return
        end
        if (random(100) + 1) <= (tanna_spec.chance_to_learn * 100) then
            local spells_to_learn, n = {}, 0
            for i, spell in SPELLS_BY_SCHOOLS[MAGIC_SCHOOL_DARK] do
                if not KnowHeroSpell(hero, spell) then
                    n = n + 1
                    spells_to_learn[n] = spell
                end
            end
            local spell_to_learn = GetRandFromT(spells_to_learn)
            TeachHeroSpell(hero, spell_to_learn)
            startThread(ShowFlyingSign, {'/Text/Default/spell_learned.txt'; name = GetSpellName(spell_to_learn)}, hero, GetObjectOwner(hero,) 5.0)
        end
    end
end)

AddEvent(add_hero_events, 'NHF_tanna_spec_add_hero',
function(hero)
    if contains(tanna_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    for i, spell in SPELLS_BY_SCHOOLS[MAGIC_SCHOOL_DARK] do
                        if (not tanna_spec.spells_known_by_heroes[%hero][spell]) and KnowHeroSpell(%hero, spell) then
                            tanna_spec.spells_known_by_heroes[%hero][spell] = 1
                            if mod(len(tanna_spec.spells_known_by_heroes[%hero]), tanna_spec.spells_for_know) == 0 then
                                startThread(MCCS_ChangeHeroStat, %hero, STAT_KNOWLEDGE, 1)
                            end
                        end
                    end
                end
                sleep()
            end       
        end)
    end
end)