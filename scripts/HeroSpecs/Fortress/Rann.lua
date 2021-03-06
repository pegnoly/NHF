--NHF-------------------Ранн---------------------
rann_spec =
{
    heroes = {'Rann', 'Rann_copy_1', 'Rann_copy_2', 'Rann_copy_3', 'Rann_copy_4', 'Rann_copy_5', 'Rann_copy_6', 'Rann_copy_7', 'Rann_copy_8'},
}

function  error_NHF_Rann_F ()
   print("error:NHF_Rann_F")
end

AddEvent(new_day_events, 'NHF_rann_spec_new_day',
function(day)
    for hero, alive in HEROES_ALIVE do
        if hero and alive and contains(rann_spec.heroes, hero) then
            local gold_to_add = 0
            for i, art in GetHeroEquipedArtifactsTable(hero) do
                gold_to_add = gold_to_add + GetArtCost(art)
            end
            if gold_to_add > 0 then
                startThread(MCCS_ChangeHeroResource, hero, GOLD, gold_to_add)
            end
        end
    end
end)