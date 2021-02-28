grow_specs_params =
{
  -- герои со стандартными спецами прироста, которые имеют отдельную логику прироста
  ignored_heroes = 
  {
      gabriel_spec.heroes,
  }
  simple_grow_specs =
  {
    -- ����� - ������� ������� ��� ��������
    [HERO_SPEC_PEASANTS] = {town = TOWN_HEAVEN, tier = 1},
    [HERO_SPEC_ARCHERS] = {town = TOWN_HEAVEN, tier = 2},
    [HERO_SPEC_FOOTMEN] = {town = TOWN_HEAVEN, tier = 3},
    [HERO_SPEC_GRIFFINS] = {town = TOWN_HEAVEN, tier = 4},
    [HERO_SPEC_HOUNDS] = {town = TOWN_INFERNO, tier = 3},
    [HERO_SPEC_SUCCUBUSES] = {town = TOWN_INFERNO, tier = 4},
    [HERO_SPEC_ZOMBIES] = {town = TOWN_NECROPOLIS, tier = 2},
    [HERO_SPEC_VAMPIRES] = {town = TOWN_NECROPOLIS, tier = 4},
    [HERO_SPEC_BLADE_MASTER] = {town = TOWN_PRESERVE, tier = 2},
    [HERO_SPEC_ELVEN_VOLLEY] = {town = TOWN_PRESERVE, tier = 3},
    [HERO_SPEC_UNICORNS] = {town = TOWN_PRESERVE, tier = 5},
    [HERO_SPEC_SAVAGE] = {town = TOWN_DUNGEON, tier = 1},
    [HERO_SPEC_WITCHES] = {town = TOWN_DUNGEON, tier = 2},
    [HERO_SPEC_MINOTAURS] = {town = TOWN_DUNGEON, tier = 3},
    [HERO_SPEC_MATRON_SALVO] = {town = TOWN_DUNGEON, tier = 6},
    [HERO_SPEC_GREMLINS] = {town = TOWN_ACADEMY, tier = 1},
    [HERO_SPEC_GOLEMS] = {town = TOWN_ACADEMY, tier = 3},
    [HERO_SPEC_MAGES] = {town = TOWN_ACADEMY, tier = 4},
    [HERO_SPEC_DEFENDER] = {town = TOWN_FORTRESS, tier = 1},
    [HERO_SPEC_AXE_MASTER] = {town = TOWN_FORTRESS, tier = 2},
    [HERO_SPEC_BEAR_RIDERS] = {town = TOWN_FORTRESS, tier = 3},
    [HERO_SPEC_MAGISTER] = {town = TOWN_FORTRESS, tier = 5},
    [HERO_SPEC_ORC_ELDER] = {town = TOWN_STRONGHOLD, tier = 3},
    [HERO_SPEC_GRIM_FIGHTER] = {town = TOWN_STRONGHOLD, tier = 5}
  }
}

AddEvent(new_day_event, 'NHF_simple_grow_new_day',
function(day)
    if mod(GetDate(day), 7) == 1 and day ~= 1 then
        for i, hero in GetObjectNamesByType('HERO') do
            local spec = GetHeroSpec(hero)
            if grow_specs_params.simple_grow_specs[spec] then
                --
                for i, table in grow_specs_params.ignored_heroes do
                    if contains(table, hero) then
                        return
                    end
                end
                --
                local grow = ceil(GetHeroLevel(hero) * GetCreatureGrow(TIER_TABLES[grow_specs_params.simple_grow_specs[spec].town][grow_specs_params.simple_grow_specs[spec].town][1]))
                startThread(DefaultCreatureGrow, hero, grow_specs_params.simple_grow_specs[spec].town, grow_specs_params.simple_grow_specs[spec].tier, grow)
            end
        end
        --
    end
end)

function DefaultCreatureGrow(hero, town, tier, amount)
    local creatures = GetHeroCreaturesByTier(hero, town, tier)
    local creature_to_add = -1
    if creatures then
      creature_to_add = GetRandFromT(creatures)
    else
      creature_to_add = TIER_TABLES[town][tier][1]
    end
    AddCreatures(hero, creature_to_add, amount)   
end