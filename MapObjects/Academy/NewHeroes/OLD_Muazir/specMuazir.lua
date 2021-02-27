NHF_flag_Nuazir = 0 ;
function  nhf_Muazir_F ()
errorHook(error_nhf_Muazir_F);
local index_battle;
local index_battle_next = -1;
while(1) do
  index_battle = GetLastSavedCombatIndex();
  if (IsHeroAlive("Muazir") == true) then
    ControlHeroCustomAbility("Muazir", CUSTOM_ABILITY_3, CUSTOM_ABILITY_ENABLED);
    if   (index_battle ~= index_battle_next) and ((GetSavedCombatArmyHero(index_battle, 1)== "Muazir")or (GetSavedCombatArmyHero(index_battle, 0)== "Muazir")) then
      index_battle_next =  index_battle ;
      NHF_flag_Nuazir = 0;
      else
      if  NHF_flag_Nuazir == 1 then
        ChangeHeroStat("Muazir", STAT_MANA_POINTS,GetHeroLevel("Muazir") - GetHeroStat("Muazir", STAT_MANA_POINTS));
        ControlHeroCustomAbility("Muazir", CUSTOM_ABILITY_3, CUSTOM_ABILITY_DISABLED );
      end;
    end;
  end;
  errorHook(error_nhf_Muazir_F);
  sleep(2);
end;
end;

function  nhf_Muazir_CUSTOM_F (hero,CUSTOM_ABILITY)
errorHook(error_nhf_Muazir_F);
if (CUSTOM_ABILITY==CUSTOM_ABILITY_3) and (hero == "Muazir") and (NHF_flag_Nuazir == 0) then
  ChangeHeroStat("Muazir", STAT_MANA_POINTS,GetHeroLevel("Muazir") - GetHeroStat("Muazir", STAT_MANA_POINTS));
  ControlHeroCustomAbility("Muazir", CUSTOM_ABILITY_3, CUSTOM_ABILITY_DISABLED );
  NHF_flag_Nuazir = 1 ;
  GiveHeroBattleBonus("Muazir", HERO_BATTLE_BONUS_DEFENCE, ceil( GetHeroLevel("Muazir")/3));
  GiveHeroBattleBonus("Muazir", HERO_BATTLE_BONUS_ATTACK, ceil( GetHeroLevel("Muazir")/3));
end;
errorHook(error_nhf_Muazir_F);
end;
---------------------------------------------
function  error_nhf_Muazir_F ()
print("error:nhf_Muazir_F");
end;
---------------------------------------------
startThread(nhf_Muazir_F)