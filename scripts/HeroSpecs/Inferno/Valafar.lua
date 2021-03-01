--NHF----------------ВАЛАФАР-------------------
NHF_mas_portal1_valafar = {0,0,0,0}; 
NHF_mas_portal2_valafar = {0,0,0,0};
NHF_mas_portal_valafar_yes = {0,0,0,1}; 
NHF_Valafar_portaled1 = "Valafar";
NHF_Valafar_portaled2 = "Valafar";
NHF_Valafar_zanyato1_flag = 0;
NHF_Valafar_zanyato2_flag = 0;
NHF_Valafar_trata_mana = 0;
NHF_Valafar_other_demon = "Valafar";
function  error_NHF_Valafar_F ()
	print("error:NHF_Valafar_F");
end;

-- MCCS
mccs_hero_custom['Valafar'] =
function(hero)
  print('Valafar custom active')
  startThread(Dialog.NewDialog, valafar_spell_dialog, hero, GetObjectOwner(hero))
end

VALAFAR_CUSTOM_PATH = '/Text/CustomAbility/Valafar/'
VALAFAR_SPELL_YELLOW_PORTAL = 1
VALAFAR_SPELL_RED_PORTAL = 2

valafar_dialog_predef_answers =
{
  [VALAFAR_SPELL_YELLOW_PORTAL] = {VALAFAR_CUSTOM_PATH..'create_yellow_portal.txt', VALAFAR_SPELL_YELLOW_PORTAL, 1},
  [VALAFAR_SPELL_RED_PORTAL] = {VALAFAR_CUSTOM_PATH..'create_red_portal.txt', VALAFAR_SPELL_RED_PORTAL, 1},
}

valafar_spell_dialog =
{
  state = 1,
  path = '/Text/CustomAbility/Valafar/',
  icon = GetSpellIcon(159),
  title = 'title',
  select_text = '',
  perform_func = function(player, curr_state, answer, next_state)
    errorHook(error_NHF_Valafar_F);
    --
    if Dialog.GetActiveHeroForPlayer(player) ~= 'Valafar' then
      return 0
    end
    --
    if next_state == VALAFAR_SPELL_YELLOW_PORTAL then
      local  x_Valafar,y_Valafar,z_Valafar = GetObjectPosition("Valafar");
      NHF_mas_portal1_valafar = {x_Valafar,y_Valafar,z_Valafar,1};
      StopVisualEffects("NHF_Portal1_Valafar_Effect_Tag");
      startThread(PlayVisualEffect,"/MapObjects/Inferno/NewHeroes/Valafar/Gates/First/Gate_First.(Effect).xdb#xpointer(/Effect)","","NHF_Portal1_Valafar_Effect_Tag", x_Valafar+0.5, y_Valafar+0.5,0,0, z_Valafar);
      startThread(Play3DSoundForPlayers,GetPlayerFilter(player),"/MapObjects/Inferno/NewHeroes/Valafar/Gates/First/Gate_First.(Sound).xdb#xpointer(/Sound)",x_Valafar,y_Valafar,z_Valafar);
	    UnblockGame();
    end
    if next_state == VALAFAR_SPELL_RED_PORTAL then
      local  x_Valafar,y_Valafar,z_Valafar = GetObjectPosition("Valafar");
      NHF_mas_portal2_valafar = {x_Valafar,y_Valafar,z_Valafar,1};
      StopVisualEffects("NHF_Portal2_Valafar_Effect_Tag");
      startThread(PlayVisualEffect,"/MapObjects/Inferno/NewHeroes/Valafar/Gates/Second/Gate_Second.(Effect).xdb#xpointer(/Effect)","","NHF_Portal2_Valafar_Effect_Tag", x_Valafar+0.5, y_Valafar+0.5,0,0, z_Valafar);
      startThread(Play3DSoundForPlayers,GetPlayerFilter(player),"/MapObjects/Inferno/NewHeroes/Valafar/Gates/Second/Gate_Second.(Sound).xdb#xpointer(/Sound)",x_Valafar,y_Valafar,z_Valafar);
  	  UnblockGame();
    end;
    return 0
  end,
  
  options = {},

  Reset =
  function(player)
    for i, option in Dialog.GetActiveDialogForPlayer(player).options do
      option = nil
    end
    Dialog.GetActiveDialogForPlayer(player).options[1] = {[0] = VALAFAR_CUSTOM_PATH..'main.txt';}
  end,
  
  Open =
  function(player)
    Dialog.Reset(player)
    local n = 1
    for answer, info in valafar_dialog_predef_answers do
	    print('answer ', answer)
      if mccs_custom_ability.hero_custom_affected_heroes[Dialog.GetActiveHeroForPlayer(player)][answer] then
	    print('is active')
        Dialog.SetPredefAnswer(Dialog.GetActiveDialogForPlayer(player), 1, n, info)
      end
      n = n + 1
    end
    Dialog.Action(player)
  end
}

