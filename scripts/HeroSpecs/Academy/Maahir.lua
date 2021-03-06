--NHF_E--------------Маахир---------------------
maahir_spec =
{
    path = "/MapObjects/Academy/NewHeroes/Maahir/",
    heroes = {'MaahirNHF', 'MaahirNHF_copy_1', 'MaahirNHF_copy_2', 'MaahirNHF_copy_3', 'MaahirNHF_copy_4', 'MaahirNHF_copy_5', 'MaahirNHF_copy_6', 'MaahirNHF_copy_7', 'MaahirNHF_copy_8'},
    base_mana_regen_coeff = 2
}

function  error_NHF_MaahirNHF_F ()
	print("error:NHF_MaahirNHF_F")
end

AddEvent(new_day_events, 'NHF_maahir_spec_new_day',
function(day)
    for hero, alive in HERO_ALIVE do
        if hero and alive and contains(maahir_spec.heroes, hero) then
            local mana_to_regen = GetHeroLevel(hero) * maahir_spec.base_mana_regen_coeff * (2 * (HasHeroSkill(hero, PERK_MYSTICISM) and 1 or 0)) * (2 * (GetCurrentMoonWeek() == WEEK_OF_MEDITATION and 1 or 0))
            local curr_mana = GetHeroStat(hero, STAT_MANA_POINTS)
            ChangeHeroStat(hero, STAT_MANA_POINTS, mana_to_regen)
            sleep(NHF_slep_singl)
            local new_mana = GetHeroStat(hero, STAT_MANA_POINTS)
            startThread(ShowFlyingSign, {maahir_spec.path..'mana_prirost.txt'; p = new_mana - curr_mana}, hero, GetObjectOwner(hero), 5.0)
        end
    end
end)