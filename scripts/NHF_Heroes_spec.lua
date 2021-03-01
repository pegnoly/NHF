-----------------------------------------------
----------------ОРДЕН ПОРЯДКА------------------
-----------------------------------------------
while not mccs_custom_ability and AddEvent and add_hero_events do
  sleep()
end

---------------------------------------
----------------����������---------------------
-----------------------------------------------

----------------������-------------------------
function  error_NHF_Nemor_F ()
	print("error:NHF_Nemor_F");
end;

AddEvent(add_hero_events, 'NHF_nemor_add_hero',
function(hero)
  if hero == 'Nemor' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Nemor') then
          errorHook(error_NHF_Nemor_F);
          local slot = -1;
          local i_count = 0;
          local id, count;
          local temp_name = NHF_tempName_F("Nemor");
          local count_umertvie = GetHeroCreatures("Nemor", CREATURE_WIGHT);
          if  count_umertvie > 0 then --���������� 0.84
          	for i = 0,6 do
          		id, count = GetObjectArmySlotCreature(temp_name,i);
          		if id == CREATURE_WIGHT then
          			slot = i;
          		end;
          		if count == 0 then
          			i_count = i_count + 1;
          		end;
          	end;
          	if i_count == 6 then
          		AddHeroCreatures("Nemor", CREATURE_SKELETON , 1);
          		sleep(NHF_slep_singl);
          		RemoveHeroCreatures("Nemor", CREATURE_WIGHT, count_umertvie);
          		AddHeroCreatures("Nemor", CREATURE_BANSHEE , count_umertvie,slot);
          		RemoveHeroCreatures("Nemor", CREATURE_SKELETON, 1);
          	else
          		RemoveHeroCreatures("Nemor", CREATURE_WIGHT, count_umertvie);
          		AddHeroCreatures("Nemor", CREATURE_BANSHEE , count_umertvie,slot);
          	end;
          end;
        end
        sleep()
      end
    end)
  end
end)

----------------��������-------------------
NHF_Tamika_week_temp = -1;
function  error_NHF_Tamika_F ()
	print("error:NHF_Tamika_F");
end;

AddEvent(new_day_events, 'NHF_tamika_new_day',
function(hero, day)
  if hero == 'Tamika' and IsHeroAlive('Tamika') then
	errorHook(error_NHF_Tamika_F);
	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Tamika_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
		NHF_Tamika_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
		local temp_name = NHF_tempName_F("Tamika");
		local prirost = ceil(GetHeroLevel("Tamika")*NHF_Lukrecia_percent);
		if prirost > 0 then
			NHF_creatures_prirost_F("Tamika",prirost,NHF_mass_creatures.Necropolis.L4);
		end;
	end;
	end
end)

----------------�����----------------------
NHF_Straker_week_temp = -1;
function  error_NHF_Straker_F ()
	print("error:NHF_Straker_F");
end;

AddEvent(new_day_events, 'NHF_straker_new_day',
function(hero, day)
  if hero == 'Straker' and IsHeroAlive('Straker') then
	errorHook(error_NHF_Straker_F);
	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Straker_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
		NHF_Straker_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
		local temp_name = NHF_tempName_F("Straker");
		local prirost = ceil(GetHeroLevel("Straker")*NHF_Orson_percent);
		if prirost > 0 then
			NHF_creatures_prirost_F("Straker",prirost,NHF_mass_creatures.Necropolis.L2);
		end;
	end;
	end
end)

--NHF---------------�������-------------------
NHF_Abissid_textPath = "/MapObjects/Necropolis/NewHeroes/Abissid/";
NHF_Abissid_while_flag = 0;
NHF_Abissid_hesroes_mass = {};
NHF_Abissid_hesroes_mass_svoi = {};
function  error_NHF_Abissid_F ()
  print("error:NHF_Abissid_F");
end;

AddEvent(add_hero_events, 'NHF_abissid_add_hero',
function(hero)
  if hero == 'Abissid' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Abissid') then
          errorHook(error_NHF_Abissid_F);
          if NHF_Abissid_while_flag == 0 then
            NHF_Abissid_while_flag = 1;
            local ManaPoints = 0;
            local MovePoints = 0;
            local temp_name = NHF_tempName_F("Abissid");
            while (IsHeroAlive("Abissid") == true) and ((GetCurrentPlayer() ~= GetObjectOwner(temp_name))or(GetCurrentPlayer() ~= -1)) do	-- 0.81 "or..."
              for i, hero in  GetObjectNamesByType("HERO") do
          		if (GetObjectOwner(temp_name)) ~= (GetObjectOwner(hero)) and (NHF_Abissid_hesroes_mass[hero] ~= 1) and (hero ~= "Abissid") then
          			if (GetPlayerTeam(GetObjectOwner(temp_name))~= GetPlayerTeam(GetObjectOwner(hero)) or (GetHeroSkillMastery(hero, SKILL_NECROMANCY) < 1)) then
          			   local x,y,z = GetObjectPosition(hero);
          			   local x_Abissid,y_Abissid,z_Abissid = GetObjectPosition(temp_name);
          			   if z == z_Abissid then
          				  local rasstoyanie = ceil(sqrt(((x-x_Abissid)*(x-x_Abissid))+((y-y_Abissid)*(y-y_Abissid))));
          				  if rasstoyanie <= NHF_Abissid_percent then
          					 local MovePoints_temp = ceil(GetHeroLevel("Abissid")*NHF_Abissid_percent_move);
          					 local ManaPoints_temp = ceil(MovePoints_temp*NHF_Abissid_percent_mana);
          					 ManaPoints = ManaPoints + ManaPoints_temp;
          					 MovePoints = MovePoints + MovePoints_temp;
          					 ChangeHeroStat(hero, STAT_MOVE_POINTS ,-MovePoints_temp);
          					 sleep(NHF_slep_singl);
          					 NHF_Abissid_hesroes_mass[hero] = 1;
          					 startThread(PlayVisualEffect,"/Effects/_(Effect)/Spells/Slow.xdb#xpointer(/Effect)", hero, "", 0, 0, 0, 0, 0);
          					 sleep(1);
          					 startThread(NHF_ShowFlyMessage,NHF_Abissid_textPath.."message1.txt", hero,5);
          					 --startThread(NHF_ShowFlyMessage, NHF_rawtext_standart("������� ����� ���� ������������"),hero,5);
          					 --NHF_ShowFlyMessage (NHF_rawtext_standart("������� ����� ���� ������������"),hero,5);
          					 --ShowFlyMessage(NHF_rawtext_standart("������� ����� ���� ������������"),hero , GetObjectOwner(hero),5);
          				  end;
          			   end;
          			end;
          		end;
              end;
            NHF_Abissid_hesroes_mass_svoi = {};
            sleep(1);
            end;
            -- + ���� ����� -0.79
            for i, hero in  GetObjectNamesByType("HERO") do
          	if (NHF_Abissid_hesroes_mass_svoi[hero] ~= 1) and (hero ~= "Abissid") then
          		if ((GetObjectOwner(temp_name))== (GetObjectOwner(hero)) and (GetHeroSkillMastery(hero, SKILL_NECROMANCY) < 1)) then
          		   local x,y,z = GetObjectPosition(hero);
          		   local x_Abissid,y_Abissid,z_Abissid = GetObjectPosition(temp_name);
          		   if z == z_Abissid then
          			  local rasstoyanie = ceil(sqrt(((x-x_Abissid)*(x-x_Abissid))+((y-y_Abissid)*(y-y_Abissid))));
          			  if rasstoyanie <= NHF_Abissid_percent then
          				 local MovePoints_temp = ceil(GetHeroLevel("Abissid")*NHF_Abissid_percent_move);
          				 local ManaPoints_temp = ceil(MovePoints_temp*NHF_Abissid_percent_mana);
          				 ManaPoints = ManaPoints + ManaPoints_temp;
          				 MovePoints = MovePoints + MovePoints_temp;
          				 ChangeHeroStat(hero, STAT_MOVE_POINTS ,-MovePoints_temp);
          				 sleep(NHF_slep_singl);
          				 NHF_Abissid_hesroes_mass_svoi[hero] = 1;
          				 startThread(PlayVisualEffect,"/Effects/_(Effect)/Spells/Slow.xdb#xpointer(/Effect)", hero, "", 0, 0, 0, 0, 0);
          				 sleep(1);
          				 startThread(NHF_ShowFlyMessage,NHF_Abissid_textPath.."message1.txt", hero,5);
          				 --startThread(NHF_ShowFlyMessage, NHF_rawtext_standart("������� ����� ���� ������������"),hero,5);
          				 --NHF_ShowFlyMessage (NHF_rawtext_standart("������� ����� ���� ������������"),hero,5);
          				 --ShowFlyMessage(NHF_rawtext_standart("������� ����� ���� ������������"),hero , GetObjectOwner(hero),5);
          			  end;
          		   end;
          		end;
          	end;
            end;
            if ManaPoints > 0 then
               local  temp_knowledge = GetHeroStat("Abissid", STAT_KNOWLEDGE)*10;
               ChangeHeroStat("Abissid", STAT_KNOWLEDGE , temp_knowledge);
               sleep(NHF_slep_singl);
               ChangeHeroStat("Abissid", STAT_MANA_POINTS ,ManaPoints);
          	   startThread(NHF_ShowFlyMessage,{NHF_Abissid_textPath.."message.txt";p=ManaPoints}, temp_name,5);
               ChangeHeroStat("Abissid", STAT_KNOWLEDGE , -temp_knowledge);
          	 sleep(NHF_slep_singl);
            end;
            NHF_Abissid_while_flag = 0;
            NHF_Abissid_hesroes_mass = {};
          end;
        end
        sleep()
      end
    end)
  end
end)

--NHF---------------БАЛЬТАЗАР-----------------
NHF_FLAG_SPELL_LIGHTNING_BOLT = 0;
NHF_FLAG_SPELL_ICE_BOLT  = 0;
NHF_FLAG_SPELL_FIREBALL = 0;
NHF_FLAG_STONE_SPIKES = 0;
function  error_NHF_Baltazar_F ()
	print("error:NHF_Baltazar_F");
end;

AddEvent(add_hero_events, 'NHF_baltazar_add_hero',
function(hero)
  if hero == 'Baltazar' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Baltazar') then
          errorHook(error_NHF_Baltazar_F);
          local temp_name = NHF_tempName_F("Baltazar");
          if (KnowHeroSpell("Baltazar", SPELL_LIGHTNING_BOLT) == true)and (NHF_FLAG_SPELL_LIGHTNING_BOLT == 0) then
            TeachHeroSpell("Baltazar", SPELL_CHAIN_LIGHTNING);
            NHF_FLAG_SPELL_LIGHTNING_BOLT = 1;
        	startThread(NHF_ShowFlyMessage, NHF_GetSpellName(SPELL_CHAIN_LIGHTNING,"+ "),temp_name, 5);
        	sleep(2);
        	startThread(NHF_ChangeHeroStat,"Baltazar", STAT_SPELL_POWER , NHF_Baltazar_percent);
          end;
          if (KnowHeroSpell("Baltazar", SPELL_ICE_BOLT) == true) and (NHF_FLAG_SPELL_ICE_BOLT == 0)then
            TeachHeroSpell("Baltazar", SPELL_FROST_RING);
            NHF_FLAG_SPELL_ICE_BOLT = 1;
        	startThread(NHF_ShowFlyMessage, NHF_GetSpellName(SPELL_FROST_RING,"+ "),temp_name,5);
        	sleep(2);
        	startThread(NHF_ChangeHeroStat,"Baltazar", STAT_SPELL_POWER , NHF_Baltazar_percent);
          end;
          if (KnowHeroSpell("Baltazar", SPELL_FIREBALL) == true) and (NHF_FLAG_SPELL_FIREBALL == 0) then
            TeachHeroSpell("Baltazar", SPELL_ARMAGEDDON);
            NHF_FLAG_SPELL_FIREBALL = 1;
        	startThread(NHF_ShowFlyMessage, NHF_GetSpellName(SPELL_ARMAGEDDON,"+ "), temp_name, 5);
        	sleep(2);
        	startThread(NHF_ChangeHeroStat,"Baltazar", STAT_SPELL_POWER , NHF_Baltazar_percent);
          end;
          if (KnowHeroSpell("Baltazar", SPELL_STONE_SPIKES) == true) and (NHF_FLAG_STONE_SPIKES == 0) then
            TeachHeroSpell("Baltazar", SPELL_METEOR_SHOWER);
            NHF_FLAG_STONE_SPIKES = 1;
        	startThread(NHF_ShowFlyMessage, NHF_GetSpellName(SPELL_METEOR_SHOWER,"+ "),temp_name,5);
        	sleep(2);
        	startThread(NHF_ChangeHeroStat,"Baltazar", STAT_SPELL_POWER , NHF_Baltazar_percent);
          end;
        end
        sleep()
      end
    end)
  end
end)

--NHF----------------�����---------------------
NHF_Veres_textPath = "/MapObjects/Necropolis/NewHeroes/Veres/";
NHF_Veres_index_battle_next = -1;
NHF_Veres_kill_mass = {11,12,111,23,24,135,51,52,149,77,78,141,96,97,168,89, 90, 183, 337, 346, 349, 351, 372, 360, 223, 224, 248, 282, 284, 387, 400, 428, 277, 605}; --Massiv Edinorogov, Koney, Naezdnikov +NCF
function  error_NHF_Veres_F ()
	print("error:NHF_Veres_F");
end;

AddEvent(combat_results_events, 'NHF_veres_combat_result',
function(fight_id)
  errorHook(error_NHF_Veres_F);
  if (GetSavedCombatArmyHero(fight_id, 1)== "Veres") and (NHF_Veres_index_battle_next ~= fight_id) then
    NHF_Veres_index_battle_next = fight_id;
    local temp_name = NHF_tempName_F("Veres");
    local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id,0);
    local id_creatures, count_creatures,dead_count ;
    local itogo_dead_stacs = 0;
    for i_kill = 0, count_stacks - 1 do
		id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id,0,i_kill);
		for i, Veres_kill in NHF_Veres_kill_mass do
			if  Veres_kill ==  id_creatures then
				itogo_dead_stacs = itogo_dead_stacs + dead_count;
				break;
			end;
		end;
    end;
	itogo_dead_stacs = (itogo_dead_stacs*((NHF_Veres_percent_base)+(floor(NHF_Veres_percent*GetHeroLevel("Veres"))/100)));
	if (itogo_dead_stacs > 0)and(itogo_dead_stacs < 1) then itogo_dead_stacs = 1 else itogo_dead_stacs = floor(itogo_dead_stacs) end;
	if itogo_dead_stacs > 0 then
		AddHeroCreatures("Veres", 90, itogo_dead_stacs );
		startThread(NHF_ShowFlyMessage, {NHF_Veres_textPath.."NHF_Veres_prirost.txt";count_pribavka=itogo_dead_stacs},temp_name,5);
	end;
  end;
end)

--NHF----------------ВИДОМИНА-----------------???
vamma_spec =
{
  affected_heroes = {}
}

function  error_NHF_Vamma_F ()
	print("error:NHF_Vamma_F");
end;

AddEvent(add_hero_events, 'NHF_vamma_add_hero',
function(hero)
  if hero == 'Vamma' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Vamma') then
          errorHook(error_NHF_Vamma_F);
          local  temp_name = NHF_tempName_F("Vamma");
          for player = PLAYER_1, PLAYER_8 do
            if IsActivePlayer(player) and (GetPlayerTeam(player) ~= GetPlayerTeam(GetObjectOwner(temp_name))) then
              for i, hero in GetPlayerHeroes(player) do
                if not vamma_spec.affected_heroes[hero] then
                  local dist = GetDistance(hero, temp_name)
                  if dist and dist <= NHF_Vamma_koeff_pribligenie then
                    vamma_spec.affected_heroes[hero] = 1
           					GiveHeroBattleBonus(hero, HERO_BATTLE_BONUS_LUCK, -ceil((GetHeroLevel("Vamma"))/NHF_Vamma_percent));
          					startThread(PlayVisualEffect,"/Effects/_(Effect)/Spells/LuckBad.xdb#xpointer(/Effect)", hero, "", 0, 0, 0, 0, 0);
                  end
                end
              end
            end
          end
        end
        sleep()
      end
    end)
  end
end)

AddEvent(combat_results_events, 'NHF_vamma_combat_result',
function(fight_id)
  local winner = GetSavedCombatArmyHero(fight_id, 1)
  local loser = GetSavedCombatArmyHero(fight_id, 0)
  if vamma_spec.affected_heroes[winner] then
    vamma_spec.affected_heroes[winner] = nil
  end
  if loser and vamma_spec.affected_heroes[loser] then
    vamma_spec.affected_heroes[loser] = nil
  end
end)

--NHF--------------ВИДОМИНА-------------------------
NHF_Vidomina_textPath = "/MapObjects/Necropolis/NewHeroes/Vidomina/";
NHF_index_battle_Vidomina_old = -1;
NHF_VidominaCreaturesTypes = {}
function  error_NHF_Vidomina_F ()
	print("error:NHF_Vidomina_F");
end;

AddEvent(add_hero_events, 'NHF_vidomina_add_hero',
function(hero)
  if hero == 'Vidomina' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Vidomina') then
          NHF_VidominaCreaturesTypes = table.pack(GetHeroCreaturesTypes('Vidomina'))
        end
        sleep()
      end
    end)
  end
end)


AddEvent(combat_results_events, 'NHF_vidomina_combat_result',
function(fight_id)
		if (GetSavedCombatArmyHero(fight_id, 1) == "Vidomina") and (fight_id ~= NHF_index_battle_Vidomina_old) then
		   NHF_index_battle_Vidomina_old = fight_id;
        local creatures_to_add = {}
		local stacks = GetSavedCombatArmyCreaturesCount(fight_id, 0)
		for i = 0, stacks - 1 do
			creature, count, died = GetSavedCombatArmyCreatureInfo(fight_id, 0, i)
			if contains(NHF_VidominaCreaturesTypes, creature) then
				if not creatures_to_add[creature] then
				  creatures_to_add[creature] = 0
				end
			creatures_to_add[creature] = creatures_to_add[creature] + count
			end
        end
        if len(creatures_to_add) > 0 then
          for creature, count in creatures_to_add do
						AddHeroCreatures("Vidomina", creature, count * 0.2);
						sleep(5);
						-- 0.81 GetCurrentPlayer() -> GetObjectOwner(temp_name)
						startThread(PlayVisualEffect,"/Effects/_(Effect)/Spells/MoraleGood.xdb#xpointer(/Effect)", temp_name, "", 0, 0, 0, 0, 0, GetPlayerFilter(GetObjectOwner(temp_name)));						
						startThread(Play3DSoundForPlayers,GetPlayerFilter(GetObjectOwner(temp_name)), "/Sounds/_(Sound)/Heroes/Arnella_Mounted/assent.xdb#xpointer(/Sound)", GetObjectPosition(temp_name));
						startThread(NHF_ShowFlyMessage,{NHF_Vidomina_textPath.."message.txt";p=count * 0.2}, temp_name,5);
						--startThread(NHF_ShowFlyMessage, NHF_rawtext_standart("���������: +"..cr[2]), temp_name, 5);--frendly_counts												
					end;
				end;
		end;
end)

--NHF-----------------ГАЛТРАН--------------------
NHF_Galtran_index_battle_next = -1;
NHF_Galtran_textPath = "/MapObjects/Necropolis/NewHeroes/Galtran/";
NHF_mass_bezkostnie ={[203]=1, [200]=1, [234]=1, [201]=1, [358]=1, [291]=1, [420]=1, [414]=1, [366]=1, [501]=1, [62]=1, [219]=1, [442]=1, [441]=1, [104]=1, [61]=1, [511]=1, [88]=1, [105]=1, [388]=1, [389]=1, [218]=1, [185]=1, [597]=1, [500]=1, [471]=1, [313]=1, [85]=1, [383]=1, [59]=1, [328]=1, [161]=1, [87]=1, [160]=1, [60]=1, [207]=1, [86]=1, [204]=1, [206]=1, [205]=1, [172]=1, [202]=1, [188]=1};
--NHF_mass_bezkostnie = {CREATURE_EARTH_ELEMENTAL, CREATURE_FIRE_ELEMENTAL, CREATURE_WATER_ELEMENTAL, CREATURE_AIR_ELEMENTAL, CREATURE_STONE_GARGOYLE, CREATURE_OBSIDIAN_GARGOYLE, CREATURE_STEEL_GOLEM, CREATURE_IRON_GOLEM, CREATURE_MARBLE_GARGOYLE, CREATURE_OBSIDIAN_GOLEM, CREATURE_FIRE_DRAGON, CREATURE_LAVA_DRAGON, CREATURE_MAGMA_DRAGON, CREATURE_MANES, CREATURE_POLTERGEIST, CREATURE_GHOST, CREATURE_GENIE, CREATURE_MASTER_GENIE, CREATURE_DJINN_VIZIER, CREATURE_TREANT, CREATURE_TREANT_GUARDIAN, CREATURE_ANGER_TREANT, CREATURE_ANGEL, CREATURE_ARCHANGEL, CREATURE_SERAPH} ;
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

--NHF----------------��������--------------------
function  error_NHF_Donsella_F ()
	print("error:NHF_Donsella_F");
end;
combat_scripts_paths[length(combat_scripts_paths) + 1] = '/scripts/combat/NHF/Doncella.lua'

--NHF---------------����������---------------------
function  error_NHF_Konstantin_F ()
  print("error:NHF_Konstantin_F");
end;

konstantin_spec =
{
  diplomacy_flag = nil,
  herald_flag = nil,
  crown_flag = nil,
  week_flag = nil
}

function KonstantinSpec_UpdateFlags()
  --
  if (not konstantin_spec.diplomacy_flag) then
    if HasHeroSkill('Konstantin', PERK_DIPLOMACY) then
      konstantin_spec.diplomacy_flag = 1
      consoleCmd("@SetGameVar('Konstantin_diplomacy', '1')")
    end
  else
    if (not HasHeroSkill('Konstantin', PERK_DIPLOMACY)) then
      konstantin_spec.diplomacy_flag = nil
      consoleCmd("@SetGameVar('Konstantin_diplomacy', '0')")
    end
  end
  --
  if (not konstantin_spec.herald_flag) then
    if HasHeroSkill('Konstantin', NECROMANCER_FEAT_HERALD_OF_DEATH) then
      konstantin_spec.herald_flag = 1
      consoleCmd("@SetGameVar('Konstantin_herald', '1')")
    end
  else
    if (not HasHeroSkill('Konstantin', NECROMANCER_FEAT_HERALD_OF_DEATH)) then
      konstantin_spec.herald_flag = nil
      consoleCmd("@SetGameVar('Konstantin_herald', '0')")
    end
  end
  --
  if (not konstantin_spec.crown_flag) then
    if HasArtefact('Konstantin', ARTIFACT_CROWN_OF_LEADER, 1) then
      konstantin_spec.crown_flag = 1
      consoleCmd("@SetGameVar('Konstantin_crown', '1')")
    end
  else
    if (not HasArtefact('Konstantin', ARTIFACT_CROWN_OF_LEADER, 1)) then
      konstantin_spec.crown_flag = nil
      consoleCmd("@SetGameVar('Konstantin_crown', '0')")
    end
  end
  --
  if (not konstantin_spec.week_flag) then
    if GetCurrentMoonWeek() == WEEK_OF_DIPLOMACY then
      konstantin_spec.week_flag = 1
      consoleCmd("@SetGameVar('Konstantin_week', '1')")
    end
  else
    if (not GetCurrentMoonWeek() == WEEK_OF_DIPLOMACY) then
      konstantin_spec.week_flag = nil
      consoleCmd("@SetGameVar('Konstantin_week', '0')")
    end
  end
end

AddEvent(add_hero_events, 'NHF_konstantin_add_hero',
function(hero)
  if hero == 'Konstantin' then
    startThread(
    function()
      consoleCmd("@SetGameVar('Konstantin_diplomacy', '0')")
      consoleCmd("@SetGameVar('Konstantin_herald', '0')")
      consoleCmd("@SetGameVar('Konstantin_crown', '0')")
      consoleCmd("@SetGameVar('Konstantin_week', '0')")
      --
      while 1 do
        if IsHeroAlive('Konstantin') then
          KonstantinSpec_UpdateFlags()
        end
        sleep()
      end
    end)
  end
end)

combat_scripts_paths[length(combat_scripts_paths) + 1] = '/scripts/combat/NHF/Konstantin.lua'

--NHF----------------�����---------------------
NHF_Tessa_textPath = "/MapObjects/Necropolis/NewHeroes/Tessa/NHF_Tessa_manakrad.txt";
function  error_NHF_Tessa_F ()
	print("error:NHF_Tessa_F");
end;
combat_scripts_paths[length(combat_scripts_paths) + 1] = '/scripts/combat/NHF/Tessa.lua'

--NHF-----------------�����---------------------
NHF_Hafad_textPath = "/MapObjects/Necropolis/NewHeroes/Hafad/";
NHF_Hafad_not_alive = {[29]=1, [30]=1, [31]=1, [32]=1, [33]=1, [34]=1, [35]=1, [36]=1, [37]=1, [38]=1, [39]=1, [40]=1, [41]=1, [42]=1, [152]=1, [153]=1, [154]=1, [155]=1, [156]=1, [157]=1, [158]=1, [59]=1, [60]=1, [61]=1, [62]=1, [160]=1, [161]=1, [104]=1, [105]=1, [172]=1, [85]=1, [86]=1, [87]=1, [88]=1, [89]=1, [90]=1, [116]=1, [56]=1, [379]=1, [371]=1, [363]=1, [355]=1, [347]=1, [339]=1, [331]=1, [366]=1, [358]=1, [328]=1, [206]=1, [207]=1, [200]=1, [201]=1, [202]=1, [203]=1, [204]=1, [205]=1, [295]=1, [295]=1, [183]=1, [182]=1, [184]=1, [185]=1, [188]=1, [193]=1, [218]=1, [219]=1, [225]=1, [234]=1, [237]=1, [239]=1, [243]=1, [244]=1, [288]=1, [298]=1, [304]=1, [312]=1, [313]=1, [400]=1, [401]=1, [403]=1, [412]=1, [417]=1, [418]=1, [420]=1, [424]=1, [425]=1, [453]=1, [496]=1, [500]=1, [501]=1, [429]=1, [437]=1, [441]=1, [442]=1, [444]=1};
function  error_NHF_Hafad_F ()
	print("error:NHF_Hafad_F");
