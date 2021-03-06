tessa_spec =
{
  path = 'Text/Combat/Tessa/',
  heroes = {'Tessa', 'Tessa_copy_1', 'Tessa_copy_2', 'Tessa_copy_3', 'Tessa_copy_4', 'Tessa_copy_5', 'Tessa_copy_6', 'Tessa_copy_7', 'Tessa_copy_8'},
  mana_remove_percent = 0.4,
  [ATTACKER] = {},
  [DEFENDER] = {}
}

function TessaSpec_RemoveMana(side)
  local mana = GetUnitManaPoints(GetHero(side))
  local mana_to_remove = GetUnitManaPoints(GetHero(1 - side)) * tessa_spec.mana_remove_percent
  SetUnitManaPoints(GetHero(side), mana - mana_to_remove)
  startThread(CombatFlyingSign, {tessa_spec.path..'mana_removed.txt'; removed_mana = mana_to_remove}, GetHero(side), 50.0)
end

if contains(tessa_spec.heroes, GetHeroName(GetAttackerHero())) and GetDefenderHero() then
  AddCombatFunction(CombatFunctions.START,
  function()
    TessaSpec_RemoveMana(DEFENDER)
  end)
end

if GetDefenderHero() and contains(tessa_spec.heroes, GetHeroName(GetDefenderHero())) then
  AddCombatFunction(CombatFunctions.START,
  function()
    TessaSpec_RemoveMana(ATTACKER)
  end)
end
