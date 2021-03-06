--NHF--------------Кирия----------------------
kiria_spec =
{
	heroes = {'Kiria', 'Kiria_copy_1', 'Kiria_copy_2', 'Kiria_copy_3', 'Kiria_copy_4', 'Kiria_copy_5', 'Kiria_copy_6', 'Kiria_copy_7', 'Kiria_copy_8'},
	chance_to_learn = 0.5,
	lvl_divisor = 5
}

function  error_NHF_Kiria_F ()
	print("error:NHF_Kiria_F")
end

AddEvent(level_up_events, 'NHF_kiria_spec_lvl_up',
function(hero)
	if contains(kiria_spec.heroes, hero) then
		local max_spell_level = ceil(GetHeroLevel(hero) / kiria_spec.lvl_divisor)
		if (random(100) + 1) <= (kiria_spec.chance_to_learn * 100) then
			local spells_to_learn, n = {}, 0
			for i, school in {MAGIC_SCHOOL_DESTRUCTIVE, MAGIC_SCHOOL_DARK, MAGIC_SCHOOL_LIGHT, MAGIC_SCHOOL_SUMMONING} do
				for j, spell in SPELLS_BY_SCHOOLS[school] do
					if (not KnowHeroSpell(hero, spell)) and (max_spell_level <= GetSpellLevel(spell)) then
						n = n + 1
						spells_to_learn[n] = spell
					end
				end
			end
			if n == 0 then
				return
			else
				local spell_to_learn = GetRandFromT(spells_to_learn)
				TeachHeroSpell(hero, spell_to_learn)
				startThread(ShowFlyingSign, {'/Text/Default/spell_learned.txt'; name = GetSpellName(spell)}, hero, GetObjectOwner(hero), 5.0)
			end
		end
	end
end)