end;
combat_scripts_paths[length(combat_scripts_paths) + 1] = '/scripts/combat/NHF/Hafad.lua'

--NHF-----------------��������------------------------------
NHF_Heormel_gilds_flag = 0;
NHF_Heormel_Kn = 1.0001;
function  error_NHF_Heormel_F ()
	print("error:NHF_Heormel_F");
end;

function  NHF_Heormel_town_F (town)
errorHook(error_NHF_Heormel_F);
local temp_name = NHF_tempName_F("Heormel");
local mass_spell_ShowFlyMessage = {}; 	
	if GetTownBuildingLevel(town, TOWN_BUILDING_MAGIC_GUILD)  == 5 and NHF_Heormel_gilds_flag < 5 then
		for i = 1, 12 do --���������� 0.85
          if KnowHeroSpell("Heormel", NHF_mass_spells_svet[i]) ~= true then
             TeachHeroSpell("Heormel", NHF_mass_spells_svet[i]);
			 mass_spell_ShowFlyMessage[NHF_mass_spells_svet[i]] = 1;
			 NHF_Heormel_Kn = NHF_Heormel_Kn + NHF_Heormel_Kn_percent;
				if NHF_Heormel_Kn >= 1 then				
					sleep(2);
					NHF_ChangeHeroStat("Heormel", STAT_KNOWLEDGE, floor(NHF_Heormel_Kn),8);	
					sleep(NHF_slep_singl);
					NHF_Heormel_Kn = NHF_Heormel_Kn - floor(NHF_Heormel_Kn);
				end;
          end;
        end;
		--GiveArtifact("Heormel", ARTIFACT_RING_OF_DEATH,1);
		NHF_Heormel_gilds_flag = 5;
		--return "full";
	end;	
	if GetTownBuildingLevel(town, TOWN_BUILDING_MAGIC_GUILD)  == 4 and NHF_Heormel_gilds_flag < 4 then
        for i = 1, 10 do --���������� 0.85
          if KnowHeroSpell("Heormel", NHF_mass_spells_svet[i]) ~= true then
             TeachHeroSpell("Heormel", NHF_mass_spells_svet[i]);
			 mass_spell_ShowFlyMessage[NHF_mass_spells_svet[i]] = 1;
			 NHF_Heormel_Kn = NHF_Heormel_Kn + NHF_Heormel_Kn_percent;
				if NHF_Heormel_Kn >= 1 then
					sleep(2);
					NHF_ChangeHeroStat("Heormel", STAT_KNOWLEDGE, floor(NHF_Heormel_Kn));
					sleep(NHF_slep_singl);
					NHF_Heormel_Kn = NHF_Heormel_Kn - floor(NHF_Heormel_Kn);
				end;			 
          end;
        end;
		NHF_Heormel_gilds_flag = 4;
	end;	
	if 	GetTownBuildingLevel(town, TOWN_BUILDING_MAGIC_GUILD)  == 3 and NHF_Heormel_gilds_flag < 3 then
        for i = 1, 7 do --���������� 0.85
          if KnowHeroSpell("Heormel", NHF_mass_spells_svet[i]) ~= true then
             TeachHeroSpell("Heormel", NHF_mass_spells_svet[i]);
			 mass_spell_ShowFlyMessage[NHF_mass_spells_svet[i]] = 1;
			 NHF_Heormel_Kn = NHF_Heormel_Kn + NHF_Heormel_Kn_percent;
				if NHF_Heormel_Kn >= 1 then
					sleep(2);
					NHF_ChangeHeroStat("Heormel", STAT_KNOWLEDGE, floor(NHF_Heormel_Kn));
					sleep(NHF_slep_singl);
					NHF_Heormel_Kn = NHF_Heormel_Kn - floor(NHF_Heormel_Kn);
				end;				 
          end;
        end;
		NHF_Heormel_gilds_flag = 3;
	end;	
	if GetTownBuildingLevel(town, TOWN_BUILDING_MAGIC_GUILD)  == 2  and NHF_Heormel_gilds_flag < 2 then
        for i = 1, 5 do --���������� 0.85
          if KnowHeroSpell("Heormel", NHF_mass_spells_svet[i]) ~= true then
			 TeachHeroSpell("Heormel", NHF_mass_spells_svet[i]);
			 mass_spell_ShowFlyMessage[NHF_mass_spells_svet[i]] = 1;  
			 NHF_Heormel_Kn = NHF_Heormel_Kn + NHF_Heormel_Kn_percent;
				if NHF_Heormel_Kn >= 1 then
					sleep(2);
					NHF_ChangeHeroStat("Heormel", STAT_KNOWLEDGE, floor(NHF_Heormel_Kn));
					sleep(NHF_slep_singl);
					NHF_Heormel_Kn = NHF_Heormel_Kn - floor(NHF_Heormel_Kn);
				end;				 
          end;
        end;
		NHF_Heormel_gilds_flag = 2;
	end;	
	if 	GetTownBuildingLevel(town, TOWN_BUILDING_MAGIC_GUILD)  == 1 and NHF_Heormel_gilds_flag < 1 then
        for i = 1, 2 do
          if KnowHeroSpell("Heormel", NHF_mass_spells_svet[i]) ~= true then
             TeachHeroSpell("Heormel", NHF_mass_spells_svet[i]);			 
			 mass_spell_ShowFlyMessage[NHF_mass_spells_svet[i]] = 1;
			 NHF_Heormel_Kn = NHF_Heormel_Kn + NHF_Heormel_Kn_percent;
				if NHF_Heormel_Kn >= 1 then
					sleep(2);
					NHF_ChangeHeroStat("Heormel", STAT_KNOWLEDGE, floor(NHF_Heormel_Kn));
					sleep(NHF_slep_singl);
					NHF_Heormel_Kn = NHF_Heormel_Kn - floor(NHF_Heormel_Kn);
				end;				 
          end;
        end;
		NHF_Heormel_gilds_flag = 1;	
    end;
	local j = 2;
	for i, value in mass_spell_ShowFlyMessage do --0.80
		j = j + 2;
		sleep(NHF_slep_singl);
		startThread(NHF_ShowFlyMessage, NHF_GetSpellName(i,"+ "), temp_name,j);
	end;	
end;

AddEvent(add_hero_events, 'NHF_heormel_add_hero',
function(hero)
  if hero == 'Heormel' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Heormel') and NHF_Heormel_gilds_flag < 5 then
        	for i, town in GetPlayerTowns(GetObjectOwner('Heormel')) do
        		if (IsHeroInTown("Heormel", town , 1, 0)  == true or GetTownHero(town) == "Heormel") then
        			NHF_Heormel_town_F (town);
        		end;
        	end;
        end;
        sleep()
      end
    end)
  end
end)

--NHF_E--------------------��������--------------------
NHF_Geralda_textPath = "/MapObjects/Necropolis/NewHeroes/Geralda/";
NHF_Geralda_index_battle_next = -1
function  error_NHF_Geralda_F ()
	print("error:NHF_Geralda_F");
end;

AddEvent(combat_results_events, 'NHF_geralda_combat_result',
function(fight_id)
  if (GetSavedCombatArmyHero(fight_id, 1)== "Geralda") and (NHF_Geralda_index_battle_next ~= fight_id) then
  	NHF_Geralda_index_battle_next = fight_id;
  	local temp_name = NHF_tempName_F("Geralda");
  	local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id,0);
  	local id_creatures, count_creatures, dead_count;
  	local TownBuilding = {
  	["idc"]={[1]= CREATURE_SKELETON,[2]= CREATURE_WALKING_DEAD,[3]= CREATURE_MANES,[4]= CREATURE_VAMPIRE ,[5]= CREATURE_LICH,[6]= CREATURE_WIGHT,[7]= CREATURE_BONE_DRAGON},
    ["tb"]={[1]=TOWN_BUILDING_DWELLING_1,[2]=TOWN_BUILDING_DWELLING_2,[3]=TOWN_BUILDING_DWELLING_3,[4]=TOWN_BUILDING_DWELLING_4,[5]=TOWN_BUILDING_DWELLING_5,[6]=TOWN_BUILDING_DWELLING_6,[7]=TOWN_BUILDING_DWELLING_7},
    ["nc"]={[1]=0,[2]=0,[3]=0,[4]=0,[5]=0,[6]=0,[7]=0},
    ["mc"]={[1]="message1.txt",[2]="message2.txt",[3]="message3.txt",[4]="message4.txt",[5]="message5.txt",[6]="message6.txt",[7]="message7.txt"}};
    for i = 0, count_stacks - 1 do
		id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo (fight_id,0,i);
		if  dead_count > 0 then		
			for j = 1, 7 do
				if (NHF_tiers_creatures[id_creatures]==j) and (NHF_mass_not_living[id_creatures]~=1) then
					TownBuilding["nc"][j] = TownBuilding["nc"][j] + dead_count;
					break;
				end;
			end;
		end;
  	end;
    for k = 1, 7 do
    	if  TownBuilding["nc"][k] > 0 then
      		for i,town in NHF_names_objects.towns do
				if  ((GetTownRace(town) == TOWN_NECROMANCY)  and (GetObjectOwner(town) ==  GetObjectOwner(temp_name))) then
					if GetTownBuildingLevel(town, TownBuilding["tb"][k]) ~= 0 then
					    local prorost = floor(TownBuilding["nc"][k]*NHF_Geralda_percent);
						if prorost > 0 then 
							SetObjectDwellingCreatures(town, TownBuilding["idc"][k], GetObjectDwellingCreatures(town,TownBuilding["idc"][k]) + prorost);
							startThread(NHF_ShowFlyMessage,{NHF_Geralda_textPath..TownBuilding["mc"][k];p=prorost}, temp_name,5);
						end;
					end;
				end;
      		end;
		end;
    end;
  end;
end)

--NHF_E---------------�������--------------------
NHF_Moander_week_temp = -1;
function  error_NHF_Moander_F ()
	print("error:NHF_Moander_F");
end;

AddEvent(new_day_events, 'NHF_moander_new_day',
function(hero, day)
  if hero == 'Moander' and IsHeroAlive('Moander') then
	errorHook(error_NHF_Moander_F);
	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Moander_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
		NHF_Moander_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
		local temp_name = NHF_tempName_F("Moander");
		local prirost = ceil(GetHeroLevel("Moander")*NHF_Moander_percent);
		if prirost > 0 then
			NHF_creatures_prirost_F("Moander",prirost,NHF_mass_creatures.Necropolis.L5);
		end;
	end;
	end
end)

--NHF_E----------------������-------------------
MCCS_NERGAL_CUSTOM = 1
function  error_NHF_NergalNHF_F ()
	print("error:NHF_NergalNHF_F");
end;

mccs_hero_custom['NergalNHF'] =
function(heroNergalNHF)
errorHook(error_NHF_NergalNHF_F);
  if heroNergalNHF == "NergalNHF" then
     local textPath = "/MapObjects/Necropolis/NewHeroes/NergalNHF/";
     for i_town,town in NHF_names_objects.towns do
       if IsHeroInTown(heroNergalNHF,town,1,0)   == true then
         TransformTown(town, TOWN_NECROMANCY);
		 startThread(NHF_ShowFlyMessage, textPath.."NHF_NergalNHF_Transform_yes.txt",town,5);
       break;
     end;
    end;
  end;
end;

AddEvent(add_hero_events, 'NHF_nergal_add_hero',
function(hero)
  if hero == 'NergalNHF' then
    mccs_custom_ability.hero_custom_affected_heroes['NergalNHF'][MCCS_NERGAL_CUSTOM] = 1
    mccs_custom_ability.hero_custom_affected_heroes['NergalNHF'][MCCS_NERGAL_CUSTOM] = nil
    startThread(
    function()
      while 1 do
        if IsHeroAlive('NergalNHF') then
        	errorHook(error_NHF_NergalNHF_F);
        	local mass_building_non = {{15,16,19,22},{15,17,19,22},{15,16,21,22},{15,16,18,21},{-1,-1,-1,-1},{15,16,19,22},{15,16,22,-1},{15,16,22,-1}}
        	local town = nil;
          for i_town,town in GetPlayerTowns(GetObjectOwner('NergalNHF')) do
            if IsHeroInTown("NergalNHF", town,1,0) == true then
              if  GetTownRace(town) ~= TOWN_NECROMANCY  then
                local level_town = 0;
                for  i_building = 0,22 do
                   if ((i_building ~= mass_building_non[GetTownRace(town)+1][1])and(i_building ~= mass_building_non[GetTownRace(town)+1][2])and(i_building ~= mass_building_non[GetTownRace(town)+1][3])and(i_building ~= mass_building_non[GetTownRace(town)+1][4])) then
                     if GetTownBuildingLevel(town,i_building) ~= nil then
                        level_town = level_town + GetTownBuildingLevel(town,i_building);
                     end;
                   end;
                end;
                if (GetHeroLevel("NergalNHF")>= level_town) then
                   mccs_custom_ability.hero_custom_affected_heroes['NergalNHF'][MCCS_NERGAL_CUSTOM] = 1
                else
                   mccs_custom_ability.hero_custom_affected_heroes['NergalNHF'][MCCS_NERGAL_CUSTOM] = nil
                end;
              end;
             end;
          end;
        end
        sleep()
      end
    end)
  end
end)

--NHF_E----------------������---------------------
NHF_Sandro_textPath = "/MapObjects/Necropolis/NewHeroes/Sandro/";
NHF_Sandro_lvl_temp = 1;
function  error_NHF_Sandro_F ()
	print("error:NHF_Sandro_F");
end;

AddEvent(level_up_events, 'NHF_sandro_lvl_up',
function(hero)
  if hero == 'Sandro' then
    if (ceil(GetHeroLevel("Sandro")/1) > ceil(NHF_Sandro_lvl_temp/1))  then
       local temp_name = NHF_tempName_F("Sandro");
       NHF_Sandro_lvl_temp = GetHeroLevel("Sandro");
  	 NHF_ChangeHeroStat("Sandro", STAT_SPELL_POWER,1);
  	 sleep(NHF_slep_singl);
       --ChangeHeroStat("Sandro", STAT_SPELL_POWER,1);
  	 --startThread(NHF_ShowFlyMessage, NHF_Sandro_textPath.."NHF_Sandro_prirost.txt",temp_name, GetObjectOwner(temp_name),5);--???
    end;
  end
end)
-----------------------------------------------
----------------������ ����--------------------
-----------------------------------------------

----------------��������---------------------
NHF_Gilraen_week_temp = -1;
function  error_NHF_Gillion_F ()
	print("error:NHF_Gillion_F");
end;

AddEvent(new_day_events, 'NHF_gillion_new_day',
function(hero, day)
  if hero == 'Gillion' and IsHeroAlive('Gillion') then
	errorHook(error_NHF_Gillion_F);
	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Gilraen_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
		NHF_Gilraen_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
		local temp_name = NHF_tempName_F("Gillion");
		local prirost = ceil(GetHeroLevel("Gillion")*NHF_Gilraen_percent);
		if prirost > 0 then
			NHF_creatures_prirost_F("Gillion",prirost,NHF_mass_creatures.Preserve.L2);
		end;
	end;
	end
end)

----------------�������-----------------------
NHF_Itil_week_temp = -1;
function  error_NHF_Itil_F ()
	print("error:NHF_Itil_F");
end;

AddEvent(new_day_events, 'NHF_itil_new_day',
function(hero, day)
  if hero == 'Itil' and IsHeroAlive('Itil') then
	errorHook(error_NHF_Itil_F);
	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Itil_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
		NHF_Itil_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
		local temp_name = NHF_tempName_F("Itil");
		local prirost = ceil(GetHeroLevel("Itil")*NHF_Ilfina_percent);
		if prirost > 0 then
			NHF_creatures_prirost_F("Itil",prirost,NHF_mass_creatures.Preserve.L5);
		end;
	end;
	end
end)

----------------�����-----------------------
NHF_Ossir_week_temp = -1;
function  error_NHF_Ossir_F ()
	print("error:NHF_Ossir_F");
end;

AddEvent(new_day_events, 'NHF_ossir_new_day',
function(hero, day)
  if hero == 'Ossir' and IsHeroAlive('Ossir') then
	errorHook(error_NHF_Ossir_F);
	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Ossir_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
		NHF_Ossir_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
		local temp_name = NHF_tempName_F("Ossir");
		local prirost = ceil(GetHeroLevel("Ossir")*NHF_Ossir_percent);
		if prirost > 0 then
			NHF_creatures_prirost_F("Ossir",prirost,NHF_mass_creatures.Preserve.L3);
		end;
	end;
	end
end)

------------------------�������--------------------
NHF_Nadaur_week_temp = -1;
function  error_NHF_Nadaur_F ()
	print("error:NHF_Nadaur_F");
end;

AddEvent(new_day_events, 'NHF_nadaur_new_day',
function(hero, day)
  if hero == 'Nadaur' and IsHeroAlive('Nadaur') then
	errorHook(error_NHF_Nadaur_F);
	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Nadaur_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then 
		NHF_Nadaur_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
		local prirost = ceil(GetHeroLevel("Nadaur")*NHF_Nadaur_percent1);
		if prirost > 0 then
			NHF_creatures_prirost_F("Nadaur",prirost,NHF_mass_creatures.Preserve.L2,nil,4);
		end;      
		prirost = ceil(GetHeroLevel("Nadaur")*NHF_Nadaur_percent2);
		if prirost > 0 then
			NHF_creatures_prirost_F("Nadaur",prirost,NHF_mass_creatures.Preserve.L3,nil,6);
		end;    
		prirost = ceil(GetHeroLevel("Nadaur")*NHF_Nadaur_percent3);
		if prirost > 0 then
			NHF_creatures_prirost_F("Nadaur",prirost,NHF_mass_creatures.Preserve.L4,nil,8);
		end;
	end;
	end
end)

--NHF---------------�����---------------------
NHF_AerisNHF_week_temp = -1;
NHF_AerisNHF_zakl_mass = {SPELL_MAGIC_ARROW, SPELL_STONE_SPIKES,SPELL_CURSE, SPELL_SLOW, SPELL_SORROW,SPELL_MAGIC_FIST, SPELL_LAND_MINE,SPELL_BLESS, SPELL_HASTE,
SPELL_LIGHTNING_BOLT, SPELL_ICE_BOLT,SPELL_DISRUPTING_RAY, SPELL_PLAGUE,SPELL_WASP_SWARM, SPELL_ANIMATE_DEAD,SPELL_STONESKIN, SPELL_DISPEL,
SPELL_FIREBALL,SPELL_FROST_RING, SPELL_FIREWALL,SPELL_WEAKNESS, SPELL_FORGETFULNESS,SPELL_PHANTOM, SPELL_EARTHQUAKE,SPELL_BLOODLUST, SPELL_DEFLECT_ARROWS,
SPELL_CHAIN_LIGHTNING, SPELL_METEOR_SHOWER,SPELL_SUMMON_ELEMENTALS, SPELL_SUMMON_HIVE, SPELL_BLIND, SPELL_BERSERK, SPELL_TELEPORT, SPELL_ANTI_MAGIC, SPELL_DIVINE_VENGEANCE,
SPELL_IMPLOSION, SPELL_ARMAGEDDON, SPELL_DEEP_FREEZE,SPELL_HYPNOTIZE, SPELL_UNHOLY_WORD, SPELL_VAMPIRISM,SPELL_CONJURE_PHOENIX, SPELL_CELESTIAL_SHIELD,SPELL_HOLY_WORD, SPELL_RESURRECT,
SPELL_SUMMON_BOAT, SPELL_DIMENSION_DOOR, SPELL_TOWN_PORTAL,SPELL_SUMMON_CREATURES };
function  error_NHF_AerisNHF_F ()
print("error:NHF_AerisNHF_F");
end;

AddEvent(new_day_events, 'NHF_aeris_new_day',
function(hero, day)
  if hero == 'AerisNHF' and IsHeroAlive('AerisNHF') then
   	errorHook(error_NHF_AerisNHF_F);
    if (NHF_AerisNHF_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
  		NHF_AerisNHF_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
  		local AerisNHF_bonus_temp = 0;
    	for i, zakl in  NHF_AerisNHF_zakl_mass do
    		if KnowHeroSpell("AerisNHF", zakl)  == true then
    			AerisNHF_bonus_temp = AerisNHF_bonus_temp + 1;
    		end;
    	end;
  		if floor(NHF_Aeris_percent*AerisNHF_bonus_temp) > 0 then
  			NHF_creatures_prirost_F("AerisNHF",floor(NHF_Aeris_percent*AerisNHF_bonus_temp),NHF_mass_creatures.Preserve.L4);
  		end;
  	end;
  end
end)

--NHF---------------�����-----------------------
NHF_DananNHF_textPath = "/MapObjects/Preserve/NewHeroes/Danan/";
NHF_DananNHF_mass_spell_zemlya = { SPELL_LAND_MINE, SPELL_WASP_SWARM, SPELL_EARTHQUAKE, SPELL_SUMMON_HIVE, SPELL_PLAGUE , SPELL_STONE_SPIKES, SPELL_IMPLOSION, SPELL_METEOR_SHOWER};
NHF_DananNHF_pribavka = 0;
function  error_NHF_DananNHF_F ()
	print("error:NHF_DananNHF_F");
end;

AddEvent(add_hero_events, 'NHF_danan_add_hero',
function(hero)
 if hero == 'DananNHF' then
   startThread(
   function()
     while 1 do
       if IsHeroAlive('DananNHF') then
         errorHook(error_NHF_DananNHF_F);
         local NHF_DananNHF_pribavka_temp = 0;
         for  i,spell_zemlya in NHF_DananNHF_mass_spell_zemlya  do
            if (KnowHeroSpell("DananNHF", spell_zemlya) == true) then
               TeachHeroSpell("DananNHF", spell_zemlya);
               NHF_DananNHF_pribavka_temp = NHF_DananNHF_pribavka_temp + 1;
            end;
         end;
         if NHF_DananNHF_pribavka_temp ~= NHF_DananNHF_pribavka then
           ChangeHeroStat("DananNHF", STAT_SPELL_POWER, -ceil(NHF_DananNHF_pribavka*NHF_DananNHF_percent));
           sleep(NHF_slep_singl);
           ChangeHeroStat("DananNHF", STAT_KNOWLEDGE, -ceil(NHF_DananNHF_pribavka*NHF_DananNHF_percent));
           sleep(NHF_slep_singl);
           local temp_name = NHF_tempName_F("DananNHF");
           ChangeHeroStat("DananNHF", STAT_SPELL_POWER, ceil(NHF_DananNHF_pribavka_temp*NHF_DananNHF_percent));
           sleep(NHF_slep_singl);
           ChangeHeroStat("DananNHF", STAT_KNOWLEDGE, ceil(NHF_DananNHF_pribavka_temp*NHF_DananNHF_percent));
           sleep(NHF_slep_singl);
           startThread(NHF_ShowFlyMessage, {NHF_DananNHF_textPath.."NHF_Danan_prirost.txt";prirost=(ceil(NHF_DananNHF_percent*(-NHF_DananNHF_pribavka+NHF_DananNHF_pribavka_temp)))},temp_name,5);
           NHF_DananNHF_pribavka = NHF_DananNHF_pribavka_temp;
         end;
       end
       sleep()
     end
   end)
 end
end)

--NHF-----------------�������--------------------
NHF_Kennent_bonus = 0;
function  error_NHF_Kennent_F ()
	print("error:NHF_Kennent_F");
end;

AddEvent(add_hero_events, 'NHF_kennent_add_hero',
function(hero)
  if hero == 'Kennent' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Kennent') then
          errorHook(error_NHF_Kennent_F);
          local count_creatures = 0;
          local Kennent_bonus_temp = NHF_Kennent_persent*GetHeroStat("Kennent", STAT_LUCK);
        	if Kennent_bonus_temp ~= NHF_Kennent_bonus then
        		NHF_ChangeHeroStat("Kennent", STAT_ATTACK ,Kennent_bonus_temp-NHF_Kennent_bonus);
        		sleep(NHF_slep_singl);
        		NHF_Kennent_bonus = Kennent_bonus_temp;
        	end;
        end
      	sleep()
      end
    end)
  end
end)

--NHF----------------�����---------------------
NHF_Kiina_textPath = "/MapObjects/Preserve/NewHeroes/Kiina/";
function  error_NHF_Kiina_F ()
	print("error:NHF_Kiina_F");
end;
-- ��������� �����
kiina_spec = 
{
	-- ������� �������� �����
	active_marks = {},
	-- ���� � ��������
	mark_object = '/MapObjects/NHF/Kiina_mark_green.(AdvMapStaticShared).xdb#xpointer(/AdvMapStaticShared)',
  mark_red_object = '/MapObjects/NHF/Kiina_mark_red.(AdvMapStaticShared).xdb#xpointer(/AdvMapStaticShared)',
	--
}

KIINA_CUSTOM_SPELL_SUMMON_CREATURES = 1

