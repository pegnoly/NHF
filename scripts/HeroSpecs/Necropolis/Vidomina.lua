--NHF--------------ВИДОМИНА-------------------------
vidomina_spec =
{
    heroes = {'Vidomina', 'Vidomina_copy_1', 'Vidomina_copy_2', 'Vidomina_copy_3', 'Vidomina_copy_4', 'Vidomina_copy_5', 'Vidomina_copy_6', 'Vidomina_copy_7', 'Vidomina_copy_8'},
    saved_types_for_hero = {}
}

NHF_Vidomina_textPath = "/MapObjects/Necropolis/NewHeroes/Vidomina/";
NHF_index_battle_Vidomina_old = -1;
NHF_VidominaCreaturesTypes = {}
function  error_NHF_Vidomina_F ()
	print("error:NHF_Vidomina_F");
end;

AddEvent(add_hero_events, 'NHF_vidomina_add_hero',
function(hero)
    if contains(vidomina_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    vidomina_spec.saved_types_for_hero[%hero] = table.pack(GetHeroCreaturesTypes(%hero))
                end
                sleep()
            end
        end)
    end
end)

AddEvent(combat_results_events, 'NHF_vidomina_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(vidomina_spec.heroes, winner) then
        local creatures_to_add = {}
		for i = 0, stacks - 1 do
			creature, count, died = GetSavedCombatArmyCreatureInfo(fight_id, 0, i)
			if contains(vidomina_spec.saved_types_for_hero[winner], creature) then
				if not creatures_to_add[creature] then
				  creatures_to_add[creature] = 0
				end
			    creatures_to_add[creature] = creatures_to_add[creature] + count
			end
        end
        if len(creatures_to_add) > 0 then
            for creature, count in creatures_to_add do
                AddCreatures(winner, creature, count * 0.2);
                sleep(5)
                local temp_name = NHF_tempName_F(winner)
                startThread(PlayVisualEffect,"/Effects/_(Effect)/Spells/MoraleGood.xdb#xpointer(/Effect)", temp_name, "", 0, 0, 0, 0, 0, GetPlayerFilter(GetObjectOwner(temp_name)))					
                startThread(Play3DSoundForPlayers,GetPlayerFilter(GetObjectOwner(temp_name)), "/Sounds/_(Sound)/Heroes/Arnella_Mounted/assent.xdb#xpointer(/Sound)", GetObjectPosition(temp_name))							
            end
        end
	end
end)