AddEvent(add_hero_events, 'NHF_valafar_add_hero',
function(hero)
  if hero == 'Valafar' then
    startThread(
    function()
    while 1 do
      if IsHeroAlive('Valafar') then
        errorHook(error_NHF_Valafar_F);
        if (IsHeroAlive("Valafar") == true) then
      	local  x_Valafar,y_Valafar,z_Valafar = GetObjectPosition("Valafar"); -- 0.86 ������ �������� ������ ������� ��� ������
      	local portal_rasstoyanie1 = ceil(sqrt(((x_Valafar-NHF_mas_portal1_valafar[1])*(x_Valafar-NHF_mas_portal1_valafar[1]))+((y_Valafar-NHF_mas_portal1_valafar[2])*(y_Valafar-NHF_mas_portal1_valafar[2]))));
      	local portal_rasstoyanie2 = ceil(sqrt(((x_Valafar-NHF_mas_portal2_valafar[1])*(x_Valafar-NHF_mas_portal2_valafar[1]))+((y_Valafar-NHF_mas_portal2_valafar[2])*(y_Valafar-NHF_mas_portal2_valafar[2]))));
      --	print("1:"..portal_rasstoyanie1);
      --	print("2:"..portal_rasstoyanie2);
      	if (portal_rasstoyanie1 == 0) or (portal_rasstoyanie2 == 0) then
           mccs_custom_ability.hero_custom_affected_heroes['Valafar'][VALAFAR_SPELL_YELLOW_PORTAL] = nil
           mccs_custom_ability.hero_custom_affected_heroes['Valafar'][VALAFAR_SPELL_RED_PORTAL] = nil
      	else
      		if (portal_rasstoyanie1 <= (GetHeroLevel("Valafar")*NHF_Valafar_persent)) or (NHF_mas_portal1_valafar[4] == 0) then
      			mccs_custom_ability.hero_custom_affected_heroes['Valafar'][VALAFAR_SPELL_RED_PORTAL] = 1;
      		else
            mccs_custom_ability.hero_custom_affected_heroes['Valafar'][VALAFAR_SPELL_RED_PORTAL] = nil
      		end;
      		if (portal_rasstoyanie2 <= (GetHeroLevel("Valafar")*NHF_Valafar_persent)) or (NHF_mas_portal2_valafar[4] == 0) then
            mccs_custom_ability.hero_custom_affected_heroes['Valafar'][VALAFAR_SPELL_YELLOW_PORTAL] = 1
      		else
      			mccs_custom_ability.hero_custom_affected_heroes['Valafar'][VALAFAR_SPELL_YELLOW_PORTAL] = nil
      		end;
      	end;
        end;
        if (NHF_mas_portal1_valafar[4] == 1) and (NHF_mas_portal2_valafar[4] == 1) then
      	  local NHF_Valafar_flag_hero1 = 0;
      	  local NHF_Valafar_flag_hero2 = 0;
      	  for i, hero in  GetObjectNamesByType("HERO") do
      		if GetHeroSkillMastery(hero, SKILL_GATING) > 0 then
      			local  x_Valafar,y_Valafar,z_Valafar = GetObjectPosition(hero);
      			NHF_mas_portal_valafar_yes = {x_Valafar,y_Valafar,z_Valafar,NHF_mas_portal_valafar_yes[4]};
      			if (NHF_mas_portal_valafar_yes[1] == NHF_mas_portal1_valafar[1])and(NHF_mas_portal_valafar_yes[2] == NHF_mas_portal1_valafar[2])and (NHF_mas_portal_valafar_yes[3] == NHF_mas_portal1_valafar[3])and (NHF_mas_portal_valafar_yes[4] == NHF_mas_portal1_valafar[4])   then
      			NHF_Valafar_flag_hero1 = 1;
      			if  NHF_Valafar_zanyato1_flag == 0 then
      				NHF_Valafar_zanyato1_flag = 1;
      				NHF_Valafar_portaled1 = hero;
      				NHF_Valafar_other_demon=hero;
      				if hero == "Valafar" then
      					startThread(NHF_QuestionBoxForPlayers,GetObjectOwner(hero), "/MapObjects/Inferno/NewHeroes/Valafar/NHF_message_portal_valafar.txt", "NHF_yes_portal_valafar1_F","NHF_no_portal_F");
      					UnblockGame();
      					sleep(NHF_slep_singl);
      					break;
      				else
      					local mana = 1;
      					local count_creatures = 1;
      					count_creatures = NHF_count_creatures(hero);
      					NHF_Valafar_trata_mana=count_creatures;

      					if count_creatures <= GetHeroStat(hero, STAT_MANA_POINTS) then
      						startThread(NHF_QuestionBoxForPlayers,GetObjectOwner(hero),{ "/MapObjects/Inferno/NewHeroes/Valafar/NHF_message_portal_non_valafar.txt";mana = count_creatures}, "NHF_yes_portal_valafar1_F","NHF_no_portal_F");
      						sleep(NHF_slep_singl);
      						break;
      					else
      						startThread(NHF_MessageBoxForPlayers, GetObjectOwner(hero),"/MapObjects/Inferno/NewHeroes/Valafar/NHF_message_portal_non_valafar_malo_mana.txt");
      						sleep(NHF_slep_singl);
      						break;
      					end;
      				end;
      			end;
      			elseif  (NHF_mas_portal_valafar_yes[1] == NHF_mas_portal2_valafar[1])and(NHF_mas_portal_valafar_yes[2] == NHF_mas_portal2_valafar[2])and (NHF_mas_portal_valafar_yes[3] == NHF_mas_portal2_valafar[3])and (NHF_mas_portal_valafar_yes[4] == NHF_mas_portal2_valafar[4])   then
      			NHF_Valafar_flag_hero2 = 1;
      			if  NHF_Valafar_zanyato2_flag == 0 then
      				NHF_Valafar_zanyato2_flag = 1;
      				NHF_Valafar_portaled2 = hero;
      				NHF_Valafar_other_demon=hero;
      				if hero == "Valafar" then
      					startThread(NHF_QuestionBoxForPlayers,GetObjectOwner(hero), "/MapObjects/Inferno/NewHeroes/Valafar/NHF_message_portal_valafar.txt", "NHF_yes_portal_valafar2_F","NHF_no_portal_F");
      					UnblockGame();
      					sleep(NHF_slep_singl);
      					break;
      				else
      					local mana = 1;
      					local count_creatures = 1;
      					count_creatures = NHF_count_creatures(hero);
      					NHF_Valafar_trata_mana=count_creatures;

      					if count_creatures <= GetHeroStat(hero, STAT_MANA_POINTS) then
      						startThread(NHF_QuestionBoxForPlayers,GetObjectOwner(hero),{ "/MapObjects/Inferno/NewHeroes/Valafar/NHF_message_portal_non_valafar.txt";mana = count_creatures}, "NHF_yes_portal_valafar2_F","NHF_no_portal_F");
      						sleep(NHF_slep_singl);
      						break;
      					else
      						startThread(NHF_MessageBoxForPlayers,GetObjectOwner(hero),"/MapObjects/Inferno/NewHeroes/Valafar/NHF_message_portal_non_valafar_malo_mana.txt");
      						sleep(NHF_slep_singl);
      						break;
      					end;
      				end;
      			 end;
      			end;
      		end;
      	  end;
      	  if (NHF_Valafar_flag_hero1 == 0) then
      		NHF_Valafar_zanyato1_flag = 0;
      	  end;
      	  if (NHF_Valafar_flag_hero2 == 0) then
      		NHF_Valafar_zanyato2_flag = 0;
      	  end;
        end;
        end
      sleep()
    end
  end)
  end
end)

