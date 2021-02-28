--NHF--------------Серхио--------------------------
serhio_spec =
{
    path = "/MapObjects/Haven/NewHeroes/Serhio/",
    heroes = {'Serhio', 'Serhio_copy_1', 'Serhio_copy_2', 'Serhio_copy_3', 'Serhio_copy_4', 'Serhio_copy_5', 'Serhio_copy_6', 'Serhio_copy_7', 'Serhio_copy_8'}
}

function  error_NHF_Serhio_F ()
	print("error:NHF_Serhio_F");
end;

AddEvent(combat_results_events, 'NHF_serhio_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(serhio_spec.heroes, winner) then
        errorHook(error_NHF_Serhio_F)
        local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id, 0)
        local itogo_dead_count = 0
        for i = 0, count_stacks - 1 do
            local id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id, 0, i)
            itogo_dead_count = itogo_dead_count + dead_count;
        end;
        if itogo_dead_count > 0 then
            local grow =  ceil((itogo_dead_count) * GetHeroLevel(winner))
            ChangeHeroStat(winner, STAT_EXPERIENCE, grow)
            sleep(NHF_slep_singl)
            startThread(ShowFlyingSign, {serhio_spec.path.."NHF_Serhio_opyt.txt"; count = grow}, winner, GetObjectOwner(winner), 5.0) 
        end;
	end;
end)