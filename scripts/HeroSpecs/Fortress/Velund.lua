--NHF----------------Велунд--------------------
velund_spec =
{
    heroes = {'Velund', 'Velund_copy_1', 'Velund_copy_2', 'Velund_copy_3', 'Velund_copy_4', 'Velund_copy_5', 'Velund_copy_6', 'Velund_copy_7', 'Velund_copy_8'},
    level_to_art_tier = 
    {
        [0] = ART_TIER_MINOR,
        [10] = ART_TIER_MAJOR,
        [20] = ART_TIER_RELIC
    },
    default_arts =
    {
        [ART_TIER_MINOR] = {ARTIFACT_ENDLESS_BAG_OF_GOLD},
        [ART_TIER_MAJOR] = {ARTIFACT_GREAT_AXE_OF_GIANT_SLAYING,ARTIFACT_DWARVEN_SMITHY_HUMMER,ARTIFACT_RUNE_OF_FLAME},
        [ART_TIER_RELIC] = {ARTIFACT_DWARVEN_MITHRAL_SHIELD, ARTIFACT_DWARVEN_MITHRAL_HELMET, ARTIFACT_DWARVEN_MITHRAL_GREAVES, ARTIFACT_DWARVEN_MITHRAL_CUIRASS}
    }
}

function  error_NHF_Velund_F ()
	print("error:NHF_Velund_F");
end;

AddEvent(new_day_events, 'NHF_velund_spec_new_day',
function(day)
    if mod(day, 7) == 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(velund_spec.heroes, hero) then
                local curr_tier = -1
                for level, tier in velund_spec.level_to_art_tier do
                    if GetHeroLevel(hero) >= level then
                        curr_tier = tier
                    else
                        break
                    end
                end
                --
                local arts_to_create, n = {}, 0
                for i, art in ARTS_TIER_TABLE[curr_tier] do
                    if not HasArtefact(hero, art) then
                        n = n + 1
                        arts_to_create[n] = art
                    end
                end
                --
                local art_to_create = -1
                if n == 0 then
                    art_to_create = GetRandFromT(velund_spec.default_arts[curr_tier])
                else
                    art_to_create = GetRandFromT(arts_to_create)
                end
                -- 
                MCCS_GiveArtifact(hero, art_to_create)
            end
        end
    end
end)