--NHF---------------ДРАГО-----------------------

drago_spec =
{
    path = "/MapObjects/Haven/NewHeroes/Drago/",
    heroes = {'Drago', 'Drago_copy_1', 'Drago_copy_2', 'Drago_copy_3', 'Drago_copy_4', 'Drago_copy_5', 'Drago_copy_6', 'Drago_copy_7', 'Drago_copy_8'},
    dragon_arts = 
    {
        36,  --Доспехи из чешуи дракона
        37,  --Щит из чешуи дракона
        38,  --Поножи из кости дракона
        39,  --Мантия из крыльев дракона
        40,  --Ожерелье из зубов дракона
        41,  --Корона из когтей дракона
        42,  --Кольцо Глаз дракона
        43,  --Пламенный язык дракона
    },
    week_multiplier = 3
}

function  error_NHF_Drago_F ()
	print("error:NHF_Drago_F");
end;

AddEvent(combat_results_events, 'NHF_drago_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(drago_spec.heroes, winner) then
        errorHook(error_NHF_Drago_F);
		local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id, 0)
		local itogo_dead_count = 0
		for i_live_dragon = 0, count_stacks - 1 do
			local id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id, 0, i_live_dragon)
			if NHF_non_elemental_dragons[id_creatures] then
				itogo_dead_count = itogo_dead_count + dead_count
			end
		end
		local  count_stacks = GetSavedCombatArmyCreaturesCount(fight_id, 1)
		for i_live_dragon = 0, count_stacks - 1 do
			id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id, 1, i_live_dragon)
			if NHF_non_elemental_dragons[id_creatures] then
				itogo_dead_count = itogo_dead_count + dead_count
			end		
		end
		if itogo_dead_count > 0 then
			if (itogo_dead_count + GetHeroLevel(winner)) > (drago_spec.week_multiplier * ceil(GetDate(ABSOLUTE_DAY) / 7)) then  -----------------------
				local arts_to_add, n = {}, 0
				for j, art_dragon in drago_spec.dragon_arts  do
					if not HasArtefact(winner, art_dragon) then
                        n = n + 1
                        arts_to_add[n] = art_dragon
					end
				end
				local temp_name = NHF_tempName_F(winner);
				local art_to_add = -1
				if n > 0 then
                    art_to_add = GetRandFromT(arts_to_add)
				else
                    art_to_add = GetRandFromT(drago_spec.dragon_arts)
				end
                startThread(ShowFlyingSign, {drago_spec.path.."NHF_Drago_format_text.txt"; text_art = GetArtName(art_to_add)}, winner, GetObjectOwner(winner), 5.0)
				GiveArtefact(winner, art_to_add, 1)
			end
		end
	end
end)