spec_bers_adv =
{
    heroes = {'Frerin', 'Frerin_copy_1', 'Frerin_copy_3', 'Frerin_copy_4', 'Frerin_copy_5', 'Frerin_copy_6', 'Frerin_copy_7', 'Frerin_copy_8'},
    path = '/Text/Combat/Specs/Berserkers/',
    lvl_saved_for_hero = {}
}

function SpecBersPostCombat(hero, fight_id)
    if contains(spec_bers_adv.heroes, hero) then
        consoleCmd("@if spec_bers_adv then local lvl = GetGameVar('"..hero.."_bers_curr_lvl') startThread(SpecBersCheckLvlForHero, '"..hero.."', lvl) end")
    end
end)

function SpecBersCheckLvlForHero(hero, new_lvl)
    print('new_lvl - ', new_lvl, ', saved - ', spec_bers_adv.lvl_saved_for_hero[hero])
    local change = new_lvl - spec_bers_adv.lvl_saved_for_hero[hero]
    if change > 0 then
        spec_bers_adv.lvl_saved_for_hero[hero] = new_lvl
        startThread(MCCS_ChangeHeroStat, hero, STAT_ATTACK, change)
        sleep(7)
    end
end

consoleCmd("@AddPostCombatEvent('NHF_frerin_post_combat', SpecBersPostCombat)")