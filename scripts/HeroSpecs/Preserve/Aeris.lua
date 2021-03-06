--NHF---------------Аерис---------------------
aeris_spec =
{
    ignored_adv_spells = {67, 348, 349, 350, 351}, -- неизучаемые адвенчурные спеллы, которые руинят чеки
    heroes = {'AerisNHF', 'AerisNHF_copy_1', 'AerisNHF_copy_2', 'AerisNHF_copy_3', 'AerisNHF_copy_4', 'AerisNHF_copy_5', 'AerisNHF_copy_6', 'AerisNHF_copy_7', 'AerisNHF_copy_8'},
    grow_per_spell = 0.5,
    spells_known_for_heroes = {}
}

function  error_NHF_AerisNHF_F ()
    print("error:NHF_AerisNHF_F")
end

AddEvent(map_loading_events, 'NHF_aeris_spec_init',
function()
    for i, hero in aeris_spec.heroes do
        aeris_spec.spells_known_for_heroes[hero] = {}
    end
end)

AddEvent(new_day_events, 'NHF_aeris_spec_new_day',
function(day)
    if mod(day, 7) == 1 and day ~= 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(aeris_spec.heroes, hero) then
                for i, school in {MAGIC_SCHOOL_DESTRUCTIVE, MAGIC_SCHOOL_DARK, MAGIC_SCHOOL_LIGHT, MAGIC_SCHOOL_SUMMONING, MAGIC_SCHOOL_ADVENTURE} do
                    for j, spell in SPELLS_BY_SCHOOLS[school] do
                        if (not contains(aeris_spec.ignored_adv_spells, spell)) and (not aeris_spec.spells_known_for_heroes[hero][spell]) and KnowHeroSpell(hero, spell) then
                            aeris_spec.spells_known_for_heroes[hero][spell] = 1
                        end
                    end
                end
                --
                local spells_count = len(aeris_spec.spells_known_for_heroes[hero])
                if spells_count ~= 0 then
                    startThread(DefaultCreatureGrow, hero, TOWN_PRESERVE, 4, floor(spells_count * aeris_spec.grow_per_spell))
                end
            end
        end
    end
end)