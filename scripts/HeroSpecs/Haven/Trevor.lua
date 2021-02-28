--NHF_E---------------Trevor---------------------
NHF_Trevor_zakl_mass = {SPELL_MAGIC_ARROW, SPELL_STONE_SPIKES,SPELL_CURSE, SPELL_SLOW, SPELL_SORROW,SPELL_MAGIC_FIST, SPELL_LAND_MINE,SPELL_BLESS, SPELL_HASTE,
SPELL_LIGHTNING_BOLT, SPELL_ICE_BOLT,SPELL_DISRUPTING_RAY, SPELL_PLAGUE,SPELL_WASP_SWARM, SPELL_ANIMATE_DEAD,SPELL_STONESKIN, SPELL_DISPEL,
SPELL_FIREBALL,SPELL_FROST_RING, SPELL_FIREWALL,SPELL_WEAKNESS, SPELL_FORGETFULNESS,SPELL_PHANTOM, SPELL_EARTHQUAKE,SPELL_BLOODLUST, SPELL_DEFLECT_ARROWS,
SPELL_CHAIN_LIGHTNING, SPELL_METEOR_SHOWER,SPELL_SUMMON_ELEMENTALS, SPELL_SUMMON_HIVE, SPELL_BLIND, SPELL_BERSERK, SPELL_TELEPORT, SPELL_ANTI_MAGIC, SPELL_DIVINE_VENGEANCE,
SPELL_IMPLOSION, SPELL_ARMAGEDDON, SPELL_DEEP_FREEZE,SPELL_HYPNOTIZE, SPELL_UNHOLY_WORD, SPELL_VAMPIRISM,SPELL_CONJURE_PHOENIX, SPELL_CELESTIAL_SHIELD,SPELL_HOLY_WORD, SPELL_RESURRECT,
SPELL_SUMMON_BOAT, SPELL_DIMENSION_DOOR, SPELL_TOWN_PORTAL,SPELL_SUMMON_CREATURES };

trevor_spec =
{
    heroes = {'NHFTrevor', 'NHFTrevor_copy_1', 'NHFTrevor_copy_2', 'NHFTrevor_copy_3', 'NHFTrevor_copy_4', 'NHFTrevor_copy_5', 'NHFTrevor_copy_6', 'NHFTrevor_copy_7', 'NHFTrevor_copy_8'},
    spells_for_sp = 2,
    saved_sp_bonus_for_hero = {},
}

function  error_NHF_Trevor_F ()
    print("error:NHF_Trevor_F");
end

AddEvent(add_hero_events, 'NHF_trevor_spec_add_hero',
function(hero)
  if contains() then
    startThread(
    function()
      while 1 do
        if IsHeroAlive(%hero) then
            errorHook(error_NHF_Trevor_F)
            local temp_sp_bonus
            for i, spell in  NHF_Trevor_zakl_mass do
                if KnowHeroSpell(%hero, zakl) then
                    temp_sp_bonus = temp_sp_bonus + 1
                end
            end
            if floor(temp_sp_bonus / trevor_spec.spells_for_sp) > floor(trevor_spec.saved_sp_bonus_for_hero[%hero] / trevor_spec.spells_for_sp) then
            NHF_ChangeHeroStat(%hero, STAT_SPELL_POWER, floor(temp_sp_bonus / trevor_spec.spells_for_sp) - floor(trevor_spec.saved_sp_bonus_for_hero[%hero] / trevor_spec.spells_for_sp))
            sleep(NHF_slep_singl)
            trevor_spec.saved_sp_bonus_for_hero[%hero] = temp_sp_bonus
            end
        end
        sleep()
      end
    end)
  end
end)