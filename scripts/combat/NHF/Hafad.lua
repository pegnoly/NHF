hafad_spec =
{
  path = 'Text/Combat/Hafad/',
  heroes = {'Hafad'},
  [ATTACKER] = {},
  [DEFENDER] = {}
}

function HafadSpec_Start(side)
  EnableAutoFinish(nil)
  local creatures_to_respawn = {}
  local x, y = pos(GetCreatures(1 - side)[0])
  --
  for i, creature in GetCreatures(side) do
    if IsAlive(creature) then
      pcall(AddCreature, 1 - side, HAFAD_HELPER, 1, x, y, nil, 'hafad_spec_helper_'..creature)
      while not exist('hafad_spec_helper_'..creature) do
        sleep()
      end
      commandShot('hafad_spec_helper_'..creature, creature)
      removeUnit('hafad_spec_helper_'..creature)
    end
  end
  --
  for i, creature in GetCreatures(side) do
    startThread(
    function()
      pcall(AddCreature, %side, HELPER, 1, -1, -1, nil, 'hafad_spec_res_helper_'..%creature)
      while not exist('hafad_spec_res_helper_'..%creature) do
        sleep()
      end
      pcall(UnitCastAimedSpell, 'hafad_spec_res_helper_'..%creature, SPELL_RESURRECT, %creature)
      startThread(CombatFlyingSign, hafad_spec.path..'hp_removed.txt', %creature, 40.0)
      removeUnit('hafad_spec_res_helper_'..%creature)
    end)
  end
  --
  EnableAutoFinish(1)
end

if contains(hafad_spec.heroes, GetHeroName(GetAttackerHero())) then
  hafad_spec[ATTACKER] =
  {
    casts_count = ceil((GetGameVar(GetHeroName(GetAttackerHero())..'_lvl') + 0) / 10)
  }
  AddCombatFunction(CombatFunctions.START,
  function()
    HafadSpec_Start(DEFENDER)
  end)
end

if GetDefenderHero() and contains(hafad_spec.heroes,GetHeroName(GetDefenderHero())) then
  hafad_spec[ATTACKER] =
  {
    casts_count = ceil((GetGameVar(GetHeroName(GetDefenderHero())..'_lvl') + 0) / 10)
  }
  AddCombatFunction(CombatFunctions.START,
  function()
    HafadSpec_Start(ATTACKER)
  end)
end
