--NHF----------------Киина---------------------
NHF_Kiina_textPath = "/MapObjects/Preserve/NewHeroes/Kiina/";
function  error_NHF_Kiina_F ()
	print("error:NHF_Kiina_F");
end;

kiina_spec = 
{
    heroes = {'Kiina', 'Kiina_copy_1', 'Kiina_copy_2', 'Kiina_copy_3', 'Kiina_copy_4', 'Kiina_copy_5', 'Kiina_copy_6', 'Kiina_copy_7', 'Kiina_copy_8'},
    active_marks_for_hero = {},
    current_mark_for_hero = {}
    mark_object = '/MapObjects/NHF/Kiina_mark_green.(AdvMapStaticShared).xdb#xpointer(/AdvMapStaticShared)',
    mark_red_object = '/MapObjects/NHF/Kiina_mark_red.(AdvMapStaticShared).xdb#xpointer(/AdvMapStaticShared)',
}

MCCS_HERO_CUSTOM_KIINA = 3

AddEvent(map_loading_events, 'NHF_kiina_spec_init',
function()
    for i, hero in kiina_spec.heroes do
        kiina_spec.active_marks_for_hero[hero] = {}
    end  
    
    mccs_hero_custom[hero] =
    function(hero)
        startThread(KiinaSpec_SummonCreatures, hero, kiina_spec.current_mark_for_hero[hero])
    end
end)

AddEvent(new_day_events, 'NHF_kiina_spec_new_day',
function(day)
    if mod(day, 7) == 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(kiina_spec.heroes, hero) then
                print('Kiina spec: ', hero, ' generation started')
                local curr_week = ceil(GetDate(DAY) / 7)
                local marks_to_generate = ceil(GetDate(DAY)/7)
                local lvl = GetHeroLevel(hero)
                if marks_to_generate > lvl then
                    marks_to_genenate = lvl
                end
                marks_to_generate = marks_to_generate - len(kiina_spec.active_marks_for_hero[hero])
                for mark, info in kiina_spec.active_marks_for_hero[hero] do
                    info.lifetime = info.lifetime - 1
                    if info.lifetime == 0 then
                        RemoveObject(info.mark)
                        kiina_spec.active_marks_for_hero[hero][mark] = nil
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
                local temp_name = NHF_tempName_F(hero)
                local kx, ky, kz = GetObjectPosition(temp_name)
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
                for i = 1, marks_to_generate do
                    while 1 do
                        --
                        local check = 1
                        local mx = -1
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
                        if IsTilePassable(mx, my, kz) then
                            for mark, info in kiina_spec.active_marks_for_hero[hero] do
                                if (mx == info.x and my == info.y and kz == info.z) then
                                    check = nil
                                    break
                                end
                            end
                        else
                            check = nil
                        end
                        if check then
                            local mark_name = hero..'_mark_'..GetDate(DAY)..'_'..i
                            CreateStatic(mark_name, kiina_spec.mark_object, mx, my, kz)
                            while not IsObjectExists(mark_name) do
                              sleep()
                            end
                            kiina_spec.active_marks[hero][mark_name] = {x = mx, y = my, z = kz, lifetime = 3}
                            --
                            if not IsObjectVisible(GetObjectOwner(temp_name), mark_name) then
                                ShowObject(GetObjectOwner(temp_name), mark_name)
                            end
                            --
                            break
                        end
                        sleep()
                    end
                end
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
        kiina_spec.current_mark_for_hero[hero] = nil 
    end
end

AddEvent(add_hero_events, 'NHF_kiina_spec_add_hero',
function(hero)
    if contains(kiina_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    local temp_name = NHF_tempName_F(%hero)
                    local x, y, z = GetObjectPosition(temp_name)
                    local check
                    for i, phero in kiina_spec.heroes do
                        if IsHeroAlive(phero) and GetObjectOwner(phero) == GetObjectOwner(temp_name) then
                            for mark, info in kiina_spec.active_marks_for_hero[phero] do
                                if mark and info then
                                    if info.x == x and info.y == y and info.z == z then
                                          kiina_spec.current_mark_for_hero[%hero] = mark
                                          check = 1
                                          break
                                    end
                                end
                            end
                        end
                    end
                    --
                    if check then
                        if not mccs_custom_ability.hero_custom_affected_heroes[%hero][MCCS_HERO_CUSTOM_KIINA] then
                            mccs_custom_ability.hero_custom_affected_heroes[%hero][MCCS_HERO_CUSTOM_KIINA] = 1
                        end
                    else
                        if mccs_custom_ability.hero_custom_affected_heroes[%hero][MCCS_HERO_CUSTOM_KIINA] then
                            mccs_custom_ability.hero_custom_affected_heroes[%hero][MCCS_HERO_CUSTOM_KIINA] = nil
                            kiina_spec.current_mark_for_hero[hero] = nil 
                        end
                    end
                end
                sleep()
            end
        end)
    end
end)