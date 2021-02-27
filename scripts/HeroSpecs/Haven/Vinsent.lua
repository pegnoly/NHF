--NHF---------------ВИНСЕНТ-------------------
vinsent_spec =
{
  path = "/MapObjects/Haven/NewHeroes/Vinsent/",
  heroes = {'Vinsent', 'Vinsent_copy_1', 'Vinsent_copy_2', 'Vinsent_copy_3', 'Vinsent_copy_4', 'Vinsent_copy_5', 'Vinsent_copy_6', 'Vinsent_copy_7', 'Vinsent_copy_8'},
  saved_levels = {},
  lvl_divisor = 3,
}

function  error_NHF_Vinsent_F ()
	print("error:NHF_Vinsent_F");
end;

AddEvent(map_loading_events, 'NHF_vinsent_spec_init',
function()
  for i, hero in vinsent_spec.heroes do
    vinsent_spec.saved_levels[hero] = -1
  end
end)

AddEvent(level_up_events, 'NHF_vinsent_spec_lvl_up',
function(hero)
  if contains(vinsent_spec.heroes, hero) then
    errorHook(error_NHF_Vinsent_F)
    local temp_name = NHF_tempName_F(hero);
    if (ceil(GetHeroLevel(hero) / vinsent_spec.lvl_divisor) > (ceil(vinsent_spec.saved_levels[hero] / vinsent_spec.lvl_divisor))) then
       vinsent_spec.saved_levels[hero] = GetHeroLevel(hero);
       ChangeHeroStat(hero, STAT_KNOWLEDGE, 1)
  	   sleep(NHF_slep_singl)
  	   startThread(NHF_ShowFlyMessage, vinsent_spec.path.."NHF_Vinsent_prirost.txt", temp_name, 5)
    end
  end
end)