--NHF----------------Эргар---------------------
ergar_spec =
{
    path = "/MapObjects/Preserve/NewHeroes/Ergar/",
    heroes = {'Ergar', 'Ergar_copy_1', 'Ergar_copy_2', 'Ergar_copy_3', 'Ergar_copy_4', 'Ergar_copy_5', 'Ergar_copy_6', 'Ergar_copy_7', 'Ergar_copy_8'},
    move_points_to_add = 350
}

function  error_NHF_Ergar_F ()
	print("error:NHF_Ergar_F")
end

AddEvent(combat_results_events, 'NHF_ergar_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(ergar_spec.heroes, winner) then
        ChangeHeroStat(winner, STAT_MOVE_POINTS, ergar_spec.move_points_to_add)
        local temp_name = NHF_tempName_F(winner)
	    startThread(ShowFlyingSign, {ergar_spec.path.."NHF_Ergar_prirost.txt"; prirost = ergar_spec.move_points_to_add}, temp_name, GetObjectOwner(temp_name), 5.0)
    end
end)