AddEvent(new_day_events, 'NHF_kiina_new_day',
function(hero, day)
  if hero == 'Kiina' and GetDate(DAY_OF_WEEK) == 1 and IsHeroAlive('Kiina') then
    print('Kiina generation started')
    -- ������� ��������� ����� ����� ��� ���������
    local curr_week = ceil(GetDate(DAY) / 7)
    local marks_to_generate = ceil(GetDate(DAY)/7)
    local lvl = GetHeroLevel('Kiina')
    -- ���� ������ ������ ������ �����, ����� ����� ����� ������
    if marks_to_generate > lvl then
      marks_to_genenate = lvl
    end
    -- �� ����� ����� ������� ����� ��� ������������
    marks_to_generate = marks_to_generate - len(kiina_spec.active_marks)
    -- ��������� ������������ �����, ������� ��, ����� ������� �������, �������� ���� ���, ������� �������� ������
    for mark, info in kiina_spec.active_marks do
      info.lifetime = info.lifetime - 1
      if info.lifetime == 0 then
        RemoveObject(info.mark)
        kiina_spec.active_marks[mark] = nil
        -- ���� ����� �������, �� ����� ����� ������������� �����
        marks_to_generate = marks_to_generate + 1
      elseif info.lifetime == 1 then
        local x, y, z = GetObjectPosition(info.mark)
        RemoveObject(info.mark)
        while IsObjectExists(info.mark) do
          sleep()
        end
        CreateStatic(info.mark, kiina_spec.mark_red_object, x, y, z)
      end
    end
    --
    local kiina_object = GetHeroTown('Kiina') or 'Kiina'
    local kx, ky, kz = GetObjectPosition(kiina_object)
    -- ���������� ������� ���������, �������� ������� �����
    local max_left_x = 25 + 10 * curr_week
    local max_right_x = max_left_x
    if kx + max_right_x > GetTerrainSize() then
      max_right_x = GetTerrainSize() - kx
    end
    if kx - max_left_x <= 0 then
      max_left_x = kx
    end
    --
    local max_up_y = 25 + 10 * curr_week
    local max_low_y = max_up_y
    if ky + max_up_y > GetTerrainSize() then
      max_up_y = GetTerrainSize() - ky
    end
    if ky - max_low_y <= 0 then
      max_low_y = ky
    end
    print('Max low_y: ', max_low_y)
    print('Max up_y: ', max_up_y)
    print('Max left_x: ', max_left_x)
    print('Max right_x: ', max_right_x)
    -- ���� ���� ����� ��� ���������...
    for i = 1, marks_to_generate do
      while 1 do
        --
        local check = 1
        local mx = -1
        -- ��������� ������� ������� ����������� � ����� ������������ ��������� �����
        if random(2) == 1 then
          mx = kx + random(max_right_x)
        else
          mx = kx - random(max_left_x)
        end
        --
        local my = -1
        if random(2) == 1 then
          my = ky + random(max_up_y)
        else
          my = ky - random(max_low_y)
        end
        -- ���� ����� ���������
        if IsTilePassable(mx, my, kz) then
          for mark, info in kiina_spec.active_marks do
            -- � �� �� ����� ��� ������ �������� �����
            if (mx == info.x and my == info.y and kz == info.z) then
              check = nil
              break
            end
          end
        else
          check = nil
        end
        -- ������� ����� �����
        if check then
          local mark_name = 'kiina_mark_'..GetDate(DAY)..'_'..i
          CreateStatic(mark_name, kiina_spec.mark_object, mx, my, kz)
          while not IsObjectExists(mark_name) do
            sleep()
          end
          -- ������ ������ � ��� � ������� �����
          kiina_spec.active_marks[mark_name] = {x = mx, y = my, z = kz, lifetime = 3}
          --
          if not IsObjectVisible(GetObjectOwner(kiina_object), mark_name) then
            ShowObject(GetObjectOwner(kiina_object), mark_name)
          end
          --
          break
        end
        sleep()
      end
    end
  end
end)

-- активация спецумения
function KiinaSpec_SummonCreatures(hero, mark)
  -- найти максимальный уровень существ в городах игрока, которому принадлежит Киина
  local current_max_tier = -1
  for i, town in GetPlayerTowns(GetObjectOwner(hero)) do
  	if GetTownRace(town) == TOWN_PRESERVE then
  	  for dwell = TOWN_BUILDING_DWELLING_1, TOWN_BUILDING_DWELLING_7 do
        print('dwell: ', dwell, ', diff: ', (dwell - (TOWN_BUILDING_DWELLING_1 + 1)))
    		if (GetTownBuildingLevel(town, dwell) ~= 0) and (current_max_tier <= (dwell - (TOWN_BUILDING_DWELLING_1 + 1))) then
    		  current_max_tier = dwell - TOWN_BUILDING_DWELLING_1 + 1
    		  print('current max tier: ', current_max_tier)
    		end
  	  end
  	end
  end
  -- построек нет?
  if current_max_tier == -1 then
  -- иначе
  else
  	-- проверить, есть ли существа этого тира у Киины
  	local kiina_max_tier_creatures = GetHeroCreaturesByTier(hero, TOWN_PRESERVE, current_max_tier)
  	local creature_to_add, count = 0, 0
  	-- если есть, то добавить случайное из имеющихся
  	if kiina_max_tier_creatures then
  	  creature_to_add = GetRandFromT(kiina_max_tier_creatures)
  	-- иначе, случайное из этого тира
  	else
  	  creature_to_add = GetRandFromT(TIER_TABLES[TOWN_PRESERVE][current_max_tier])
  	end
  	count = ceil(GetCreatureGrow(creature_to_add) * GetHeroLevel(hero) * kiina_spec_params.count_per_lvl)
  	print('Adding '..creature_to_add..' in count '..count)
  	AddCreatures(hero, creature_to_add, count)
  	sleep(20)
  	RemoveObject(mark)
  	kiina_spec.active_marks[mark] = nil
  end
end

mccs_hero_custom['Kiina'] =
function()
  local x, y, z = GetObjectPosition('Kiina')
  for mark, info in kiina_spec.active_marks do
    if x == info.x and y == info.y and z == info.z then
      startThread(KiinaSpec_SummonCreatures, 'Kiina', mark)
      break
    end
  end
end

AddEvent(add_hero_events, 'NHF_kiina_add_hero',
function(hero)
  if hero == 'Kiina' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Kiina') then
          local object = GetHeroTown('Kiina') or 'Kiina'
          local x, y, z = GetObjectPosition(object)
          local check
          for mark, info in kiina_spec.active_marks do
            if mark and info then
              if info.x == x and info.y == y and info.z == z then
                check = 1
                break
              end
            end
          end
          --
          if check then
            if not mccs_custom_ability.hero_custom_affected_heroes['Kiina'][KIINA_CUSTOM_SPELL_SUMMON_CREATURES] then
              mccs_custom_ability.hero_custom_affected_heroes['Kiina'][KIINA_CUSTOM_SPELL_SUMMON_CREATURES] = 1
            end
          else
            if mccs_custom_ability.hero_custom_affected_heroes['Kiina'][KIINA_CUSTOM_SPELL_SUMMON_CREATURES] then
              mccs_custom_ability.hero_custom_affected_heroes['Kiina'][KIINA_CUSTOM_SPELL_SUMMON_CREATURES] = nil
            end
          end
        end
        sleep()
      end
    end)
  end
end)



--NHF----------------�������-----------------------
NHF_Lendail_date_temp = 0;
NHF_Lendail_offence = 0;
NHF_Lendail_mass_perk = {PERK_SCOUTING,  RANGER_FEAT_DISGUISE_AND_RECKON , KNIGHT_FEAT_GRAIL_VISION, RANGER_FEAT_SOIL_BURN, RANGER_FEAT_SUN_FIRE};
NHF_Lendail_textPath = "/MapObjects/Preserve/NewHeroes/Lendail/";
function  error_NHF_Lendail_F ()
	print("error:NHF_Lendail_F");
end;

AddEvent(new_day_events, 'NHF_lendail_new_day',
function(hero, day)
  if hero == 'Lendail' and IsHeroAlive('Lendail') then
  	errorHook(error_NHF_Lendail_F);
  	if GetDate(ABSOLUTE_DAY) > NHF_Lendail_date_temp then
  		local temp_name = NHF_tempName_F("Lendail");
  		local  x_hero_Lendail, y_hero_Lendail, zhero_Lendail;
  		local percent = (GetHeroLevel("Lendail")*NHF_Lendail_percent_sc)+12;
  		if HasHeroSkill("Lendail",PERK_SCOUTING) == true then
  			percent = percent + 4;
  		end;
  		if HasHeroSkill("Lendail",RANGER_FEAT_DISGUISE_AND_RECKON) == true then
  			percent = percent + 12;
  		end;
  		if HasArtefact("Lendail", 12,1)  == true then
  			percent = percent + 4;
  		end;
  		NHF_Lendail_date_temp = GetDate(ABSOLUTE_DAY);
  		x_hero_Lendail, y_hero_Lendail, zhero_Lendail = GetObjectPosition("Lendail");
  		OpenCircleFog(x_hero_Lendail, y_hero_Lendail, zhero_Lendail , percent, GetObjectOwner(temp_name));
  	end;
	end
end)

AddEvent(add_hero_events, 'NHF_lendail_add_hero',
function(hero)
  if hero == 'Lendail' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Lendail') then
        	local bonus = 0;
        	for i,perk in NHF_Lendail_mass_perk do
        		if HasHeroSkill("Lendail",perk) == true then
        			bonus = bonus + NHF_Lendail_percent_of;
        		end;
        	end;
        	local d =(bonus-NHF_Lendail_offence);
        	if  d ~= 0 then
        		ChangeHeroStat("Lendail", STAT_ATTACK, d);
        		sleep(NHF_slep_singl);
        		local temp_name = NHF_tempName_F("Lendail")
        		startThread(NHF_ShowFlyMessage,{NHF_Lendail_textPath.."message.txt";p=d}, temp_name,5);
        	end;
        	NHF_Lendail_offence = bonus;
        end
      	sleep()
      end
    end)
  end
end)

--NHF----------------���--------------------
NHF_Sef_ent_temp = 0;
NHF_Sef_index_battle_next = -1;
NHF_Sef_fight_flag = 0
function  error_NHF_Sef_F ()
	print("error:NHF_Sef_F");
end;

AddEvent(combat_results_events, 'NHF_sef_combat_result',
function(fight_id)
  errorHook(error_NHF_Sef_F);
  if (NHF_Sef_index_battle_next ~= fight_id) then
    if (GetSavedCombatArmyHero(fight_id, 1)== "Sef") then
      NHF_Sef_index_battle_next = fight_id;
      NHF_Sef_fight_flag = 1
    end
    if (GetSavedCombatArmyHero(fight_id, 0)== "Sef")  then
      NHF_Sef_index_battle_next = fight_id;
	    NHF_Sef_index_battle_next = -2 ;
    end;
  end;
end)

AddEvent(add_hero_events, 'NHF_set_add_hero',
function(hero)
  if hero == 'Sef' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Sef') then
          local count_pribavka =  ceil((GetHeroCreatures("Sef", CREATURE_TREANT) + GetHeroCreatures("Sef", CREATURE_TREANT_GUARDIAN) + GetHeroCreatures("Sef", CREATURE_ANGER_TREANT))/NHF_Sef_percent);
    	    if count_pribavka > ceil(GetHeroLevel("Sef")/2) then
            count_pribavka = ceil(GetHeroLevel("Sef")/2)
          end;
        	if (count_pribavka ~= NHF_Sef_ent_temp) or (NHF_Sef_fight_flag == 1) then
        		GiveHeroBattleBonus("Sef", HERO_BATTLE_BONUS_DEFENCE, NHF_Sef_percent_base+count_pribavka-NHF_Sef_ent_temp);
        		NHF_Sef_ent_temp = count_pribavka;
        		if NHF_Sef_fight_flag == 1 then
              NHF_Sef_fight_flag = 0
            end
        	end;
        end
      	sleep()
      end
    end)
  end
end)

AddEvent(remove_hero_events, 'NHF_set_remove_hero',
function(hero)
  if hero == 'Sef' then
  	errorHook(error_NHF_Sef_F);
  	NHF_Sef_index_battle_next = -2 ;
  	NHF_Sef_fight_flag = 0
	end
end)

--NHF---------------��������------------------
NHF_Tavaril_textPath = "/MapObjects/Preserve/NewHeroes/Tavaril/";
NHF_Tavaril_date_popolnenie = -1;
function  error_NHF_Tavaril_F ()
	print("error:NHF_Tavaril_F");
end;

AddEvent(new_day_events, 'NHF_tavaril_new_day',
function(hero, day)
  if hero == 'Tavaril' and IsHeroAlive('Tavaril') then
    errorHook(error_NHF_Tavaril_F);
    local count_pribavka =  NHF_Tavaril_percent*ceil((GetHeroCreatures("Tavaril", CREATURE_TREANT) + GetHeroCreatures("Tavaril", CREATURE_TREANT_GUARDIAN) + GetHeroCreatures("Tavaril", CREATURE_ANGER_TREANT)));
    if (NHF_Tavaril_date_popolnenie < (ceil(GetDate(ABSOLUTE_DAY)/7)-1))and(count_pribavka>0) then
    NHF_Tavaril_date_popolnenie = (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
      if count_pribavka > ceil(2*GetHeroLevel("Tavaril")) then
         count_pribavka = ceil(2*GetHeroLevel("Tavaril"));
      end;
  	if count_pribavka > 0 then
  		NHF_creatures_prirost_F("Tavaril",count_pribavka,NHF_mass_creatures.Preserve.L1);
  	end;
      end;
   end
end)

--NHF---------------��������------------------
NHF_Torintan_day_temp = 0;
function  error_NHF_Torintan_F ()
	print("error:NHF_Torintan_F");
end;

AddEvent(new_day_events, 'NHF_torintan_new_day',
function(hero, day)
  if hero == 'Torintan' and IsHeroAlive('Torintan') then
  errorHook(error_NHF_Torintan_F);
  if (mod(GetDate(ABSOLUTE_DAY),7) == 1) and (NHF_Torintan_day_temp ~= GetDate(ABSOLUTE_DAY)) then
    NHF_Torintan_day_temp = GetDate(ABSOLUTE_DAY);
    NHF_ChangeResourceHero(WOOD, ceil(NHF_Torintan_percent*GetHeroLevel("Torintan")), "Torintan");
	sleep(NHF_slep_singl);
  end;
  end
end)

--NHF--------------------���--------------------
NHF_Ula_textPath = "/MapObjects/Preserve/NewHeroes/Ula/";
NHF_Ula_index_battle_next = -1;
NHF_Ula_mana_temp = 0;
function  error_NHF_Ula_F ()
	print("error:NHF_Ula_F");
end;

AddEvent(combat_results_events, 'NHF_ula_combat_result',
function(fight_id)
	errorHook(error_NHF_Ula_F);
	if (GetSavedCombatArmyHero(fight_id, 1)== "Ula") and (NHF_Ula_index_battle_next ~= fight_id) then
		NHF_Ula_index_battle_next = fight_id;
		local temp_name = NHF_tempName_F("Ula");
		local mana_plus = GetPlayerResource(GetObjectOwner(temp_name), GEM);
		if mana_plus > (NHF_Ula_mana_temp - GetHeroStat("Ula", STAT_MANA_POINTS)) then 
			mana_plus = NHF_Ula_mana_temp - GetHeroStat("Ula", STAT_MANA_POINTS); 
		end;			
		if mana_plus > 0 then
			local mana_prirost =  ceil(mana_plus*NHF_Ula_persent);
			local temp_knowledge = GetHeroStat("Ula", STAT_KNOWLEDGE)*10;
			ChangeHeroStat("Ula", STAT_KNOWLEDGE, temp_knowledge);
			sleep(NHF_slep_singl);
			ChangeHeroStat("Ula", STAT_MANA_POINTS, mana_prirost);
			sleep(NHF_slep_singl);
			ChangeHeroStat("Ula", STAT_KNOWLEDGE, -temp_knowledge);
			sleep(NHF_slep_singl);
			startThread(NHF_ShowFlyMessage,{NHF_Ula_textPath.."message.txt";p=mana_prirost}, temp_name,5);
			--startThread(NHF_ShowFlyMessage, NHF_rawtext_standart("���� + "..mana_prirost),temp_name,5);
		end;
	else
		NHF_Ula_mana_temp  = GetHeroStat("Ula", STAT_MANA_POINTS);
	end;	   
end)

--NHF---------------�������-------------------
NHF_Unutel_index_battle_next = -2;
NHF_Unutel_perviy_flag = 0;
function  error_NHF_Unutel_F ()
	print("error:NHF_Unutel_F");
end;

AddEvent(add_hero_events, 'NHF_unutel_add_hero',
function(hero)
  if hero == 'Unutel' then
  	errorHook(error_NHF_Unutel_F);
		GiveHeroBattleBonus("Unutel", HERO_BATTLE_BONUS_SPEED, NHF_Unutel_percent);
		GiveHeroBattleBonus("Unutel", HERO_BATTLE_BONUS_INITIATIVE, NHF_Unutel_percent);
  end
end)

AddEvent(respawn_hero_events, 'NHF_unutel_respawn',
function(hero)
  if hero == 'Unutel' then
  	errorHook(error_NHF_Unutel_F);
		GiveHeroBattleBonus("Unutel", HERO_BATTLE_BONUS_SPEED, NHF_Unutel_percent);
		GiveHeroBattleBonus("Unutel", HERO_BATTLE_BONUS_INITIATIVE, NHF_Unutel_percent);
  end
end)

AddEvent(combat_results_events, 'NHF_unutel_combat_result',
function(fight_id)
	if (NHF_Unutel_index_battle_next ~= fight_id) then
		if (GetSavedCombatArmyHero(fight_id, 1)== "Unutel")  then
			NHF_Unutel_index_battle_next = fight_id;
			GiveHeroBattleBonus("Unutel", HERO_BATTLE_BONUS_SPEED, NHF_Unutel_percent);
			GiveHeroBattleBonus("Unutel", HERO_BATTLE_BONUS_INITIATIVE, NHF_Unutel_percent);
		end;
		if (GetSavedCombatArmyHero(fight_id, 0)== "Unutel")  then
			NHF_Unutel_index_battle_next = fight_id;
		end;
	end;
	NHF_Unutel_index_battle_next = fight_id;
end)

AddEvent(remove_hero_events, 'NHF_unutel_remove_hero',
function(hero)
  if hero == 'Unutel' then
	  NHF_Unutel_index_battle_next = -2;
	end
end)

--NHF----------------�����---------------------
NHF_Ergar_textPath = "/MapObjects/Preserve/NewHeroes/Ergar/";
NHF_Ergar_index_battle_next = -1;
function  error_NHF_Ergar_F ()
	print("error:NHF_Ergar_F");
end;

AddEvent(combat_results_events, 'NHF_ergar_combat_result',
function(fight_id)
  errorHook(error_NHF_Ergar_F);
  local temp_name = NHF_tempName_F("Ergar");
  if (GetSavedCombatArmyHero(fight_id, 1)== "Ergar") and (NHF_Ergar_index_battle_next ~= fight_id) then
	NHF_Ergar_index_battle_next = fight_id;
	ChangeHeroStat("Ergar", STAT_MOVE_POINTS, NHF_Ergar_MP);
	sleep(NHF_slep_singl);
	local NHF_Ergar_MP_temp = NHF_Ergar_MP;
	if GetHeroSkillMastery("Ergar", HERO_SKILL_PATH_OF_WAR) == true then
		NHF_Ergar_MP = NHF_Ergar_MP + 250;
	end;
	startThread(NHF_ShowFlyMessage, {NHF_Ergar_textPath.."NHF_Ergar_prirost.txt";prirost=NHF_Ergar_MP},temp_name,5);
	NHF_Ergar_MP = NHF_Ergar_MP_temp;
  end;
end)

--NHF_E--------------��������-----------------------
NHF_Vyneeris_week_temp = -1;
NHF_Vyneeris_index_battle_next = -1;
NHF_Vyneeris_bonus_temp = 0;
function  error_NHF_Vyneeris_F ()
	print("error:NHF_Vyneeris_F");
end;

AddEvent(new_day_events, 'NHF_vyneeris_new_day',
function(hero, day)
  if hero == 'Vyneeris' and IsHeroAlive('Vyneeris') then
  --���������� ����������
  	errorHook(error_NHF_Vyneeris_F);
  	if (NHF_Vyneeris_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
  		NHF_Vyneeris_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
  		local temp_name = NHF_tempName_F("Vyneeris");
  		local prirost = ceil(GetHeroLevel("Vyneeris")*NHF_Vyneeris_percent);
  		if prirost > 0 then
  			NHF_creatures_prirost_F("Vyneeris",prirost,NHF_mass_creatures.Preserve.L5);
  		end;
  	end;
  end
end)

AddEvent(combat_results_events, 'NHF_vyneeris_combat_result',
function(fight_id)
--���������� ����������	
	local flag_battle = 0;
	if (GetSavedCombatArmyHero(fight_id, 1)== "Vyneeris") and (NHF_Vyneeris_index_battle_next ~= fight_id) then
		NHF_Vyneeris_index_battle_next = fight_id;
		flag_battle = 1;
  end
end)

AddEvent(add_hero_events, 'NHF_vyneeris_add_hero',
function(hero)
  if hero == 'Vyneeris' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Vyneeris') then
        	local count_unicorn = GetHeroCreatures("Vyneeris",CREATURE_UNICORN) + GetHeroCreatures("Vyneeris",CREATURE_WAR_UNICORN) + GetHeroCreatures("Vyneeris",CREATURE_WHITE_UNICORN);
        	local count_dobavka = 0;
        	count_dobavka = floor(count_unicorn/NHF_Vyneeris_percent_ini);
        	if  (NHF_Vyneeris_bonus_temp ~= count_dobavka)  or (flag_battle == 1) then
        		local bonus_temp_too = count_dobavka;
        		if  flag_battle == 0 then
        			count_dobavka = count_dobavka - NHF_Vyneeris_bonus_temp;
        		end;
        		if count_dobavka ~= 0 then
        			GiveHeroBattleBonus("Vyneeris", HERO_BATTLE_BONUS_INITIATIVE, count_dobavka);
        		end;
        		NHF_Vyneeris_bonus_temp = bonus_temp_too;
        		flag_battle = 0;
        	 end;
         end
         sleep()
      end
    end)
  end
end)

--NHF_E--------------��������-----------------------
NHF_Draylana_textPath = "/MapObjects/Preserve/NewHeroes/Draylana/";
NHF_Draylana_index_battle_next = -1;
NHF_Draylana_mana_temp = 0;
function  error_NHF_Draylana_F ()
	print("error:NHF_Draylana_F");
end;

AddEvent(combat_results_events, 'NHF_draylana_combat_result',
function(fight_id)
  errorHook(error_NHF_Draylana_F);
  if (GetSavedCombatArmyHero(fight_id, 1)== "Draylana") and (NHF_Draylana_index_battle_next ~= fight_id) then
    NHF_Draylana_index_battle_next = fight_id;
	local temp_name = NHF_tempName_F("Draylana");
    local mana_trata = NHF_Draylana_mana_temp - GetHeroStat("Draylana", STAT_MANA_POINTS);
    if mana_trata >0 then
       local mana_prirost =  ceil(mana_trata*NHF_Draylana_persent);
       local temp_knowledge = GetHeroStat("Draylana", STAT_KNOWLEDGE)*10;
       ChangeHeroStat("Draylana", STAT_KNOWLEDGE, temp_knowledge);
       sleep(NHF_slep_singl);
       ChangeHeroStat("Draylana", STAT_MANA_POINTS, mana_prirost);
	   sleep(NHF_slep_singl);
       ChangeHeroStat("Draylana", STAT_KNOWLEDGE, -temp_knowledge);
	   sleep(NHF_slep_singl);
	   startThread(NHF_ShowFlyMessage,{NHF_Draylana_textPath.."message.txt";p=mana_prirost}, temp_name,5);
	   --startThread(NHF_ShowFlyMessage, NHF_rawtext_standart("���� + "..mana_prirost),temp_name,5);
    end;
  else
    if IsHeroAlive('Draylana') then
      NHF_Draylana_mana_temp = GetHeroStat("Draylana", STAT_MANA_POINTS);
    end
  end;
end)

--NHF_E---------------�����---------------------
NHF_Istar_textPath = "/MapObjects/Preserve/NewHeroes/Istar/";
NHF_Istar_index_battle_next = -1;
NHF_Istar_mana_points = 0;
NHF_Istar_mana_temp = 0;
function  error_NHF_Istar_F ()
	print("error:NHF_Istar_F");
end;

AddEvent(combat_results_events, 'NHF_istar_combat_result',
function(fight_id)
  errorHook(error_NHF_Istar_F);
  if (GetSavedCombatArmyHero(fight_id, 1)== "Istar") and (NHF_Istar_index_battle_next ~= fight_id) then
    NHF_Istar_index_battle_next = fight_id;
    local prirost =  ceil((NHF_Istar_mana_points - GetHeroStat("Istar", STAT_MANA_POINTS) + NHF_Istar_mana_temp)/NHF_Istar_percent)-1;
       if prirost < 1 then
          prirost = 0;
          NHF_Istar_mana_temp = mod((NHF_Istar_mana_points-GetHeroStat("Istar", STAT_MANA_POINTS)),NHF_Istar_percent)+ NHF_Istar_mana_temp ;
       else
          NHF_Istar_mana_temp = mod((NHF_Istar_mana_points-GetHeroStat("Istar", STAT_MANA_POINTS)),NHF_Istar_percent);
          NHF_creatures_prirost_F("Istar",prirost,NHF_mass_creatures.Preserve.L4);
    end;
  else
    if IsHeroAlive('Istar') then
      NHF_Istar_mana_points = GetHeroStat("Istar", STAT_MANA_POINTS);
    end
  end;
end)

-----------------------------------------------
----------------���� �����---------------------
-----------------------------------------------

----------------������-------------------------
NHF_Ohtarig_week_temp = -1;
function  error_NHF_Ohtarig_F ()
	print("error:NHF_Ohtarig_F");
end;

AddEvent(new_day_events, 'NHF_ohtarig_new_day',
function(hero, day)
  if hero == 'Ohtarig' and IsHeroAlive('Ohtarig') then
	errorHook(error_NHF_Ohtarig_F);
	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Ohtarig_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
		NHF_Ohtarig_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
		local temp_name = NHF_tempName_F("Ohtarig");
		local prirost = ceil(GetHeroLevel("Ohtarig")*NHF_Vaishan_percent);
		if prirost > 0 then
			NHF_creatures_prirost_F("Ohtarig",prirost,NHF_mass_creatures.Dungeon.L1);
		end;
	end;
	end
end)

----------------������-------------------------
NHF_Urunir_week_temp = -1;
function  error_NHF_Urunir_F ()
	print("error:NHF_Urunir_F");
end;

AddEvent(new_day_events, 'NHF_urunir_new_day',
function(hero, day)
  if hero == 'Urunir' and IsHeroAlive('Urunir') then
	errorHook(error_NHF_Urunir_F);
	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Urunir_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
		NHF_Urunir_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
		local temp_name = NHF_tempName_F("Urunir");
		local prirost = ceil(GetHeroLevel("Urunir")*NHF_Iranna_percent);
		if prirost > 0 then
			NHF_creatures_prirost_F("Urunir",prirost,NHF_mass_creatures.Dungeon.L2);
		end;
	end;
	end
end)

----------------�����--------------------------
NHF_Almegir_k = -1;
NHF_Almegir_mp = -1;
NHF_Almegir_mana = -1;
function  error_NHF_Almegir_F ()
	print("error:NHF_Almegir_F");
end;

AddEvent(add_hero_events, 'NHF_almegir_add_hero',
function(hero)
  if hero == 'Almegir' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Almegir') then
        	errorHook(error_NHF_Almegir_F);
        	local temp_k = GetHeroStat("Almegir", STAT_KNOWLEDGE);
        	local temp_mp = GetHeroStat("Almegir", STAT_MOVE_POINTS);
        	local temp_mana = GetHeroStat("Almegir", STAT_MANA_POINTS);
        	local temp_mana_max = temp_k*10;
        	if GetHeroSkillMastery("Almegir", PERK_INTELLIGENCE) == true then
        		temp_mana_max = temp_k*15;
        	end;
        	if  (temp_k == NHF_Almegir_k) and ((temp_mp == 0) and (temp_mp < NHF_Almegir_mp) and (NHF_Almegir_mp >= 2500 )) and ((temp_mana > NHF_Almegir_mana) and (temp_mana == temp_mana_max) ) then --and (NHF_Almegir_mana < temp_mana_max)
        		local temp_knowledge = GetHeroStat("Almegir", STAT_KNOWLEDGE)*10;
        		ChangeHeroStat("Almegir", STAT_KNOWLEDGE, temp_knowledge);
        		sleep(NHF_slep_singl);
        		local count_pribavka_mana = ceil(GetHeroStat("Almegir", STAT_MANA_POINTS)*NHF_Almegir_percent);
        		ChangeHeroStat("Almegir",STAT_MANA_POINTS, count_pribavka_mana);
        		sleep(NHF_slep_singl);
        		ChangeHeroStat("Almegir", STAT_KNOWLEDGE, -temp_knowledge);
        		sleep(NHF_slep_singl);
        		local temp_name = NHF_tempName_F("Almegir");
        		startThread(NHF_ShowFlyMessage, {NHF_Add_mana_textPath;add_mana=count_pribavka_mana},temp_name,5);
        	end;
        	NHF_Almegir_k = temp_k;
        	NHF_Almegir_mp = temp_mp;
        	NHF_Almegir_mana = temp_mana;
        end
      	sleep()
      end
    end)
  end
end)

