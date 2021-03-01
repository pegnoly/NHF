 --NHF---------------������--------------------
 aglion_spec =
 {
    path = "/MapObjects/Inferno/NewHeroes/Aglion/",
    heroes = {'Aglion', 'Aglion_copy_1', 'Aglion_copy_2', 'Aglion_copy_3', 'Aglion_copy_4', 'Aglion_copy_5', 'Aglion_copy_6', 'Aglion_copy_7', 'Aglion_copy_8'},
    imps = TIER_TABLES[TOWN_INFERNO][1],
    add_coeff = 0.02
 }
 NHF_Aglion_textPath = "/MapObjects/Inferno/NewHeroes/Aglion/";
 NHF_Aglion_index_battle_next = -1;
 function  error_NHF_Aglion_F ()
     print("error:NHF_Aglion_F");
 end;
 
 AddEvent(combat_results_events, 'NHF_aglion_spec_combat_result',
 function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(aglion_spec.heroes, winner) then
        local imps_to_add = {}
        local mana_to_add = 0
        for slot = 0, 6 do
            local creature, count = GetObjectArmySlotCreature(winner, slot)
            if not (creature == 0 or count == 0) then
                if contains(aglion_spec.imps, creature) then
                    mana_to_add = mana_to_add + count
                    if not imps_to_add[creature] then
                        imps_to_add[creature] = 0
                    end
                    imps_to_add[creature] = imps_to_add[creature] + count
                end
            end
        end
        --
        for creature, count in imps_to_add do
            AddCreatures(winner, creature, count * aglion_spec.add_coeff)
        end
        --
        if mana_to_add > 0 then
            mana_to_add = mana_to_add * aglion_spec.add_coeff
            local current_mana = GetHeroStat(winner, STAT_MANA_POINTS)
            local current_know = GetHeroStat(winner, STAT_KNOWLEDGE)
            if (current_mana + mana_to_add) > current_know * (10 + (5 * HasHeroSkill(winner, PERK_INTELLIGENCE) and 1 or 0)) then
                local new_know = ceil((current_mana + mana_to_add) / 10)
                ChangeHeroStat(winner, STAT_KNOWLEDGE, new_know - current_know)
                sleep()
                ChangeHeroStat(winner, STAT_MANA_POINTS, mana_to_add)
                sleep()
                ChangeHeroStat(winner, STAT_KNOWLEDGE, -(new_know - current_know))
                startThread(ShowFlyingSign, {aglion_spec.path.."message.txt"; p = mana_to_add}, winner, GetObjectOwner(winner), 8.0)		
            end
        end
    end
end)
