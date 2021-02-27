NHF_IsHeroAlive_or_sabotag_amund_flag = 0;
NHF_mass_amund_mines_sabotag = {} ;
NHF_object_mass_amund_mines_sabotag_players = {};
NHF_hero_mass_amund_mines_sabotag_players = {} ;
NHF_mas_name_mines_creature = {};
-----------------------------------------
for i, name_mines in  NHF_GetMines(0) do
NHF_mass_amund_mines_sabotag[i] = "";
NHF_mas_name_mines_creature[i] = name_mines;
end;

--for i= 1, 8  do
--NHF_object_mass_amund_mines_sabotag_players[i] = "";
--end;
-----------------------------------------
--for i= 1, 8  do
--NHF_hero_mass_amund_mines_sabotag_players[i] = "";
--end;
-----------------------------------------
function  nhf_Amund_F (hero, OBJECT_TOUCH)
errorHook(error_nhf_Amund_F);
local  name_mines ,flag_sabotag;
flag_sabotag = 0;
--NHF_object_mass_amund_mines_sabotag_players[GetObjectOwner(hero)] = OBJECT_TOUCH;
--NHF_hero_mass_amund_mines_sabotag_players[GetObjectOwner(hero)] = hero;
for i, name_mines in  NHF_GetMines(0)  do
if  (NHF_mass_amund_mines_sabotag[i] == OBJECT_TOUCH)   then
if  hero ==  "Amund" then
QuestionBoxForPlayers(GetObjectOwner(hero),"/MapObjects/Dwarves/NewHeroes/Amund/NHF_sabotag_mines_amund_fix.txt","nhf_Amund_YesFix_F('"..hero.."','"..OBJECT_TOUCH.."')");
flag_sabotag = 1;
else
QuestionBoxForPlayers(GetObjectOwner(hero),"/MapObjects/Dwarves/NewHeroes/Amund/NHF_sabotag_mines_NoAmund_fix.txt","nhf_Amund_YesFix_F('"..hero.."','"..OBJECT_TOUCH.."')");
end;
end;
end;
if (flag_sabotag == 0) and (hero ==  "Amund") then
QuestionBoxForPlayers(GetObjectOwner(hero),"/MapObjects/Dwarves/NewHeroes/Amund/NHF_sabotag_mines_amund_bad.txt" ,"nhf_Amund_Yes_F('"..hero.."','"..OBJECT_TOUCH.."')");
end;
errorHook(error_nhf_Amund_F);
end;
-----------------------------------------
function  nhf_Amund_Yes_F(hero,OBJECT_TOUCH)
errorHook(error_nhf_AmundGood_F);
if  (IsHeroAlive("Amund") == true) then
ChangeHeroStat("Amund", STAT_MOVE_POINTS, - GetHeroStat("Amund", STAT_MOVE_POINTS));
for i, name_mines in  NHF_GetMines(0)  do
if (name_mines == OBJECT_TOUCH)  then
NHF_mass_amund_mines_sabotag[i] = name_mines ;
SetObjectEnabled(name_mines, nil);
SetObjectOwner(name_mines, PLAYER_NONE);
if (NHF_mas_name_mines_creature[i]~= "non")   then
NHF_mas_name_mines_creature[i] = "non";
end;
end;
end;
end;
errorHook(error_nhf_AmundGood_F);
end;
-----------------------------------------
function  nhf_Amund_YesFix_F(hero,OBJECT_TOUCH)
errorHook(error_nhf_AmundGood_F);
local  name_mines
local temp_name
  if GetHeroTown("Amund") ~= nil then
    temp_name = GetHeroTown("Amund");
  else
    temp_name = "Amund";
  end;
if  hero ~= "Amund" then
if GetPlayerResource(GetCurrentPlayer(), GOLD) >= 5000 then
SetPlayerResource(GetCurrentPlayer(), GOLD,GetPlayerResource(GetCurrentPlayer(), GOLD)-5000)
for i, name_mines in  NHF_mass_amund_mines_sabotag  do
if (name_mines == OBJECT_TOUCH)   then
NHF_mass_amund_mines_sabotag[i] = "" ;
NHF_mas_name_mines_creature[i] = name_mines;
SetObjectEnabled(name_mines, true);
if GetObjectOwner(hero) == GetObjectOwner(temp_name) then
SetObjectOwner(name_mines, GetObjectOwner(temp_name));
sleep(1);
MakeHeroInteractWithObject(hero,name_mines );
else
MakeHeroInteractWithObject(hero,name_mines )
end;

--SetObjectOwner(name_mines, GetCurrentPlayer());
ChangeHeroStat(hero, STAT_MOVE_POINTS, - GetHeroStat(hero, STAT_MOVE_POINTS));
end;
end;
else
MessageBoxForPlayers(GetCurrentPlayer(),"/MapObjects/Dwarves/NewHeroes/Amund/NHF_sabotag_mines_amund_NoMoney.txt");
end;
else
if GetPlayerResource(GetCurrentPlayer(), GOLD) >= 2500 then
SetPlayerResource(GetCurrentPlayer(), GOLD,GetPlayerResource(GetCurrentPlayer(), GOLD)-2500)
for i, name_mines in  NHF_mass_amund_mines_sabotag  do
if (name_mines == OBJECT_TOUCH)   then
NHF_mass_amund_mines_sabotag[i] = "" ;
NHF_mas_name_mines_creature[i] = name_mines;
SetObjectEnabled(name_mines, true);
--SetObjectOwner(name_mines, GetObjectOwner("Amund"));
ChangeHeroStat("Amund", STAT_MOVE_POINTS, - GetHeroStat("Amund", STAT_MOVE_POINTS));
sleep(1);
MakeHeroInteractWithObject("Amund",name_mines )
end;
end;
else
MessageBoxForPlayers(GetCurrentPlayer(),"/MapObjects/Dwarves/NewHeroes/Amund/NHF_sabotag_mines_amund_NoMoney.txt");
end;
--for i, name_mines in  NHF_mass_amund_mines_sabotag  do
--if (name_mines == OBJECT_TOUCH)   then
--NHF_mass_amund_mines_sabotag[i] = "" ;
--SetObjectEnabled(name_mines, true);
--SetObjectOwner(name_mines, GetCurrentPlayer());
--end;
--end;
end;
errorHook(error_nhf_AmundGood_F);
end;
-----------------------------------------
function  nhf_AmundDay_F ()
errorHook(error_nhf_Amund_F);
local day_temp = 0;
while(1) do
    if (day_temp < GetDate(ABSOLUTE_DAY)) and (IsHeroAlive("Amund") == true) then
       day_temp = GetDate(ABSOLUTE_DAY);
       for i, name_mines in  NHF_mas_name_mines_creature  do
           if (name_mines == "non" ) then
                  AddObjectCreatures(NHF_mass_amund_mines_sabotag[i], CREATURE_BROWLER,ceil(GetHeroLevel("Amund")/5));
           end;
       end;
    end;
sleep(4);
end;
errorHook(error_nhf_Amund_F);
end;
-----------------------------------------
function  error_nhf_Amund_F ()
print("error:nhf_Amund_F");
end;
-----------------------------------------
function  error_nhf_AmundGood_F ()
print("NONerror:nhf_Amund_F");
end;
-----------------------------------------
startThread(nhf_AmundDay_F);