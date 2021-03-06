--NHF_E--------------Солмир---------------------
solmir_spec =
{
    heroes = {'Solmir', 'Solmir_copy_1', 'Solmir_copy_2', 'Solmir_copy_3', 'Solmir_copy_4', 'Solmir_copy_5', 'Solmir_copy_6', 'Solmir_copy_7', 'Solmir_copy_8'},
}

function  error_NHF_Solmir_F ()
	print("error:NHF_Solmir_F");
end;

AddEvent(level_up_events, 'NHF_solmir_spec_lvl_up',
function(hero)
    if contains(solmir_spec.heroes, hero) then
        startThread(MCCS_ChangeHeroStat, hero, STAT_SPELL_POWER, 1)
    end
end)