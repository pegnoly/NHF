--NHF---------------Октавио-------------------
octavio_spec =
{
    path = "/MapObjects/Haven/NewHeroes/Oktavio/",
    heroes = {'Oktavio', 'Oktavio_copy_1', 'Oktavio_copy_2', 'Oktavio_copy_3', 'Oktavio_copy_4', 'Oktavio_copy_5', 'Oktavio_copy_6', 'Oktavio_copy_7', 'Oktavio_copy_8'},
    grow_coeff = 3 / 15,
    sp_coeff = 5,
    town_grow_active_for_player = {},
    saved_sp_bonus_for_hero = {}
}

function  error_NHF_Oktavio_F ()
	print("error:NHF_Oktavio_F");
end;

AddEvent(map_loading_events, 'NHF_oktavio_spec_init',
function()
    for i, hero in octavio_spec.heroes do
        saved_sp_bonus_for_hero[hero] = -1
    end
end)

AddEvent(new_day_events, 'NHF_oktavio_spec_new_day',
function(day)
    if mod(day, 7) == 0 and day ~= 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(octavio_spec.heroes, hero) then
                --
                errorHook(error_NHF_Oktavio_F)
                --
                local temp_name = NHF_tempName_F(hero)
                -- добавление существ герою --
                local creatures = GetHeroCreaturesByTier(hero, TOWN_HEAVEN, 5)
                local creature_to_add = - 1
                if creatures then
                    creature_to_add = GetRandFromT(creatures)
                else
                    creature_to_add = TIER_TABLES[TOWN_HEAVEN][5][1]
                end
                AddCreatures(hero, creature_to_add, ceil(GetHeroLevel(hero) * octavio_spec.grow_coeff))
                -- прибавление приростов в города --
                for player = PLAYER_1, PLAYER_8 do -- сначала сбросить флаги всех приростов
                    octavio_spec.town_grow_active_for_player[player] = nil
                end
                --    
                local owner = GetObjectOwner(hero)
                -- таблица союзных игроков, которым еще не был добавлен прирост
                local players_to_check, n = {}, 0
                for player = PLAYER_1, PLAYER_8 do 
                    if IsActivePlayer(player) and (GetPlayerTeam(player) == GetPlayerTeam(owner)) and not octavio_spec.town_grow_active_for_player[player] then
                        n = n + 1
                        players_to_check[n] = player
                    end
                end
                --
                local grow = GetHeroLevel(hero) * octavio_spec.grow_coeff
                for i, player in players_to_check do
                    for i, town in GetPlayerTowns(player) do
                        if GetTownRace(town) == TOWN_HEAVEN and GetTownBuildingLevel(town, TOWN_BUILDING_DWELLING_5) ~= 0 then               
                        SetObjectDwellingCreatures(town, CREATURE_PRIEST, GetObjectDwellingCreatures(town,CREATURE_PRIEST) + grow)
                        octavio_spec.town_grow_active_for_player[player] = 1
                        startThread(ShowFlyingSign, {octavio_spec.path.."message0.txt"; p = grow}, town, GetObjectOwner(town), 5.0)
                        end
                    end
                end
            end
        end
    end
end)

AddEvent(add_hero_events, 'NHF_octavio_spec_sp_update',
function(hero)
    if contains(octavio_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    local creatures = GetHeroCreaturesByTier(%hero, TOWN_HEAVEN, 5)
                    local count = 0
                    if creatures then
                        for i, creature in creatures do
                            count = count + GetHeroCreatures(%hero, creature)
                        end
                    end
                    local sp_temp = count / octavio_spec.sp_coeff
                    if sp_temp ~= octavio_spec.saved_sp_bonus_for_hero[%hero] then
                        local delta = sp_temp - octavio_spec.saved_sp_bonus_for_hero[%hero]
                        octavio_spec.saved_sp_bonus_for_hero[%hero] = delta
                        ChangeHeroStat(%hero, STAT_SPELL_POWER, delta)
                        startThread(ShowFlyingSign, {octavio_spec.path.."message.txt"; p = delta}, %hero, GetObjectOwner(%hero), 5.0)
                    end
                end
                sleep()
            end
        end)
    end
end)