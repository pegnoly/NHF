--NHF---------------Абиссид-------------------
abissid_spec =
{
    path = "/MapObjects/Necropolis/NewHeroes/Abissid/",
    heroes = {'Abissid', 'Abissid_copy_1', 'Abissid_copy_2', 'Abissid_copy_3', 'Abissid_copy_4', 'Abissid_copy_5', 'Abissid_copy_6', 'Abissid_copy_7', 'Abissid_copy_8'},
    base_distance = 20,
    mp_per_lvl = 75,
    mana_percent = 0.02,
}

function  error_NHF_Abissid_F ()
  print("error:NHF_Abissid_F")
end;

AddEvent(new_day_events, 'NHF_abissid_spec_new_day',
function(day)
    for hero, alive in HEROES_ALIVE do
        if hero and alive and contains(abissid_spec.heroes, hero) then
            --
            local temp_name = NHF_tempName_F(hero)
            local affected_heroes, n = {}, 0
            for player = PLAYER_1, PLAYER_8 do
                if IsActivePlayer(player) and (GetPlayerTeam(player) ~= GetPlayerTeam(GetObjectOwner(temp_name))) then
                    for i, phero in GetPlayerHeroes(player) do
                        local dist = GetDistance(phero, temp_name)
                        if dist and dist <= abissid_spec.base_distance then
                            n = n + 1
                            affected_heroes[n] = phero
                        end
                    end
                end
            end
            --
            if n == 0 then
                return
            else
                local total_mp_stolen = 0
                local mp_to_remove = GetHeroLevel(hero) * abissid_spec.mp_per_lvl
                for i, phero in affected_heroes do
                    startThread(PlayVisualEffect, "/Effects/_(Effect)/Spells/Slow.xdb#xpointer(/Effect)", phero)
                    sleep()
                    startThread(ShowFlyingSign, abissid_spec.path.."message1.txt", phero, GetObjectOwner(phero), 5.0)
                    ChangeHeroStat(phero, STAT_MOVE_POINTS, -mp_to_remove)
                    total_mp_stolen = total_mp_stolen + mp_to_remove
                end
                --
                if total_mp_stolen ~= 0 then
                    local mana_to_add = total_mp_stolen * abissid_spec.mana_percent
                    local max_mana = GetHeroStat(hero, STAT_KNOWLEDGE) * (10 + 5 * (HasHeroSkill(PERK_INTELLIGENCE) and 1 or 0))
                    if (GetHeroStat(hero, STAT_MANA_POINTS) + mana_to_add) > max_mana then
                        local curr_know = GetHeroStat(hero, STAT_KNOWLEDGE)
                        ChangeHeroStat(hero, STAT_KNOWLEDGE, ceil((GetHeroStat(STAT_MANA_POINTS) + mana_to_add) / 10) - curr_know)
                        sleep(NHF_slep_singl)
                        ChangeHeroStat(hero, STAT_MANA_POINTS, mana_to_add)
                        sleep(NHF_slep_singl)
                        ChangeHeroStat(hero, STAT_KNOWLEDGE, -(ceil((GetHeroStat(STAT_MANA_POINTS) + mana_to_add) / 10) - curr_know)))
                    else
                        ChangeHeroStat(hero, STAT_MANA_POINTS, mana_to_add)
                    end
                    startThread(ShowFlyingSign, {abissid_spec.path.."message.txt"; p = mana_to_add}, hero, GetObjectOwner(hero), 5.0)
                end
            end
        end
    end
end)