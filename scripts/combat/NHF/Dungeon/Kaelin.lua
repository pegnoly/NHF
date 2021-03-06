kaelin_spec =
{
    path = "/MapObjects/Dungeon/NewHeroes/Kaelin/",
    heroes = {'Kaelin', 'Kaelin_copy_1', 'Kaelin_copy_2', 'Kaelin_copy_3', 'Kaelin_copy_4', 'Kaelin_copy_5', 'Kaelin_copy_6', 'Kaelin_copy_7', 'Kaelin_copy_8'},
    mana_restore_coeff = 0.2,
    [ATTACKER] = {},
    [DEFENDER] = {}
}

function KaelinSpec_Start(side)
    for i, creature in GetCreatures(side) do
        kaelin_spec[1 - side].stacks[creature] = GetCreatureNumber(creature)
    end
end

function KaelinSpec_CreatureDeath(creature, side)
    if IsAlive(creature) then
        local mana_to_add = kaelin_spec[1 - side].stacks[creature] * kaelin_spec.mana_restore_coeff
        local curr_mana = GetUnitManaPoints(GetHero(1 - side))
        local max_mana = GetUnitMaxManaPoints(GetHero(1 - side))
        if (curr_mana + mana_to_add) > max_mana then
            mana_to_add = max_mana - curr_mana
        end
        SetUnitManaPoints(GetHero(1 - side), curr_mana + mana_to_add)
        startThread(CombatFlyingSign, {kaelin_spec.path.."NHF_Kaelin_prirost.txt"; count_pribavka = mana_to_add}, GetHero(1 - side), 30.0)
    end
end

AddCombatEvent(combat_event_add_creature, 'NHF_kaelin_spec_add_creature',
function(creature, side)
    kaelin_spec[side].stacks[creature] = GetCreatureNumber(creature)
end)

if contains(kaelin_spec.heroes, GetHeroName(GetAttackerHero())) then
    kaelin_spec[ATTACKER] =
    {
        stacks = {}
    }
    AddCombatFunction(CombatFunctions.START,
    function()
      KaelinSpec_Start(DEFENDER)
    end)
    AddCombatFunction(CombatFunctions.DEFENDER_CREATURE_DEATH,
    function(creature)
        KaelinSpec_CreatureDeath(creature, DEFENDER)
    end)
end
  
if GetDefenderHero() and contains(kaelin_spec.heroes, GetHeroName(GetDefenderHero())) then
    kaelin_spec[DEFENDER] =
    {
        stacks = {}
    }
    AddCombatFunction(CombatFunctions.START,
    function()
      KaelinSpec_Start(ATTACKER)
    end)
    AddCombatFunction(CombatFunctions.ATTACKER_CREATURE_DEATH,
    function(creature)
        KaelinSpec_CreatureDeath(creature, ATTACKER)
    end)
end