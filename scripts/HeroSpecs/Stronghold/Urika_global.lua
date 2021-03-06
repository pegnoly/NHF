shamans_spec_adv = 
{
    heroes = {'Urika', 'Urika_copy_1', 'Urika_copy_2', 'Urika_copy_3', 'Urika_copy_4', 'Urika_copy_5', 'Urika_copy_6', 'Urika_copy_7', 'Urika_copy_8'},
}

function ShamansSpecPostCombat(hero, fight_id)
    if contains(shamans_spec_adv.heroes, hero) then
        consoleCmd("@if shamans_spec_adv then local income = GetGameVar('"..winner.."_shamans_income') startThread(ShamansSpec_AddShamans, '"..winner.."', income) end")
    end
end

function ShamansSpec_AddShamans(hero, shamans_income)
  if shamans_income == '0' then
    return
  end
  AddCreaturesByTier(hero, TOWN_STRONGHOLD, 4, shamans_income + 0)
end

consoleCmd("@AddPostCombatEvent('NHF_shamans_post_combat', ShamansSpecPostCombat)")