------------------�����---------------------
NHF_Menel_week_temp = -1;
function  error_NHF_Menel_F ()
	print("error:NHF_Menel_F");
end;

AddEvent(new_day_events, 'NHF_menel_new_day',
function(hero, day)
  if hero == 'Menel' and IsHeroAlive('Menel') then
  	errorHook(error_NHF_Menel_F);
  	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Menel_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
  		NHF_Menel_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
  		local temp_name = NHF_tempName_F("Menel");
  		local prirost = ceil(GetHeroLevel("Menel")*NHF_Kifra_percent);
  		if prirost > 0 then
  			NHF_creatures_prirost_F("Menel",prirost,NHF_mass_creatures.Dungeon.L3);
  		end;
  	end;
	end
end)

----------------�������-------------------	
NHF_Ferigl_index_battle_next = -1;
function  error_NHF_Ferigl_F ()
	print("error:NHF_Ferigl_F");
end;

AddEvent(combat_results_events, 'NHF_ferigl_combat_result',
function(fight_id)
  errorHook(error_NHF_Ferigl_F);
  local temp_name = NHF_tempName_F("Ferigl");
  if (GetSavedCombatArmyHero(fight_id, 1)== "Ferigl") and (NHF_Ferigl_index_battle_next ~= fight_id) then
	  NHF_Ferigl_index_battle_next = fight_id;
	  local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id,1);
	  for i = 0, count_stacks - 1 do
		  local id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id,1,i);
		  if  dead_count > 0 then
				local dobavka_rider = (floor(dead_count*NHF_Ferigl_percent));
				if dobavka_rider > dead_count then
					dobavka_rider = dead_count;
				end;
				if dobavka_rider > 0 then  				
					for j, id in NHF_mass_creatures.Dungeon.L4.ID do
						if id == id_creatures then							
							AddHeroCreatures("Ferigl",id_creatures, dobavka_rider);
							startThread(NHF_ShowFlyMessage, {NHF_textPath_prirost;creatures=NHF_mass_creatures.Dungeon.L4.Name[j],prirost=dobavka_rider },temp_name ,5);
							break;
						end;
					end;
				end;
		  dead_count = 0;
		  end;
	  end;
  end;
end)

----------------����---------------------
NHF_Eruina_week_temp = -1;
function  error_NHF_Eruina_F ()
	print("error:NHF_Eruina_F");
end;

AddEvent(new_day_events, 'NHF_eruina_new_day',
function(hero, day)
  if hero == 'Eruina' and IsHeroAlive('Eruina') then
	errorHook(error_NHF_Eruina_F);
	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Eruina_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
		NHF_Eruina_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
		local temp_name = NHF_tempName_F("Eruina");
		local prirost = ceil(GetHeroLevel("Eruina")*NHF_Eruina_percent);
		if prirost > 0 then
			NHF_creatures_prirost_F("Eruina",prirost,NHF_mass_creatures.Dungeon.L6);
		end;
	end;
	end
end)

--NHF-------------�����---------------------
NHF_Ashbeth_textPath = "/MapObjects/Dungeon/NewHeroes/Ashbeth/";
NHF_Ashbeth_in_town = -1;
function  error_NHF_Ashbeth_F ()
	print("error:NHF_Ashbeth_F");
end;

AddEvent(add_hero_events, 'NHF_ashbeth_add_hero',
function(hero)
  if hero == 'Ashbeth' then
    startThread(
    function()
      while 1 do
      	errorHook(error_NHF_Ashbeth_F);
      	if IsHeroAlive('Ashbeth') then
        	for i, town in NHF_names_objects.towns do
        		if (((IsHeroInTown("Ashbeth", town , 1, 0)  == true) or (GetTownHero(town) == "Ashbeth")) and NHF_Ashbeth_in_town ~= 1) then
        			NHF_Ashbeth_in_town = 1;
        			local cur_mana = GetHeroStat("Ashbeth", STAT_MANA_POINTS);
        			ChangeHeroStat("Ashbeth", STAT_MOVE_POINTS, 12000);
        			sleep(NHF_slep_singl);
        			ChangeHeroStat("Ashbeth", STAT_MANA_POINTS, GetHeroStat("Ashbeth", STAT_KNOWLEDGE)*30);
        			sleep(NHF_slep_singl);
        			if GetHeroStat("Ashbeth", STAT_MANA_POINTS) > cur_mana then
        				local delta_mana = GetHeroStat("Ashbeth", STAT_MANA_POINTS) - cur_mana;
        				local temp_name = NHF_tempName_F("Ashbeth");
        				startThread(NHF_ShowFlyMessage, {NHF_Ashbeth_textPath.."NHF_Ashbeth_prirost.txt";p_m=delta_mana},temp_name,5);
        			end;
        		else
        			NHF_Ashbeth_in_town = 0;
        		end;
        	end;
        end
        sleep()
      end;
    end)
  end
end)

AddEvent(remove_hero_events, 'NHF_ashbeth_remove_hero',
function(hero)
  if hero == 'Ashbeth' then
	errorHook(error_NHF_Ashbeth_F);
	NHF_Ashbeth_in_town = -1;
	end
end)

--NHF-------------�������---------------------
NHF_Vikonia_day_temp = 0;
function  error_NHF_Vikonia_F ()
	print("error:NHF_Vikonia_F");
end;

AddEvent(new_day_events, 'NHF_vikonia_new_day',
function(hero, day)
  if hero == 'Viconia' and IsHeroAlive('Viconia') then
  	errorHook(error_NHF_Vikonia_F);
  	if GetDate(ABSOLUTE_DAY) > NHF_Vikonia_day_temp then
  		NHF_Vikonia_day_temp = GetDate(ABSOLUTE_DAY);
  		local count = 0;
  		local creature_mass = {} ;
  		creature_mass[0], creature_mass[1], creature_mass[2], creature_mass[3], creature_mass[4], creature_mass[5], creature_mass[6]= GetHeroCreaturesTypes("Vikonia");
  		for  i, id in  creature_mass do
  			if id ~= 0 then
  				if GetHeroCreatures("Vikonia", id ) > 0 then
  					count = count + GetHeroCreatures("Vikonia", id );
  				end;
  			end;
  		end;
  		local gold_plus = ceil(count*NHF_Vikonia_percent*ceil(GetHeroLevel("Vikonia")/NHF_Vikonia_lvl_percent));
  		if gold_plus > 0 then
  			NHF_ChangeResourceHero(GOLD, gold_plus, "Vikonia");
  			sleep(NHF_slep_singl);
  		end;
  	end;
	end
end)

--NHF---------------�����----------------------
NHF_Deliya_textPath = "/MapObjects/Dungeon/NewHeroes/Deliya/";
function  error_NHF_Deliya_F ()
	print("error:NHF_Deliya_F");
end;
NHF_Deliya_lvl_temp = 1;

AddEvent(level_up_events, 'NHF_deliya_lvl_up',
function(hero)
  if hero == 'Deliya' then
  	errorHook(error_NHF_Deliya_F);
  	if GetHeroLevel("Deliya") > NHF_Deliya_lvl_temp  then
  		local temp_name = NHF_tempName_F("Deliya");
  		NHF_Deliya_lvl_temp = GetHeroLevel("Deliya");
  		local mass_Deliya_stat =
  		{
  			[1] = {["path"]="NHF_Deliya_o.txt",["count"]=GetHeroStat("Deliya", STAT_ATTACK)},
  			[2] = {["path"]="NHF_Deliya_d.txt",["count"]=GetHeroStat("Deliya", STAT_DEFENCE)},
  			[3] = {["path"]="NHF_Deliya_sp.txt",["count"]=GetHeroStat("Deliya", STAT_SPELL_POWER)},
  			[4] = {["path"]="NHF_Deliya_k.txt",["count"]=GetHeroStat("Deliya", STAT_KNOWLEDGE)},
  			["STAT_MAX"] = {["id_stat"]=0,["count"]=0,["path"]="_"},
  			["STAT_MIN"] = {["id_stat"]=0,["count"]=9999,["path"]="_"}
  		};
  		for i=1,4 do
  			if mass_Deliya_stat.STAT_MAX.count <= mass_Deliya_stat[i]["count"] then
  				mass_Deliya_stat.STAT_MAX.count = mass_Deliya_stat[i]["count"];
  			end;
  			if mass_Deliya_stat.STAT_MIN.count >= mass_Deliya_stat[i]["count"] then
  				mass_Deliya_stat.STAT_MIN.count = mass_Deliya_stat[i]["count"];
  				mass_Deliya_stat.STAT_MIN.id_stat = i;
  				mass_Deliya_stat.STAT_MIN.path = mass_Deliya_stat[i]["path"];
  			end;
          end;
  		local delta_persent_Deliya = (mass_Deliya_stat.STAT_MAX.count - mass_Deliya_stat.STAT_MIN.count)*NHF_Deliya_percent;
  		if (delta_persent_Deliya*100) >= (random(100)+1) then
  			ChangeHeroStat("Deliya", mass_Deliya_stat.STAT_MIN.id_stat,1);
  			sleep(NHF_slep_singl);
  			startThread(NHF_ShowFlyMessage, {NHF_Deliya_textPath.."NHF_Deliya_prirost.txt";stat=NHF_Deliya_textPath..mass_Deliya_stat.STAT_MIN.path},temp_name , 5);
  		end;
  	end;
	end
end)

--NHF----------------������--------------------
NHF_Ilmirn_textPath = "/MapObjects/Dungeon/NewHeroes/Ilmirn/";
NHF_Ilmirn_index_battle_next = -1
function  error_NHF_Ilmirn_F ()
	print("error:NHF_Ilmirn_F");
end;

AddEvent(combat_results_events, 'NHF_ilmirn_combat_result',
function(fight_id)
  if (GetSavedCombatArmyHero(fight_id, 1)== "Ilmirn") and (NHF_Ilmirn_index_battle_next ~= fight_id) then
	NHF_Ilmirn_index_battle_next = fight_id;
	local temp_name = NHF_tempName_F("Ilmirn");
	local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id,1);
	local dobavka = 0;
	local id_creatures, count_creatures, dead_count;
	for i = 0, count_stacks - 1 do
	  id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id,1,i);
	  if  dead_count > 0 then
		if  (id_creatures == CREATURE_HYDRA)or(id_creatures ==CREATURE_CHAOS_HYDRA)or(id_creatures ==CREATURE_ACIDIC_HYDRA) then
			dobavka = dead_count +  dobavka;
		end;
	  end;
	  dead_count = 0;
	end;
	if  dobavka > 0 then
	    if  GetHeroLevel("Ilmirn") < dobavka then dobavka = GetHeroLevel("Ilmirn") end; -- 0.72		 
		for i,town in NHF_names_objects.towns do
		  if  ((GetTownRace(town) == TOWN_DUNGEON)  and (GetObjectOwner(town) ==  GetObjectOwner(temp_name))) then
			if GetTownBuildingLevel(town, TOWN_BUILDING_DWELLING_5) ~= 0 then
			   local prorost = floor(dobavka*NHF_Ilmirn_percent);
			   if prorost > 0 then 
				   SetObjectDwellingCreatures(town, CREATURE_HYDRA, GetObjectDwellingCreatures(town,CREATURE_HYDRA) + prorost);
				   startThread(NHF_ShowFlyMessage,{NHF_Ilmirn_textPath.."message.txt";p=prorost}, temp_name,5);
				   --startThread(NHF_ShowFlyMessage, NHF_rawtext_standart("��������� ������� ����: + "..prorost),town , 5);
			   end;
			end;
		  end;
		end;
	end;
  end;
end)

--NHF---------------������---------------------
NHF_Kastore_bonus = 0;
NHF_Kastore_zakl_mass = {SPELL_MAGIC_ARROW, SPELL_STONE_SPIKES,SPELL_CURSE, SPELL_SLOW, SPELL_SORROW,SPELL_MAGIC_FIST, SPELL_LAND_MINE,SPELL_BLESS, SPELL_HASTE,
SPELL_LIGHTNING_BOLT, SPELL_ICE_BOLT,SPELL_DISRUPTING_RAY, SPELL_PLAGUE,SPELL_WASP_SWARM, SPELL_ANIMATE_DEAD,SPELL_STONESKIN, SPELL_DISPEL,
SPELL_FIREBALL,SPELL_FROST_RING, SPELL_FIREWALL,SPELL_WEAKNESS, SPELL_FORGETFULNESS,SPELL_PHANTOM, SPELL_EARTHQUAKE,SPELL_BLOODLUST, SPELL_DEFLECT_ARROWS,
SPELL_CHAIN_LIGHTNING, SPELL_METEOR_SHOWER,SPELL_SUMMON_ELEMENTALS, SPELL_SUMMON_HIVE, SPELL_BLIND, SPELL_BERSERK, SPELL_TELEPORT, SPELL_ANTI_MAGIC, SPELL_DIVINE_VENGEANCE,
SPELL_IMPLOSION, SPELL_ARMAGEDDON, SPELL_DEEP_FREEZE,SPELL_HYPNOTIZE, SPELL_UNHOLY_WORD, SPELL_VAMPIRISM,SPELL_CONJURE_PHOENIX, SPELL_CELESTIAL_SHIELD,SPELL_HOLY_WORD, SPELL_RESURRECT,
SPELL_SUMMON_BOAT, SPELL_DIMENSION_DOOR, SPELL_TOWN_PORTAL,SPELL_SUMMON_CREATURES };

function  error_NHF_Kastore_F ()
print("error:NHF_Kastore_F");
end;

AddEvent(add_hero_events, 'NHF_kastore_add_hero',
function(hero)
  if hero == 'Kastore' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Kastore') then
        	errorHook(error_NHF_Kastore_F);
        	local Kastore_bonus_temp = 0;
        	for i, zakl in  NHF_Kastore_zakl_mass do
        		if KnowHeroSpell("Kastore", zakl)  == true then
        			Kastore_bonus_temp = Kastore_bonus_temp + 1;
        		end;
        	end;
          if floor(Kastore_bonus_temp/NHF_Kastore_percent) > floor(NHF_Kastore_bonus/NHF_Kastore_percent) then
      	    NHF_ChangeHeroStat("Kastore", STAT_SPELL_POWER,floor(Kastore_bonus_temp/NHF_Kastore_percent)-floor(NHF_Kastore_bonus/NHF_Kastore_percent));
      	    sleep(NHF_slep_singl);
      	    NHF_Kastore_bonus = Kastore_bonus_temp;
        	end;
        end
        sleep()
      end
    end)
	end
end)

--NHF----------------������--------------------
NHF_Kaelin_textPath = "/MapObjects/Dungeon/NewHeroes/Kaelin/";
NHF_Kaelin_index_battle_next = -1;
function  error_NHF_Kaelin_F ()
	print("error:NHF_Kaelin_F");
end;

AddEvent(combat_results_events, 'NHF_kaelin_combat_result',
function(fight_id)
  errorHook(error_NHF_Kaelin_F);
  if (GetSavedCombatArmyHero(fight_id, 1)== "Kaelin") and (NHF_Kaelin_index_battle_next ~= fight_id) then
    NHF_Kaelin_index_battle_next = fight_id;
    local temp_name = NHF_tempName_F("Kaelin");
    local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id,0);
    local id_creatures, count_creatures,dead_count ;
    local itogo_dead_count = 0;
    for i_givie = 0, count_stacks - 1 do
		id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id,0,i_givie);
		if NHF_mass_not_living[id_creatures] == 1 then
			itogo_dead_count = itogo_dead_count - dead_count;
		end;
		itogo_dead_count = itogo_dead_count + dead_count;
    end;
    local count_pribavka_mana =  floor((itogo_dead_count)*NHF_Kaelin_persent);
  	if count_pribavka_mana > 0 then
  	    local temp_knowledge = GetHeroStat("Kaelin", STAT_KNOWLEDGE)*10;
  		ChangeHeroStat("Kaelin", STAT_KNOWLEDGE, temp_knowledge);
  		sleep(NHF_slep_singl);
  		ChangeHeroStat("Kaelin", STAT_MANA_POINTS, count_pribavka_mana);
  		sleep(NHF_slep_singl);
  		ChangeHeroStat("Kaelin", STAT_KNOWLEDGE, -temp_knowledge);
  		sleep(NHF_slep_singl);
  		startThread(NHF_ShowFlyMessage, {NHF_Kaelin_textPath.."NHF_Kaelin_prirost.txt";count_pribavka=count_pribavka_mana},temp_name,5);
  	end;
  end;
end)

--NHF----------------------�����--------------------
NHF_Menan_week_temp = -1;
function  error_NHF_Menan_F ()
	print("error:NHF_Menan_F");
end;

AddEvent(new_day_events, 'NHF_menan_new_day',
function(hero, day)
  if hero == 'Menan' and IsHeroAlive('Menan') then
	errorHook(error_NHF_Menan_F);
	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Menan_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
		NHF_Menan_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
		local prirost = ceil(GetHeroLevel("Menan")*NHF_Menan_percent1);
		if prirost > 0 then
			sleep(0.1);
			NHF_creatures_prirost_F("Menan",prirost,NHF_mass_creatures.Dungeon.L1,nil,4);
		end;      
		prirost = ceil(GetHeroLevel("Menan")*NHF_Menan_percent2);
		if prirost > 0 then
			sleep(2);
			NHF_creatures_prirost_F("Menan",prirost,NHF_mass_creatures.Dungeon.L2,nil,4);
		end;    
		prirost = ceil(GetHeroLevel("Menan")*NHF_Menan_percent3);
		if prirost > 0 then
			sleep(2);
			NHF_creatures_prirost_F("Menan",prirost,NHF_mass_creatures.Dungeon.L3,nil,4);
		end;
	end;
	end
end)

--NHF----------------------������--------------------
NHF_Sylsai_index_battle_next = -2;
NHF_Sylsai_perviy_flag = 0;
function  error_NHF_Sylsai_F ()
	print("error:NHF_Sylsai_F");
end;

AddEvent(add_hero_events, 'NHF_sylsai_add_hero',
function(hero)
  if hero == 'Sylsai' then
		GiveHeroBattleBonus("Sylsai", HERO_BATTLE_BONUS_SPEED, NHF_Sylsai_percent);
	end; 
end)

AddEvent(respawn_hero_events, 'NHF_sylsai_respawn',
function(hero)
  if hero == 'Sylsai' then
		GiveHeroBattleBonus("Sylsai", HERO_BATTLE_BONUS_SPEED, NHF_Sylsai_percent);
	end;
end)

AddEvent(combat_results_events, 'NHF_sylsai_combat_result',
function(fight_id)
	if (NHF_Sylsai_index_battle_next ~= fight_id) then
		if (GetSavedCombatArmyHero(fight_id, 1)== "Sylsai")  then
			NHF_Sylsai_index_battle_next = fight_id;
			GiveHeroBattleBonus("Sylsai", HERO_BATTLE_BONUS_SPEED, NHF_Sylsai_percent);
		end;
		if (GetSavedCombatArmyHero(fight_id, 0)== "Sylsai")  then
			NHF_Sylsai_index_battle_next = fight_id;
		end;
	end;
	NHF_Sylsai_index_battle_next = fight_id;
end)

AddEvent(remove_hero_events, 'NHF_sylsai_remove_hero',
function(hero)
  if hero == 'Sylsai' then
	  NHF_Sylsai_index_battle_next = -2;
	end
end)

--NHF----------------�����---------------------
NHF_Tanna_lvlHero_temp = 1;
NHF_Tanna_Kn = 1.0001;
function  error_NHF_Tanna_F ()
	print("error:NHF_Tanna_F");
end;

AddEvent(level_up_events, 'NHF_tanna_lvl_up',
function(hero)
  if hero == 'Tanna' then
	errorHook(error_NHF_Tanna_F);
	if (GetHeroLevel("Tanna") > NHF_Tanna_lvlHero_temp) then
		local temp_name = NHF_tempName_F("Tanna");
		NHF_Tanna_lvlHero_temp = GetHeroLevel("Tanna");
		if (((random(100)+1) <= (NHF_Tanna_percent*100))) then
		for i, zaklinanie in NHF_mass_spells_tma do
			if (KnowHeroSpell("Tanna", zaklinanie) ~= true)  then
				TeachHeroSpell("Tanna" ,zaklinanie);
				startThread(NHF_ShowFlyMessage, NHF_GetSpellName(zaklinanie,"+ "),temp_name , 5);
				NHF_Tanna_Kn = NHF_Tanna_Kn + NHF_Tanna_Kn_percent;
				if NHF_Tanna_Kn >= 1 then							
					sleep(2);
					NHF_ChangeHeroStat("Tanna", STAT_KNOWLEDGE, floor(NHF_Tanna_Kn),8);	
					sleep(NHF_slep_singl);
					NHF_Tanna_Kn = NHF_Tanna_Kn - floor(NHF_Tanna_Kn);
				end;			
				break;
			end;
		end;
  	end;
  end;
  end
end)

--NHF----------------�������-------------------
NHF_Torefin_lvl_temp = 0;
NHF_Torefin_flag = 0;
NHF_Torefin_index_battle_next = -1;
function  error_NHF_Torefin_F ()
	print("error:NHF_Torefin_F");
end;

AddEvent(add_hero_events, 'NHF_torefin_add_hero',
function(hero)
  if hero == 'Torefin' then
	  if (floor(GetHeroLevel("Torefin")/NHF_Torefin_percent)) > 0 then
		  GiveHeroBattleBonus("Torefin", HERO_BATTLE_BONUS_HITPOINTS, (NHF_Torefin_percent_base*100)+floor( GetHeroLevel("Torefin")/NHF_Torefin_percent));
	  else
		  GiveHeroBattleBonus("Torefin", HERO_BATTLE_BONUS_HITPOINTS, (NHF_Torefin_percent_base*100));
	  end;
  end
end)

AddEvent(respawn_hero_events, 'NHF_torefin_respawn',
function(hero)
  if hero == 'Torefin' then
	  if (floor(GetHeroLevel("Torefin")/NHF_Torefin_percent)) > 0 then
		  GiveHeroBattleBonus("Torefin", HERO_BATTLE_BONUS_HITPOINTS, (NHF_Torefin_percent_base*100)+floor( GetHeroLevel("Torefin")/NHF_Torefin_percent));
	  else
		  GiveHeroBattleBonus("Torefin", HERO_BATTLE_BONUS_HITPOINTS, (NHF_Torefin_percent_base*100));
	  end;
  end
end)

AddEvent(combat_results_events, 'NHF_torefin_combat_result',
function(fight_id)
  if (NHF_Torefin_index_battle_next ~= fight_id) then
    if (GetSavedCombatArmyHero(fight_id, 1)== "Torefin") then
      NHF_Torefin_index_battle_next = fight_id;
	if (floor( GetHeroLevel("Torefin")/NHF_Torefin_percent)) > 0 then
		GiveHeroBattleBonus("Torefin", HERO_BATTLE_BONUS_HITPOINTS, (NHF_Torefin_percent_base*100)+ floor( GetHeroLevel("Torefin")/NHF_Torefin_percent));
	else
		GiveHeroBattleBonus("Torefin", HERO_BATTLE_BONUS_HITPOINTS, (NHF_Torefin_percent_base*100));		
	end;
    end;
    if (GetSavedCombatArmyHero(fight_id, 0)== "Torefin")  then
      NHF_Torefin_index_battle_next = fight_id;
    end;
  end;
end)

AddEvent(level_up_events, 'NHF_torefin_lvl_up',
function(hero)
  if hero == 'Torefin' then
    if (GetHeroLevel("Torefin")> (NHF_Torefin_lvl_temp)) and (floor( GetHeroLevel("Torefin")/NHF_Torefin_percent)>floor(NHF_Torefin_lvl_temp/NHF_Torefin_percent))  then
      GiveHeroBattleBonus("Torefin", HERO_BATTLE_BONUS_HITPOINTS, 1);
      NHF_Torefin_lvl_temp = GetHeroLevel("Torefin");
    end;
  end
end)

AddEvent(remove_hero_events, 'NHF_torefin_remove_hero',
function(hero)
  if hero == 'Torefin' then
    NHF_Torefin_index_battle_next = -2
  end
end)

--NHF_E----------------�����-------------------
NHF_Agbet_mass_spell_tma = NHF_mass_spells_tma;
function  error_NHF_Agbet_F ()
	print("error:NHF_Agbet_F");
end;

