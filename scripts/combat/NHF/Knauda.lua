knauda_spec =
{
  heroes = {'Knaud', 'Knaud_copy_1', 'Knaud_copy_2', 'Knaud_copy_3', 'Knaud_copy_4', 'Knaud_copy_5', 'Knaud_copy_6', 'Knaud_copy_7', 'Knaud_copy_8'},
  [ATTACKER] = {},
  [DEFENDER] = {}
}

function KnaudaSpec_Start(side)
  pcall(AddCreature, 1 - side, HELPER, 20000, -1, -1, nil, 'kn_spec_helper')
  while not exist('kn_spec_helper') do
    sleep()
  end
  local count = 0
  for i, machine in GetWarMachines(side) do
    commandShot('kn_spec_helper', machine, 1)
    count = count + 1
  end
  count = (count + length(GetWarMachines(1 - side))) / 10
  for i, creature in GetCreatures(1 - side) do
    if random() < count then
      pcall(UnitCastAimedSpell, 'kn_spec_helper', SPELL_ENCOURAGE, creature)
    end
  end
  removeUnit('kn_spec_helper')
  while exist('kn_spec_helper') do
    sleep()
  end
end

if contains(knauda_spec.heroes, GetHeroName(GetAttackerHero())) then
  AddCombatFunction(CombatFunctions.START,
  function()
    KnaudaSpec_Start(DEFENDER)
  end)
end

if GetDefenderHero() and contains(knauda_spec.heroes,GetHeroName(GetDefenderHero())) then
  AddCombatFunction(CombatFunctions.START,
  function()
    KnaudaSpec_Start(ATTACKER)
  end)
end
