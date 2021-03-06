--NHF_E----------------Сандро---------------------
sandro_spec =
{
    heroes = {'Sandro', 'Sandro_copy_1', 'Sandro_copy_2', 'Sandro_copy_3', 'Sandro_copy_4', 'Sandro_copy_5', 'Sandro_copy_6', 'Sandro_copy_7', 'Sandro_copy_8'},
}

function  error_NHF_Sandro_F ()
	print("error:NHF_Sandro_F");
end;

AddEvent(level_up_events, 'NHF_sandro_spec_lvl_up',
function(hero)
    if contains(sandro_spec.heroes, hero) then
        NHF_ChangeHeroStat(hero, STAT_SPELL_POWER, 1)
        sleep(NHF_slep_singl)
    end
end)