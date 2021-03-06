--NHF---------------Данан-----------------------
danan_spec =
{
    heroes = {'DananNHF', 'DananNHF_copy_1', 'DananNHF_copy_2', 'DananNHF_copy_3', 'DananNHF_copy_4', 'DananNHF_copy_5', 'DananNHF_copy_6', 'DananNHF_copy_7', 'DananNHF_copy_8'},
    spells_known_by_heroes = {}
}

function  error_NHF_DananNHF_F ()
	print("error:NHF_DananNHF_F")
end

AddEvent(map_loading_events, 'NHF_danan_spec_init',
function()
    for i, hero in danan_spec.heroes do
        danan_spec.spells_known_by_heroes[hero] = {}
        for j, spell in {SPELL_LAND_MINE, SPELL_WASP_SWARM, SPELL_EARTHQUAKE, SPELL_SUMMON_HIVE, SPELL_PLAGUE , SPELL_STONE_SPIKES, SPELL_IMPLOSION, SPELL_METEOR_SHOWER} do
            danan_spec.spells_known_by_heroes[hero][spell] = -1
        end
    end   
end)

AddEvent(add_hero_events, 'NHF_danan_spec_add_hero',
function(hero)
    if contains(danan_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    for spell, known in danan_spec.spells_known_by_heroes[%hero] do
                        if known == -1 and KnowHeroSpell(%hero, spell) then
                            danan_spec.spells_known_by_heroes[%hero] = 1
                            startThread(MCCS_ChangeHeroStat, %hero, STAT_SPELL_POWER, 1)
                            startThread(MCCS_ChangeHeroStat, %hero, STAT_KNOWLEDGE, 1)
                        end
                    end    
                end
                sleep()
            end
        end)
    end
end)