AddEvent(add_hero_events, 'NHF_agbet_add_hero',
function(hero)
  if hero == 'Agbet' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Agbet') then
        	errorHook(error_NHF_Agbet_F);
        	local temp_name = NHF_tempName_F("Agbet");
        	local count = 0;
        	local j = 3;
        	for  i, id in NHF_Agbet_mass_spell_tma do
        		if id ~= nil then
        			if (KnowHeroSpell("Agbet", id) == true) then
        				TeachHeroSpell("Agbet", id);
        				count = count + 1;
        				NHF_Agbet_mass_spell_tma = NHF_del_data_mass(NHF_Agbet_mass_spell_tma, id);
        			end;
        		else
        			break;
        		end;
        	end;
        	if count > 0 then
        		for k = 1, count do
        			if length(NHF_Agbet_mass_spell_tma) > 0 then
        				local shans = 0.5;
        				for  i, id in NHF_Agbet_mass_spell_tma  do
        					if id ~= nil then
        						if (random(100)+1 <= shans*100) or (length(NHF_Agbet_mass_spell_tma) == 1) then
        							TeachHeroSpell("Agbet", id);
        							NHF_Agbet_mass_spell_tma = NHF_del_data_mass(NHF_Agbet_mass_spell_tma, id);
        							j = j + 3;
        							sleep(NHF_slep_singl);
        							startThread(NHF_ShowFlyMessage, NHF_GetSpellName(id,"+ "), temp_name,j);
        							break;
        						else
        							shans = 1;
        						end;
        					else
        						break;
        					end;
        				end;
        			end;
        		end;
        	end;
        end
        sleep()
      end
    end)
  end
end)

--NHF_�----------------������--------------------
NHF_WelyggNHF_lvl_temp = 0;
function  error_NHF_WelyggNHF_F ()
	print("error:NHF_WelyggNHF_F");
end;

AddEvent(level_up_events, 'NHF_welygg_lvl_up',
function(hero)
  if hero == 'WelyggNHF' then
  	errorHook(error_NHF_WelyggNHF_F);
  	if (GetHeroLevel("WelyggNHF") >= (NHF_WelyggNHF_lvl_temp+NHF_WelyggNHF_percent))then
  		local x,y,p = 0,0,0;
  		local temp_name = NHF_tempName_F("WelyggNHF");
  		if IsObjectExists("WelyggNHF") == true then
  			x,y,p = GetObjectPosition(temp_name);
  		end;
  		if GetHeroTown("WelyggNHF") ~= nil then
  			p = 1;
  		end;
  		NHF_WelyggNHF_lvl_temp = GetHeroLevel("WelyggNHF");
  		if (p == 1)then
  			ChangeHeroStat("WelyggNHF", STAT_DEFENCE,1);
  			sleep(NHF_slep_singl);
  		else
  			ChangeHeroStat("WelyggNHF", STAT_ATTACK,1);
  			sleep(NHF_slep_singl);
  		end;
  	end;
	end
end)

--NHF_E----------------�����---------------------
NHF_Olhar_bonus = 0;
NHF_Olhar_p = 0;
function  error_NHF_Olhar_F ()
	print("error:NHF_Olhar_F");
end;

AddEvent(add_hero_events, 'NHF_olhar_add_hero',
function(hero)
  if hero == 'Olhar' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Olhar') then
          errorHook(error_NHF_Olhar_F);
          local x,y,p = 0,0,0;
          local temp_name = NHF_tempName_F("Olhar");
          if IsObjectExists("Olhar") == true then
        	x,y,p = GetObjectPosition(temp_name);
          end;
          if GetHeroTown("Olhar") ~= nil then
             p = 1;
          end;
          if ( p ~= NHF_Olhar_p) then
            if (p == 0) then
              NHF_Olhar_p = 0;
              ChangeHeroStat("Olhar", STAT_DEFENCE, -NHF_Olhar_bonus );
        	  sleep(NHF_slep_singl);
        	  ChangeHeroStat("Olhar", STAT_ATTACK, NHF_Olhar_bonus );
        	  sleep(NHF_slep_singl);
            end;
            if (p == 1)then
              NHF_Olhar_p = 1;
              NHF_Olhar_bonus = ceil(GetHeroLevel("Olhar")/NHF_Olhar_percent) ;
              ChangeHeroStat("Olhar", STAT_DEFENCE, NHF_Olhar_bonus);
        	  sleep(NHF_slep_singl);
        	  ChangeHeroStat("Olhar", STAT_ATTACK, -NHF_Olhar_bonus);
        	  sleep(NHF_slep_singl);
            end;
          end;
          if (p == 1) and (ceil(GetHeroLevel("Olhar")/NHF_Olhar_percent) ~=  NHF_Olhar_bonus)  then
            local NHF_Olhar_bonus_temp = NHF_Olhar_bonus;
            NHF_Olhar_bonus = ceil(GetHeroLevel("Olhar")/NHF_Olhar_percent);
            ChangeHeroStat("Olhar", STAT_DEFENCE, (NHF_Olhar_bonus - NHF_Olhar_bonus_temp));
        	sleep(NHF_slep_singl);
          end;
          if (p == 0) and (ceil(GetHeroLevel("Olhar")/NHF_Olhar_percent) ~=  NHF_Olhar_bonus)  then
            local NHF_Olhar_bonus_temp = NHF_Olhar_bonus;
            NHF_Olhar_bonus = ceil(GetHeroLevel("Olhar")/NHF_Olhar_percent);
            ChangeHeroStat("Olhar", STAT_ATTACK, (NHF_Olhar_bonus - NHF_Olhar_bonus_temp));
        	sleep(NHF_slep_singl);
          end;
        end;
      sleep()
    end
  end)
end
end)

--NHF_E----------------------�������---------------------
NHF_Rameliya_day_temp = 0;
function  error_NHF_Rameliya_F ()
	print("error:NHF_Rameliya_F");
end;

AddEvent(new_day_events, 'NHF_rameliya_new_day',
function(hero, day)
  if hero == 'Rameliya' and IsHeroAlive('Rameliya') then
  errorHook(error_NHF_Rameliya_F);
  if (mod(GetDate(ABSOLUTE_DAY),7) == 1) and (NHF_Rameliya_day_temp ~= GetDate(ABSOLUTE_DAY)) then
    NHF_Rameliya_day_temp = GetDate(ABSOLUTE_DAY);
    NHF_ChangeResourceHero( MERCURY, ceil(NHF_Rameliya_percent*GetHeroLevel("Rameliya")), "Rameliya");
	sleep(NHF_slep_singl);
    NHF_ChangeResourceHero( SULFUR, ceil(NHF_Rameliya_percent*GetHeroLevel("Rameliya")), "Rameliya");
	sleep(NHF_slep_singl);
  end;
  end
end)
-----------------------------------------------	
----------------�������� ����������------------
-----------------------------------------------

----------------������-------------------------
NHF_Razzak_week_temp = -1;
function  error_NHF_Razzak_F ()
	print("error:NHF_Razzak_F");
end;

AddEvent(new_day_events, 'NHF_razzak_new_day',
function(hero, day)
  if hero == 'Razzak' and IsHeroAlive('Razzak') then
	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Razzak_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
		NHF_Razzak_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
		local temp_name = NHF_tempName_F("Razzak");
		local prirost = ceil(GetHeroLevel("Razzak")*NHF_Narhiz_percent);
		if prirost > 0 then
			NHF_creatures_prirost_F("Razzak",prirost,NHF_mass_creatures.Academy.L4);
		end;
	end;
	end
end)

----------------������------------------------
NHF_Isher_week_temp = -1;
function  error_NHF_Isher_F ()
	print("error:NHF_Isher_F");
end;

AddEvent(new_day_events, 'NHF_isher_new_day',
function(hero, day)
  if hero == 'Isher' and IsHeroAlive('Isher') then
	errorHook(error_NHF_Isher_F);
	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Isher_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
		NHF_Isher_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
		local temp_name = NHF_tempName_F("Isher");
		local prirost = ceil(GetHeroLevel("Isher")*NHF_Razzak_percent);
		if prirost > 0 then
			NHF_creatures_prirost_F("Isher",prirost,NHF_mass_creatures.Academy.L3);
		end;
	end;
	end
end)

----------------�����------------------------
NHF_Havez_week_temp = -1;
function  error_NHF_Havez_F ()
	print("error:NHF_Havez_F");
end;

AddEvent(new_day_events, 'NHF_havez_new_day',
function(hero, day)
  if hero == 'Havez' and IsHeroAlive('Havez') then
	errorHook(error_NHF_Havez_F);
	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Havez_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
		NHF_Havez_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
		local temp_name = NHF_tempName_F("Havez");
		local prirost = ceil(GetHeroLevel("Havez")*NHF_Havez_percent);
		if prirost > 0 then
			NHF_creatures_prirost_F("Havez",prirost,NHF_mass_creatures.Academy.L1);
		end;
	end;
	end
end)

--NHF----------------����-----------------------	
NHF_Iona_textPath = "/MapObjects/Academy/NewHeroes/Iona/";
NHF_Iona_ostatok_temp = 0;
NHF_Iona_znanie_max = 0;
function  error_NHF_Iona_F ()
	print("error:NHF_Iona_F");
end;

AddEvent(add_hero_events, 'NHF_iona_add_hero',
function(hero)
  if hero == 'Iona' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Iona') then
          local temp_name = NHF_tempName_F("Iona");
          local NHF_Iona_znanie_max_temp = GetHeroStat("Iona", STAT_KNOWLEDGE);
          if NHF_Iona_znanie_max < NHF_Iona_znanie_max_temp then
             local delta_znanie = NHF_Iona_znanie_max_temp - NHF_Iona_znanie_max + NHF_Iona_ostatok_temp;
             NHF_Iona_znanie_max = NHF_Iona_znanie_max_temp;
             NHF_Iona_ostatok_temp = mod(delta_znanie,NHF_Iona_percent);
             local delta_spell_power = floor(delta_znanie/NHF_Iona_percent);
             if delta_spell_power > 0 then
               ChangeHeroStat("Iona", STAT_SPELL_POWER,delta_spell_power );
          	 sleep(NHF_slep_singl);
          	 startThread(NHF_ShowFlyMessage, {NHF_Iona_textPath.."NHF_Iona_prirost.txt";prirost=delta_spell_power},temp_name , 5);
             end;
          end;
        end;
        sleep()
      end
    end)
  end
end)

--NHF--------------�����----------------------
NHF_Kiria_textPath = "/MapObjects/Academy/NewHeroes/Kiria/";
NHF_Kiria_lvlHero = 1;
NHF_Kiria_lvlHero_temp = 0;
NHF_Kiria_mass_spell_all = {[1]=NHF_mass_spell_1,[2]=NHF_mass_spell_2,[3]=NHF_mass_spell_3,[4]=NHF_mass_spell_4,[5]=NHF_mass_spell_5};
function  error_NHF_Kiria_F ()
	print("error:NHF_Kiria_F");
end;

AddEvent(level_up_events, 'NHF_kiria_lvl_up',
function(hero)
  if hero == 'Kiria' then
  	errorHook(error_NHF_Kiria_F);
  	if (GetHeroLevel("Kiria") > NHF_Kiria_lvlHero_temp) then
  	  local temp_name = NHF_tempName_F("Kiria");
  	  NHF_Kiria_lvlHero_temp = GetHeroLevel("Kiria");
  	  local NHF_Kiria_mass_spell_neizucheno = {[1]={},[2]={},[3]={},[4]={},[5]={}};
  	  local i_NHF_Kiria_mass_spell_neizucheno = 0;
  	  for j,uroven in NHF_Kiria_mass_spell_all do
  		for i, zaklinanie in NHF_Kiria_mass_spell_all[j] do
  		  if (KnowHeroSpell("Kiria", zaklinanie) ~= true)  then
  			i_NHF_Kiria_mass_spell_neizucheno = i_NHF_Kiria_mass_spell_neizucheno + 1;
  			NHF_Kiria_mass_spell_neizucheno[j][i_NHF_Kiria_mass_spell_neizucheno] = zaklinanie ;
  		  end;
  		end;
  		i_NHF_Kiria_mass_spell_neizucheno = 0;
  	  end;
  	  if (((random(100)+1) <= (NHF_Kiria_percent*100))) then
  		NHF_Kiria_lvlHero =  ceil(GetHeroLevel("Kiria")/5);
  		if NHF_Kiria_lvlHero >= 5 then NHF_Kiria_lvlHero = 5 end;
  		  for k = NHF_Kiria_lvlHero,1,-1 do
  			if length(NHF_Kiria_mass_spell_neizucheno[k]) > 0 then
  			  local kiriya_spell = NHF_Kiria_mass_spell_neizucheno[k][random(length(NHF_Kiria_mass_spell_neizucheno[k]))+1];
  			  TeachHeroSpell("Kiria" , kiriya_spell);
  			  startThread(NHF_ShowFlyMessage, NHF_GetSpellName(kiriya_spell,"+ "),temp_name,5);
  			  --startThread(NHF_ShowFlyMessage,NHF_GetSpellName(kiriya_spell,"+ "),temp_name,5);
  			  --ShowFlyMessage(NHF_GetSpellName(kiriya_spell,"+ "), temp_name , GetObjectOwner(temp_name),5);
  			  --ShowFlyMessage(NHF_Kiria_textPath.."NHF_Kiria_obuchenie.txt",temp_name, GetObjectOwner(temp_name),5);
  			  break;
  			end;
  		  end;
  	  end;
  	end;
  end
end)

--NHF----------------�����----------------------
NHF_Ksuda_textPath = "/MapObjects/Academy/NewHeroes/Ksuda/";
NHF_Ksuda_date_temp = 0;
function  error_NHF_Ksuda_F ()
	print("error:NHF_Ksuda_F");
end;

AddEvent(new_day_events, 'NHF_ksuda_new_day',
function(hero, day)
  if hero == 'Ksuda' and IsHeroAlive('Ksuda') then
  	errorHook(error_NHF_Ksuda_F);
  	local temp_name = NHF_tempName_F("Ksuda");
  	if (GetDate(ABSOLUTE_DAY) > NHF_Ksuda_date_temp) and ((GetObjectOwner(temp_name) == GetCurrentPlayer()) or (GetCurrentPlayer() == -1)) then	-- �������� 0.78, 0.81
  		NHF_Ksuda_date_temp = GetDate(ABSOLUTE_DAY);
  		if (random(100) < (GetHeroLevel("Ksuda")*3)) then
  			local heroes_Ksuda = GetObjectNamesByType("HERO");
  			for i,hero_Ksuda in heroes_Ksuda do
  				if GetHeroTown(hero_Ksuda) == nil then
  					local  x_hero_Ksuda, y_hero_Ksuda, zhero_Ksuda;
  					x_hero_Ksuda, y_hero_Ksuda, zhero_Ksuda = GetObjectPosition(hero_Ksuda);
  					OpenCircleFog(x_hero_Ksuda, y_hero_Ksuda, zhero_Ksuda , (floor(NHF_Ksuda_percent)), GetObjectOwner(temp_name));
  				end;
  			end;
  			startThread(NHF_ShowFlyMessage,NHF_Ksuda_textPath.."message.txt", temp_name,5);
  			--startThread(NHF_ShowFlyMessage, NHF_rawtext_standart("������� ���������"),temp_name , 5);
  		end;
  	end;
  end
end)

--NHF----------------������---------------------
NHF_Kubera_index_battle_next = -1;
NHF_Kubera_bonus_temp = 0;
NHF_Kubera_battle_flag = 0
function  error_NHF_Kubera_F ()
	print("error:NHF_Kubera_F");
end;

AddEvent(combat_results_events, 'NHF_kubera_combat_result',
function(fight_id)
	errorHook(error_NHF_Kubera_F);
	if (GetSavedCombatArmyHero(fight_id, 1)== "Kubera") and (NHF_Kubera_index_battle_next ~= fight_id) then
		NHF_Kubera_index_battle_next = fight_id;
		NHF_Kubera_battle_flag = 1;
	end;
end)

AddEvent(add_hero_events, 'NHF_kubera_add_hero',
function(hero)
  if hero == 'Kubera' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Kubera') then
        	local count_rakhshasa = GetHeroCreatures("Kubera",CREATURE_RAKSHASA) + GetHeroCreatures("Kubera",CREATURE_RAKSHASA_RUKH) + GetHeroCreatures("Kubera",CREATURE_RAKSHASA_KSHATRI);
        	local count_dobavka = 0;
        	local flag_while = 1;
        	local i_stepen = 0;
        	while flag_while  ~= 0 do
        		i_stepen = i_stepen + 1;
        		if count_rakhshasa >= NHF_ceil_stepen(NHF_Kubera_percent, i_stepen) then
        			flag_while = 1;
        		else
        			count_dobavka = i_stepen-1;
        			flag_while = 0;
        		end;
        	end;
        	if  (NHF_Kubera_bonus_temp ~= count_dobavka)  or (NHF_Kubera_battle_flag == 1) then
        		local bonus_temp_too = count_dobavka;
        		if  NHF_Kubera_battle_flag == 0 then
        			count_dobavka = count_dobavka - NHF_Kubera_bonus_temp;
        		end;
        		if count_dobavka ~= 0 then
        			GiveHeroBattleBonus("Kubera", HERO_BATTLE_BONUS_INITIATIVE, count_dobavka);
        			GiveHeroBattleBonus("Kubera", HERO_BATTLE_BONUS_ATTACK, count_dobavka);
        		end;
        		NHF_Kubera_bonus_temp = bonus_temp_too;
        		NHF_Kubera_battle_flag = 0;
       	  end
        end
        sleep()
      end
    end)
  end
end)

--NHF----------------����---------------------	
NHF_Lara_textPath = "/MapObjects/Academy/NewHeroes/Lara/";
function  error_NHF_Lara_F ()
	print("error:NHF_Lara_F");
end;

