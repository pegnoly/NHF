--NHF----------------Лендаил-----------------------
lendail_spec =
{
    heroes = {'Lendail', 'Lendail_copy_1', 'Lendail_copy_2', 'Lendail_copy_3', 'Lendail_copy_4', 'Lendail_copy_5', 'Lendail_copy_6', 'Lendail_copy_7', 'Lendail_copy_8'},
    perks_for_hero = {},
    tiles_per_lvl = 2
}

function  error_NHF_Lendail_F ()
	print("error:NHF_Lendail_F")
end

AddEvent(map_loading_events, 'NHF_lendail_spec_init',
function
    for i, hero in lendail_spec.heroes do
        lendail_spec.perks_for_hero[hero] = {}
        for j, perk in {PERK_SCOUTING,  RANGER_FEAT_DISGUISE_AND_RECKON , KNIGHT_FEAT_GRAIL_VISION, RANGER_FEAT_SOIL_BURN, RANGER_FEAT_SUN_FIRE} do
            lendail_spec.perks_for_hero[hero][perk] = -1
        end
    end
end)

AddEvent(new_day_events, 'NHF_lendail_spec_new_day',
function(day)
    if contains(lendail_spec.heroes, hero) then
        local percent = (GetHeroLevel(hero) * lendail_spec.tiles_per_lvl) + 12
        if HasHeroSkill(hero, PERK_SCOUTING) then
            percent = percent + 4;
        end
        if HasHeroSkill(hero, RANGER_FEAT_DISGUISE_AND_RECKON) then
            percent = percent + 12;
        end
        if HasArtefact(hero, 12, 1) then
            percent = percent + 4;
        end;
        local x, y, z = GetObjectPosition(hero)
        OpenCircleFog(x, y, z, percent, GetObjectOwner(hero))
	end
end)

AddEvent(add_hero_events, 'NHF_lendail_spec_add_hero',
function(hero)
  if contains(lendail_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                    for perk, learned in lendail_spec.perks_for_hero[%hero] do
                        if learned == -1 and HasHeroSkill(%hero, perk) then
                            lendail_spec.perks_for_hero[%hero][perk] = 1
                            startThread(MCCS_ChangeHeroStat, hero, STAT_ATTACK, 2)
                        end
                    end
                end
                sleep()
            end
        end)
    end
end)