lara_spec =
{
  heroes = {'Lara', 'Lara_copy_1', 'Lara_copy_2', 'Lara_copy_3', 'Lara_copy_4', 'Lara_copy_5', 'Lara_copy_6', 'Lara_copy_7', 'Lara_copy_8'},
  pairs =
  {
    [CREATURE_SKELETON_COPY] = CREATURE_SKELETON,
    [CREATURE_SKELETON_ARCHER_COPY] = CREATURE_SKELETON_ARCHER,
    [CREATURE_WALKING_DEAD_COPY] = CREATURE_WALKING_DEAD,
    [CREATURE_ZOMBIE_COPY] = CREATURE_ZOMBIE,
    [CREATURE_MANES_COPY] = CREATURE_MANES,
    [CREATURE_GHOST_COPY] = CREATURE_GHOST,
    [CREATURE_VAMPIRE_COPY] = CREATURE_VAMPIRE,
    [CREATURE_VAMPIRE_LORD_COPY] = CREATURE_VAMPIRE_LORD,
    [CREATURE_LICH_COPY] = CREATURE_LICH,
    [CREATURE_IRON_GOLEM_COPY] = CREATURE_IRON_GOLEM,
    [CREATURE_STEEL_GOLEM_COPY] = CREATURE_STEEL_GOLEM,
    [CREATURE_MAGI_COPY] = CREATURE_MAGI_COPY,
    [CREATURE_STONE_GARGOYLE_COPY] = CREATURE_STONE_GARGOYLE,
    [CREATURE_OBSIDIAN_GARGOYLE_COPY] = CREATURE_OBSIDIAN_GARGOYLE,
    [CREATURE_ARCH_MAGI_COPY] = CREATURE_ARCH_MAGI,
    [CREATURE_GENIE_COPY] = CREATURE_GENIE,
    [CREATURE_MASTER_GENIE_COPY] = CREATURE_MASTER_GENIE,
    [CREATURE_RAKSHASA_RUKH_COPY] = CREATURE_RAKSHASA_RUKH,
    [CREATURE_PHOENIX_COPY] = CREATURE_PHOENIX,
    [CREATURE_GREEN_DRAGON_COPY] = CREATURE_GREEN_DRAGON,
    [CREATURE_GOLD_DRAGON_COPY] = CREATURE_GOLD_DRAGON,
    [CREATURE_DEEP_DRAGON_COPY] = CREATURE_DEEP_DRAGON,
    [CREATURE_BLACK_DRAGON_COPY] = CREATURE_BLACK_DRAGON,
    [CREATURE_FIRE_ELEMENTAL_COPY] = CREATURE_FIRE_ELEMENTAL,
    [CREATURE_AIR_ELEMENTAL_COPY] = CREATURE_AIR_ELEMENTAL,
    [CREATURE_WATER_ELEMENTAL_COPY] = CREATURE_WATER_ELEMENTAL,
    [CREATURE_EARTH_ELEMENTAL_COPY] = CREATURE_EARTH_ELEMENTAL,
    [CREATURE_WIGHT_COPY] = CREATURE_WIGHT,
    [CREATURE_WRAITH_COPY] = CREATURE_WRAITH,
    [CREATURE_ARCHER_COPY] = CREATURE_ARCHER,
    [CREATURE_PEASANT_COPY] = CREATURE_PEASANT,
    [CREATURE_SCOUT_COPY] = CREATURE_SCOUT,
    [CREATURE_ASSASSIN_COPY] = CREATURE_ASSASSIN,
    [CREATURE_HYDRA_COPY] = CREATURE_HYDRA,
    [CREATURE_MATRON_COPY] = CREATURE_MATRON,
    [CREATURE_STOUT_DEFENDER_COPY] = CREATURE_STOUT_DEFENDER,
    [CREATURE_AXE_THROWER_COPY] = CREATURE_AXE_THROWER,
    [CREATURE_WARLORD_COPY] = CREATURE_WARLORD,
    [CREATURE_BLOOD_WITCH_COPY] = CREATURE_BLOOD_WITCH,
    [CREATURE_MATRIARCH_COPY] = CREATURE_MATRIARCH,
    [CREATURE_TREANT_COPY] = CREATURE_TREANT,
    [CREATURE_WOOD_ELF_COPY] = CREATURE_WOOD_ELF,
    [CREATURE_TREANT_GUARDIAN_COPY] = CREATURE_TREANT_GUARDIAN,
    [CREATURE_GRAND_ELF_COPY] = CREATURE_GRAND_ELF,
    [CREATURE_DRUID_ELDER_COPY] = CREATURE_DRUID_ELDER,
    [CREATURE_GIANT_COPY] = CREATURE_GIANT,
    [CREATURE_TITAN_COPY] = CREATURE_TITAN
  }
}

function RescaleATB()
  local max_ini, min_ini = -1, 9999
  for side = ATTACKER, DEFENDER do
    for i, creature in GetCreatures(side) do
      local ini = GetCreatureInitiative(creature)
      if ini < min_ini then
        min_ini = ini
      end
      if ini > max_ini then
        max_ini = ini
      end
    end
  end
  --
  local avg_ini = (max_ini + min_ini)/2
  print('average ini: ', avg_ini)
  --
  for side = ATTACKER, DEFENDER do
    for i, creature in GetCreatures(side) do
      local ini = GetCreatureInitiative(creature)
      print(creature, ': ', ini)
      if ini == avg_ini then
        setATB(creature, 0.5)
        print('set to 0.5')
      elseif ini > avg_ini then
        print('set to ', 1 - ((max_ini - ini) / max_ini))
        setATB(creature, 1 - ((max_ini - ini) / max_ini))
      else
        print('set to ', 0.5 - ((avg_ini - ini) / max_ini))
        setATB(creature, 0.5 - ((avg_ini - ini) / max_ini))
      end
    end
  end
  --
end

function LaraSpec_Start(side)
  local replace_flag
  --
  for i, creature in GetCreatures(1 - side) do
    for pair, _ in lara_spec.pairs do
      if GetCreatureType(creature) == pair then
        replace_flag = 1
        break
      end
    end
    if replace_flag == 1 then
      break
    end
  end
  --
  if replace_flag and GetHeroName(GetHero(side)) ~= 'Lara' then
    EnableAutoFinish(nil)
    print('treasure fight and Lara is not here...')
    for i, creature in GetCreatures(1 - side) do
      startThread(
      function()
        local x, y = pos(%creature)
        local type = GetCreatureType(%creature)
        local num = GetCreatureNumber(%creature)
        removeUnit(%creature)
        while exist(%creature) do
          sleep()
        end
        pcall(AddCreature, 1 - %side, lara_spec.pairs[type], num, x, y, nil, %creature)
      end)
    end
  end
  --
  sleep(100)
  EnableAutoFinish(1)
  --
  -- ��������� �� ���
  if replace_flag then
    while not combatReadyPerson() do
      sleep()
    end
    local unit = combatReadyPerson()
    RescaleATB()
    commandDefend(unit)
    setATB(unit, 1)
  end
end

if not GetDefenderHero() then
  AddCombatFunction(CombatFunctions.START,
  function()
    LaraSpec_Start(ATTACKER)
  end)
end