function NHF_yes_portal_valafar1_F () 
	UnblockGame();
	if NHF_Valafar_other_demon ~= "Valafar" then
		ChangeHeroStat(NHF_Valafar_other_demon, STAT_MANA_POINTS,-NHF_Valafar_trata_mana);
		sleep(NHF_slep_singl);	
	end;
	local blocked_portal_flag = 0;
	for i, hero in  GetObjectNamesByType("HERO") do
		local  x_Valafar,y_Valafar,z_Valafar = GetObjectPosition(hero);
		local  blocked_portal_hero = {x_Valafar,y_Valafar,z_Valafar,1};
		if (blocked_portal_hero[1] == NHF_mas_portal2_valafar[1])and(blocked_portal_hero[2] == NHF_mas_portal2_valafar[2])and (blocked_portal_hero[3] == NHF_mas_portal2_valafar[3])and (blocked_portal_hero[4] == NHF_mas_portal2_valafar[4])   then			
			NHF_Touch_hero_F(NHF_Valafar_portaled1,hero);			
			blocked_portal_flag = 1;
			sleep(NHF_slep_singl);	
			break;
		end;
	end; 
	if blocked_portal_flag == 0 then
    print('??')
		SetObjectPosition(NHF_Valafar_portaled1,NHF_mas_portal2_valafar[1],NHF_mas_portal2_valafar[2],NHF_mas_portal2_valafar[3]);	
		sleep(NHF_slep_singl);		
		NHF_Valafar_zanyato1_flag = 0;
		NHF_Valafar_zanyato2_flag = 1;
	end; 
