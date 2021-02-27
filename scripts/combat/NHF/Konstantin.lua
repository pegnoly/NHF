konstantin_spec = 
{
  path = 'Text/Combat/Konstantin/',
  heroes = {'Konstantin'},
  percent = 0.05,
  [ATTACKER] = {},
  [DEFENDER] = {}
}

function KonstantinSpec_Start(side)
  for i, creature in GetCreatures(1 - side) do
    konstantin_spec[side].base_creatures[creature] = GetCreatureNumber(creature)
  end
end

function KonstantinSpec_CreatureDeath(creature, side)
  if IsAlive(creature) then
    if konstantin_spec[side].first_dead_unit == 0 then
      konstantin_spec[side].first_dead_unit = 1
    else
      return
    end
    --
    EnableAutoFinish(nil)
    local town = GetCreatureTown(creature)
    local base_name = GetCreatureName(creature)
    local pair = FindCreaturePairInTown(GetCreatureType(creature), TOWN_NECROMANCY)
    if not pair then
      pair = TIER_TABLES[TOWN_NECROMANCY][GetCreatureTier(creature)][1]
    end
    --
    local x, y = pos(creature)
    local count = ceil(konstantin_spec[side].base_creatures[creature] * konstantin_spec[side].respawn_percent)
    pcall(AddCreature, side, pair, count, x, y, nil, creature)
    while not exist(creature) do
      sleep()
    end
    sleep(100)
    startThread(CombatFlyingSign, {'Text/Default/add_creature.txt'; name = GetCreatureName(creature), num = count}, creature, 30.0)
    EnableAutoFinish(1)
  end
end

if contains(konstantin_spec.heroes, GetHeroName(GetAttackerHero())) then
  local name = GetHeroName(GetAttackerHero())
  konstantin_spec[ATTACKER] =
  {
    first_dead_unit = 0,
    base_creatures = {},
    respawn_percent = konstantin_spec.percent * (((GetGameVar(name..'_diplomacy')) + 0) + (GetGameVar(name..'_herald') + 0) + (GetGameVar(name..'_crown') + 0) + (GetGameVar(name..'_week') + 0))
  }
  AddCombatFunction(CombatFunctions.START,
  function()
    KonstantinSpec_Start(ATTACKER)
  end)
  --
  AddCombatFunction(CombatFunctions.DEFENDER_CREATURE_DEATH,
  function(creature)
    KonstantinSpec_CreatureDeath(creature, ATTACKER)
  end)
end

if GetDefenderHero() and contains(konstantin_spec.heroes, GetHeroName(GetDefenderHero())) then
  local name = GetHeroName(GetDefenderHero())
  konstantin_spec[DEFENDER] =
  {
    first_dead_unit = 0,
    base_creatures = {},
    respawn_percent = konstantin_spec.percent * (((GetGameVar(name..'_diplomacy')) + 0) + (GetGameVar(name..'_herald') + 0) + (GetGameVar(name..'_crown') + 0) + (GetGameVar(name..'_week') + 0))
  }
  AddCombatFunction(CombatFunctions.START,
  function()
    KonstantinSpec_Start(DEFENDER)
  end)
  --
  AddCombatFunction(CombatFunctions.ATTACKER_CREATURE_DEATH,
  function(creature)
    KonstantinSpec_CreatureDeath(creature, DEFENDER)
  end)
end