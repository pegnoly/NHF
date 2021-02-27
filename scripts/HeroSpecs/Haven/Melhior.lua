--NHF------------Мельхиор--------------------------

melhior_spec =
{
    heroes = {'Melhior', 'Melhior_copy_1', 'Melhior_copy_2', 'Melhior_copy_3', 'Melhior_copy_4', 'Melhior_copy_5', 'Melhior_copy_6', 'Melhior_copy_7', 'Melhior_copy_8'},
    chance = 0.5,
    base_knowledge = 1.0001,
    knowledge_per_spell = 1/3
}

function  error_NHF_Melhior_F ()
	print("error:NHF_Melhior_F");
end;

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
                    startThread(NHF_ShowFlyMessage, NHF_GetSpellName(spell, "+ "), temp_name , 5)
                    melhior_spec.base_knowledge = melhior_spec.base_knowledge + melhior_spec.knowledge_per_spell;
                    if melhior_spec.base_knowledge >= 1 then							
                        sleep(2);
                        NHF_ChangeHeroStat(hero, STAT_KNOWLEDGE, floor(melhior_spec.base_knowledge), 8)		
                        sleep(NHF_slep_singl)
                        melhior_spec.base_knowledge = melhior_spec.base_knowledge - floor(melhior_spec.base_knowledge)
                    end
                    break
                end
            end
        end
    end
end)