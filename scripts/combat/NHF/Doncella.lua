doncella_spec = 
{
  heroes = {'Doncella', 'Doncella_copy_1', 'Doncella_copy_2', 'Doncella_copy_3', 'Doncella_copy_4', 'Doncella_copy_5', 'Doncella_copy_6', 'Doncella_copy_7', 'Doncella_copy_8'},
  [ATTACKER] = {},
  [DEFENDER] = {}
}

function DoncellaSpec_Start(side)
  for i, creature in GetCreatures(side) do
    if IsAlive(creature) and IsCaster(creature) then
      doncella_spec[side].casters_table[creature] = GetCreatureNumber(creature)
    end
  end
end 

function DoncellaSpec_CreatureDeath(creature, side)
  EnableAutoFinish(nil)
  if doncella_spec[side][creature] then
    local count = ceil(doncella_spec[side][creature] / GetCreatureGrow(creature))
    local x, y = pos(creature)
    pcall(AddCreature, 1 - side, CREATURE_MUMMY, count, x, y)
  end
  EnableAutoFinish(1)
end

if contains(doncella_spec.heroes, GetHeroName(GetAttackerHero())) then
  doncella_spec[ATTACKER] = 
  {
    casters_table = {},
  }
  AddCombatFunction(CombatFunctions.START,
  function()
    DoncellaSpec_Start(DEFENDER)
  end)
  AddCombatFunction(CombatFunctions.DEFENDER_CREATURE_DEATH,
  function(creature)
    DoncellaSpec_CreatureDeath(creature, DEFENDER)
  end)
end

if GetDefenderHero() and contains(doncella_spec.heroes,GetHeroName(GetDefenderHero())) then
  doncella_spec[DEFENDER] = 
  {
    casters_table = {},
  }
  AddCombatFunction(CombatFunctions.START,
  function()
    DoncellaSpec_Start(ATTACKER)
  end)
  AddCombatFunction(CombatFunctions.ATTACKER_CREATURE_DEATH,
  function(creature)
    DoncellaSpec_CreatureDeath(creature, ATTACKER)
  end)
end