lara_spec =
{
   -- ���� �����
   ['bank_crypt_01'] =
   {
     guards =
     {
       {
         [CREATURE_SKELETON_COPY] = {45, 45},
         [CREATURE_SKELETON_ARCHER_COPY] = {30, 30}
       },
       {
         [CREATURE_WALKING_DEAD_COPY] = {30, 30},
         [CREATURE_ZOMBIE_COPY] = {20, 20}
       },
     },
     reward = {res = {[GOLD] = {1500, 1500}}}
   },
   --
   ['bank_crypt_02'] =
   {
     guards =
     {
       {
         [CREATURE_SKELETON_COPY] = {30, 30},
         [CREATURE_SKELETON_ARCHER_COPY] = {25, 25}
       },
       {
         [CREATURE_WALKING_DEAD_COPY] = {30, 30},
         [CREATURE_ZOMBIE_COPY] = {20, 20}
       },
       {
         [CREATURE_MANES_COPY] = {5, 5},
         [CREATURE_GHOST_COPY] = {5, 5}
       }
     },
     reward = {res = {[GOLD] = {2000, 2000}}}
   },
   --
   ['bank_crypt_03'] =
   {
     guards =
     {
       {
         [CREATURE_SKELETON_COPY] = {35, 35},
         [CREATURE_SKELETON_ARCHER_COPY] = {20, 20}
       },
       {
         [CREATURE_WALKING_DEAD_COPY] = {25, 25},
         [CREATURE_ZOMBIE_COPY] = {20, 20}
       },
       {
         [CREATURE_MANES_COPY] = {10, 10},
         [CREATURE_GHOST_COPY] = {6, 7}
       },
       {
         [CREATURE_VAMPIRE_COPY] = {5, 5},
         [CREATURE_VAMPIRE_LORD_COPY] = {3, 3}
       }
     },
     reward = {res = {[GOLD] = {2500, 2500}}}
   },
   --
   ['bank_crypt_04'] =
   {
     guards =
     {
       {
         [CREATURE_SKELETON_COPY] = {35, 35},
         [CREATURE_SKELETON_ARCHER_COPY] = {20, 20}
       },
       {
         [CREATURE_WALKING_DEAD_COPY] = {25, 25},
         [CREATURE_ZOMBIE_COPY] = {20, 20}
       },
       {
         [CREATURE_MANES_COPY] = {10, 10},
         [CREATURE_GHOST_COPY] = {6, 6}
       },
       {
         [CREATURE_LICH_COPY] = {5, 6},
         [CREATURE_VAMPIRE_LORD_COPY] = {5, 6}
       }
     },
     reward = {res = {[GOLD] = {5000, 5000}}, art = {[ART_TIER_MINOR] = {1, 1}}}
   },
   
   -- ��������
   ['bank_pyramid_01'] =
   {
     guards =
     {
       {
         [CREATURE_IRON_GOLEM_COPY] = {40, 40},
       },
       {
         [CREATURE_STEEL_GOLEM_COPY] = {20, 20}
       }
     },
     reward = {spell = {count = {1, 1}, lvl = {1, 5}}}
   },
   --
   ['bank_pyramid_02'] =
   {
     guards =
     {
       {
         [CREATURE_SKELETON_COPY] = {666, 666}
       }
     },
     reward = {spell = {count = {1, 2}, lvl = {2, 4}}}
   },
   
   -- ������������ �����
   ['bank_magi_vault_01'] =
   {
     guards =
     {
       {
         [CREATURE_MAGI_COPY] = {7, 7},
         [CREATURE_MAGI_COPY] = {9, 9}
       },
       {
         [CREATURE_STONE_GARGOYLE_COPY] = {25, 25},
         [CREATURE_OBSIDIAN_GARGOYLE_COPY] = {20, 20}
       },
       {
         [CREATURE_ARCH_MAGI_COPY] = {5, 5},
         [CREATURE_ARCH_MAGI_COPY] = {7, 7}
       }
     },
     reward = {res = {[GEM] = {8, 8}, [GOLD] = {2500, 2500}}, spell = {count = {1, 1}, lvl = {4, 4}}}
   },
   --
   ['bank_magi_vault_02'] =
   {
     guards =
     {
       {
         [CREATURE_MAGI_COPY] = {15, 15}
       },
       {
         [CREATURE_GENIE_COPY] = {15, 15},
         [CREATURE_MASTER_GENIE_COPY] = {13, 13}
       },
       {
         [CREATURE_MAGI_COPY] = {20, 20},
         [CREATURE_ARCH_MAGI_COPY] = {12, 12}
       },
       {
         [CREATURE_MAGI_COPY] = {15, 15}
       }
     },
     reward = {res = {[GEM] = {12, 12}, [GOLD] = {5000, 5000}}, spell = {count = {1, 2}, lvl = {4, 5}}}
   },
   --
   ['bank_magi_vault_03'] =
   {
     guards =
     {
       {
         [CREATURE_MAGI_COPY] = {21, 21},
         [CREATURE_ARCH_MAGI_COPY] = {12, 12}
       },
       {
         [CREATURE_RAKSHASA_RUKH_COPY] = {5, 5},
         [CREATURE_PHOENIX_COPY] = {3, 3}
       },
       {
         [CREATURE_MAGI_COPY] = {20, 2},
         [CREATURE_ARCH_MAGI_COPY] = {20, 20}
       }
     },
     reward = {res = {[GEM] = {12, 12}, [GOLD] = {7000, 7000}}, art = {[ART_TIER_MINOR] = {0, 1}}, spell = {count = {2, 2}, lvl = {5, 5}}}
   },
   
   -- ������
   ['bank_utopia_01'] =
   {
     guards =
     {
       {
         [CREATURE_GREEN_DRAGON_COPY] = {9, 9},
         [CREATURE_GOLD_DRAGON_COPY] = {7, 7}
       },
       {
         [CREATURE_DEEP_DRAGON_COPY] = {6, 6},
         [CREATURE_BLACK_DRAGON_COPY] = {4, 4}
       }
     },
     reward = {res = {[GOLD] = {12000, 20000}}, art = {[ART_TIER_MAJOR] = {2, 3}, [ART_TIER_RELIC] = {1, 1}}, spell = {count = {2, 2}, lvl = {4, 5}}}
   },
   --
   ['bank_utopia_02'] =
   {
     guards =
     {
       {
         [CREATURE_SHADOW_DRAGON_COPY] = {11, 11},
       },
       {
         [CREATURE_DEEP_DRAGON_COPY] = {6, 6},
       },
       {
         [CREATURE_BLACK_DRAGON_COPY] = {5, 5}
       }
     },
     reward = {res = {[GOLD] = {14000, 14000}}, art = {[ART_TIER_MINOR] = {1, 3}, [ART_TIER_MAJOR] = {2, 2}, [ART_TIER_RELIC] = {1, 1}}, spell = {count = {2, 2}, lvl = {4, 5}}}
   },
   --
   ['bank_utopia_03'] =
   {
     guards =
     {
       {
         [CREATURE_GREEN_DRAGON_COPY] = {8, 8},
       },
       {
         [CREATURE_DEEP_DRAGON_COPY] = {6, 6},
       },
       {
         [CREATURE_GOLD_DRAGON_COPY] = {4, 4},
       },
       {
         [CREATURE_BLACK_DRAGON_COPY] = {4, 4}
       }
     },
     reward = {res = {[GOLD] = {20000, 20000}}, art = {[ART_TIER_MAJOR] = {3, 4}, [ART_TIER_RELIC] = {2, 2}}, spell = {count = {3, 3}, lvl = {5, 5}}}
   },
   
   --
   ['bank_elems_01'] =
   {
     guards =
     {
       {
         [CREATURE_FIRE_ELEMENTAL_COPY] = {5, 5},
       },
       {
         [CREATURE_AIR_ELEMENTAL_COPY] = {5, 5},
       },
       {
         [CREATURE_WATER_ELEMENTAL_COPY] = {5, 5},
       },
       {
         [CREATURE_EARTH_ELEMENTAL_COPY] = {5, 5},
       }
     },
     reward = {res = {[WOOD] = {4, 4}, [ORE] = {4, 4}, [MERCURY] = {4, 4}, [SULFUR] = {4, 4}, [GEM] = {4, 4}, [CRYSTAL] = {4, 4}}}
   },
   --
   ['bank_elems_02'] =
   {
     guards =
     {
       {
         [CREATURE_FIRE_ELEMENTAL_COPY] = {10, 10},
       },
       {
         [CREATURE_AIR_ELEMENTAL_COPY] = {10, 10},
       },
       {
         [CREATURE_WATER_ELEMENTAL_COPY] = {10, 10},
       },
       {
         [CREATURE_EARTH_ELEMENTAL_COPY] = {10, 10},
       }
     },
     reward = {res = {[WOOD] = {6, 6}, [ORE] = {6, 6}, [MERCURY] = {6, 6}, [SULFUR] = {6, 6}, [GEM] = {6, 6}, [CRYSTAL] = {6, 6}}}
   },
   --
   ['bank_elems_03'] =
   {
     guards =
     {
       {
         [CREATURE_FIRE_ELEMENTAL_COPY] = {15, 15},
       },
       {
         [CREATURE_AIR_ELEMENTAL_COPY] = {15, 15},
       },
       {
         [CREATURE_WATER_ELEMENTAL_COPY] = {15, 15},
       },
       {
         [CREATURE_EARTH_ELEMENTAL_COPY] = {15, 15},
       }
     },
     reward = {res = {[WOOD] = {8, 10}, [ORE] = {8, 10}, [MERCURY] = {8, 10}, [SULFUR] = {8, 10}, [GEM] = {8, 10}, [CRYSTAL] = {8, 10}}}
   },
   --
   ['bank_elems_04'] =
   {
     guards =
     {
       {
         [CREATURE_FIRE_ELEMENTAL_COPY] = {20, 20},
       },
       {
         [CREATURE_AIR_ELEMENTAL_COPY] = {20, 20},
       },
       {
         [CREATURE_WATER_ELEMENTAL_COPY] = {20, 20},
       },
       {
         [CREATURE_EARTH_ELEMENTAL_COPY] = {20, 20},
       }
     },
     reward = {res = {[WOOD] = {10, 12}, [ORE] = {10, 12}, [MERCURY] = {10, 12}, [SULFUR] = {10, 12}, [GEM] = {10, 12}, [CRYSTAL] = {10, 12}}, art = {[ART_TIER_MINOR] = {1, 1}}}
   },

   --
   ['bank_demolish_01'] =
   {
     guards =
     {
       {
         [CREATURE_GHOST_COPY] = {15, 15},
         [CREATURE_MANES_COPY] = {22, 22}
       },
       {
         [CREATURE_SKELETON_COPY] = {21, 21},
         [CREATURE_WALKING_DEAD_COPY] = {17, 17}
       }
     },
     reward = {res = {[GOLD] = {2500, 2500}}}
   },
   --
   ['bank_demolish_02'] =
   {
     guards =
     {
       {
         [CREATURE_GHOST_COPY] = {15, 15},
       },
       {
         [CREATURE_MANES_COPY] = {15, 15}
       }
     },
     reward = {res = {[GOLD] = {3000, 3000}}}
   },
   --
   ['bank_demolish_03'] =
   {
     guards =
     {
       {
         [CREATURE_GHOST_COPY] = {25, 25},
         [CREATURE_WALKING_DEAD_COPY] = {75, 75}
       },
       {
         [CREATURE_SKELETON_COPY] = {15, 15},
       }
     },
     reward = {res = {[GOLD] = {5000, 5000}}, art = {[ART_TIER_MINOR] = {1, 1}}}
   },
   --
   ['bank_demolish_04'] =
   {
     guards =
     {
       {
         [CREATURE_GHOST_COPY] = {15, 15},
       },
       {
         [CREATURE_MANES_COPY] = {21, 21},
       },
       {
         [CREATURE_WIGHT_COPY] = {4, 4},
         [CREATURE_WRAITH_COPY] = {2, 2}
       }
     },
     reward = {res = {[GOLD] = {5000, 5000}}, art = {[ART_TIER_MAJOR] = {1, 1}}}
   },
   
   --
   ['bank_unkempt_01'] =
   {
     guards =
     {
       {
         [CREATURE_ARCHER_COPY] = {38, 38}
       },
       {
         [CREATURE_PEASANT_COPY] = {75, 75}
       }
     },
     reward = {red = {[GOLD] = {3000, 3000}}}
   },
   --
   ['bank_unkempt_02'] =
   {
     guards =
     {
       {
         [CREATURE_WATER_ELEMENTAL_COPY] = {15, 15}
       },
     },
     reward = {red = {[GOLD] = {3000, 3000}}, art = {[ART_TIER_MAJOR] = {1, 1}}}
   },
   --
   ['bank_unkempt_03'] =
   {
     guards =
     {
       {
         [CREATURE_AIR_ELEMENTAL_COPY] = {35, 40}
       },
     },
     reward = {red = {[GOLD] = {4000, 4000}}, art = {[ART_TIER_MINOR] = {1, 1}}}
   },
   --
   ['bank_unkempt_04'] =
   {
     guards =
     {
       {
         [CREATURE_SCOUT_COPY] = {40, 40},
         [CREATURE_ASSASSIN_COPY] = {30, 30}
       },
       {
         [CREATURE_HYDRA_COPY] = {6, 6},
         [CREATURE_MATRON_COPY] = {2, 2}
       },
       {
         [CREATURE_SCOUT_COPY] = {40, 40},
         [CREATURE_ASSASSIN_COPY] = {30, 30}
       },
     },
     reward = {red = {[GOLD] = {5000, 5000}}, art = {[ART_TIER_MAJOR] = {1, 1}}}
   },
   
   --
   ['bank_dwarven_01'] =
   {
     guards =
     {
       {
         [CREATURE_STOUT_DEFENDER_COPY] = {50, 50},
       },
--       {
--         [CREATURE_STOUT_DEFENDER_COPY] = {25, 25},
--       },
       {
         [CREATURE_AXE_THROWER_COPY] = {10, 10},
       },
--       {
--         [CREATURE_AXE_THROWER_COPY] = {5, 5},
--       }
     },
     reward = {res = {[GEM] = {5, 5}, [CRYSTAL] = {5, 5}, [GOLD] = {1000, 1000}}}
   },
   --
   ['bank_dwarven_02'] =
   {
     guards =
     {
       {
         [CREATURE_STOUT_DEFENDER_COPY] = {100, 100},
       },
--       {
--         [CREATURE_STOUT_DEFENDER_COPY] = {50, 50},
--       },
       {
         [CREATURE_AXE_THROWER_COPY] = {20, 20},
       },
--       {
--         [CREATURE_AXE_THROWER_COPY] = {10, 10},
--       }
     },
     reward = {res = {[GEM] = {10, 10}, [CRYSTAL] = {10, 10}, [GOLD] = {2500, 2500}}}
   },
   --
   ['bank_dwarven_03'] =
   {
     guards =
     {
       {
         [CREATURE_STOUT_DEFENDER_COPY] = {150, 150},
       },
--       {
--         [CREATURE_STOUT_DEFENDER_COPY] = {75, 75},
--       },
       {
         [CREATURE_AXE_THROWER_COPY] = {30, 30},
       },
--       {
--         [CREATURE_AXE_THROWER_COPY] = {15, 15},
--       },
       {
         [CREATURE_WARLORD_COPY] = {5, 5},
       }
     },
     reward = {res = {[GEM] = {15, 15}, [CRYSTAL] = {15, 15}, [GOLD] = {5000, 5000}}}
   },
   
   --
   ['bank_blood_temple_01'] =
   {
     guards =
     {
       {
         [CREATURE_BLOOD_WITCH_COPY] = {40, 40},
       },
--       {
--         [CREATURE_BLOOD_WITCH_COPY] = {20, 20},
--       },
       {
         [CREATURE_MATRON_COPY] = {5, 5},
       },
     },
     reward = {res = {[GOLD] = {2500, 2500}}}
   },
   --
   ['bank_blood_temple_02'] =
   {
     guards =
     {
       {
         [CREATURE_BLOOD_WITCH_COPY] = {80, 80},
       },
--       {
--         [CREATURE_BLOOD_WITCH_COPY] = {40, 40},
--       },
       {
         [CREATURE_MATRON_COPY] = {10, 10},
       },
--       {
--         [CREATURE_MATRON_COPY] = {5, 5},
--       },
       {
         [CREATURE_MATRIARCH_COPY] = {5, 5},
       },
     },
     reward = {res = {[GOLD] = {4000, 4000}}, art = {[ART_TIER_MINOR] = {1, 1}}}
   },
   --
   ['bank_blood_temple_02'] =
   {
     guards =
     {
       {
         [CREATURE_BLOOD_WITCH_COPY] = {120, 120},
       },
--       {
--         [CREATURE_BLOOD_WITCH_COPY] = {60, 60},
--       },
       {
         [CREATURE_MATRON_COPY] = {20, 20},
       },
--       {
--         [CREATURE_MATRON_COPY] = {10, 10},
--       },
       {
         [CREATURE_MATRIARCH_COPY] = {10, 10},
       },
     },
     reward = {res = {[GOLD] = {5500, 5500}}, art = {[ART_TIER_MAJOR] = {1, 1}}}
   },
   
   --
   ['bank_treant_tricket_01'] =
   {
     guards =
     {
       {
         [CREATURE_TREANT_COPY] = {30, 30},
       },
--       {
--         [CREATURE_TREANT_COPY] = {15, 15},
--       },
       {
         [CREATURE_WOOD_ELF_COPY] = {60, 60},
       },
--       {
--         [CREATURE_WOOD_ELF_COPY] = {30, 30},
--       },
     },
     reward = {res = {[WOOD] = {10, 10}, [GOLD] = {5500, 5500}}}
   },
   --
   ['bank_treant_tricket_02'] =
   {
     guards =
     {
       {
         [CREATURE_TREANT_GUARDIAN_COPY] = {30, 30},
       },
--       {
--         [CREATURE_TREANT_GUARDIAN_COPY] = {15, 15},
--       },
       {
         [CREATURE_WOOD_ELF_COPY] = {60, 60},
       },
--       {
--         [CREATURE_WOOD_ELF_COPY] = {30, 30},
--       },
     },
     reward = {res = {[WOOD] = {20, 20}, [GOLD] = {7500, 7500}}}
   },
   --
   ['bank_treant_tricket_03'] =
   {
     guards =
     {
       {
         [CREATURE_TREANT_GUARDIAN_COPY] = {40, 40},
       },
--       {
--         [CREATURE_TREANT_GUARDIAN_COPY] = {20, 20},
--       },
       {
         [CREATURE_GRAND_ELF_COPY] = {60, 60},
       },
--       {
--         [CREATURE_GRAND_ELF_COPY] = {30, 30},
--       },
       {
         [CREATURE_DRUID_ELDER_COPY] = {10, 10},
       },
     },
     reward = {res = {[WOOD] = {30, 30}, [GOLD] = {10000, 10000}}}
   },
   
   --
   ['bank_gargoyle_stone_01'] =
   {
     guards =
     {
       {
         [CREATURE_STONE_GARGOYLE_COPY] = {60, 60},
       },
--       {
--         [CREATURE_STONE_GARGOYLE_COPY] = {20, 20},
--       },
--       {
--         [CREATURE_STONE_GARGOYLE_COPY] = {20, 20},
--       }
     },
     reward = {res = {[ORE] = {5, 5}, [GOLD] = {1000, 1000}}}
   },
   --
   ['bank_gargoyle_stone_02'] =
   {
     guards =
     {
       {
         [CREATURE_OBSIDIAN_GARGOYLE_COPY] = {90, 90},
       },
--       {
--         [CREATURE_OBSIDIAN_GARGOYLE_COPY] = {30, 30},
--       },
--       {
--         [CREATURE_OBSIDIAN_GARGOYLE_COPY] = {30, 30},
--       },
       {
         [CREATURE_IRON_GOLEM_COPY] = {20, 20},
       }
     },
     reward = {res = {[ORE] = {10, 10}, [GOLD] = {2000, 2000}}}
   },
   --
   ['bank_gargoyle_stone_03'] =
   {
     guards =
     {
       {
         [CREATURE_OBSIDIAN_GARGOYLE_COPY] = {120, 120},
       },
--       {
--         [CREATURE_OBSIDIAN_GARGOYLE_COPY] = {40, 40},
--       },
--       {
--         [CREATURE_OBSIDIAN_GARGOYLE_COPY] = {40, 40},
--       },
       {
         [CREATURE_STEEL_GOLEM_COPY] = {20, 20},
       }
     },
     reward = {res = {[ORE] = {15, 15}, [GOLD] = {3000, 3000}}}
   },
   
   --
   ['bank_sunken_temple_01'] =
   {
     guards =
     {
       {
         [CREATURE_GIANT_COPY] = {11, 11},
         [CREATURE_TITAN_COPY] = {7, 7}
       },
       {
         [CREATURE_WATER_ELEMENTAL_COPY] = {50, 50},
         [CREATURE_WATER_ELEMENTAL_COPY] = {40, 40}
       }
     },
     reward = {res = {[GOLD] = {12000, 20000}}, art = {[ART_TIER_MAJOR] = {2, 3}, [ART_TIER_RELIC] = {1, 1}}, spell = {count = {2, 2}, lvl = {4, 5}}}
   },
   --
   ['bank_sunken_temple_02'] =
   {
     guards =
     {
       {
         [CREATURE_GIANT_COPY] = {11, 11},
       },
       {
         [CREATURE_TITAN_COPY] = {6, 6}
       },
       {
         [CREATURE_WATER_ELEMENTAL_COPY] = {50, 50},
       }
     },
     reward = {res = {[GOLD] = {14000, 14000}}, art = {[ART_TIER_MINOR] = {1, 3}, [ART_TIER_MAJOR] = {2, 2}, [ART_TIER_RELIC] = {1, 1}}, spell = {count = {2, 2}, lvl = {4, 5}}}
   },
   --
   ['bank_sunken_temple_03'] =
   {
     guards =
     {
       {
         [CREATURE_GIANT_COPY] = {8, 8},
       },
       {
         [CREATURE_WATER_ELEMENTAL_COPY] = {100, 100},
       },
       {
         [CREATURE_TITAN_COPY] = {4, 4}
       },
--       {
--         [CREATURE_WATER_ELEMENTAL_COPY] = {40, 40},
--       }
     },
     reward = {res = {[GOLD] = {20000, 20000}}, art = {[ART_TIER_MAJOR] = {3, 4}, [ART_TIER_RELIC] = {2, 2}}, spell = {count = {3, 3}, lvl = {4, 5}}}
   },
   
   --
   ['bank_naga_temple_01'] =
   {
     guards =
     {
       {
         [CREATURE_GIANT_COPY] = {9, 9},
         [CREATURE_TITAN_COPY] = {7, 7}
       },
     },
     reward = {res = {[GOLD] = {12000, 20000}}, art = {[ART_TIER_MAJOR] = {2, 3}, [ART_TIER_RELIC] = {1, 1}}, spell = {count = {2, 2}, lvl = {4, 5}}}
   },
}

AddEvent(combat_results_events, 'NHF_lara_combat_result',
function(fight_id)
  if GetSavedCombatArmyHero(fight_id, 1) == 'Lara' then
    --
    local multiplier = 1
    local chance = 100 -- NHF_Lara_percent * GetHeroLevel('Lara') * 100
    print("Lara's chance to increase rewards: ", chance)
    if chance <= 100 then
      local try = random(100) + 1
      print('random: ', try)
      if try > chance then
        print('no more rewards')
        return
      else
        multiplier = 2
      end
    else
      if (random(100) + 1) <= (chance - 100) then
        multiplier = 3
      else
        multiplier = 2
      end
    end
    --
    if multiplier ~= 1 then
      print('Multiplier: ', multiplier)
      local reward_to_increase = {}
      local stacks = GetSavedCombatArmyCreaturesCount(fight_id,0);
      -- �� ���� ������
      for bank, info in lara_spec do
        local check = 1
        -- �������� �� ������ ������ �������
        for i = 0, stacks - 1 do
  	      creature, count, dead = GetSavedCombatArmyCreatureInfo(fight_id, 0, i)
          local curr_id_check
          -- ���� ��������� ������ ��������...
          for j, pair in info.guards do
            for type, range in pair do
              -- ������� ���� �� � ����� �� ��������� ������� ����� � ������ ����������
              if type == creature and (dead >= range[1] and dead <= range[2]) then
                curr_id_check = 1 -- ���������� �����
                break
              end
            end
          end
          -- ���� �������� �� ������� � ������ �����
          if not curr_id_check then
            check = nil -- ��������� �������� ��� ��������
            break
          end
        end
        -- ���� ����� ���� �������� ���� ����������� - ������ ���� ������ � ������������ ��� ������� ��� ����������
        if check then
          reward_to_increase = info.reward
          print('Lara was in ', bank)
        end
      end
      --
      if len(reward_to_increase) ~= 0 then
        --
        if reward_to_increase.res then
          for res, counts in reward_to_increase.res do
            local count_to_add = GetRandFromT(counts) * (multiplier - 1)
            local curr_count = GetPlayerResource(GetObjectOwner('Lara'), res)
            SetPlayerResource(GetObjectOwner('Lara'), res, curr_count + count_to_add)
          end
        end
        --
        if reward_to_increase.art then
          for art_tier, counts in reward_to_increase.art do
            local count_to_add = GetRandFromT(counts) * (multiplier - 1)
            for i = 1, count_to_add do
              local art = GetRandomArt(art_tier)
              print('art = ', art)
              GiveArtefact('Lara', art)
            end
          end
        end
        --
        if reward_to_increase.spell then
          local curr_count = GetRandFromT(reward_to_increase.spell.count)
          for i = 1, curr_count do
            local curr_lvl = GetRandFrom(reward_to_increase.spell.lvl)
            local mastery = curr_lvl - 2
            local spells = GetAllSpellsByMastery(mastery)
            local lara_unknown_spells = {}, n
            for i, spell in spells do
              if not KnowHeroSpell('Lara', spell) then
                n = n + 1
                lara_unknown_spells[n] = spell
              end
            end
            if n ~= 0 then
              TeachHeroSpell('Lara', GetRandFromT(lara_unknown_spells))
            end
          end
        end
        --
        if multiplier == 2 then
          ShowFlyingSign(NHF_Lara_textPath..'double_reward.txt', 'Lara', GetObjectOwner('Lara'), 7.0)
        else
          ShowFlyingSign(NHF_Lara_textPath..'triple_reward.txt', 'Lara', GetObjectOwner('Lara'), 7.0)
        end
      end
    end
  end
end)

combat_scripts_paths[length(combat_scripts_paths) + 1] = 'scripts/combat/NHF/Lara.lua'

--NHF-------------�������---------------------
NHF_Muadgir_textPath = "/MapObjects/Academy/NewHeroes/Muadgir/";
NHF_Muadgir_lvl_temp = 1;
function  error_NHF_Muadgir_F ()
	print("error:NHF_Muadgir_F");
end;

AddEvent(level_up_events, 'NHF_muadgir_lvl_up',
function(hero)
  if hero == 'Muadgir' then
    if (floor(GetHeroLevel("Muadgir")/NHF_Muadgir_percent) > floor(NHF_Muadgir_lvl_temp/NHF_Muadgir_percent))  then
       local temp_name = NHF_tempName_F("Muadgir");
       NHF_Muadgir_lvl_temp = GetHeroLevel("Muadgir");
  	 NHF_ChangeHeroStat("Muadgir", STAT_DEFENCE, 1);
  	 sleep(NHF_slep_singl);
    end;
  end;
end)

--NHF--------------�����---------------------
NHF_Nadia_textPath = "/MapObjects/Academy/NewHeroes/Nadia/";
NHF_Nadia_in_town = -1;
NHF_Nadia_out_town = -1;
NHF_Nadia_bonus_k = 0;
function  error_NHF_Nadia_F ()
	print("error:NHF_Nadia_F");
end;

AddEvent(add_hero_events, 'NHF_nadia_add_hero',
function(hero)
  if hero == 'Nadia' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Nadia') then
        	errorHook(error_NHF_Nadia_F);
        	NHF_Nadia_out_town = 1;
        	local temp_name = NHF_tempName_F("Nadia");
        	for i, town in GetPlayerTowns(GetObjectOwner('Nadia')) do
        		if ((IsHeroInTown("Nadia", town , 1, 0)  == true) or (GetTownHero(town) == "Nadia")) then
        			NHF_Nadia_out_town = 0;
        			local temp_bonus_k = ceil(GetTownBuildingLevel(town, TOWN_BUILDING_MAGIC_GUILD)*NHF_Nadia_percent);
        			if (NHF_Nadia_in_town ~= 1) or (NHF_Nadia_bonus_k ~= temp_bonus_k) then
        				NHF_Nadia_in_town = 1;
        				local temp_bonus_delta = (temp_bonus_k-NHF_Nadia_bonus_k);
        				if temp_bonus_delta  > 0 then
        					ChangeHeroStat("Nadia", STAT_KNOWLEDGE, temp_bonus_delta);
        					sleep(NHF_slep_singl);
        					startThread(NHF_ShowFlyMessage, {NHF_Nadia_textPath.."NHF_Nadia_prirost_plus.txt";p_m=temp_bonus_k},temp_name,5);
        				end;
        				NHF_Nadia_bonus_k = temp_bonus_k;
        				break;
        			end;
        		end;
        	end;
        	if NHF_Nadia_out_town == 1 then
        		NHF_Nadia_in_town = 0;
        		if NHF_Nadia_bonus_k > 0 then
        			ChangeHeroStat("Nadia", STAT_KNOWLEDGE, -NHF_Nadia_bonus_k);
        			sleep(NHF_slep_singl);
        			startThread(NHF_ShowFlyMessage, {NHF_Nadia_textPath.."NHF_Nadia_prirost_minus.txt";p_m=-NHF_Nadia_bonus_k},temp_name,5);
        		end;
        		NHF_Nadia_bonus_k = 0;
        	end;
        end;
        sleep()
      end
    end)
  end
end)
      
AddEvent(remove_hero_events, 'NHF_nadia_remove_hero',
function(hero)
  if hero == 'Nadia' then
  	errorHook(error_NHF_Nadia_F);
  	NHF_Nadia_in_town = -1;
  	NHF_Nadia_out_town = -1;
  	NHF_Nadia_bonus_k = 0;
  end
end)

--NHF----------------����-----------------------
NHF_Reeva_lvl_temp = 1;
function  error_NHF_Reeva_F ()
	print("error:NHF_Reeva_F");
end;

AddEvent(level_up_events, 'NHF_reeva_lvl_up',
function(hero)
  if hero == 'Reeva' then
  	errorHook(error_NHF_Reeva_F);
  	local temp_name = NHF_tempName_F("Reeva");
  	if (GetHeroLevel("Reeva") > NHF_Reeva_lvl_temp) then
  		NHF_Reeva_lvl_temp = GetHeroLevel("Reeva");
  		NHF_ChangeResourceHero(GEM,NHF_Reeva_percent,"Reeva");
  		sleep(NHF_slep_singl);
  	end;
  end
end)

--NHF----------------����-----------------------
NHF_Sara_zakl_mass = {SPELL_MAGIC_ARROW, SPELL_STONE_SPIKES,SPELL_CURSE, SPELL_SLOW, SPELL_SORROW,SPELL_MAGIC_FIST, SPELL_LAND_MINE,SPELL_BLESS, SPELL_HASTE,
SPELL_LIGHTNING_BOLT, SPELL_ICE_BOLT,SPELL_DISRUPTING_RAY, SPELL_PLAGUE,SPELL_WASP_SWARM, SPELL_ANIMATE_DEAD,SPELL_STONESKIN, SPELL_DISPEL,
SPELL_FIREBALL,SPELL_FROST_RING, SPELL_FIREWALL,SPELL_WEAKNESS, SPELL_FORGETFULNESS,SPELL_PHANTOM, SPELL_EARTHQUAKE,SPELL_BLOODLUST, SPELL_DEFLECT_ARROWS,
SPELL_CHAIN_LIGHTNING, SPELL_METEOR_SHOWER,SPELL_SUMMON_ELEMENTALS, SPELL_SUMMON_HIVE, SPELL_BLIND, SPELL_BERSERK, SPELL_TELEPORT, SPELL_ANTI_MAGIC, SPELL_DIVINE_VENGEANCE,
SPELL_IMPLOSION, SPELL_ARMAGEDDON, SPELL_DEEP_FREEZE,SPELL_HYPNOTIZE, SPELL_UNHOLY_WORD, SPELL_VAMPIRISM,SPELL_CONJURE_PHOENIX, SPELL_CELESTIAL_SHIELD,SPELL_HOLY_WORD, SPELL_RESURRECT,
SPELL_SUMMON_BOAT, SPELL_DIMENSION_DOOR, SPELL_TOWN_PORTAL,SPELL_SUMMON_CREATURES };
function  error_NHF_Sara_F ()
print("error:NHF_Sara_F");
end;

AddEvent(add_hero_events, 'NHF_sara_add_hero',
function(hero)
  if hero == 'Sara' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Sara') then
        	errorHook(error_NHF_Sara_F);
        	local pribavka = 0;
        	for i, zakl in  NHF_Sara_zakl_mass do
        		if zakl ~= "0" then
        			if KnowHeroSpell("Sara", zakl)  == true then
        				NHF_Sara_zakl_mass[i] =  "0";
        				ChangeHeroStat("Sara", STAT_EXPERIENCE, NHF_Sara_percent);
        				sleep(NHF_slep_singl);
        			end;
        		end;
        	end;
        end
        sleep()
      end
    end)
  end
end)

--NHF--------------�����----------------------
NHF_Farid_textPath = "/MapObjects/Academy/NewHeroes/Farid/";
NHF_Farid_week_temp = 0;
NHF_Farid_index_battle_next = -1;
function  error_NHF_Farid_F ()
	print("error:NHF_Farid_F");
end;

AddEvent(combat_results_events, 'NHF_farid_combat_result',
function(fight_id)
	errorHook(error_NHF_Farid_F);
	local temp_name = NHF_tempName_F("Farid");
	if (GetSavedCombatArmyHero(fight_id, 1)== "Farid") and (NHF_Farid_index_battle_next ~= fight_id) then
		NHF_Farid_index_battle_next = fight_id;
		local creature,id_creatures, count_creatures, dead_count;
		local dobavka_kamen = 0;
		local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id,1);
		for i = 0, count_stacks - 1 do
			id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id,1,i);
			if  dead_count > 0 then
				if  (id_creatures == CREATURE_MARBLE_GARGOYLE)or(id_creatures == CREATURE_OBSIDIAN_GARGOYLE)or(id_creatures ==CREATURE_STONE_GARGOYLE) then
					dobavka_kamen = dead_count +  dobavka_kamen;
				end;
			end;
			dead_count = 0;
		end;
		if (floor(dobavka_kamen*NHF_Farid_percent_ore)) > 0 then
			NHF_ChangeResourceHero(ORE, floor(dobavka_kamen*NHF_Farid_percent_ore), "Farid");
			sleep(NHF_slep_singl);
		end;
	end;
end)

AddEvent(new_day_events, 'NHF_farid_new_day',
function(hero, day)
  if hero == 'Farid' and IsHeroAlive('Farid') then
  	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Farid_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
  		NHF_Farid_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
  		local count_pribavka = floor(GetHeroLevel("Farid")*NHF_Farid_percent_garg);
  		if count_pribavka > 0 then
  		   NHF_creatures_prirost_F("Farid",count_pribavka,NHF_mass_creatures.Academy.L2);
  		end;
  	end;
  end
end)

--NHF--------------�����----------------------
NHF_Fahim_index_battle_next = -1;
function  error_NHF_Fahim_F ()
    print("error:NHF_Fahim_F");
end;

