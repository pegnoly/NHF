--NHF----------------БИАРА---------------------
MCCS_HERO_CUSTOM_BIARA = 1

biara_spec =
{
    heroes = {'BiaraNHF', 'BiaraNHF_copy_1', 'BiaraNHF_copy_2', 'BiaraNHF_copy_3', 'BiaraNHF_copy_4', 'BiaraNHF_copy_5', 'BiaraNHF_copy_6', 'BiaraNHF_copy_7', 'BiaraNHF_copy_8'},
    path = "/MapObjects/Inferno/NewHeroes/Biara/",
    base_distance = 12,
    targets_for_hero = {}
}

function  error_NHF_BiaraNHF_F ()
	print("error:NHF_BiaraNHF_F");
end;

function  error_good_NHF_BiaraNHF_F ()
	print("GoodScriptBiaraNHF");
end;

function  NHF_battle_BiaraNHF_F (hero, hero_to_steal)
	errorHook(error_good_NHF_BiaraNHF_F)
	MakeHeroInteractWithObject(hero, hero_to_steal)
	errorHook(error_good_NHF_BiaraNHF_F)
	return parse('')
end;

-- при загрузке карты назначить героям со спецой обработчик абилки
AddEvent(map_loading_events, 'NHF_biara_spec_loading',
function()
    for i, hero in biara_spec.heroes do
        mccs_hero_custom[hero] =
        function(hero)
            -- если целей больше одной - запустить диалог выбора
            if len(biara_spec.targets_for_hero[hero]) > 1 then
                startThread(Dialog.NewDialog, biara_choose_hero_dialog, hero, GetObjectOwner(hero))
            else
                local hero_to_steal = ''
                for chero, enabled in biara_spec.targets_for_hero[hero] do
                    if chero and enabled then
                        hero_to_steal = chero
                        break
                    end
                end
                startThread(NHFBiaraStealCreatures, hero, hero_to_steal)
            end
        end
    end
end)

-- непосредственно функция кражи
function NHFBiaraStealCreatures(hero, hero_to_steal)
    errorHook(error_NHF_BiaraNHF_F)
    local stealer_creatures = table.pack(GetHeroCreaturesTypes(hero))
    local target_creatures = table.pack(GetHeroCreaturesTypes(hero_to_steal))
    -- если у цели всего 1 отряд - украсть нельзя
    if len(target_creatures) == 1 then
        startThread(ShowFlyingSign, biara_spec.path.."battle_BiaraNHF.txt", hero, GetObjectOwner(hero), 5.0)
        sleep(3)
        NHF_battle_BiaraNHF_F(hero, hero_to_steal)
        return
    end
    --
    local check
    local creature_to_steal = {id = 0, count = 0}
    for stealer_slot = 0, 6 do
        if not check then
            local tier = GetCreatureTier(stealer_creatures[stealer_slot])
            local count = GetHeroCreatures(hero, stealer_creatures[stealer_slot])
            for target_slot = 0, 6 do
                if (GetCreatureTier(target_creatures[target_slot]) == tier) and (GetHeroCreatures(hero_to_steal, target_creatures[target_slot]) <= count) then
                    creature_to_steal.id = target_creatures[target_slot])
                    creature_to_steal.count = GetHeroCreatures(hero_to_steal, target_creatures[target_slot])
                    check = 1
                    break
                end
            end
        else
            break
        end
    end
    --
    if not check then
        startThread(ShowFlyingSign, biara_spec.path.."battle_BiaraNHF.txt", hero, GetObjectOwner(hero), 5.0)
        sleep(3)
        NHF_battle_BiaraNHF_F(hero, hero_to_steal)
        return
    else
        AddCreatures(hero, creature_to_steal.id, creature_to_steal.count)
        AddCreatures(hero_to_steal, creature_to_steal.id, -creature_to_steal.count)
        local mp = GetHeroStat(hero, STAT_MOVE_POINTS)
        if mp > 2500 then
            mp = 2500
        end
        ChangeHeroStat(hero, STAT_MOVE_POINTS, -mp)
    end
end

-- поток включения абилки и формирования таблицы героев для кражи
AddEvent(add_hero_events, 'NHF_biara_spec_add_hero',
function(hero)
  if contains(biara_spec.heroes, hero) then
    startThread(
    function()
      while 1 do
        if IsHeroAlive(hero) then
            errorHook(error_NHF_BiaraNHF_F)
            local temp_name = NHF_tempName_F(hero)
            -- составить таблицу игроков, не союзных герою со спецой
            local players_to_check, n = {}, 0
            for player = PLAYER_1, PLAYER_8 do
                if IsActivePlayer(player) and (GetPlayerTeam(player) ~= GetPlayerTeam(GetObjectOwner(temp_name))) then
                    n = n + 1
                    players_to_check[n] = player
                end
            end
            -- проверить всех героев этих игроков на близость к герою со спецой
            for i, player in players_to_check do
                for j, phero in GetPlayerHeroes(player) do
                    local dist = GetDistance(phero, temp_name)
                    if dist and dist <= biara_spec.base_distance then
                        biara_spec.targets_for_hero[hero][phero] = 1
                    else
                        biara_spec.targets_for_hero[hero][phero] = nil
                    end
                end
            end
            -- если таргеты есть и у героя нужное число очков движения, включить абилку
            if (len(biara_spec.targets_for_hero) > 0) and (GetHeroStat(hero, STAT_MOVE_POINTS) >= 2500) then
                mccs_custom_ability.hero_custom_affected_heroes[hero][MCCS_HERO_CUSTOM_BIARA] = 1
            else
                mccs_custom_ability.hero_custom_affected_heroes[hero][MCCS_HERO_CUSTOM_BIARA] = nil
            end 
            sleep()
        end
    end
end)

biara_choose_hero_dialog =
{
	state = 1,
	path = biara_spec.path,
	icon = '',
	title = 'title',
	select_text = '',

	perform_func =
	function(player, curr_state, answer, next_state)
	  if IsNum(next_state) then
		  return next_state
	  else
		  startThread(NHFBiaraStealCreatures, Dialog.GetActiveHeroForPlayer(player), next_state)
		  return 0
	  end
	end,

	options = {[1] = {[0] = biara_spec.path..'choose_hero.txt';}},

	Reset = 
	function(player)
	  for i, option in Dialog.GetActiveDialogForPlayer(player) do
		  option = nil
	  end
	  Dialog.GetActiveDialogForPlayer(player).options[1] = {[0] = biara_spec.path..'choose_hero.txt';}
	end,

	Open = 
	function(player)
        Dialog.Reset(player)
        Dialog.GetCurrentDialogForPlayer(player).icon = '/'..GetHeroIcon(Dialog.GetActiveHeroForPlayer(player))
        local curr_state, heroes_per_state = 1, 0
        for hero, enabled in biara_spec.targets_for_hero[Dialog.GetActiveHeroForPlayer(player)] do
            if hero and enabled then
                heroes_per_state = heroes_per_state + 1
                if heroes_per_state == 5 then
                    heroes_per_state = 1
                    Dialog.SetAnswer(Dialog.GetActiveDialogForPlayer(player), curr_state, 5, '/Text/next.txt', curr_state + 1)
                    curr_state = curr_state + 1
                    Dialog.GetActiveDialogForPlayer(player).options[curr_state] = {[0] = biara_spec.path..'choose_hero.txt';}
                end
                Dialog.SetAnswer(Dialog.GetActiveDialogForPlayer(player), curr_state, heroes_per_state, GetName(hero), hero)
            end
        end
        Dialog.Action(player)
	end
}