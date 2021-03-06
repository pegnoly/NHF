--NHF-------------Викония---------------------
viconia_spec = 
{
    heroes = {'Viconia', 'Viconia_copy_1', 'Viconia_copy_2', 'Viconia_copy_3', 'Viconia_copy_4', 'Viconia_copy_5', 'Viconia_copy_6', 'Viconia_copy_7', 'Viconia_copy_8'},
    gold_per_creature = 1,
    lvl_coeff = 4
}

function  error_NHF_Vikonia_F ()
	print("error:NHF_Vikonia_F")
end

AddEvent(new_day_events, 'NHF_vikonia_spec_new_day',
function(day)
    for hero, alive in HEROES_ALIVE do
        if hero and alive and contains(viconia_spec.heroes, hero) then
            local count = CalcHeroCreatures(hero)
            local gold_plus = ceil(count * viconia_spec.gold_per_creature * ceil(GetHeroLevel(hero) / viconia_spec.lvl_coeff))
            if gold_plus > 0 then
                NHF_ChangeResourceHero(GOLD, gold_plus, %hero)
                sleep(NHF_slep_singl)
            end
  	    end
	end
end)