--NHF----------------Аврана--------------------
avrana_spec =
{
	path = '/Text/CustomAbility/Avrana/',
    heroes = {'Avran', 'Avran_copy_1', 'Avran_copy_2', 'Avran_copy_3', 'Avran_copy_4', 'Avran_copy_5', 'Avran_copy_6', 'Avran_copy_7', 'Avran_copy_8'},
	curr_heroes_to_steal_for_hero = {},
    base_radius = 3
}

MCCS_HERO_CUSTOM_AVRANA = 5

AddEvent(map_loading_events, 'NHF_avrana_spec_init'
function()
    for i, hero in avrana_spec.heroes do
        avrana_spec.curr_heroes_to_steal_for_hero[hero] = {}
        mccs_hero_custom[hero] =
        function(hero)
            if len(avrana_spec.curr_heroes_to_steal_for_hero[hero]) == 1 then
                startThread(AvranaSpec_StealArts, hero, avrana_spec.curr_heroes_to_steal_for_hero[hero][1])
            else
                startThread(Dialog.NewDialog, avrana_choose_hero_dialog, hero, GetObjectOwner(hero))
            end
        end
    end
end)

avrana_choose_hero_dialog =
{
	state = 1,
	path = avrana_spec.path,
	icon = ''
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

	options = {[1] = {[0] = avrana_spec.path..'choose_hero.txt';}},

	Reset = 
	function(player)
        for i, option in Dialog.GetActiveDialogForPlayer(player) do
            option = nil
        end
        Dialog.GetActiveDialogForPlayer(player).options[1] = {[0] = avrana_spec.path..'choose_hero.txt';}
	end,

	Open = 
	function(player)
        Dialog.Reset(player)
        Dialog.GetActiveDialogForPlayer(player).icon = '/'..GetHeroIcon(Dialog.GetActiveHeroForPlayer(player))
        local curr_state, heroes_per_state = 1, 0
        for i, hero in avrana_spec.curr_heroes_to_steal do
            heroes_per_state = heroes_per_state + 1
            if heroes_per_state == 5 then
                heroes_per_state = 1
                Dialog.SetAnswer(Dialog.GetActiveDialogForPlayer(player), curr_state, 5, '/Text/next.txt', curr_state + 1)
                curr_state = curr_state + 1
                Dialog.GetActiveDialogForPlayer(player).options[curr_state] = {[0] = avrana_spec.path..'choose_hero.txt';}
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
                startThread(ShowFlyingSign, {avrana_spec.path..'add_art.txt'; art_name = GetArtName(art_to_steal)}, hero, GetObjectOwner(hero), 5.0)
                startThread(ShowFlyingSign, {avrana_spec.path..'remove_art.txt'; art_name = GetArtName(art_to_steal)}, hero_to_steal, GetObjectOwner(hero_to_steal), 5.0)
            else
                max_tier_to_steal = max_tier_to_steal - 1
                break
            end
        end
        sleep()
    end
    --
    if count == 0 then
        startThread(ShowFlyingSign, avrana_spec.path..'no_stealed_arts.txt', hero, GetObjectOwner(hero), 5.0)
    end
end

function AvranaSpec_CheckHeroesNear(hero)
	local check_radius = avrana_spec.base_radius + (avrana_spec.base_radius * (HasArtefact(hero, ARTIFACT_CROWN_OF_MANY_EYES, 1) and 1 or 0)) +
                      (avrana_spec.base_radius * (HasHeroSkill(hero, PERK_SCOUTING) and 1 or 0)) +
                      (avrana_spec.base_radius * (HasHeroSkill(hero, RANGER_FEAT_DISGUISE_AND_RECKON) and 1 or 0))
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

AddEvent(add_hero_events, 'NHF_avrana_spec_add_hero',
function(hero)
    if contains(avrana_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) and IsObjectExists(%hero) then
                    if not mccs_custom_ability.hero_custom_affected_heroes[%hero][MCCS_HERO_CUSTOM_AVRANA] then
                        avrana_spec.curr_heroes_to_steal_for_hero[%hero] = AvranaSpec_CheckHeroesNear(hero)
                        if avrana_spec.curr_heroes_to_steal_for_hero[%hero] then
                            print('Avrana can steal')
                            mccs_custom_ability.hero_custom_affected_heroes[%hero][MCCS_HERO_CUSTOM_AVRANA] = 1
                        end
                    else
                        avrana_spec.curr_heroes_to_steal_for_hero[%hero] = AvranaSpec_CheckHeroesNear(hero)
                        if not avrana_spec.curr_heroes_to_steal_for_hero[%hero] then
                            mccs_custom_ability.hero_custom_affected_heroes[%hero][MCCS_HERO_CUSTOM_AVRANA] = nil
                        end
                    end
                end
                sleep()
            end
        end)
    end
end)