--NHF----------------Ксуда----------------------
ksuda_spec =
{
    path = "/MapObjects/Academy/NewHeroes/Ksuda/",
    heroes = {'Ksuda', 'Ksuda_copy_1', 'Ksuda_copy_2', 'Ksuda_copy_3', 'Ksuda_copy_4', 'Ksuda_copy_5', 'Ksuda_copy_6', 'Ksuda_copy_7', 'Ksuda_copy_8'},
    chance_per_lvl = 3,
    open_fog_radius = 5
}

function  error_NHF_Ksuda_F ()
	print("error:NHF_Ksuda_F")
end

AddEvent(new_day_events, 'NHF_ksuda_spec_new_day',
function(day)
    for hero, alive in HEROES_ALIVE do
        if hero and alive and contains(ksuda_spec.heroes, hero) and ((random(100) + 1) <= GetHeroLevel(hero) / ksuda_spec.chance_per_lvl) then
            for player = PLAYER_1, PLAYER_8 do
                if IsActivePlayer(player) and (GetPlayerTeam(player) ~= GetPlayerTeam(GetObjectOwner(hero))) then
                    for i, phero in GetPlayerHeroes(player) do
                        if not GetHeroTown(phero) then
                            local x, y, z = GetObjectPosition(phero)
                            OpenCircleFog(x, y, z, ksuda_spec.open_fog_radius, GetObjectOwner(hero))
                        end
                    end
                end
            end
        end
    end
end)