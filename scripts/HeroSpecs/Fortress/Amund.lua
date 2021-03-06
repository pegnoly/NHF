--NHF----------------Эймунд--------------------
amund_spec =
{
    heroes = {'Amund', 'Amund_copy_1', 'Amund_copy_2', 'Amund_copy_3', 'Amund_copy_4', 'Amund_copy_5', 'Amund_copy_6', 'Amund_copy_7', 'Amund_copy_8'},
    dwarven_arts =
    {
        --
        [ARTIFACT_DWARWEN_MITHRAL_CUIRASS] =
        function(hero)
            ChangeHeroStat(hero, STAT_DEFENCE, 4)
            while HasArtefact(hero, ARTIFACT_DWARWEN_MITHRAL_CUIRASS, 1) do
                sleep()
            end
            ChangeHeroStat(hero, STAT_DEFENCE, -4)
            amund_spec.art_active_on_hero[hero][ARTIFACT_DWARWEN_MITHRAL_CUIRASS] = nil
        end,
        --
        [ARTIFACT_DWARWEN_MITHRAL_GREAVES] =
        function(hero)
            ChangeHeroStat(hero, STAT_ATTACK, 4)
            while HasArtefact(hero, ARTIFACT_DWARWEN_MITHRAL_GREAVES, 1) do
                sleep()
            end
            ChangeHeroStat(hero, STAT_ATTACK, -4)
            amund_spec.art_active_on_hero[hero][ARTIFACT_DWARWEN_MITHRAL_GREAVES] = nil
        end,
        --
        [ARTIFACT_DWARWEN_MITHRAL_HELMET] =
        function(hero)
            ChangeHeroStat(hero, STAT_KNOWLEDGE, 4)
            while HasArtefact(hero, ARTIFACT_DWARWEN_MITHRAL_HELMET, 1) do
                sleep()
            end
            ChangeHeroStat(hero, STAT_KNOWLEDGE, -4)
            amund_spec.art_active_on_hero[hero][ARTIFACT_DWARWEN_MITHRAL_HELMET] = nil
        end,
        --
        [ARTIFACT_DWARWEN_MITHRAL_SHIELD] =
        function(hero)
            ChangeHeroStat(hero, STAT_DEFENCE, 4)
            while HasArtefact(hero, ARTIFACT_DWARWEN_MITHRAL_SHIELD, 1) do
                sleep()
            end
            ChangeHeroStat(hero, STAT_DEFENCE, -4)
            amund_spec.art_active_on_hero[hero][ARTIFACT_DWARWEN_MITHRAL_SHIELD] = nil
        end,
        --
        [ARTIFACT_GREAT_AXE_OF_GIANT_SLAYING] =
        function(hero)
            ChangeHeroStat(hero, STAT_ATTACK, 4)
            while HasArtefact(hero, ARTIFACT_GREAT_AXE_OF_GIANT_SLAYING, 1) do
                sleep()
            end
            ChangeHeroStat(hero, STAT_ATTACK, -4)
            amund_spec.art_active_on_hero[hero][ARTIFACT_GREAT_AXE_OF_GIANT_SLAYING] = nil
        end,
        --
        [ARTIFACT_DWARVEN_SMITHY_HAMMER] =
        function(hero)
            ChangeHeroStat(hero, STAT_ATTACK, 3)
            while HasArtefact(hero, ARTIFACT_DWARVEN_SMITHY_HAMMER, 1) do
                sleep()
            end
            ChangeHeroStat(hero, STAT_ATTACK, -3)
            amund_spec.art_active_on_hero[hero][ARTIFACT_DWARVEN_SMITHY_HAMMER] = nil
        end,
        --
        [ARTIFACT_RUNE_OF_FLAME] =
        function(hero)
            ChangeHeroStat(hero, STAT_SPELL_POWER, 1)
            while HasArtefact(hero, ARTIFACT_RUNE_OF_FLAME, 1) do
                sleep()
            end
            ChangeHeroStat(hero, STAT_SPELL_POWER, -1)
            amund_spec.art_active_on_hero[hero][ARTIFACT_RUNE_OF_FLAME] = nil
        end,
        --
        [ARTIFACT_RUNIC_WAR_AXE] =
        function(hero)
            ChangeHeroStat(hero, STAT_SPELL_POWER, 2)
            ChangeHeroStat(hero, STAT_ATTACK, 2)
            while HasArtefact(hero, ARTIFACT_RUNIC_WAR_AXE, 1) do
                sleep()
            end
            ChangeHeroStat(hero, STAT_SPELL_POWER, -2)
            ChangeHeroStat(hero, STAT_ATTACK, -2)
            amund_spec.art_active_on_hero[hero][ARTIFACT_RUNIC_WAR_AXE] = nil
        end,
        --
        [ARTIFACT_RUNIC_WAR_HARNESS] =
        function(hero)
            ChangeHeroStat(hero, STAT_DEFENCE, 2)
            ChangeHeroStat(hero, STAT_KNOWLEDGE, 2)
            while HasArtefact(hero, ARTIFACT_RUNIC_WAR_AXE, 1) do
                sleep()
            end
            ChangeHeroStat(hero, STAT_DEFENCE, -2)
            ChangeHeroStat(hero, STAT_KNOWLEDGE, -2)
            amund_spec.art_active_on_hero[hero][ARTIFACT_RUNIC_WAR_HARNESS] = nil
        end,
        --
        [ARTIFACT_CRASHER] =
        function(hero)
            ChangeHeroStat(hero, STAT_ATTACK, 7)
            while HasArtefact(hero, ARTIFACT_CRASHER, 1) do
                sleep()
            end
            ChangeHeroStat(hero, STAT_ATTACK, -7)
            amund_spec.art_active_on_hero[hero][ARTIFACT_CRASHER] = nil
        end,
        --
        [ARTIFACT_SUPRESSION_BAND] =
        function(hero)
            ChangeHeroStat(hero, STAT_KNOWLEDGE, 3)
            while HasArtefact(hero, ARTIFACT_SUPRESSION_BAND, 1) do
                sleep()
            end
            ChangeHeroStat(hero, STAT_KNOWLEDGE, -3)
            amund_spec.art_active_on_hero[hero][ARTIFACT_SUPRESSION_BAND] = nil
        end
        --
        [ARTIFACT_SIGNET_OF_UNITY] = 
        function(hero)
            signet_of_unity.double_bonus_active[hero] = 1
            while HasArtefact(hero, ARTIFACT_SIGNET_OF_UNITY, 1) do
                sleep()
            end
            signet_of_unity.double_bonus_active[hero] = nil
            amund_spec.art_active_on_hero[hero][ARTIFACT_SIGNET_OF_UNITY] = nil
        end),
    },
    --
    art_active_on_hero = {}
}

function  error_NHF_Amund_F ()
   print("error:NHF_Amund_F")
end

AddEvent(map_loading_events, 'NHF_amund_spec_init',
function()
    for i, hero in amund_spec.heroes do
        amund_spec.art_active_on_hero[hero] = {}
    end
end)

AddEvent(add_hero_events, 'NHF_amund_spec_add_hero',
function(hero)
    if contains(amund_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    errorHook(error_NHF_Amund_F)
                    for art, func in amund_spec.dwarven_arts do
                        if not amund_spec.art_active_on_hero[%hero][art] and HasArtefact(%hero, art, 1) then
                            amund_spec.art_active_on_hero[%hero][art] = 1
                            startThread(func, %hero)
                        end
                    end
                end
                sleep()
            end
        end)
    end
end)