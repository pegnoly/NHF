--NHF----------------Элмандр------------------
elmandr_spec =
{
    heroes = {'Elmandr', 'Elmandr_copy_1', 'Elmandr_copy_2', 'Elmandr_copy_3', 'Elmandr_copy_4', 'Elmandr_copy_5', 'Elmandr_copy_6', 'Elmandr_copy_7', 'Elmandr_copy_8'},
    grow_coeff = 2 * 4 / 15,
}
function  error_NHF_Elmandr_F ()
	print("error:NHF_Elmandr_F");
end;

AddEvent(new_day_events, 'NHF_elmandr_spec_new_day',
function(day)
    if mod(day, 7) == 1 and day ~= 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(elmandr_spec.heroes, hero) then
  	            errorHook(error_NHF_Elmandr_F)
                AddCreatures(hero, CREATURE_FIRE_ELEMENTAL, GetHeroLevel(hero) * elmandr_spec.grow_coeff)
  	        end
        end
	end
end)