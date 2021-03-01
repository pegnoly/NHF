konstantin_spec =
{
    heroes = {'Konstantin', 'Konstantin_copy_1', 'Konstantin_copy_2', 'Konstantin_copy_3', 'Konstantin_copy_4', 'Konstantin_copy_5', 'Konstantin_copy_6', 'Konstantin_copy_7', 'Konstantin_copy_8'},
    flags_for_hero = {}
}

function KonstantinSpec_UpdateFlags(hero)
    --
    if (not konstantin_spec.flags_for_hero[hero].diplomacy_flag) then
        if HasHeroSkill(hero, PERK_DIPLOMACY) then
            konstantin_spec.flags_for_hero[hero]..diplomacy_flag = 1
            consoleCmd("@SetGameVar('"..hero.."_diplomacy', '1')")
        end
    else
        if (not HasHeroSkill(hero, PERK_DIPLOMACY)) then
            konstantin_spec.flags_for_hero[hero].diplomacy_flag = nil
            consoleCmd("@SetGameVar('"..hero.."_diplomacy', '0')")
        end
    end
    --
    if (not konstantin_spec.flags_for_hero[hero].herald_flag) then
        if HasHeroSkill(hero, NECROMANCER_FEAT_HERALD_OF_DEATH) then
            konstantin_spec.flags_for_hero[hero].herald_flag = 1
            consoleCmd("@SetGameVar('"..hero.."_herald', '1')")
        end
    else
        if (not HasHeroSkill(hero, NECROMANCER_FEAT_HERALD_OF_DEATH)) then
            konstantin_spec.flags_for_hero[hero].herald_flag = nil
        consoleCmd("@SetGameVar('"..hero.."_herald', '0')")
        end
    end
    --
    if (not konstantin_spec.flags_for_hero[hero].crown_flag) then
        if HasArtefact(hero, ARTIFACT_CROWN_OF_LEADER, 1) then
            konstantin_spec.flags_for_hero[hero].flags_for_hero[hero].crown_flag = 1
        consoleCmd("@SetGameVar('"..hero.."_crown', '1')")
        end
    else
        if (not HasArtefact(hero, ARTIFACT_CROWN_OF_LEADER, 1)) then
            konstantin_spec.flags_for_hero[hero].crown_flag = nil
        consoleCmd("@SetGameVar('"..hero.."_crown', '0')")
        end
    end
    --
    if (not konstantin_spec.flags_for_hero[hero].week_flag) then
        if GetCurrentMoonWeek() == WEEK_OF_DIPLOMACY then
            konstantin_spec.flags_for_hero[hero].week_flag = 1
            consoleCmd("@SetGameVar('"..hero.."_week', '1')")
        end
    else
        if (not GetCurrentMoonWeek() == WEEK_OF_DIPLOMACY) then
            konstantin_spec.flags_for_hero[hero].week_flag = nil
            consoleCmd("@SetGameVar('"..hero.."_week', '0')")
        end
    end
end

AddEvent(add_hero_events, 'NHF_konstantin_add_hero',
function(hero)
    if contains(konstantin_spec.heroes, hero) then
        startThread(
        function()
            --
            konstantin_spec.flags_for_hero[%hero] = {}
            konstantin_spec.flags_for_hero[%hero].diplomacy_flag = nil
            konstantin_spec.flags_for_hero[%hero].herald_flag = nil
            konstantin_spec.flags_for_hero[%hero].crown_flag = nil
            konstantin_spec.flags_for_hero[%hero].week_flag = nil
            --
            consoleCmd("@SetGameVar('"..%hero.."_diplomacy', '0')")
            consoleCmd("@SetGameVar('"..%hero.."_herald', '0')")
            consoleCmd("@SetGameVar('"..%hero.."_crown', '0')")
            consoleCmd("@SetGameVar('"..%hero.."_week', '0')")
            --
            while 1 do
                if IsHeroAlive(%hero) then
                    KonstantinSpec_UpdateFlags(%hero)
                end
                sleep()
            end
        end)
    end
end)

combat_scripts_paths[length(combat_scripts_paths) + 1] = '/scripts/combat/NHF/Konstantin.lua'