end;  
function NHF_yes_portal_valafar2_F ()
	UnblockGame();
	if NHF_Valafar_other_demon ~= "Valafar" then
		ChangeHeroStat(NHF_Valafar_other_demon, STAT_MANA_POINTS,-NHF_Valafar_trata_mana);
		sleep(NHF_slep_singl);	
	end;
	local blocked_portal_flag = 0;
	for i, hero in  GetObjectNamesByType("HERO") do
		local  x_Valafar,y_Valafar,z_Valafar = GetObjectPosition(hero);
		local  blocked_portal_hero = {x_Valafar,y_Valafar,z_Valafar,1};
		if (blocked_portal_hero[1] == NHF_mas_portal1_valafar[1])and(blocked_portal_hero[2] == NHF_mas_portal1_valafar[2])and (blocked_portal_hero[3] == NHF_mas_portal1_valafar[3])and (blocked_portal_hero[4] == NHF_mas_portal1_valafar[4])   then
			NHF_Touch_hero_F(NHF_Valafar_portaled2,hero);
			blocked_portal_flag = 1;
			sleep(NHF_slep_singl);	
			break;
		end;
	end; 
	if blocked_portal_flag == 0 then  
		SetObjectPosition(NHF_Valafar_portaled2,NHF_mas_portal1_valafar[1],NHF_mas_portal1_valafar[2],NHF_mas_portal1_valafar[3]);
		sleep(NHF_slep_singl);
		NHF_Valafar_zanyato2_flag = 0;
		NHF_Valafar_zanyato1_flag = 1;
	end; 
end;  

function  NHF_no_portal_F ()
	UnblockGame();
end;