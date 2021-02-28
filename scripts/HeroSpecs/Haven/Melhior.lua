--NHF------------Мельхиор--------------------------

melhior_spec =
{
    heroes = {'Melhior', 'Melhior_copy_1', 'Melhior_copy_2', 'Melhior_copy_3', 'Melhior_copy_4', 'Melhior_copy_5', 'Melhior_copy_6', 'Melhior_copy_7', 'Melhior_copy_8'},
    chance = 0.5,
    spells_learned_for_hero = {},
    spells_for_know = 3
}

function  error_NHF_Melhior_F ()
	print("error:NHF_Melhior_F");
end;

AddEvent(map_loading_events, 'NHF_melhior_spec_init',
function()
    for i, hero in melhior_spec.heroes do
        melhior_spec.spells_learned_for_hero[hero] = 1
    end
end)

AddEvent(level_up_events, 'NHF_melhior_lvl_up',
function(hero)
	if contains(melhior_spec.heroes, hero) then
        errorHook(error_NHF_Melhior_F)
	    local temp_name = NHF_tempName_F(hero);
        NHF_Melhior_lvlHero_temp = GetHeroLevel(hero);
        if (((random(100) + 1) <= (melhior_spec.chance * 100))) then
            for i, spell in SPELLS_BY_SCHOOLS[MAGIC_SCHOOL_LIGHT] do
                if not KnowHeroSpell(hero, spell) then
                    TeachHeroSpell(hero, spell)
                    startThread(ShowFlyingSign, {'/Text/Default/spell_learned.txt'; name = GetSpellName(spell)}, temp_name, GetObjectOwner(temp_name), 5.0)
                    melhior_spec.spells_learned_for_hero[hero] = melhior_spec.spells_learned_for_hero[hero] + 1
                    if mod(melhior_spec.spells_learned_for_hero[hero], melhior_spec.spells_for_know) == 0 then							
                        sleep(2);
                        NHF_ChangeHeroStat(hero, STAT_KNOWLEDGE, 1, 8.0)		
                        sleep(NHF_slep_singl)
                    end
                    break
                end
            end
        end
    end
end)