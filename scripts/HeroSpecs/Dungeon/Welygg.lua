--NHF_E----------------Велигг--------------------
welygg_spec =
{
    heroes = {'WelyggNHF', 'WelyggNHF_copy_1', 'WelyggNHF_copy_2', 'WelyggNHF_copy_3', 'WelyggNHF_copy_4', 'WelyggNHF_copy_5', 'WelyggNHF_copy_6', 'WelyggNHF_copy_7', 'WelyggNHF_copy_8'},
    lvl_divisor = 3
}

function  error_NHF_WelyggNHF_F ()
	print("error:NHF_WelyggNHF_F")
end

AddEvent(level_up_events, 'NHF_welygg_spec_lvl_up',
function(hero)
    if contains(welygg_spec.heroes, hero) and (mod(GetHeroLevel(hero), welygg_spec.lvl_divisor) == 0) then
        local temp_name = NHF_tempName_F(hero)
        if (GetHeroTown(hero) or IsInDungeon(temp_name)) then
            startThread(MCCS_ChangeHeroStat, hero, STAT_DEFENCE, 1)
        else
            startThread(MCCS_ChangeHeroStat, hero, STAT_ATTACK, 1)
        end
    end
end