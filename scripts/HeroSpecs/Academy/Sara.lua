--NHF----------------Сари-----------------------
sara_spec =
{
    heroes = {'Sara', 'Sara_copy_1', 'Sara_copy_2', 'Sara_copy_3', 'Sara_copy_4', 'Sara_copy_5', 'Sara_copy_6', 'Sara_copy_7', 'Sara_copy_8'},
    ignored_adv_spells = {67, 348, 349, 350, 351}, 
    exp_per_spell = 500,
    spells_known_by_hero = {}
}

function  error_NHF_Sara_F ()
    print("error:NHF_Sara_F")
end

AddEvent(map_loading_events, 'NHF_sara_spec_init',
function()
    for i, hero in sara_spec.heroes do
        sara_spec.spells_known_by_hero[hero] = {}
    end
end)

AddEvent(add_hero_events, 'NHF_sara_spec_add_hero',
function(hero)
    if contains(sara_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    errorHook(error_NHF_Sara_F)
                    for i, school in {MAGIC_SCHOOL_DESTRUCTIVE, MAGIC_SCHOOL_DARK, MAGIC_SCHOOL_LIGHT, MAGIC_SCHOOL_SUMMONING} do
                        for j, spell in SPELLS_BY_SCHOOLS[school] do
                            if (not sara_spec.spells_known_by_hero[%hero][spell]) and KnowHeroSpell(%hero, spell) then
                                sara_spec.spells_known_by_hero[%hero][spell] = 1
                                startThread(MCCS_ChangeHeroStat, %hero, STAT_EXPERIENCE, sara_spec.exp_per_spell)
                            end
                        end
                    end
                end
                sleep()
            end
        end)
    end
end)