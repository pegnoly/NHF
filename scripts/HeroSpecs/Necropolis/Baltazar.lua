--NHF---------------БАЛЬТАЗАР-----------------
baltazar_spec =
{
    heroes = {'Baltazar', 'Baltazar_copy_1', 'Baltazar_copy_2', 'Baltazar_copy_3', 'Baltazar_copy_4', 'Baltazar_copy_5', 'Baltazar_copy_6', 'Baltazar_copy_7', 'Baltazar_copy_8'},
    spells_known_by_hero = {},
    spells_to_learn = 
    {
        [SPELL_LIGHTNING_BOLT] = SPELL_CHAIN_LIGHTNING,
        [SPELL_ICE_BOLT] = SPELL_FROST_RING,
        [SPELL_FIREBALL] = SPELL_ARMAGEDDON,
        [SPELL_STONE_SPIKES] = SPELL_METEOR_SHOWER
    },
    sp_per_spell = 2
}

function  error_NHF_Baltazar_F ()
	print("error:NHF_Baltazar_F")
end;

AddEvent(map_loading_events, 'NHF_baltazar_spec_init',
function()
    for i, hero in baltazar_spec.heroes do
        baltazar_spec.spells_known_by_hero[hero] = {}
        for spell, _ in baltazar_spec.spells_to_learn do
            baltazar_spec.spells_known_by_hero[hero][spell] = nil
        end
    end
end)

AddEvent(add_hero_events, 'NHF_baltazar_add_hero',
function(hero)
    if contains(baltazar_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%hero) then
                errorHook(error_NHF_Baltazar_F)
                for spell, upgrade in baltazar_spec.spells_to_learn do
                    if KnowHeroSpell(%hero, spell) and (not baltazar_spec.spells_known_by_hero[%hero][spell]) then
                        TeachHeroSpell(%hero, upgrade)
                        startThread(ShowFlyingSign, {'/Text/Default/spell_learned.txt'; name = GetSpellName(upgrade)}, %hero, GetObjectOwner(%hero), 5.0)
                        baltazar_spec.spells_known_by_hero[%hero][spell] = 1
                        startThread(NHF_ChangeHeroStat, %hero, STAT_SPELL_POWER, baltazar_spec.sp_per_spell)
                    end
                end
                sleep()
            end
        end
    end
end)