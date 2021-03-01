--NHF-----------------Хиормель------------------------------
heormel_spec = 
{
    heroes = {'Heormel', 'Heormel_copy_1', 'Heormel_copy_2', 'Heormel_copy_3', 'Heormel_copy_4', 'Heormel_copy_5', 'Heormel_copy_6', 'Heormel_copy_7', 'Heormel_copy_8'},
    hero_in_town = {},
    spells_count_for_hero = {}
    spells_for_know = 3,
}

function  error_NHF_Heormel_F ()
	print("error:NHF_Heormel_F")
end

AddEvent(map_loading_events, 'NHF_heormel_spec_init',
function()
    for i, hero in heormel_spec.heroes do
        --heormel_spec.spells_learned_for_hero[hero] = {}
        heormel_spec.spells_count_for_hero[hero] = 0
        for j, spell in SPELLS_BY_SCHOOL[MAGIC_SCHOOL_LIGHT] do
            if KnowHeroSpell(hero, spell) then
                --heormel_spec.spells_learned_for_hero[hero][spell] = 1
                heormel_spec.spells_count_for_hero[hero] = heormel_spec.spells_count_for_hero[hero] + 1
            end
        end
    end
end)

function HeormelSpec_EnterTown(hero, town)
    local guild_lvl = GetTownBuildingLevel(town, TOWN_BUILDING_MAGIC_GUILD)
    local temp_name = NHF_tempName_F(hero)
    if guild_lvl > 0 then
        local max_mastery_to_learn = (guild_lvl == 0 and 0 or guild_lvl - 2)
        for i, spell in SPELLS_BY_SCHOOL[MAGIC_SCHOOL_LIGHT] do
            local mastery = GetSpellMastery(spell)
            if (not KnowHeroSpell(hero, spell)) and mastery and mastery <= max_mastery_to_learn then
                TeachHeroSpell(hero, spell)
                startThread(ShowFlyingSign, {'/Text/Default/spell_learned.txt'; name = GetSpellName(spell)}, temp_name, GetObjectOwner(temp_name), 5.0)
            end
        end
    end
end

AddEvent(add_hero_events, 'NHF_heormel_spec_add_hero',
function(hero)
    if contains(heormel_spec.heroes, hero) then
        startThread(
        function()
            while 1 do
                if IsHeroAlive(%) and (heormel_spec.spells_count_for_hero[%hero] ~= len(SPELLS_BY_SCHOOL[MAGIC_SCHOOL_LIGHT])) then
                    --
                    if not heormel_spec.hero_in_town[%hero] then
                        for i, town in GetPlayerTowns(GetObjectOwner(%hero)) do
                            if (IsHeroInTown(%hero, town , 1, 0) or GetTownHero(town) == %hero) then
                                heormel_spec.hero_in_town[%hero] = 1
                                HeormelSpec_EnterTown(%hero, town)
                            end
                        end
                    else
                        if not (IsHeroInTown(%hero, town , 1, 0) or GetTownHero(town) == %hero) then
                            heormel_spec.hero_in_town[%hero] = nil
                        end
                    end
                    --
                    local spells_learned_temp = 0
                    for i, spell in SPELLS_BY_SCHOOL[MAGIC_SCHOOL_LIGHT] do
                        if KnowHeroSpell(%hero, spell) then
                            spells_learned_temp = spells_learned_temp + 1
                        end
                    end
                    --
                    if spells_learned_temp > heormel_spec.spells_count_for_hero[%hero] then
                        if mod(spells_learned_temp, heormel_spec.spells_for_know) == 0 then
                            startThread(NHF_ChangeHeroStat, %hero, STAT_KNOWLEDGE, 1, 5.0)
                        end
                    end
                end
                sleep()
            end
        end)
    end
end)