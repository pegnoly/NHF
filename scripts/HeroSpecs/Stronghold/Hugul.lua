
--NHF--------------Хугул---------------------
hugul_spec = 
{
    path = "/MapObjects/Stronghold/NewHeroes/Hugul/NHF_Hugul_opyt.txt",
    heroes = {'Hugul', 'Hugul_copy_1', 'Hugul_copy_2', 'Hugul_copy_3', 'Hugul_copy_4', 'Hugul_copy_5', 'Hugul_copy_6', 'Hugul_copy_7', 'Hugul_copy_8'},
}

NHF_Hugul_textPath = "/MapObjects/Stronghold/NewHeroes/Hugul/NHF_Hugul_opyt.txt";
function  error_NHF_Hugul_F ()
	print("error:NHF_Hugul_F");
end;

AddEvent(combat_results_events, 'NHF_hugul_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(hugul_spec.heroes, winner) then
        local loser = GetSavedCombatArmyHero(fight_id, 0)
        print('loser: ', loser)
        if loser then
            --
            local exp = GetHeroStat(loser, STAT_EXPERIENCE)
            ChangeHeroStat(winner, STAT_EXPERIENCE, exp)
            startThread(ShowFlyingSign, {hugul_spec.path; count_pribavka = exp}, winner, GetObjectOwner(winner), 5.0)
                --
            local result = GetSavedCombatResult(fight_id)
            print('result: ', result)
            --
            if result == COMBAT_RESULT_SURRENDER then
                print('left combat and cant be hired again...')
                for i, town in GetObjectNamesByType('TOWN') do
                    AllowHiringOfHeroInTown(town, loser, 0)
                end
            elseif result == COMBAT_RESULT_RETREAT then
                print('surrended to Hugul')
                TakeAwayHeroExp(loser, exp)
            end
        end
    end
end)