--NHF---------------Дэлия----------------------
deliya_spec =
{
    heroes = {'Deliya', 'Deliya_copy_1', 'Deliya_copy_2', 'Deliya_copy_3', 'Deliya_copy_4', 'Deliya_copy_5', 'Deliya_copy_6', 'Deliya_copy_7', 'Deliya_copy_8'},
    chance_per_diff = 0.2
}

function  error_NHF_Deliya_F ()
	print("error:NHF_Deliya_F")
end

AddEvent(level_up_events, 'NHF_deliya_spec_lvl_up',
function(hero)
    if contains(deliya_spec.heroes, hero) then
        local min_stat = GetHeroMinStat(hero)
        local max_stat = GetHeroMaxStat(hero)
        local chance = (GetHeroStat(hero, max_stat) - GetHeroStat(hero, min_stat)) * deliya_spec.chance_per_diff
  		if (chance * 100) >= (random(100) + 1) then
            startThread(MCCS_ChangeHeroStat, hero, min_stat, 1)
  		end
	end
end)