--NHF-------------Ашбет---------------------
ashbeth_spec =
{
	path = "/MapObjects/Dungeon/NewHeroes/Ashbeth/",
    heroes = {'Ashbeth', 'Ashbeth_copy_1', 'Ashbeth_copy_2', 'Ashbeth_copy_3', 'Ashbeth_copy_4', 'Ashbeth_copy_5', 'Ashbeth_copy_6', 'Ashbeth_copy_7', 'Ashbeth_copy_8'},
	town_for_hero = {}
}

function  error_NHF_Ashbeth_F ()
	print("error:NHF_Ashbeth_F")
end

AddEvent(add_hero_events, 'NHF_ashbeth_spec_add_hero',
function(hero)
	if contains(ashbeth_spec.heroes, hero) then
		startThread(
		function()
			while 1 do
				errorHook(error_NHF_Ashbeth_F)
				if IsHeroAlive(%hero) then
					if not ashbeth_spec.town_for_hero[%hero] then
						for i, town in GetPlayerTown(GetObjectOwner(%hero)) do
							if ((IsHeroInTown(%hero, town , 1, 0)  == true) or (GetTownHero(town) == %hero)) then
								ashbeth_spec.town_for_hero[%hero] = town;
								local cur_mana = GetHeroStat(%hero, STAT_MANA_POINTS)
								ChangeHeroStat(%hero, STAT_MOVE_POINTS, 12000)
								sleep(NHF_slep_singl)
								ChangeHeroStat(%hero, STAT_MANA_POINTS, GetHeroStat(%hero, STAT_KNOWLEDGE)*30)
								sleep(NHF_slep_singl);
								if GetHeroStat(%hero, STAT_MANA_POINTS) > cur_mana then
									local delta_mana = GetHeroStat(%hero, STAT_MANA_POINTS) - cur_mana
									startThread(ShowFlyingSign, {ashbeth_spec.path.."NHF_Ashbeth_prirost.txt"; p_m =delta_mana}, %hero, GetObjectOwner(%hero), 5.0)
								end
							end
						end
					else
						if not ((IsHeroInTown(%hero, town , 1, 0)  == true) or (GetTownHero(town) == %hero)) then
							ashbeth_spec.town_for_hero[%hero] = nil
						end
					end
				end
				sleep()
			end
		end)
	end
end)

