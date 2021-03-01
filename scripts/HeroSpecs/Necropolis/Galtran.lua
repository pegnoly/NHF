--NHF-----------------ГАЛТРАН--------------------
galtran_spec = 
{

}

NHF_Galtran_index_battle_next = -1;
NHF_Galtran_textPath = "/MapObjects/Necropolis/NewHeroes/Galtran/";
NHF_mass_bezkostnie ={[203]=1, [200]=1, [234]=1, [201]=1, [358]=1, [291]=1, [420]=1, [414]=1, [366]=1, [501]=1, [62]=1, [219]=1, [442]=1, [441]=1, [104]=1, 
[61]=1, [511]=1, [88]=1, [105]=1, [388]=1, [389]=1, [218]=1, [185]=1, [597]=1, [500]=1, [471]=1, [313]=1, [85]=1, [383]=1, [59]=1, [328]=1, [161]=1, [87]=1, [160]=1, 
[60]=1, [207]=1, [86]=1, [204]=1, [206]=1, [205]=1, [172]=1, [202]=1, [188]=1};

function  error_NHF_Galtran_F ()
	print("error:NHF_Galtran_F");
end;

AddEvent(combat_results_events, 'NHF_galtran_combat_result',
function(fight_id)
	if (GetSavedCombatArmyHero(fight_id, 1)== "Galtran") and (NHF_Galtran_index_battle_next ~= fight_id) then
	  NHF_Galtran_index_battle_next = fight_id;
	  local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id,0);
	  local itogo_dead_count = 0;
	  for i_kostnie = 0, count_stacks - 1 do
		local id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id,0,i_kostnie);
		itogo_dead_count = itogo_dead_count + dead_count;
		if NHF_mass_bezkostnie[id_creatures] == 1 then 
			itogo_dead_count = itogo_dead_count - dead_count; 
		end;
	  end;
	  if itogo_dead_count > 0 then
		 local prirost =  ceil((itogo_dead_count)*((NHF_Galtran_percent*GetHeroLevel("Galtran"))+NHF_Galtran_base_percent));
		 NHF_creatures_prirost_F("Galtran",prirost,NHF_mass_creatures.Necropolis.L1);
	  end;
	end;
end)