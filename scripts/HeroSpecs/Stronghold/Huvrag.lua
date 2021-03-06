--NHF--------------Хувраг--------------------
huvrag_spec =
{
    heroes = {'Huvrag', 'Huvrag_copy_1', 'Huvrag_copy_2', 'Huvrag_copy_3', 'Huvrag_copy_4', 'Huvrag_copy_5', 'Huvrag_copy_6', 'Huvrag_copy_7', 'Huvrag_copy_8'},
    lvl_divisor = 2
}

function  error_NHF_Huvrag_F ()
	print("error:NHF_Huvrag_F")
end

AddEvent(level_up_events, 'NHF_huvrag_spec_lvl_up',
function(hero)
    if contains(huvrag_spec.heroes, hero) and (mod(GetHeroLevel(hero), huvrag_spec.lvl_divisor) == 0) then
        startThread(MCCS_ChangeHeroStat, hero, STAT_SPELL_POWER, 1)
    end
end)