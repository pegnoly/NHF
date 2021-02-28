--NHF_E---------------Габриэль---------------------
gabriel_spec =
{
    heroes = {'GabriellNHF', 'GabriellNHF_copy_1', 'GabriellNHF_copy_2', 'GabriellNHF_copy_3', 'GabriellNHF_copy_4', 'GabriellNHF_copy_5', 'GabriellNHF_copy_6', 'GabriellNHF_copy_7', 'GabriellNHF_copy_8'},
    iris_copies = {'Ving', 'Ving_copy_1', 'Ving_copy_2', 'Ving_copy_3', 'Ving_copy_4', 'Ving_copy_5', 'Ving_copy_6', 'Ving_copy_7', 'Ving_copy_8'},
}

function  error_NHF_GabriellNHF_F ()
	print("error:NHF_GabriellNHF_F");
end;

AddEvent(new_day_events, 'NHF_gabriell_spec_new_day',
function(day)
    if mod(day, 7) == 1 and day ~= 1 then
        for hero, alive in HEROES_ALIVE do
            if hero and alive and contains(gabriel_spec.heroes, hero) then
                errorHook(error_NHF_GabriellNHF_F)
                --
                local owner = GetObjectOwner(hero)
                local iris_lvl_temp = 0
                for player = PLAYER_1, PLAYER_8 do
                    if IsActivePlayer(player) and (GetPlayerTeam(owner) == GetPlayerTeam(player)) then
                        for i, phero in GetPlayerHeroes(player) do
                            if contains(gabriel_spec.iris_copies, phero) and (GetHeroLevel(phero) > iris_lvl_temp) then
                                iris_lvl_temp = GetHeroLevel(phero)
                            end
                        end
                    end
                end
                --
                local grow = GetHeroLevel(hero) + iris_lvl_temp
                startThread(DefaultCreatureGrow, hero, TOWN_HEAVEN, 4, grow)
            end
        end
    end
end)