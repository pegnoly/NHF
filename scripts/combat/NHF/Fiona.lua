fiona_spec = 
{
  heroes = {'Fiona'},

  [ATTACKER] = {},
  [DEFENDER] = {},
}

function FionaSpec_NeutralsStart(side)
  --
  EnableAutoFinish(nil)
  local fiona_creatures_to_types = {}
  local fiona_stacks_to_replace = {}
  local enemy_stacks_to_replace = {}
  for i, creature in GetCreatures(side) do
    fiona_creatures_to_types[creature] = GetCreatureType(creature)
  end
  --
  for i, creature in GetCreatures(1 - side) do
    local type = GetCreatureType(creature)
    for fiona_creature, info in fiona_creatures_to_types do
      if info == type then
        if not enemy_stacks_to_replace[creature] then
          local count = floor(GetCreatureNumber(creature) * 0.2)
          enemy_stacks_to_replace[creature] = count
          if not fiona_stacks_to_replace[type] then
            fiona_stacks_to_replace[type] = count
          else
            fiona_stacks_to_replace[type] = fiona_stacks_to_replace[type] + count
          end
        end
      end
    end
  end
  --
  for creature, count in enemy_stacks_to_replace do
    local new_count = GetCreatureNumber(creature) - count
    local x, y = pos(creature)
    local type = GetCreatureType(creature)
    removeUnit(creature)
    while exist(creature) do
      sleep()
    end
    AddCreature(1 - side, type, new_count, x, y, nil, creature)
    while not exist(creature) do
      sleep()
    end
    startThread(CombatFlyingSign, {'Text/Default/remove_creature.txt'; name = GetCreatureName(creature), num = count}, creature, 30.0)
  end
  --
  for type, count in fiona_stacks_to_replace do
    for i, creature in GetCreatures(side) do
      if GetCreatureType(creature) == type then
        local base_count = GetCreatureNumber(creature)
        local new_count = GetCreatureNumber(creature) + count
        local x, y = pos(creature)
        local type = GetCreatureType(creature)
        removeUnit(creature)
        while exist(creature) do
          sleep()
        end
        AddCreature(side, type, new_count, x, y, nil, creature)
        while not exist(creature) do
          sleep()
        end
        startThread(CombatFlyingSign, {'Text/Default/add_creature.txt'; name = GetCreatureName(creature), num = (new_count - base_count)}, creature, 30.0)
        break
      end
    end
  end
  --
  EnableAutoFinish(1)
  -- пораскидывать по ини
  while not combatReadyPerson() do
    sleep()
  end
  local unit = combatReadyPerson()
  RescaleATB()
  commandDefend(unit)
  setATB(unit, 1)
end

function FionaSpec_HeroStart(side)
  local fiona_creatures_to_types = {}
  local enemy_stacks_to_sorrow = {}
  for i, creature in GetCreatures(side) do
    fiona_creatures_to_types[creature] = GetCreatureType(creature)
  end
  --
  for i, creature in GetCreatures(1 - side) do
    local type = GetCreatureType(creature)
    for fiona_creature, info in fiona_creatures_to_types do
      if info == type then
        if not enemy_stacks_to_sorrow[creature] then
          enemy_stacks_to_sorrow[creature] = 1
        end
      end
    end
  end
  --
  SummonCreature(1 - side, HELPER, 30, -1, -1, nil, 'fiona_sorrow_helper')
  while not exist('fiona_sorrow_helper') do
    sleep()
  end
  for creature, _ in enemy_stacks_to_sorrow do
    pcall(UnitCastAimedSpell, 'fiona_sorrow_helper', SPELL_SORROW, creature)
  end
  removeUnit('fiona_sorrow_helper')
  while exist('fiona_sorrow_helper') do
    sleep()
  end
end

if contains(fiona_spec.heroes, GetHeroName(GetAttackerHero())) then
  if GetDefenderHero() then
    AddCombatFunction(CombatFunctions.START,
    function()
      FionaSpec_HeroStart(ATTACKER)
    end)
  else
    AddCombatFunction(CombatFunctions.START,
    function()
      FionaSpec_NeutralsStart(ATTACKER)
    end)
  end
end

if GetDefenderHero() and contains(fiona_spec.heroes, GetHeroName(GetDefenderHero())) then
  AddCombatFunction(CombatFunctions.START,
  function()
    FionaSpec_HeroStart(DEFENDER)
  end)
end


