aratrok_spec =
{
    path = 'Text/Combat/Aratrok/',
    heroes = {'Aratrok', 'Aratrok_copy_1', 'Aratrok_copy_2', 'Aratrok_copy_3', 'Aratrok_copy_4', 'Aratrok_copy_5', 'Aratrok_copy_6', 'Aratrok_copy_7', 'Aratrok_copy_8'},
    [ATTACKER] = {},
    [DEFENDER] = {}
}

function AratrokSpec_Start(side)
  --
  for i, creature in GetCreatures(side) do
    if IsCaster(creature) then
      local mana = GetUnitManaPoints(creature)
      SetUnitManaPoints(creature, 0)
      startThread(CombatFlyingSign, {aratrok_spec.path..'mana_removed.txt'; mana = mana}, creature, 30.0)
    end
  end
  --
  if GetHero(side) then
    local hero_max_mana = ceil(((GetGameVar(GetHeroName(GetHero(side))..'_Knowledge')) + 0) * 10)
    local hero_curr_mana = GetUnitManaPoints(GetHero(side))
    if hero_curr_mana > hero_max_mana then
      SetUnitManaPoints(GetHero(side), hero_max_mana)
      startThread(CombatFlyingSign, {aratrok_spec.path..'mana_removed.txt'; mana = (hero_curr_mana - hero_max_mana)}, GetHero(side), 30.0)
    end
  end
  --
end

if contains(aratrok_spec.heroes, GetHeroName(GetAttackerHero())) then
  AddCombatFunction(CombatFunctions.START,
  function()
    AratrokSpec_Start(DEFENDER)
  end)
end

if GetDefenderHero() and contains(aratrok_spec.heroes, GetHeroName(GetDefenderHero())) then
  AddCombatFunction(CombatFunctions.START,
  function()
    AratrokSpec_Start(ATTACKER)
  end)
end