AddEvent(combat_results_events, 'NHF_fahim_combat_result',
function(fight_id)
errorHook(error_NHF_Fahim_F);
local temp_name = NHF_tempName_F("Fahim")
if (GetSavedCombatArmyHero(fight_id, 1)== "Fahim") and (NHF_Fahim_index_battle_next ~= fight_id) then
    NHF_Fahim_index_battle_next = fight_id;
    local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id,1);
        for i = 0, count_stacks - 1 do
            local id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id,1,i);
            if  dead_count > 0 then
				for j, id in NHF_mass_creatures.Academy.L5.ID do
					if id == id_creatures then
						local dobavka_dzhin = ceil(GetHeroStat("Fahim",STAT_KNOWLEDGE)*NHF_Fahim_percent);
						if dobavka_dzhin > dead_count then
						   dobavka_dzhin =  dead_count;
						end;
						AddHeroCreatures("Fahim", id_creatures, dobavka_dzhin);
						startThread(NHF_ShowFlyMessage, {NHF_textPath_prirost;creatures=NHF_mass_creatures.Academy.L5.Name[j],prirost=dobavka_dzhin },temp_name ,5);
						sleep(2);
						break;
					end;
				end;
            dead_count = 0;
            end;
        end;
    end;
end)

--NHF_E--------------����---------------------
NHF_Agar_week_temp = -1;
function  error_NHF_Agar_F ()
	print("error:NHF_Agar_F");
end;

AddEvent(new_day_events, 'NHF_agar_new_day',
function(hero, day)
  if hero == 'Agar' and IsHeroAlive('Agar') then
    errorHook(error_NHF_Agar_F);
    if (mod(GetDate(ABSOLUTE_DAY),7) == 1) and (NHF_Agar_week_temp < GetDate(ABSOLUTE_DAY)) then
      NHF_Agar_week_temp =  GetDate(ABSOLUTE_DAY);
      local temp_name = NHF_tempName_F("Agar");
      local prirost = ceil(GetHeroLevel("Agar")*NHF_Agar_percent);
      if prirost > 0 then
         NHF_creatures_prirost_F("Agar",prirost,NHF_mass_creatures.Academy.L6);
      end;
    end;
  end
end)

--NHF_E--------------������---------------------
NHF_Maahir_textPath = "/MapObjects/Academy/NewHeroes/Maahir/";
NHF_MaahirNHF_date_temp = 0;
function  error_NHF_MaahirNHF_F ()
	print("error:NHF_MaahirNHF_F");
end;

AddEvent(new_day_events, 'NHF_maahir_new_day',
function(hero, day)
  if hero == 'MaahirNHF' and IsHeroAlive('MaahirNHF') then
  	errorHook(error_NHF_MaahirNHF_F);
  	if GetDate(ABSOLUTE_DAY) > NHF_MaahirNHF_date_temp then
  		local temp_name = NHF_tempName_F("MaahirNHF");
  		local cur_mana = GetHeroStat("MaahirNHF", STAT_MANA_POINTS);
  		NHF_MaahirNHF_date_temp = GetDate(ABSOLUTE_DAY);
  		local mana_prirost = 1;
  		if GetHeroSkillMastery("MaahirNHF", PERK_MYSTICISM) == true then
  		   mana_prirost = 2;
  		end;
  		mana_prirost = mana_prirost*NHF_Maahir_percent*GetHeroStat("MaahirNHF", STAT_KNOWLEDGE);
  		ChangeHeroStat("MaahirNHF", STAT_MANA_POINTS,mana_prirost);
  		sleep(NHF_slep_singl);
  		if GetHeroStat("MaahirNHF", STAT_MANA_POINTS) > cur_mana then
  			local delta_mana = GetHeroStat("MaahirNHF", STAT_MANA_POINTS) - cur_mana;
  			startThread(NHF_ShowFlyMessage,{NHF_Maahir_textPath.."mana_prirost.txt";p=delta_mana}, temp_name,5);
  		end;
  		--startThread(NHF_ShowFlyMessage, NHF_rawtext_standart("����: +"..mana_prirost), temp_name,5);
  	end;
  end
end)

--NHF_E--------------������---------------------
NHF_Solmir_lvl_temp = 1;
function  error_NHF_Solmir_F ()
	print("error:NHF_Solmir_F");
end;

AddEvent(level_up_events, 'NHF_solmir_lvl_up',
function(hero)
  if hero == 'Solmir' then
    if (ceil(GetHeroLevel("Solmir")/NHF_Solmir_percent) > ceil(NHF_Solmir_lvl_temp/NHF_Solmir_percent))  then
       local temp_name = NHF_tempName_F("Solmir");
       NHF_Solmir_lvl_temp = GetHeroLevel("Solmir");
  	 NHF_ChangeHeroStat("Solmir", STAT_SPELL_POWER,1);
  	 sleep(NHF_slep_singl);
       --ChangeHeroStat("Solmir", STAT_SPELL_POWER,1);
  	 --startThread(NHF_ShowFlyMessage, NHF_Solmir_textPath.."NHF_Solmir_prirost.txt",temp_name, GetObjectOwner(temp_name),5);
    end;
  end
end)
-----------------------------------------------
----------------�������� �����-----------------
-----------------------------------------------

----------------����-------------------------
NHF_Bersy_week_temp = -1;
function  error_NHF_Bersy_F ()
	print("error:NHF_Bersy_F");
end;

AddEvent(new_day_events, 'NHF_bersy_new_day',
function(hero, day)
  if hero == 'Bersy' and IsHeroAlive('Bersy') then
  	errorHook(error_NHF_Bersy_F);
  	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Bersy_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
  		NHF_Bersy_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
  		local temp_name = NHF_tempName_F("Bersy");
  		local prirost = ceil(GetHeroLevel("Bersy")*NHF_Ibba_percent);
  		if prirost > 0 then
  			NHF_creatures_prirost_F("Bersy",prirost,NHF_mass_creatures.Dwarves.L3);
  		end;
  	end;
  end
end)

----------------�����-------------------------
NHF_Skeggy_week_temp = -1;
function  error_NHF_Skeggy_F ()
	print("error:NHF_Skeggy_F");
end;

AddEvent(new_day_events, 'NHF_skeggy_new_day',
function(hero, day)
  if hero == 'Skeggy' and IsHeroAlive('Skeggy') then
  	errorHook(error_NHF_Skeggy_F);
  	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Skeggy_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
  		NHF_Skeggy_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
  		local temp_name = NHF_tempName_F("Skeggy");
  		local prirost = ceil(GetHeroLevel("Skeggy")*NHF_Skeggy_percent);
  		if prirost > 0 then
  			NHF_creatures_prirost_F("Skeggy",prirost,NHF_mass_creatures.Dwarves.L2);
  		end;
  	end;
  end
end)

----------------������-------------------------
NHF_Egil_week_temp = -1;
function  error_NHF_Egil_F ()
	print("error:NHF_Egil_F");
end;

AddEvent(new_day_events, 'NHF_egil_new_day',
function(hero, day)
  if hero == 'Egil' and IsHeroAlive('Egil') then
  	errorHook(error_NHF_Egil_F);
  	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Egil_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
  		NHF_Egil_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
  		local temp_name = NHF_tempName_F("Egil");
  		local prirost = ceil(GetHeroLevel("Egil")*NHF_Erling_percent);
  		if prirost > 0 then
  			NHF_creatures_prirost_F("Egil",prirost,NHF_mass_creatures.Dwarves.L5);
  		end;
  	end;
  end
end)

--NHF----------------������--------------------
NHF_Velund_level = 0;
NHF_Velund_week = 0;
NHF_mass_Major_artefact_Gnom = {ARTIFACT_GREAT_AXE_OF_GIANT_SLAYING,ARTIFACT_DWARVEN_SMITHY_HUMMER,ARTIFACT_RUNE_OF_FLAME};
NHF_mass_Relict_artefact_Gnom = {ARTIFACT_DWARVEN_MITHRAL_SHIELD, ARTIFACT_DWARVEN_MITHRAL_HELMET, ARTIFACT_DWARVEN_MITHRAL_GREAVES, ARTIFACT_DWARVEN_MITHRAL_CUIRASS};
function  error_NHF_Velund_F ()
	print("error:NHF_Velund_F");
end;

AddEvent(new_day_events, 'NHF_velund_new_day',
function(hero, day)
  if hero == 'Velund' and IsHeroAlive('Velund') then
    errorHook(error_NHF_Velund_F);
    local temp_name = NHF_tempName_F("Velund");
    if ((NHF_Velund_level < GetHeroLevel("Velund"))and(NHF_Velund_week < ceil(GetDate(ABSOLUTE_DAY)/7)))   then
      NHF_Velund_level = GetHeroLevel("Velund");
      NHF_Velund_week =  ceil(GetDate(ABSOLUTE_DAY)/7);
		  if GetHeroLevel("Velund") < 10  then
		     temp_artefact = NHF_mass_MinorArt[random(length(NHF_mass_MinorArt))+1];
			 for i_MinorArt, MinorArt in NHF_mass_MinorArt do
				 if (HasArtefact("Velund",MinorArt) == true) and (temp_artefact == MinorArt)then
					temp_artefact = ARTIFACT_ENDLESS_BAG_OF_GOLD;
					break;
				 end;
			 end;
			 GiveArtefact("Velund", temp_artefact);
			 startThread(NHF_ShowFlyMessage, NHF_GetArtefactName(temp_artefact,"+ "), temp_name , 5);
		  end;
		  if GetHeroLevel("Velund") < 20 and GetHeroLevel("Velund") >= 10 then
		  temp_artefact = NHF_mass_MajorArt[random(length(NHF_mass_MajorArt))+1];
			 for i_MajorArt, MajorArt in NHF_mass_MajorArt do
				 if (HasArtefact("Velund",MajorArt) == true) and (temp_artefact == MajorArt)then
					temp_artefact = NHF_mass_Major_artefact_Gnom[random(3)+1];
					break;
				 end;
			 end;
			 GiveArtefact("Velund", temp_artefact);
			 startThread(NHF_ShowFlyMessage, NHF_GetArtefactName(temp_artefact,"+ "), temp_name , 5);
		  end;
		  if GetHeroLevel("Velund") >= 20 then
		  temp_artefact = NHF_mass_RelictArt[random(length(NHF_mass_RelictArt))+1];
			 for i_RelictArt, RelictArt in NHF_mass_RelictArt do
				 if (HasArtefact("Velund",RelictArt) == true) and (temp_artefact == RelictArt)then
					temp_artefact = NHF_mass_Relict_artefact_Gnom[random(4)+1];
					break;
				 end;
			 end;
			 GiveArtefact("Velund", temp_artefact);
			 startThread(NHF_ShowFlyMessage, NHF_GetArtefactName(temp_artefact,"+ "), temp_name , 5);
		  end;
    end;
  end
end)

--NHF----------------��������------------------
local NHF_Geyrmund_textPath = "/MapObjects/Dwarves/NewHeroes/Geyrmund/";
NHF_Geyrmund_index_battle_next = -1
function  error_NHF_Geyrmund_F ()
	print("error:NHF_Geyrmund_F");
end;

AddEvent(combat_results_events, 'NHF_geyrmund_combat_result',
function(fight_id)
  if (GetSavedCombatArmyHero(fight_id, 1)== "Geyrmund") and (NHF_Geyrmund_index_battle_next ~= fight_id) then
  NHF_Geyrmund_index_battle_next = fight_id;
  local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id,0);
	 for i = 0, count_stacks - 1 do
	 local ID_Creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id,0,i);
	   if dead_count > 0 then
		 if ID_Creatures > 0 then
		   local resurs_Geymund =  ceil(GetDate(MONTH)*GetHeroLevel("Velund")/10);
		   if ID_Creatures <= 14 or (ID_Creatures >= 106 and ID_Creatures <= 112) then
			  NHF_ChangeResourceHero(CRYSTAL, resurs_Geymund, "Geyrmund" );
			  sleep(NHF_slep_singl);
		   end;
		   if (ID_Creatures >= 15 and ID_Creatures <= 28) or (ID_Creatures >= 131 and ID_Creatures <= 137) then
			  NHF_ChangeResourceHero(SULFUR, resurs_Geymund, "Geyrmund" );
			  sleep(NHF_slep_singl);
		   end;
		   if (ID_Creatures >= 29 and ID_Creatures <= 42) or (ID_Creatures >= 152 and ID_Creatures <= 158) then
			  NHF_ChangeResourceHero(MERCURY, resurs_Geymund, "Geyrmund" );
			  sleep(NHF_slep_singl);
		   end;
		   if (ID_Creatures >= 43 and ID_Creatures <= 56) or (ID_Creatures >= 145 and ID_Creatures <= 151) then
			  NHF_ChangeResourceHero(GEM, resurs_Geymund, "Geyrmund" );
			  sleep(NHF_slep_singl);
		   end;
		   if (ID_Creatures >= 57 and ID_Creatures <= 70) or (ID_Creatures >= 159 and ID_Creatures <= 165) then
			  NHF_ChangeResourceHero(GEM, resurs_Geymund, "Geyrmund" );
			  sleep(NHF_slep_singl);
		   end;
		   if (ID_Creatures >= 71 and ID_Creatures <= 84) or (ID_Creatures >= 138 and ID_Creatures <= 144) then
			  NHF_ChangeResourceHero(SULFUR, resurs_Geymund, "Geyrmund" );
			  sleep(NHF_slep_singl);
		   end;
		   if (ID_Creatures >= 92 and ID_Creatures <= 105) or (ID_Creatures >= 166 and ID_Creatures <= 172) then
			  NHF_ChangeResourceHero(CRYSTAL, resurs_Geymund, "Geyrmund" );
			  sleep(NHF_slep_singl);
		   end;
		   if (ID_Creatures >= 117 and ID_Creatures <= 130) or (ID_Creatures >= 173 and ID_Creatures <= 179) then
			  NHF_ChangeResourceHero( MERCURY, resurs_Geymund, "Geyrmund" );
			  sleep(NHF_slep_singl);
		   end;
		   if (ID_Creatures >= 85 and ID_Creatures <= 91) or (ID_Creatures >= 113 and ID_Creatures <= 116) or (ID_Creatures > 179) then
		   resurs_Geymund = resurs_Geymund * 500;
			  NHF_ChangeResourceHero(GOLD, resurs_Geymund, "Geyrmund" );
			  sleep(NHF_slep_singl);
		   end;
		 break;
		 end;
	   end;
	 end;
  end;
end)

--NHF----------------��������--------------------
NHF_Gronulf_textPath = "/MapObjects/Dwarves/NewHeroes/Gronulf/";
NHF_Gronulf_week_temp = -1;
NHF_Gronulf_StartArmy = 1;
function  error_NHF_Gronulf_F ()
	print("error:NHF_Gronulf_F");
end;

AddEvent(new_day_events, 'NHF_gronulf_new_day',
function(hero, day)
  if hero == 'Gronulf' and IsHeroAlive('Gronulf') then
    errorHook(error_NHF_Gronulf_F);
    if  (mod(GetDate(ABSOLUTE_DAY),7) == 1) and (NHF_Gronulf_week_temp < GetDate(ABSOLUTE_DAY)) then
        local prirost = 1;
    	local count_week = ceil(GetDate(ABSOLUTE_DAY)/7);
        local temp_name = NHF_tempName_F("Gronulf");
        NHF_Gronulf_week_temp = GetDate(ABSOLUTE_DAY);
        if GetHeroLevel("Gronulf") > GetHeroCreatures("Gronulf", CREATURE_WOLF)*NHF_Gronulf_percent then
    		prirost = GetHeroLevel("Gronulf");
        else
    		prirost = ceil(GetHeroCreatures("Gronulf", CREATURE_WOLF)*NHF_Gronulf_percent);
        end;
        AddHeroCreatures("Gronulf",CREATURE_WOLF,prirost);
    	startThread(NHF_ShowFlyMessage,{NHF_Gronulf_textPath.."message.txt";p=prirost}, temp_name,5);
    	--startThread(NHF_ShowFlyMessage, NHF_rawtext_standart("�����: +"..prirost),temp_name , 5);
    end;
  end
end)

--NHF----------------������---------------------
function  error_NHF_Knaud_F ()
	print("error:NHF_Knaud_F");
end;	

combat_scripts_paths[length(combat_scripts_paths) + 1] = '/scripts/combat/NHF/Knauda.lua'


--NHF-------------------����---------------------
NHF_Rann_day_temp = 0;
function  error_NHF_Rann_F ()
   print("error:NHF_Rann_F");
end;

AddEvent(new_day_events, 'NHF_rann_new_day',
function(hero, day)
  if hero == 'Rann' and IsHeroAlive('Rann') then
   errorHook(error_NHF_Rann_F);
   if GetDate(ABSOLUTE_DAY) > NHF_Rann_day_temp then
  	NHF_Rann_day_temp = GetDate(ABSOLUTE_DAY);
  	local pribavka = 0;
  	for id, mass in  NHF_artefact_table do
  	   if (HasArtefact("Rann", id,1) == true) then
  		   pribavka = pribavka + NHF_artefact_table[id][ARTEFACT_TABLE_COST];
  	   end;
  	end;
  	pribavka =( pribavka *NHF_Rann_percent );
  	if pribavka > 0 then
  	   NHF_ChangeResourceHero(GOLD, pribavka, "Rann");
  	   sleep(NHF_slep_singl);
  	end;
   end;
  end
end)

--NHF----------------��������----------------------
NHF_Rikfrost_textPath = "/MapObjects/Dwarves/NewHeroes/Rikfrost/";
NHF_Rikfrost_index_battle_next = -1;
NHF_Rikfrost_get_mana = 0;
function  error_NHF_Rikfrost_F ()
	print("error:NHF_Rikfrost_F");
end;

AddEvent(combat_results_events, 'NHF_rikfrost_combat_result',
function(fight_id)
	if (GetSavedCombatArmyHero(fight_id, 1)== "Rikfrost") and (NHF_Rikfrost_index_battle_next ~= fight_id) then
		NHF_Rikfrost_index_battle_next = fight_id;
		local temp_name = NHF_tempName_F("Rikfrost");
    errorHook(error_NHF_Rikfrost_F);
  	local get_mana = NHF_Rikfrost_get_mana;
		local count_pribavka_mana =  ceil((get_mana-GetHeroStat("Rikfrost", STAT_MANA_POINTS))/2);
		if count_pribavka_mana > 0 then
			local temp_knowledge = GetHeroStat("Rikfrost", STAT_KNOWLEDGE)*10;
			ChangeHeroStat("Rikfrost", STAT_KNOWLEDGE, temp_knowledge);
			sleep(NHF_slep_singl);
			ChangeHeroStat("Rikfrost", STAT_MANA_POINTS, count_pribavka_mana);
			sleep(NHF_slep_singl);
			ChangeHeroStat("Rikfrost", STAT_KNOWLEDGE, -temp_knowledge);
			sleep(NHF_slep_singl);			
			startThread(NHF_ShowFlyMessage,{NHF_Rikfrost_textPath.."message.txt";p=count_pribavka_mana}, temp_name,5);
			--startThread(NHF_ShowFlyMessage, NHF_rawtext_standart("����: +"..count_pribavka_mana), temp_name,5);
		end;
	end;
	NHF_Rikfrost_get_mana = GetHeroStat("Rikfrost", STAT_MANA_POINTS);
end)

--NHF----------------������----------------------
seegrun_spec =
{
	affected_heroes = {},
	ms_reduction = 1
}

NHF_Seegrun_textPath = "/MapObjects/Dwarves/NewHeroes/Seegrun/";
NHF_Seegrun_day = 1;
function  error_NHF_Seegrun_F ()
	print("error:NHF_Seegrun_F");
end;

AddEvent(level_up_events, 'NHF_Seegrun_lvl_up',
function(hero)
  if hero == 'Seegrun' then
    seegrun_spec.ms_reduction = ceil(GetHeroLevel(hero) / 10)
  end
end)

AddEvent(add_hero_events, 'NHF_seegrun_add_hero',
function(hero)
  if hero == 'Seegrun' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Seegrun') then
        	for player = PLAYER_1, PLAYER_8 do
        		if IsActivePlayer(player) and GetObjectOwner('Seegrun') ~= player and GetPlayerTeam(GetObjectOwner('Seegrun')) ~= GetPlayerTeam(player) then
        			for i, c_hero in GetPlayerHeroes(player) do
        				if not seegrun_spec.affected_heroes[c_hero] then
        					if GetDistance(c_hero, 'Seegrun') <= seegrun_spec_params.base_distance then
                    print(c_hero, ' near Seegrun')
        						seegrun_spec.affected_heroes[c_hero] = 1
        						GiveHeroBattleBonus(c_hero, HERO_BATTLE_BONUS_SPEED, -seegrun_spec.ms_reduction)
        					end
        				else
        					if GetDistance(c_hero, 'Seegrun') > seegrun_spec_params.base_distance then
        						seegrun_spec.affected_heroes[c_hero] = nil
        						GiveHeroBattleBonus(c_hero, HERO_BATTLE_BONUS_SPEED, seegrun_spec.ms_reduction)
        					end
        				end
        			end
        		end
        	end
      	end
      	sleep()
      end
    end)
  end
end)

--NHF----------------������--------------------
NHF_Telhar_textPath = "/MapObjects/Dwarves/NewHeroes/Telhar/";
NHF_index_battle_Telhar = -1 ;
NHF_Telhar_bonus_temp = 0;
NHF_Telhar_flag_battle = 0;
function  error_NHF_Telhar_F ()
	print("error:NHF_Telhar_F");
end;

AddEvent(combat_results_events, 'NHF_telhar_combat_result',
function(fight_id)
   errorHook(error_NHF_Telhar_F);
   if (GetSavedCombatArmyHero(fight_id, 1)== "Telhar") and (NHF_index_battle_Telhar ~= fight_id) then
      NHF_index_battle_Telhar = fight_id;
      NHF_Telhar_flag_battle = 1;
   end;
end)

AddEvent(add_hero_events, 'NHF_telhar_add_hero',
function(hero)
  if hero == 'Telhar' then
   startThread(
   function()
     while 1 do
       if IsHeroAlive('Telhar') then
         local creature_mass = {} ;
         local i_staks = 0;
         creature_mass[0], creature_mass[1], creature_mass[2], creature_mass[3], creature_mass[4], creature_mass[5], creature_mass[6]= GetHeroCreaturesTypes("Telhar");
         for  i, creature in  creature_mass do
            if  creature_mass[i] ~= 0 then
                i_staks = i_staks + 1;
            else
                break;
            end;
         end;
         local count_dobavka = ceil((NHF_Telhar_percent*GetHeroLevel("Telhar"))/i_staks);
         if  (NHF_Telhar_bonus_temp  ~= count_dobavka)  or (NHF_Telhar_flag_battle == 1) then
           local bonus_temp_too = count_dobavka;
           if  NHF_Telhar_flag_battle == 0 then
              count_dobavka = count_dobavka - NHF_Telhar_bonus_temp;
           end;
           GiveHeroBattleBonus("Telhar", HERO_BATTLE_BONUS_DEFENCE, count_dobavka);
           NHF_Telhar_bonus_temp  = bonus_temp_too;
           NHF_Telhar_flag_battle = 0;
         end;
       end
       sleep()
     end
   end)
  end
end)

AddEvent(remove_hero_events, 'NHF_telhar_remove_hero',
function(hero)
  if hero == 'Telhar' then
	  NHF_Telhar_flag_battle = 1;
  end
end)

--NHF----------------�ܨ���--------------------
NHF_Fyotra_textPath = "/MapObjects/Dwarves/NewHeroes/Fyotra/";
NHF_Fyotra_day_temp = 0;
NHF_Fyotra_n_runes_temp = 0;
function  error_NHF_Fyotra_F ()
	print("error:NHF_Fyotra_F");
end;

AddEvent(add_hero_events, 'NHF_fyotra_add_hero',
function(hero)
  if hero == 'Fyotra' then
   startThread(
   function()
     while 1 do
       if IsHeroAlive('Fyotra') then
         errorHook(error_NHF_Fyotra_F);
         local n_runes = 0;
         for i = 249, 258 do
           if KnowHeroSpell("Fyotra", i) == true then
              n_runes = n_runes + 1;
           end;
         end;
         if NHF_Fyotra_n_runes_temp ~= n_runes then
           local prirost = - NHF_Fyotra_n_runes_temp + n_runes;
           local temp_name = NHF_tempName_F("Fyotra");
           ChangeHeroStat("Fyotra", STAT_KNOWLEDGE, prirost);
      	   sleep(NHF_slep_singl);
      	   startThread(NHF_ShowFlyMessage, {NHF_Fyotra_textPath.."NHF_Fyotra_prirost.txt";prirost=prirost},temp_name , 5);
           NHF_Fyotra_n_runes_temp = n_runes;
         end;
       end
       sleep()
     end
   end)
  end
end)

AddEvent(new_day_events, 'NHF_fyotra_new_day',
function(hero, day)
  if hero == 'Fyotra' and IsHeroAlive('Fyotra') then
   if ceil(GetDate(ABSOLUTE_DAY)/7) > ceil(NHF_Fyotra_day_temp/7) then
     NHF_Fyotra_day_temp = GetDate(ABSOLUTE_DAY);
     NHF_ChangeResourceHero(CRYSTAL, NHF_Fyotra_n_runes_temp, "Fyotra");
	 sleep(NHF_slep_singl);
   end;
  end
end)

--NHF---------------������--------------------
NHF_Frerin_textPath = "/MapObjects/Dwarves/NewHeroes/Frerin/";
NHF_index_battle_next = -1 ;
NHF_Frerin_bonus_temp = 0;
NHF_Frerin_week_temp = -1;
function  error_NHF_Frerin_F ()
	print("error:NHF_Frerin_F");
end;

AddEvent(new_day_events, 'NHF_frerin_new_day',
function(hero, day)
  if hero == 'Frerin' and IsHeroAlive('Frerin') then
  	errorHook(error_NHF_Frerin_F);
  	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Frerin_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
  	  NHF_Frerin_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
  	  local temp_name = NHF_tempName_F("Frerin");
  	  local prirost = ceil(GetHeroLevel("Frerin")*NHF_Frerin_percent);
  	  if prirost > 0 then
  		 NHF_creatures_prirost_F("Frerin",prirost,NHF_mass_creatures.Dwarves.L4);
  	  end;
  	end;
  end
end)

