--NHF----------------Ойрхин--------------------
oirhin_spec =
{
    heroes = {'Oirhin', 'Oirhin_copy_1', 'Oirhin_copy_2', 'Oirhin_copy_3', 'Oirhin_copy_4', 'Oirhin_copy_5', 'Oirhin_copy_6', 'Oirhin_copy_7', 'Oirhin_copy_8'},
    war_cry_learn_lvl =
    {
        [SPELL_WARCRY_RALLING_CRY] = 2,
        [SPELL_WARCRY_CALL_OF_BLOOD] = 2, 
        [SPELL_WARCRY_WORD_OF_THE_CHIEF] = 6, 
        [SPELL_WARCRY_FEAR_MY_ROAR] = 6, 
        [SPELL_WARCRY_BATTLECRY] = 11, 
        [SPELL_WARCRY_SHOUT_OF_MANY] = 11
    },
    chance_to_learn = 40
}

function  error_NHF_Oihrin_F ()
    print("error:NHF_Oihrin_F")
end

AddEvent(level_up_events, 'NHF_oirhin_spec_lvl_up',
function(hero)
    if contains(oirhin_spec.heroes, hero) and ((random(100) + 1) < oirhin_spec.chance_to_learn) then
        local war_cries_to_learn, n = {}, 0
        for i, spell in SPELLS_BY_SCHOOLS[MAGIC_SCHOOL_WAR_CRY] do
            if not KnowHeroSpell(hero, spell) and (GetHeroLevel(hero) >= oirhin_spec.war_cry_learn_lvl[spell]) then
                n = n + 1
                war_cries_to_learn[n] = spell
            end
        end
        if n ~= 0 then
            startThread(MCCS_TeachHeroSpell, hero, GetRandFromT(war_cries_to_learn))
        end
    end
end)