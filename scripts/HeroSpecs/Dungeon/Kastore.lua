--NHF---------------Кастор---------------------
kastore_spec =
{
    ignored_adv_spells = {67, 348, 349, 350, 351}, 
    heroes = {'Kastore', 'Kastore_copy_1', 'Kastore_copy_2', 'Kastore_copy_3', 'Kastore_copy_4', 'Kastore_copy_5', 'Kastore_copy_6', 'Kastore_copy_7', 'Kastore_copy_8'},
    spells_known_for_heroes = {},
    spells_for_sp = 2
}

function  error_NHF_Kastore_F ()
    print("error:NHF_Kastore_F")
end

AddEvent(map_loading_events, 'NHF_kastore_spec_init',
function()
    for i, hero in kastore_spec.heroes do
        kastore_spec.spells_known_for_heroes[hero] = {}
    end
end)

AddEvent(add_hero_events, 'NHF_kastore_spec_add_hero',
function(hero)
    if contains(kastore_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    errorHook(error_NHF_Kastore_F)
                    for i, school in {MAGIC_SCHOOL_DESTRUCTIVE, MAGIC_SCHOOL_DARK, MAGIC_SCHOOL_LIGHT, MAGIC_SCHOOL_SUMMONING, MAGIC_SCHOOL_ADVENTURE} do
                        for j, spell in SPELLS_BY_SCHOOLS[school] do
                            if (not contains(kastore_spec.ignored_adv_spells, spell)) and 
                                (not kastore_spec.spells_known_for_heroes[%hero][spell]) and 
                                KnowHeroSpell(%hero, spell) then
                                kastore_spec.spells_known_for_heroes[%hero][spell] = 1
                                if mod(len(kastore_spec.spells_known_for_heroes[%hero]), kastore_spec.spells_for_sp) == 0 then
                                    startThread(MCCS_ChangeHeroStat, %hero, STAT_SPELL_POWER, 1)
                                end
                            end
                        end
                    end
                end
                sleep()
            end
        end)
    end
end)