AddEvent(add_hero_events, 'NHF_frerin_add_hero',
function(hero)
  if hero == 'Frerin' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Frerin') then
        	local NHF_Frerin_percent_ofence_temp = 0;
        	local NHF_Frerin_percent_ofence_summ = 0;
        	local count_berserk = GetHeroCreatures("Frerin",CREATURE_BERSERKER) + GetHeroCreatures("Frerin",CREATURE_BATTLE_RAGER) + GetHeroCreatures("Frerin",CREATURE_BROWLER);
        	local count_dobavka = 0;
        	local count_dobavka_temp = 2;
        	if count_berserk > 0 then
        	  while (count_dobavka_temp ~= 1)  do
        		  count_dobavka = count_dobavka + 1;
        		  if count_dobavka_temp > 1 then
        			NHF_Frerin_percent_ofence_temp = NHF_Frerin_percent_ofence_temp + NHF_Frerin_percent_ofence;
        			NHF_Frerin_percent_ofence_summ = NHF_Frerin_percent_ofence_temp + NHF_Frerin_percent_ofence_summ;
        		  else
        			break;
        		  end;
        		  count_dobavka_temp = floor(count_berserk/NHF_Frerin_percent_ofence_summ)+1;
        	  end;
        	end;
       		if  (NHF_Frerin_bonus_temp  ~= count_dobavka) then
          	local bonus_temp_too = count_dobavka;
          	count_dobavka = count_dobavka - NHF_Frerin_bonus_temp;
          	GiveHeroBattleBonus("Frerin", HERO_BATTLE_BONUS_ATTACK, count_dobavka);
          	NHF_Frerin_bonus_temp  = bonus_temp_too;
        	end;
        end
        sleep()
      end
    end)
  end
end)

AddEvent(combat_results_events, 'NHF_frerin_combat_result',
function(fight_id)
	if (GetSavedCombatArmyHero(fight_id, 1)== "Frerin") and (NHF_index_battle_next ~= fight_id) then
	NHF_index_battle_next = fight_id;
	NHF_Frerin_bonus_temp = 0;
	end;   
end)

AddEvent(remove_hero_events, 'NHF_frerin_remove_hero',
function(hero)
  if hero == 'Frerin' then
	  NHF_Frerin_bonus_temp = 0;
	end
end)

--NHF----------------������--------------------
NHF_Amund_mass_arts = {{85, 2,48,49,50,51,86,81,82},{{3,4,0,4,0,0,0,2,0},{0,0,4,0,0,4,0,0,2},{0,0,0,0,0,0,1,2,0},{0,0,0,0,4,0,0,0,2}},{0,0,0,0,0,0,0,0,0}}
function  error_NHF_Amund_F ()
   print("error:NHF_Amund_F");
end;

AddEvent(add_hero_events, 'NHF_amund_add_hero',
function(hero)
  if hero == 'Amund' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive('Amund') then
         errorHook(error_NHF_Amund_F);
         for i, art in  NHF_Amund_mass_arts[1] do
             if (HasArtefact("Amund", art,1) == true) and (NHF_Amund_mass_arts[3][i] == 0) then
                 NHF_Amund_mass_arts[3][i] = 1;
                 for j = 1, 4 do
                     if NHF_Amund_mass_arts[2][j][i] ~= 0 then
                       local ID_parametr = j;
                       ChangeHeroStat("Amund",ID_parametr,NHF_Amund_mass_arts[2][j][i]);
      				 sleep(NHF_slep_singl);
                     end;
                 end;
             end;
             if (HasArtefact("Amund", art,1) ~= true) and (NHF_Amund_mass_arts[3][i] == 1) then
                 NHF_Amund_mass_arts[3][i] = 0;
                 for j = 1, 4 do
                     if NHF_Amund_mass_arts[2][j][i] ~= 0 then
                       local ID_parametr = j;
                       ChangeHeroStat("Amund",ID_parametr,-NHF_Amund_mass_arts[2][j][i]);
      				 sleep(NHF_slep_singl);
                     end;
                 end;
             end;
         end;
        end
        sleep()
      end
    end)
  end
end)
-----------------------------------------------
----------------������� ����-------------------
-----------------------------------------------

----------------�����--------------------------
NHF_Hero4_week_temp = -1;
function  error_NHF_Hero4_F ()
	print("error:NHF_Hero4(Goshak)_F");
end;

AddEvent(new_day_events, 'NHF_goshak_new_day',
function(hero, day)
  if hero == 'Hero4' and IsHeroAlive('Hero4') then
  	errorHook(error_NHF_Hero4_F);
  	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Hero4_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
  		NHF_Hero4_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
  		local temp_name = NHF_tempName_F("Hero4");
  		local prirost = ceil(GetHeroLevel("Hero4")*NHF_Goshak_percent);
  		if prirost > 0 then
  			NHF_creatures_prirost_F("Hero4",prirost,NHF_mass_creatures.Stronghold.L5);
  		end;
  	end;
  end
end)

----------------������------------------------
NHF_Hero8_week_temp = -1;
function  error_NHF_Hero8_F ()
	print("error:NHF_Hero8(Tilsek)_F");
end;

AddEvent(new_day_events, 'NHF_tilsek_new_day',
function(hero, day)
  if hero == 'Hero8' and IsHeroAlive('Hero8') then
  	errorHook(error_NHF_Hero8_F);
  	if (ceil(GetDate(ABSOLUTE_DAY)/7) > 1) and (NHF_Hero8_week_temp < (ceil(GetDate(ABSOLUTE_DAY)/7)-1)) then
  		NHF_Hero8_week_temp =  (ceil(GetDate(ABSOLUTE_DAY)/7)-1);
  		local temp_name = NHF_tempName_F("Hero8");
  		local prirost = ceil(GetHeroLevel("Hero8")*NHF_Tilsek_percent);
  		if prirost > 0 then
  			NHF_creatures_prirost_F("Hero8",prirost,NHF_mass_creatures.Stronghold.L3);
  		end;
  	end;
  end
end)

--NHF----------------������--------------------

-- MCCS Avrana adaptation start --
avrana_spec =
{
	curr_heroes_to_steal = {},
}

MCCS_CUSTOM_AVRANA = 1
-- функция, проверяющая, сколько героев находится в подходящем для воровства радиусе, и если их больше одного, то запускает диалог выбора, иначе - сразу ворует
mccs_hero_custom['Avran'] =
function(hero)
  local heroes_to_steal = AvranaSpec_CheckHeroesNear(hero)
  -- герой всего один?
  if length(heroes_to_steal) == 1 then
		-- сразу воруем
		startThread(AvranaSpec_StealArts, 'Avran', heroes_to_steal[1])
  else
		-- иначе, сохранить таблицу героев для кражи глобально, чтобы инициализировать диалог
		avrana_spec.curr_heroes_to_steal = heroes_to_steal
		-- запустить диалог выбора героев
		Dialog.NewDialog(avrana_choose_hero_dialog, hero, GetObjectOwner(hero))
  end
end

avrana_choose_hero_dialog =
{
	state = 1,
	path = avrana_spec_params.path,
	icon = '/'..GetHeroIcon('Avran'),
	title = 'title',
	select_text = '',

	perform_func =
	function(player, curr_state, answer, next_state)
	  if IsNum(next_state) then
		  return next_state
	  else
		  startThread(AvranaSpec_StealArts, Dialog.GetActiveHeroForPlayer(player), next_state)
		  return 0
	  end
	end,

	options = {[1] = {[0] = avrana_spec_params.path..'choose_hero.txt';}},

	Reset = 
	function(player)
	  for i, option in Dialog.GetActiveDialogForPlayer(player) do
		  option = nil
	  end
	  Dialog.GetActiveDialogForPlayer(player).options[1] = {[0] = avrana_spec_params.path..'choose_hero.txt';}
	end,

	Open = 
	function(player)
	  Dialog.Reset(player)
	  local curr_state, heroes_per_state = 1, 0
	  for i, hero in avrana_spec.curr_heroes_to_steal do
  		heroes_per_state = heroes_per_state + 1
  		if heroes_per_state == 5 then
  		  heroes_per_state = 1
  		  Dialog.SetAnswer(Dialog.GetActiveDialogForPlayer(player), curr_state, 5, '/Text/next.txt', curr_state + 1)
  		  curr_state = curr_state + 1
  		  Dialog.GetActiveDialogForPlayer(player).options[curr_state] = {[0] = avrana_spec_params.path..'choose_hero.txt';}
  		end
  		Dialog.SetAnswer(Dialog.GetActiveDialogForPlayer(player), curr_state, heroes_per_state, GetName(hero), hero)
	  end
	  Dialog.Action(player)
	end
}

function AvranaSpec_StealArts(hero, hero_to_steal)
  local arts_count_to_steal = 
  {
	  [ART_TIER_MINOR] = 0,
	  [ART_TIER_MAJOR] = 0,
	  [ART_TIER_RELIC] = 0
  }  
  local max_tier_to_steal = ART_TIER_MINOR
  local hero_lvl = GetHeroLevel(hero)
  local enemy_lvl = GetHeroLevel(hero_to_steal)
  --
  if hero_lvl < enemy_lvl then
  	arts_count_to_steal[ART_TIER_MINOR] = 1
    elseif hero_lvl == enemy_lvl then
  	arts_count_to_steal[ART_TIER_MINOR] = 2
  	arts_count_to_steal[ART_TIER_MAJOR] = 1
  	max_tier_to_steal = ART_TIER_MAJOR
  else
  	arts_count_to_steal[ART_TIER_MINOR] = 4
  	arts_count_to_steal[ART_TIER_MAJOR] = 2
  	arts_count_to_steal[ART_TIER_RELIC] = 1
  	max_tier_to_steal = ART_TIER_RELIC
  end
  --
  local count = 0
  while max_tier_to_steal > 0 do
  	for i = 1, arts_count_to_steal[max_tier_to_steal] do
  	  local arts_to_steal = GetHeroEquipedArtsByTier(hero_to_steal, max_tier_to_steal)
  	  if arts_to_steal then
    		-- сократить вдвое число по оставшимся тирам, главным образом для ситуации, если нет реликов и всего 1 мажор(должно получиться 0-1-2)
    		for i = 1, max_tier_to_steal - 1 do
    		  arts_count_to_steal[i] = arts_count_to_steal[i] / 2
    		end
    		--
    		local art_to_steal = GetRandFromT(arts_to_steal)
    		count = count + 1
    		RemoveArtefact(hero_to_steal, art_to_steal)
    		GiveArtefact(hero, art_to_steal)
    		sleep()
    		startThread(ShowFlyingSign, {avrana_spec_params.path..'add_art.txt'; art_name = GetArtName(art_to_steal)}, hero, GetObjectOwner(hero), 5.0)
    		startThread(ShowFlyingSign, {avrana_spec_params.path..'remove_art.txt'; art_name = GetArtName(art_to_steal)}, hero_to_steal, GetObjectOwner(hero_to_steal), 5.0)
   	  else
    		max_tier_to_steal = max_tier_to_steal - 1
    		break
  	  end
  	end
  	sleep()
  end
  --
  if count == 0 then
    startThread(ShowFlyingSign, avrana_spec_params.path..'no_stealed_arts.txt', hero, GetObjectOwner(hero), 5.0)
  end
end

function AvranaSpec_CheckHeroesNear(hero)
	local check_radius = avrana_spec_params.base_radius + (avrana_spec_params.base_radius * (HasArtefact(hero, ARTIFACT_CROWN_OF_MANY_EYES, 1) and 1 or 0)) +
                      (avrana_spec_params.base_radius * (HasHeroSkill(hero, PERK_SCOUTING) and 1 or 0)) +
                      (avrana_spec_params.base_radius * (HasHeroSkill(hero, RANGER_FEAT_DISGUISE_AND_RECKON) and 1 or 0))
  local answer, n = {}, 0
  for player = PLAYER_1, PLAYER_8 do
		if IsActivePlayer(player) and (player ~= GetObjectOwner(hero)) and (GetPlayerTeam(player) ~= GetPlayerTeam(GetObjectOwner(hero))) then
			for i, check_hero in GetPlayerHeroes(player) do
				if GetDistance(hero, check_hero) <= check_radius then
					n = n + 1
					answer[n] = check_hero
				end
			end
		end
	end
	if n > 0 then
		return answer
	end
	return nil
end

AddEvent(add_hero_events, 'NHF_avrana_add_hero',
function(hero)
  if hero == 'Avran' then
    startThread(
    function()
      while 1 do
        if IsHeroAlive(%hero) and IsObjectExists(%hero) then
        	if not mccs_custom_ability.hero_custom_affected_heroes[%hero][MCCS_CUSTOM_AVRANA] then
        		if AvranaSpec_CheckHeroesNear(%hero) then
              print('Avrana can steal')
        			mccs_custom_ability.hero_custom_affected_heroes[%hero][MCCS_CUSTOM_AVRANA] = 1
        		end
        	else
        		if not AvranaSpec_CheckHeroesNear(%hero) then
        			mccs_custom_ability.hero_custom_affected_heroes[%hero][MCCS_CUSTOM_AVRANA] = nil
        		end
        	end
        end
       	sleep()
      end
    end)
  end
end)

-- MCCS Avrana adaptation end --

combat_scripts_paths[length(combat_scripts_paths) + 1] = '/scripts/combat/NHF/Aratrok.lua'

--NHF----------------������--------------------
NHF_Vardok_index_battle_next = -1;
NHF_Vardok_flag =1;
NHF_Vardok_lvl_temp = -1;
function  error_NHF_Vardok_F ()
	print("error:NHF_Vardok_F");
end;

AddEvent(add_hero_events, 'NHF_vardok_add_hero',
function(hero)
  if hero == 'Vardok' then
    GiveHeroBattleBonus("Vardok", HERO_BATTLE_BONUS_MORALE, floor( GetHeroLevel("Vardok")/NHF_Vardok_percent)+1);
  end
end)

AddEvent(respawn_hero_events, 'NHF_vardok_respawn',
function(hero)
  if hero == 'Vardok' then
    GiveHeroBattleBonus("Vardok", HERO_BATTLE_BONUS_MORALE, floor( GetHeroLevel("Vardok")/NHF_Vardok_percent)+1);
  end
end)

AddEvent(combat_results_events, 'NHF_vardok_combat_result',
function(fight_id)
   if (NHF_Vardok_index_battle_next ~= fight_id) then
     if (GetSavedCombatArmyHero(fight_id, 1)== "Vardok") then
       NHF_Vardok_index_battle_next = fight_id;
       GiveHeroBattleBonus("Vardok", HERO_BATTLE_BONUS_MORALE, floor( GetHeroLevel("Vardok")/NHF_Vardok_percent)+1);
     end;
     if (GetSavedCombatArmyHero(fight_id, 0)== "Vardok")  then
       NHF_Vardok_index_battle_next = fight_id;
       NHF_Vardok_flag = 0;
     end;
   end;
end)

AddEvent(level_up_events, 'NHF_vardok_lvl_up',
function(hero)
  if hero == 'Vardok' then
   if (GetHeroLevel("Vardok")> NHF_Vardok_lvl_temp) and (floor( GetHeroLevel("Vardok")/NHF_Vardok_percent)>floor(NHF_Vardok_lvl_temp/NHF_Vardok_percent))  then
     GiveHeroBattleBonus("Vardok", HERO_BATTLE_BONUS_MORALE, 1);
     NHF_Vardok_lvl_temp = GetHeroLevel("Vardok");
   end;
  end
end)

AddEvent(remove_hero_events, 'NHF_vardok_remove_hero',
function(hero)
 if hero == 'Vardok' then
	 NHF_Vardok_flag = 0;
	 NHF_Vardok_index_battle_next = -2;
 end;
end)
  
--NHF--------------�����---------------------
--NHF_Mahur_textPath = "/MapObjects/Stronghold/NewHeroes/Mahur/";
NHF_Mahur_day_temp = 0;
NHF_Mahur_mass_orcs = {{117,118,173},{119,120,174},{121,122,175},{123,124,176},{125,126,177},{127,128,178},{129,130,179}}
function  error_NHF_Mahur_F ()
	print("error:NHF_Mahur_F");
end;

AddEvent(new_day_events, 'NHF_mahur_new_day',
function(hero, day)
  if hero == 'Mahur' and IsHeroAlive('Mahur') then
    errorHook(error_NHF_Mahur_F);
    if NHF_Mahur_day_temp < GetDate(ABSOLUTE_DAY) then
    NHF_Mahur_day_temp = GetDate(ABSOLUTE_DAY);
      local temp_name = NHF_tempName_F("Mahur");
      local creature_mass ={};
      local flag_dobavka = 0;
      local count_pribavka =  1;
      local creatures = "";
      local lvl_pribavka = ceil((GetHeroLevel("Mahur")/6));
        if count_pribavka > 0 then
        creature_mass[0], creature_mass[1], creature_mass[2], creature_mass[3], creature_mass[4], creature_mass[5], creature_mass[6]= GetHeroCreaturesTypes("Mahur");
          for  i, creature in  creature_mass do
            if creature ~= 0 then
              if creature ==  NHF_Mahur_mass_orcs[lvl_pribavka][1] then
                AddHeroCreatures("Mahur", NHF_Mahur_mass_orcs[lvl_pribavka][1], count_pribavka);
                flag_dobavka = 1;
  			  startThread(NHF_ShowFlyMessage, NHF_nameCr_F(NHF_Mahur_mass_orcs[lvl_pribavka][1], ": +"..count_pribavka),temp_name,5);
                break;
              end;
              if creature ==  NHF_Mahur_mass_orcs[lvl_pribavka][2] then
                AddHeroCreatures("Mahur", NHF_Mahur_mass_orcs[lvl_pribavka][2], count_pribavka);
                flag_dobavka = 1;
  			  startThread(NHF_ShowFlyMessage, NHF_nameCr_F(NHF_Mahur_mass_orcs[lvl_pribavka][2], ": +"..count_pribavka),temp_name,5);
                break;
              end;
              if creature ==  NHF_Mahur_mass_orcs[lvl_pribavka][3] then
                AddHeroCreatures("Mahur", NHF_Mahur_mass_orcs[lvl_pribavka][3], count_pribavka);
                flag_dobavka = 1;
  			  startThread(NHF_ShowFlyMessage, NHF_nameCr_F(NHF_Mahur_mass_orcs[lvl_pribavka][3], ": +"..count_pribavka),temp_name,5);
                break;
              end;
            end;
          end;
          if flag_dobavka == 0 then
          AddHeroCreatures("Mahur", NHF_Mahur_mass_orcs[lvl_pribavka][1], count_pribavka);
  		startThread(NHF_ShowFlyMessage, NHF_nameCr_F(NHF_Mahur_mass_orcs[lvl_pribavka][1], ": +"..count_pribavka),temp_name,5);
          end;
        end;
      end;
    end
end)
 
--NHF----------------������--------------------
NHF_Oihrin_lvlHero = 1;
NHF_Oihrin_mass_spell = NHF_mass_klich;
function  error_NHF_Oihrin_F ()
    print("error:NHF_Oihrin_F");
end;

AddEvent(level_up_events, 'NHF_oirhin_lvl_up',
function(hero)
  if hero == 'Oirhin' then
    errorHook(error_NHF_Oihrin_F);
    if (GetHeroLevel("Oihrin") > NHF_Oihrin_lvlHero) then
      NHF_Oihrin_lvlHero = GetHeroLevel("Oihrin");
      local temp_name = NHF_tempName_F("Oihrin");
      for id,uroven in NHF_Oihrin_mass_spell do
          if (GetHeroLevel("Oihrin") >= (uroven*3)) and (KnowHeroSpell("Oihrin", id) ~= true) then
             if ((NHF_Oihrin_persent*100) >= (random(100)+1))  then
                TeachHeroSpell("Oihrin" , id);
  			  startThread(NHF_ShowFlyMessage, NHF_GetSpellName(id,"+ "), temp_name,5);
             end;
             break;
          end;
      end;
    end;
  end
end)
 
--NHF----------------�����--------------------
NHF_Orbag_itogo_dead_count = 0;
NHF_Orbag_index_battle_next = -1
function  error_NHF_Orbag_F ()
	print("error:NHF_Orbag_F");
end;

AddEvent(combat_results_events, 'NHF_orbag_combat_result',
function(fight_id)
   errorHook(error_NHF_Orbag_F);
   if (NHF_Orbag_index_battle_next ~= fight_id) then
     if (GetSavedCombatArmyHero(fight_id, 1)== "Orbag")  then
        NHF_Orbag_index_battle_next = fight_id;
        local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id,0);
        for i=0, count_stacks - 1 do
    			local id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id,0,i);
    			NHF_Orbag_itogo_dead_count = NHF_Orbag_itogo_dead_count + dead_count;
        end;
        if  NHF_Orbag_itogo_dead_count >= 0  then
          local temp_name = NHF_tempName_F("Orbag");
          NHF_ChangeResourceHero(GOLD, ceil(NHF_Orbag_itogo_dead_count*NHF_Orbag_percent), "Orbag");
		  sleep(NHF_slep_singl);
        end;
     end;
   end;
end)

AddEvent(remove_hero_events, 'NHF_orbag_remove_hero',
function(hero)
  if hero == 'Orbag' then
    NHF_Orbag_index_battle_next = -2;
  end
end)

--NHF----------------�����---------------------
NHF_Urika_week_temp = -1;
function  error_NHF_Urika_F ()
	print("error:NHF_Urika_F");
end;

AddEvent(new_day_events, 'NHF_urika_new_day',
function(hero, day)
  if hero == 'Urika' and IsHeroAlive('Urika') then
    errorHook(error_NHF_Urika_F);
    if   ceil((GetDate(ABSOLUTE_DAY)/7)-1)~= NHF_Urika_week_temp then
        NHF_Urika_week_temp =  ceil((GetDate(ABSOLUTE_DAY)/7)-1);
        local prirost = ceil(GetHeroStat("Urika", STAT_KNOWLEDGE)*NHF_Urika_percent);
        for i,town in NHF_names_objects.towns do
  		  if GetObjectOwner(town) ~= 0 then
  			if  (IsHeroInTown("Urika",town,1,0) == true  or  IsHeroInTown("Urika",town,0,1) == true) and  (GetTownRace(town) == TOWN_STRONGHOLD)  then
  			  if GetTownBuildingLevel(town, TOWN_BUILDING_DWELLING_4) ~= 0 then
  				 SetObjectDwellingCreatures(town, CREATURE_SHAMAN, GetObjectDwellingCreatures(town,CREATURE_SHAMAN) + prirost);
  			  end;
  			end;
  		  end;
  	  end;
      if prirost > 0 then
         NHF_creatures_prirost_F("Urika",prirost,NHF_mass_creatures.Stronghold.L4);
      end;
    end;
  end
end)

--NHF--------------������--------------------
NHF_Huvrag_lvl_temp = 0;
function  error_NHF_Huvrag_F ()
	print("error:NHF_Huvrag_F");
end;

AddEvent(level_up_events, 'NHF_huvrag_lvl_up',
function(hero)
  if hero == 'Huvrag' then
    errorHook(error_NHF_Huvrag_F);
    if (GetHeroLevel("Huvrag") >= (NHF_Huvrag_lvl_temp+NHF_Huvrag_percent))then
      NHF_Huvrag_lvl_temp = GetHeroLevel("Huvrag");
      ChangeHeroStat("Huvrag", STAT_SPELL_POWER,1);
  	  sleep(NHF_slep_singl);
    end;
   end
end)

--NHF--------------�����---------------------
NHF_Hugul_textPath = "/MapObjects/Stronghold/NewHeroes/Hugul/NHF_Hugul_opyt.txt";
function  error_NHF_Hugul_F ()
	print("error:NHF_Hugul_F");
end;

AddEvent(combat_results_events, 'NHF_hugul_combat_result',
function(fight_id)
  if GetSavedCombatArmyHero(fight_id, 1) == 'Hugul' then
    local loser = GetSavedCombatArmyHero(fight_id, 0)
    print('loser: ', loser)
    if loser then
      --
      local exp = GetHeroStat(loser, STAT_EXPERIENCE)
      ChangeHeroStat('Hugul', STAT_EXPERIENCE, exp)
      local  temp_name = NHF_tempName_F('Hugul');
		  startThread(ShowFlyingSign, {NHF_Hugul_textPath;count_pribavka = exp},temp_name,GetObjectOwner(temp_name), 5);
		  --
      local result = GetSavedCombatResult(fight_id)
      print('result: ', result)
      --
      if result == COMBAT_RESULT_SURRENDER then
        print('left combat and cant be hired again...')
        for i, town in GetObjectNamesByType('TOWN') do
          AllowHiringOfHeroInTown(town, loser, 0)
        end
      elseif result == COMBAT_RESULT_RETREAT then
        print('surrended to Hugul')
        TakeAwayHeroExp(loser, exp)
      end
    end
  end
end)
 
--NHF---------------������--------------------
NHF_Shagrat_textPath = "/MapObjects/Stronghold/NewHeroes/Shagrat/";
NHF_Shagrat_itogo_dead_count = 0;
NHF_Shagrat_index_battle_next = -1
NHF_Shagrat_percent_temp = NHF_Shagrat_percent;
function  error_NHF_Shagrat_F ()
	print("error:NHF_Shagrat_F");
end;

AddEvent(combat_results_events, 'NHF_shagrat_combat_result',
function(fight_id)
 errorHook(error_NHF_Shagrat_F);
 if (NHF_Shagrat_index_battle_next ~= fight_id) then
   if (GetSavedCombatArmyHero(fight_id, 1)== "Shagrat")  then
      NHF_Shagrat_index_battle_next = fight_id;
      local count_stacks = GetSavedCombatArmyCreaturesCount(fight_id,0);
      for i=0, count_stacks - 1 do
		local id_creatures, count_creatures, dead_count = GetSavedCombatArmyCreatureInfo(fight_id,0,i);
		NHF_Shagrat_itogo_dead_count = NHF_Shagrat_itogo_dead_count + dead_count;
      end;
      if  NHF_Shagrat_itogo_dead_count >= NHF_Shagrat_percent_temp  then
          local temp_name = NHF_tempName_F("Shagrat");
          NHF_Shagrat_itogo_dead_count = NHF_Shagrat_itogo_dead_count - NHF_Shagrat_percent_temp;
		NHF_Shagrat_percent_temp = NHF_Shagrat_percent + NHF_Shagrat_percent_temp;
          ChangeHeroStat("Shagrat", STAT_ATTACK,1);
		sleep(NHF_slep_singl);
		startThread(NHF_ShowFlyMessage, {NHF_Shagrat_textPath.."NHF_Shagrat_prirost.txt";prirost=1},temp_name,5);
      end;
   end;
 end;
end)
 
AddEvent(remove_hero_events, 'NHF_shagrat_remove_hero',
function(hero)
  if hero == 'Shagrat' then
    NHF_Shagrat_index_battle_next = -2;
  end
end)
----------------------------------------------------------