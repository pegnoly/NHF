--BlockGame()

----------------Проверка версии 3.1----------------------------------------------------
NHF31 = 1;
function NHF_not3_1F()
	ExitGame();
end;
function  error31_F ()
	--print("error: not 3.1");
	sleep(3);
	if NHF31 == 0 then
		MessageBox("/Text/NHF_3.1.txt", "NHF_not3_1F");
	end;
end; 
function  Valid31_F ()
	--errorHook(error31_F);
	NHF31 = 0;
	startThread(error31_F);
	ceil(3.1);
	NHF31 = 1;	
end; 
startThread(Valid31_F);

----------------Загрузка дополнительных имён объектов из текущей карты:-----------------
NHF_UNNAMED_OBJECTS = {GARRISON = {},DWARVEN_WARREN = {}};
NHF_OBJECT_GROUPS = {SUBTERRA_GATE = {},MONOLITH_ONE_WAY_ENTRANCE = {},	MONOLITH_ONE_WAY_EXIT = {},MONOLITH_TWO_WAY = {}};
doFile(GetMapDataPath().."NHF-Names.lua");

----------------Загрузка констант специализаций героев----------------------------------
doFile("/scripts/NHF_Heroes_percent_spec.lua");

----------------Проверка режима игры, через который запущена карта ч.1------------------
NHF_multiplayer = 1;
NHF_slep_singl = 1;
consoleCmd('@NHF_multiplayer = 0');

--------------------------------------Constants-----------------------------------------
--Общие пути для подсказок
NHF_Add_mana_textPath = "/Text/NHF_add_stat/NHF_mana_prirost.txt";  
--Количество  маны по-умолчанию за единицу знания                     
NHF_K_Znanie_Mana = 10;
--Массивы артефактов по силе в игре
NHF_mass_MinorArt={1,3,5,8,14,16,18,20,27,29,32,52,55,60,61,62,64,65,66,70,80,84,86,87,90,93};
NHF_mass_MajorArt={2,4,9,17,19,21,23,25,28,31,34,36,37,38,39,40,41,42,43,58,59,63,71,74,75,81,82,85,88,92,94,95};
NHF_mass_RelictArt={11,13,15,33,35,44,45,46,47,48,49,50,51,67,68,69,83,91};
--Массивы заклинаний по уровням гильдии
NHF_mass_spell_1 = {SPELL_MAGIC_FIST,SPELL_LAND_MINE,SPELL_BLESS,SPELL_HASTE,SPELL_CURSE,SPELL_SLOW,SPELL_SORROW,SPELL_MAGIC_ARROW,SPELL_STONE_SPIKES};
NHF_mass_spell_2 = {SPELL_WASP_SWARM,SPELL_ANIMATE_DEAD,SPELL_ARCANE_CRYSTAL,SPELL_STONESKIN,SPELL_DISPEL,SPELL_REGENERATION,SPELL_DISRUPTING_RAY,SPELL_PLAGUE,SPELL_LIGHTNING_BOLT,SPELL_ICE_BOLT};
NHF_mass_spell_3 = {SPELL_PHANTOM,SPELL_BLADE_BARRIER,SPELL_EARTHQUAKE,SPELL_BLOODLUST,SPELL_DEFLECT_ARROWS,SPELL_WEAKNESS,SPELL_FORGETFULNESS,SPELL_FIREBALL,SPELL_FROST_RING,SPELL_FIREWALL};
NHF_mass_spell_4 = {SPELL_SUMMON_ELEMENTALS,SPELL_SUMMON_HIVE,SPELL_ANTI_MAGIC,SPELL_TELEPORT,SPELL_DIVINE_VENGEANCE,SPELL_BERSERK,SPELL_BLIND,SPELL_CHAIN_LIGHTNING,SPELL_METEOR_SHOWER};
NHF_mass_spell_5 = {SPELL_CONJURE_PHOENIX,SPELL_CELESTIAL_SHIELD,SPELL_RESURRECT,SPELL_HOLY_WORD,SPELL_UNHOLY_WORD,SPELL_HYPNOTIZE,SPELL_VAMPIRISM,SPELL_IMPLOSION,SPELL_DEEP_FREEZE,SPELL_ARMAGEDDON};
--Массив заклинаний магии света
NHF_mass_spells_svet = {SPELL_BLESS,SPELL_HASTE,SPELL_STONESKIN,SPELL_DISPEL,SPELL_REGENERATION,SPELL_BLOODLUST,SPELL_DEFLECT_ARROWS,SPELL_ANTI_MAGIC,SPELL_TELEPORT,SPELL_DIVINE_VENGEANCE,SPELL_RESURRECT,SPELL_HOLY_WORD};
--Массив заклинаний магии тьмы
NHF_mass_spells_tma = {SPELL_CURSE, SPELL_SLOW, SPELL_SORROW, SPELL_DISRUPTING_RAY, SPELL_PLAGUE, SPELL_WEAKNESS, SPELL_FORGETFULNESS,  SPELL_BLIND, SPELL_BERSERK, SPELL_VAMPIRISM, SPELL_HYPNOTIZE, SPELL_UNHOLY_WORD};
--Массив боевых кличей
NHF_mass_klich = {[SPELL_WARCRY_RALLING_CRY] = 2, [SPELL_WARCRY_CALL_OF_BLOOD] = 2, [SPELL_WARCRY_WORD_OF_THE_CHIEF] = 6, [SPELL_WARCRY_FEAR_MY_ROAR] = 6, [SPELL_WARCRY_BATTLECRY] = 11, [SPELL_WARCRY_SHOUT_OF_MANY] = 11}; -- ID и уровень для изучения
--Массив городов
--NHF_mass_towns = GetObjectNamesByType("TOWN"); --Переведено на NHF_names_objects.towns 0.73s
--Массив существ и городов с карты
NHF_names_objects = {};
NHF_names_objects.creature = GetObjectNamesByType("CREATURE");
NHF_names_objects.towns = GetObjectNamesByType("TOWN");
NHF_names_objects.mines={[0]=nil};
NHF_names_objects.garisson={[0]=nil};
--Массив неживых существ
--NHF_mass_notAlive = {29,30,31,32,33,34,35,36,37,38,39,40,41,42,152,153,154,155,156,157,158,59,60,61,62,160,161,104,105,172,85,86,87,88,89,90,116};
NHF_mass_not_living = {[29]=1, [30]=1, [31]=1, [32]=1, [33]=1, [34]=1, [35]=1, [36]=1, [37]=1, [38]=1, [39]=1, [40]=1, [41]=1, [42]=1, [59]=1, [60]=1, [61]=1, [62]=1, [347]=1, [234]=1, [244]=1, [182]=1, [355]=1, [183]=1, [366]=1, [363]=1, [496]=1, [243]=1, [501]=1, [500]=1, [371]=1, [188]=1, [383]=1, [511]=1, [88]=1, [379]=1, [388]=1, [389]=1, [184]=1, [185]=1, [90]=1, [193]=1, [400]=1, [401]=1, [284]=1, [204]=1, [205]=1, [202]=1, [203]=1, [200]=1, [418]=1, [201]=1, [294]=1, [291]=1, [420]=1, [288]=1, [424]=1, [429]=1, [298]=1, [157]=1, [597]=1, [471]=1, [437]=1, [155]=1, [444]=1, [158]=1, [441]=1, [104]=1, [442]=1, [156]=1, [417]=1, [105]=1, [313]=1, [219]=1, [414]=1, [218]=1, [412]=1, [152]=1, [453]=1, [312]=1, [89]=1, [116]=1, [86]=1, [85]=1, [207]=1, [609]=1, [331]=1, [328]=1, [206]=1, [161]=1, [87]=1, [237]=1, [160]=1, [225]=1, [339]=1, [239]=1, [153]=1, [154]=1, [304]=1, [172]=1, [358]=1, [295]=1};
--Массив существ колдунов
NHF_mass_caster = {[347]=1, [170]=1, [345]=1, [357]=1, [356]=1, [244]=1, [182]=1, [82]=1, [124]=1, [367]=1, [63]=1, [241]=1, [497]=1, [499]=1, [176]=1, [369]=1, [190]=1, [191]=1, [189]=1, [186]=1, [388]=1, [390]=1, [10]=1, [999]=1, [386]=1, [101]=1, [44]=1, [100]=1, [606]=1, [604]=1, [597]=1, [498]=1, [192]=1, [280]=1, [281]=1, [282]=1, [283]=1, [284]=1, [86]=1, [50]=1, [212]=1, [26]=1, [456]=1, [202]=1, [455]=1, [454]=1, [277]=1, [49]=1, [279]=1, [201]=1, [64]=1, [423]=1, [210]=1, [200]=1, [290]=1, [289]=1, [288]=1, [425]=1, [424]=1, [360]=1, [148]=1, [420]=1, [298]=1, [432]=1, [434]=1, [418]=1, [110]=1, [412]=1, [221]=1, [408]=1, [407]=1, [405]=1, [368]=1, [441]=1, [350]=1, [348]=1, [38]=1, [344]=1, [342]=1, [123]=1, [240]=1, [336]=1, [449]=1, [325]=1, [25]=1, [453]=1, [231]=1, [156]=1, [116]=1, [335]=1, [462]=1, [143]=1, [460]=1, [461]=1, [162]=1, [230]=1, [226]=1, [235]=1, [237]=1, [341]=1, [245]=1, [339]=1, [239]=1, [278]=1, [238]=1, [112]=1, [81]=1, [295]=1, [294]=1};
--Массив неэлементальных драконов
NHF_non_elemental_dragons = { [41]=1, [42]=1, [55]=1, [56]=1, [83]=1, [84]=1, [144]=1, [151]=1, [158]=1, [284]=1, [311]=1, [327]=1, [331]=1, [333]=1, [385]=1, [408]=1};
--Массив уровней существ
NHF_tiers_creatures = {[1]=1, [2]=1, [3]=2, [4]=2, [5]=3, [6]=3, [7]=4, [8]=4, [9]=5, [10]=5, [11]=6, [12]=6, [13]=7, [14]=7, [15]=1, [16]=1, [17]=2, [18]=2, [19]=3, [20]=3, [21]=4, [22]=4, [23]=5, [24]=5, [25]=6, [26]=6, [27]=7, [28]=7, [29]=1, [30]=1, [31]=2, [32]=2, [33]=3, [34]=3, [35]=4, [36]=4, [37]=5, [38]=5, [39]=6, [40]=6, [41]=7, [42]=7, [43]=1, [44]=1, [45]=2, [46]=2, [47]=3, [48]=3, [49]=4, [50]=4, [51]=5, [52]=5, [53]=6, [54]=6, [55]=7, [56]=7, [57]=1, [58]=1, [59]=2, [60]=2, [61]=3, [62]=3, [63]=4, [64]=4, [65]=5, [66]=5, [67]=6, [68]=6, [69]=7, [70]=7, [71]=1, [72]=1, [73]=2, [74]=2, [75]=3, [76]=3, [77]=4, [78]=4, [79]=5, [80]=5, [81]=6, [82]=6, [83]=7, [84]=7, [85]=4, [86]=4, [87]=4, [88]=4, [89]=6, [90]=6, [91]=7, [92]=1, [93]=1, [94]=2, [95]=2, [96]=3, [97]=3, [98]=4, [99]=4, [100]=5, [101]=5, [102]=6, [103]=6, [104]=7, [105]=7, [106]=1, [107]=2, [108]=3, [109]=4, [110]=5, [111]=6, [112]=7, [113]=4, [114]=4, [115]=6, [116]=5, [117]=1, [118]=1, [119]=2, [120]=2, [121]=3, [122]=3, [123]=4, [124]=4, [125]=5, [126]=5, [127]=6, [128]=6, [129]=7, [130]=7, [131]=1, [132]=2, [133]=3, [134]=4, [135]=5, [136]=6, [137]=7, [138]=1, [139]=2, [140]=3, [141]=4, [142]=5, [143]=6, [144]=7, [145]=1, [146]=2, [147]=3, [148]=4, [149]=5, [150]=6, [151]=7, [152]=1, [153]=2, [154]=3, [155]=4, [156]=5, [157]=6, [158]=7, [159]=1, [160]=2, [161]=3, [162]=4, [163]=5, [164]=6, [165]=7, [166]=1, [167]=2, [168]=3, [169]=4, [170]=5, [171]=6, [172]=7, [173]=1, [174]=2, [175]=3, [176]=4, [177]=5, [178]=6, [179]=7, [180]=7, [181]=7, [182]=5, [183]=6, [184]=7, [185]=5, [186]=4, [187]=4, [188]=4, [189]=6, [190]=6, [191]=6, [192]=6, [193]=6, [197]=4, [198]=4, [199]=4, [200]=4, [201]=4, [202]=4, [203]=4, [204]=4, [205]=4, [206]=4, [207]=4, [208]=2, [209]=7, [210]=7, [211]=7, [212]=5, [213]=4, [214]=4, [215]=4, [216]=4, [217]=3, [218]=4, [219]=4, [220]=6, [221]=6, [222]=6, [223]=4, [224]=4, [225]=4, [226]=5, [227]=3, [228]=1, [229]=4, [230]=5, [231]=5, [232]=3, [233]=1, [234]=2, [235]=5, [236]=4, [237]=5, [238]=6, [239]=6, [240]=6, [241]=7, [242]=4, [243]=2, [244]=6, [245]=4, [246]=3, [247]=5, [248]=5, [249]=4, [273]=3, [274]=3, [275]=3, [276]=6, [277]=6, [278]=5, [279]=4, [280]=4, [281]=4, [282]=5, [283]=5, [284]=7, [285]=6, [286]=6, [287]=6, [288]=5, [289]=6, [290]=5, [291]=8, [294]=5, [295]=5, [297]=5, [298]=1, [299]=3, [304]=6, [311]=7, [312]=5, [313]=6, [325]=4, [326]=7, [327]=7, [328]=7, [329]=7, [330]=7, [331]=7, [332]=7, [333]=7, [334]=6, [335]=6, [336]=6, [337]=6, [338]=6, [339]=6, [340]=6, [341]=6, [342]=5, [343]=5, [344]=5, [345]=5, [346]=5, [347]=5, [348]=5, [349]=5, [350]=4, [351]=4, [352]=4, [353]=4, [354]=4, [355]=4, [356]=4, [357]=4, [358]=3, [359]=3, [360]=3, [361]=3, [362]=3, [363]=3, [364]=3, [365]=3, [366]=2, [367]=2, [368]=2, [369]=2, [370]=2, [371]=2, [372]=2, [373]=2, [374]=1, [375]=1, [376]=1, [377]=1, [378]=1, [379]=1, [380]=1, [381]=1, [383]=8, [384]=4, [385]=8, [386]=10, [387]=2, [388]=10, [389]=8, [390]=7, [391]=4, [392]=7, [393]=1, [394]=1, [395]=3, [396]=1, [397]=2, [398]=2, [399]=4, [400]=5, [401]=2, [402]=3, [403]=6, [404]=6, [405]=6, [406]=4, [407]=6, [408]=8, [409]=4, [412]=7, [413]=3, [414]=6, [415]=6, [416]=6, [417]=6, [418]=6, [419]=7, [420]=5, [423]=7, [424]=2, [425]=6, [428]=2, [429]=2, [430]=4, [431]=2, [432]=8, [433]=3, [434]=6, [435]=3, [436]=1, [437]=3, [438]=3, [439]=3, [440]=5, [441]=4, [442]=2, [443]=4, [444]=6, [445]=3, [446]=4, [447]=5, [448]=5, [449]=4, [450]=6, [451]=6, [452]=6, [453]=5, [454]=5, [455]=5, [456]=5, [457]=3, [458]=3, [459]=3, [460]=4, [461]=4, [462]=4, [471]=2, [496]=6, [497]=4, [498]=4, [499]=7, [500]=5, [501]=5, [502]=2, [511]=2, [597]=4, [599]=2, [600]=1, [601]=2, [602]=3, [603]=4, [604]=5, [605]=6, [606]=7, [609]=3, [999]=8};
--Массив существ по фракциям, уровням
NHF_mass_creatures = 
{
  ["Haven"] = {
    ["L1"] = {
        ["ID"] = {[0]= CREATURE_PEASANT  , [1]= CREATURE_MILITIAMAN , [2]= CREATURE_LANDLORD},
        ["Name"] = {[0]="/Text/Game/Creatures/Haven/Peasant.txt" , [1]="/Text/Game/Creatures/Haven/Militiaman.txt", [2]="/Text/Game/Creatures/Haven/Landlord.txt"}
    },
    ["L2"] = {
        ["ID"] = {[0]= CREATURE_ARCHER  , [1]= CREATURE_MARKSMAN , [2]= CREATURE_LONGBOWMAN},
        ["Name"] = {[0]="/Text/Game/Creatures/Haven/Archer.txt" , [1]="/Text/Game/Creatures/Haven/Marksman.txt", [2]="/Text/Game/Creatures/Haven/Longbowman.txt"}
    },	
    ["L3"] = {
        ["ID"] = {[0]= CREATURE_FOOTMAN  , [1]= CREATURE_SWORDSMAN , [2]= CREATURE_VINDICATOR},
        ["Name"] = {[0]="/Text/Game/Creatures/Haven/Footman.txt" , [1]="/Text/Game/Creatures/Haven/Swordsman.txt", [2]="/Text/Game/Creatures/Haven/Vindicator.txt"}
    },
    ["L4"] = {
        ["ID"] = {[0]= CREATURE_GRIFFIN  , [1]= CREATURE_ROYAL_GRIFFIN , [2]= CREATURE_BATTLE_GRIFFIN},
        ["Name"] = {[0]="/Text/Game/Creatures/Haven/Griffin.txt" , [1]="/Text/Game/Creatures/Haven/RoyalGriffin.txt", [2]="/Text/Game/Creatures/Haven/BattleGriffin.txt"}
    },
    ["L5"] = {
        ["ID"] = {[0]= CREATURE_PRIEST  , [1]= CREATURE_CLERIC , [2]= CREATURE_ZEALOT},
        ["Name"] = {[0]="/Text/Game/Creatures/Haven/Priest.txt" , [1]="/Text/Game/Creatures/Haven/Cleric.txt", [2]="/Text/Game/Creatures/Haven/Zealot.txt"}
    }
  },
  ["Inferno"] = {
    ["L1"] = {
        ["ID"] = {[0]= CREATURE_FAMILIAR , [1]= CREATURE_IMP , [2]= CREATURE_QUASIT},
        ["Name"] = {[0]="/Text/Game/Creatures/Inferno/Familiar.txt" , [1]="/Text/Game/Creatures/Inferno/Imp.txt", [2]="/Text/Game/Creatures/Inferno/3rd/Quasit_Name.txt"}
    },
    ["L3"] = {
        ["ID"] = {[0]= CREATURE_HELL_HOUND , [1]= CREATURE_CERBERI , [2]= CREATURE_FIREBREATHER_HOUND},
        ["Name"] = {[0]="/Text/Game/Creatures/Inferno/HellHound.txt" , [1]="/Text/Game/Creatures/Inferno/Cerberi.txt", [2]="/Text/Game/Creatures/Inferno/3rd/FirebreatherHound_Name.txt"}
    },
    ["L4"] = {
        ["ID"] = {[0]= CREATURE_SUCCUBUS , [1]= CREATURE_INFERNAL_SUCCUBUS , [2]= CREATURE_SUCCUBUS_SEDUCER},
        ["Name"] = {[0]="/Text/Game/Creatures/Inferno/Succubus.txt" , [1]="/Text/Game/Creatures/Inferno/InfernalSuccubus.txt", [2]="/Text/Game/Creatures/Inferno/3rd/SuccubusSeducer_Name.txt"}
    },
    ["L6"] = {
        ["ID"] = {[0]= CREATURE_PIT_FIEND , [1]= CREATURE_BALOR , [2]= CREATURE_PIT_SPAWN},
        ["Name"] = {[0]="/Text/Game/Creatures/Inferno/PitFiend.txt" , [1]="/Text/Game/Creatures/Inferno/Balor.txt", [2]="/Text/Game/Creatures/Inferno/3rd/PitSpawn_Name.txt"}
    }
  },  
  ["Necropolis"] = {
    ["L1"] = {
        ["ID"] = {[0]= CREATURE_SKELETON  , [1]= CREATURE_SKELETON_ARCHER , [2]= CREATURE_SKELETON_WARRIOR},
        ["Name"] = {[0]="/Text/Game/Creatures/Necropolis/Skeleton.txt" , [1]="/Text/Game/Creatures/Necropolis/Skeleton_Archer.txt", [2]="/Text/Game/Creatures/Necropolis/3rd/SkeletonWarrior_Name.txt"}
    },
    ["L2"] = {
        ["ID"] = {[0]= CREATURE_WALKING_DEAD  , [1]= CREATURE_ZOMBIE , [2]= CREATURE_DISEASE_ZOMBIE},
        ["Name"] = {[0]="/Text/Game/Creatures/Necropolis/Walking_Dead.txt" , [1]="/Text/Game/Creatures/Necropolis/Zombie.txt", [2]="/Text/Game/Creatures/Necropolis/3rd/DiseaseZombie_Name.txt"}
    },	
    ["L4"] = {
        ["ID"] = {[0]= CREATURE_VAMPIRE  , [1]= CREATURE_VAMPIRE_LORD , [2]= CREATURE_NOSFERATU},
        ["Name"] = {[0]="/Text/Game/Creatures/Necropolis/Vampire.txt" , [1]="/Text/Game/Creatures/Necropolis/Vampire_Lord.txt", [2]="/Text/Game/Creatures/Necropolis/3rd/Nosferatu_Name.txt"}
    },	
    ["L5"] = {
        ["ID"] = {[0]= CREATURE_LICH , [1]= CREATURE_DEMILICH , [2]= CREATURE_LICH_MASTER},
        ["Name"] = {[0]="/Text/Game/Creatures/Necropolis/Lich.txt" , [1]="/Text/Game/Creatures/Necropolis/Demilich.txt", [2]="/Text/Game/Creatures/Necropolis/3rd/LichMaster_Name.txt"}
    }
  },  
  ["Preserve"] = {
     ["L1"] = {
        ["ID"] = {[0]= CREATURE_PIXIE  , [1]= CREATURE_SPRITE , [2]= CREATURE_DRYAD},
        ["Name"] = {[0]="/Text/Game/Creatures/Preserve/Pixie.txt" , [1]="/Text/Game/Creatures/Preserve/Sprite.txt", [2]="/Text/Game/Creatures/Preserve/3rd/Dryad_Name.txt"}
    }, 
    ["L2"] = {
        ["ID"] = {[0]= CREATURE_BLADE_JUGGLER  , [1]= CREATURE_WAR_DANCER , [2]= CREATURE_BLADE_SINGER},
        ["Name"] = {[0]="/Text/Game/Creatures/Preserve/Blade_Juggler.txt" , [1]="/Text/Game/Creatures/Preserve/War_Dancer.txt", [2]="/Text/Game/Creatures/Preserve/3rd/BladeSinger_Name.txt"}
    },
    ["L3"] = {
        ["ID"] = {[0]= CREATURE_WOOD_ELF  , [1]= CREATURE_GRAND_ELF , [2]= CREATURE_SHARP_SHOOTER},
        ["Name"] = {[0]="/Text/Game/Creatures/Preserve/Wood_Elf.txt" , [1]="/Text/Game/Creatures/Preserve/Grand_Elf.txt", [2]="/Text/Game/Creatures/Preserve/3rd/SharpShooter_Name.txt"}
    },
    ["L4"] = {
        ["ID"] = {[0]= CREATURE_DRUID  , [1]= CREATURE_DRUID_ELDER , [2]= CREATURE_HIGH_DRUID},
        ["Name"] = {[0]="/Text/Game/Creatures/Preserve/Druid.txt" , [1]="/Text/Game/Creatures/Preserve/Druid_Elder.txt", [2]="/Text/Game/Creatures/Preserve/3rd/HighDruid_Name.txt"}
    },	
    ["L5"] = {
        ["ID"] = {[0]= CREATURE_UNICORN  , [1]= CREATURE_WAR_UNICORN , [2]= CREATURE_WHITE_UNICORN},
        ["Name"] = {[0]="/Text/Game/Creatures/Preserve/Unicorn.txt" , [1]="/Text/Game/Creatures/Preserve/War_Unicorn.txt", [2]="/Text/Game/Creatures/Preserve/3rd/WhiteUnicorn_Name.txt"}
    }	
  }, 
  ["Dungeon"] = {
    ["L1"] = {
        ["ID"] = {[0]= CREATURE_SCOUT  , [1]= CREATURE_ASSASSIN , [2]= CREATURE_STALKER},
        ["Name"] = {[0]="/Text/Game/Creatures/Dungeon/Scout.txt" , [1]="/Text/Game/Creatures/Dungeon/Assassin.txt", [2]="/Text/Game/Creatures/Dungeon/3rd/Stalker_Name.txt"}
    },
    ["L2"] = {
        ["ID"] = {[0]= CREATURE_WITCH  , [1]= CREATURE_BLOOD_WITCH , [2]= CREATURE_BLOOD_WITCH_2},
        ["Name"] = {[0]="/Text/Game/Creatures/Dungeon/Witch.txt" , [1]="/Text/Game/Creatures/Dungeon/Blood_Witch.txt", [2]="/Text/Game/Creatures/Dungeon/3rd/BloodWitch2_Name.txt"}
    },
    ["L3"] = {
        ["ID"] = {[0]= CREATURE_MINOTAUR  , [1]= CREATURE_MINOTAUR_KING , [2]= CREATURE_MINOTAUR_CAPTAIN},
        ["Name"] = {[0]="/Text/Game/Creatures/Dungeon/Minotaur.txt" , [1]="/Text/Game/Creatures/Dungeon/Minotaur_King.txt", [2]="/Text/Game/Creatures/Dungeon/3rd/MinotaurCaptain_Name.txt"}
    },	
    ["L4"] = {
        ["ID"] = {[0]= CREATURE_RIDER  , [1]= CREATURE_RAVAGER , [2]= CREATURE_BLACK_RIDER},
        ["Name"] = {[0]="/Text/Game/Creatures/Dungeon/Rider.txt" , [1]="/Text/Game/Creatures/Dungeon/Ravager.txt", [2]="/Text/Game/Creatures/Dungeon/3rd/BlackRider_Name.txt"}	
	},	
    ["L6"] = {
        ["ID"] = {[0]= CREATURE_MATRON  , [1]= CREATURE_MATRIARCH , [2]= CREATURE_SHADOW_MISTRESS},
        ["Name"] = {[0]="/Text/Game/Creatures/Dungeon/Matron.txt" , [1]="/Text/Game/Creatures/Dungeon/Matriarch.txt", [2]="/Text/Game/Creatures/Dungeon/3rd/ShadowMistress_Name.txt"}
    }	
  },    
  ["Academy"] = {
    ["L1"] = {
        ["ID"] = {[0]=  CREATURE_GREMLIN , [1]= CREATURE_MASTER_GREMLIN, [2]= CREATURE_GREMLIN_SABOTEUR},
        ["Name"] = {[0]="/Text/Game/Creatures/Academy/Gremlin.txt" , [1]="/Text/Game/Creatures/Academy/Master_Gremlin.txt", [2]="/Text/Game/Creatures/Academy/3rd/GremlinSaboteur_Name.txt"}
    },
    ["L2"] = {
        ["ID"] = {[0]=  CREATURE_STONE_GARGOYLE , [1]= CREATURE_OBSIDIAN_GARGOYLE  , [2]= CREATURE_MARBLE_GARGOYLE},
        ["Name"] = {[0]="/Text/Game/Creatures/Academy/Stone_Gargoyle.txt" , [1]="/Text/Game/Creatures/Academy/Obsidian_Gargoyle.txt", [2]="/Text/Game/Creatures/Academy/3rd/MarbleGargoyle_Name.txt"}
    },
    ["L3"] = {
        ["ID"] = {[0]=  CREATURE_IRON_GOLEM , [1]= CREATURE_STEEL_GOLEM  , [2]= CREATURE_OBSIDIAN_GOLEM},
        ["Name"] = {[0]="/Text/Game/Creatures/Academy/Iron_Golem.txt" , [1]="/Text/Game/Creatures/Academy/Steel_Golem.txt", [2]="/Text/Game/Creatures/Academy/3rd/ObsidianGolem_Name.txt"}
    },	
    ["L4"] = {
        ["ID"] = {[0]=  CREATURE_MAGI , [1]= CREATURE_ARCH_MAGI  , [2]= CREATURE_COMBAT_MAGE},
        ["Name"] = {[0]="/Text/Game/Creatures/Academy/Magi.txt" , [1]="/Text/Game/Creatures/Academy/Arch_Magi.txt", [2]="/Text/Game/Creatures/Academy/3rd/CombatMage_Name.txt"}
    },	
    ["L5"] = {
        ["ID"] = {[0]=  CREATURE_GENIE , [1]= CREATURE_MASTER_GENIE  , [2]= CREATURE_DJINN_VIZIER},
        ["Name"] = {[0]="/Text/Game/Creatures/Academy/Genie.txt" , [1]="/Text/Game/Creatures/Academy/Master_Genie.txt", [2]="/Text/Game/Creatures/Academy/3rd/DjinnVizier_Name.txt"}
    },	
    ["L6"] = {
        ["ID"] = {[0]=  CREATURE_RAKSHASA , [1]= CREATURE_RAKSHASA_RUKH  , [2]= CREATURE_RAKSHASA_KSHATRI},
        ["Name"] = {[0]="/Text/Game/Creatures/Academy/Rakshasa.txt" , [1]="/Text/Game/Creatures/Academy/Rakshasa_Rukh.txt", [2]="/Text/Game/Creatures/Academy/3rd/RakshasaKshatri_Name.txt"}
    }
  },  
  ["Dwarves"] = {
    ["L2"] = {
        ["ID"] = {[0]= CREATURE_AXE_FIGHTER  , [1]= CREATURE_AXE_THROWER, [2]= CREATURE_HARPOONER},
        ["Name"] = {[0]="/Text/Game/Creatures/Dwarf/Axe_Fighter.txt" , [1]="/Text/Game/Creatures/Dwarf/Axe_Thrower.txt", [2]="/Text/Game/Creatures/Dwarf/3rd/Harpooner_Name.txt"}
    },  
     ["L3"] = {
        ["ID"] = {[0]= CREATURE_BEAR_RIDER  , [1]= CREATURE_BLACKBEAR_RIDER , [2]= CREATURE_WHITE_BEAR_RIDER},
        ["Name"] = {[0]="/Text/Game/Creatures/Dwarf/Bear_Raider.txt" , [1]="/Text/Game/Creatures/Dwarf/Blackbear_Raider.txt", [2]="/Text/Game/Creatures/Dwarf/3rd/WhiteBearRider_Name.txt"}
    }, 
    ["L4"] = {
        ["ID"] = {[0]= CREATURE_BROWLER  , [1]= CREATURE_BERSERKER , [2]= CREATURE_BATTLE_RAGER},
        ["Name"] = {[0]="/Text/Game/Creatures/Dwarf/Brawler.txt" , [1]="/Text/Game/Creatures/Dwarf/Berserker.txt", [2]="/Text/Game/Creatures/Dwarf/3rd/BattleRager_Name.txt"}
    },
    ["L5"] = {
        ["ID"] = {[0]= CREATURE_RUNE_MAGE  , [1]= CREATURE_FLAME_MAGE , [2]= CREATURE_FLAME_KEEPER},
        ["Name"] = {[0]="/Text/Game/Creatures/Dwarf/Rune_Mage.txt" , [1]="/Text/Game/Creatures/Dwarf/Flame_Mage.txt", [2]="/Text/Game/Creatures/Dwarf/3rd/FlameKeeper_Name.txt"}
    }	
  },
  ["Stronghold"] = {
    ["L3"] = {
        ["ID"] = {[0]= CREATURE_ORC_WARRIOR  , [1]= CREATURE_ORC_SLAYER , [2]= CREATURE_ORC_WARMONGER},
        ["Name"] = {[0]="/Text/Game/Creatures/Orcs/Orc_slayer.txt" , [1]="/Text/Game/Creatures/Orcs/Shaman2.txt", [2]="/Text/Game/Creatures/Orcs/3rd/OrcWarmonger_Name.txt"}
    },
    ["L4"] = {
        ["ID"] = {[0]= CREATURE_SHAMAN  , [1]= CREATURE_SHAMAN_WITCH , [2]= CREATURE_SHAMAN_HAG},
        ["Name"] = {[0]="/Text/Game/Creatures/Orcs/Shaman.txt" , [1]="/Text/Game/Creatures/Orcs/Shaman2.txt", [2]="/Text/Game/Creatures/Orcs/3rd/ShamanHag_Name.txt"}
    },  
    ["L5"] = {
        ["ID"] = {[0]= CREATURE_ORCCHIEF_BUTCHER  , [1]= CREATURE_ORCCHIEF_EXECUTIONER , [2]= CREATURE_ORCCHIEF_CHIEFTAIN},
        ["Name"] = {[0]="/Text/Game/Creatures/Orcs/OrcChief1.txt" , [1]="/Text/Game/Creatures/Orcs/OrcChief2.txt", [2]="/Text/Game/Creatures/Orcs/3rd/OrcchiefChieftain_Name.txt"}
    }
  }
};
--Массив путей названий существ по ID by RedHeavenHero -0.78
NHF_mass_name_cr = 
{
	"Haven/Peasant","Haven/Militiaman","Haven/Archer","Haven/Marksman","Haven/Footman","Haven/Swordsman","Haven/Griffin","Haven/RoyalGriffin","Haven/Priest","Haven/Cleric","Haven/Cavalier","Haven/Paladin","Haven/Angel","Haven/Archangel",
	"Inferno/Familiar","Inferno/Imp","Inferno/Demon","Inferno/HornedDemon","Inferno/HellHound","Inferno/Cerberi","Inferno/Succubus","Inferno/InfernalSuccubus","Inferno/Nightmare","Inferno/FrightfulNightmare","Inferno/PitFiend","Inferno/Balor","Inferno/Devil","Inferno/ArchDevil",
	"Necropolis/Skeleton","Necropolis/Skeleton_Archer","Necropolis/Walking_Dead","Necropolis/Zombie","Necropolis/Manes","Necropolis/Ghosts","Necropolis/Vampire","Necropolis/Vampire_Lord","Necropolis/Lich","Necropolis/Demilich","Necropolis/Wight","Necropolis/Wraith","Necropolis/Bone_Dragon","Necropolis/Shadow_Dragon",
	"Preserve/Pixie","Preserve/Sprite","Preserve/Blade_Juggler","Preserve/War_Dancer","Preserve/Wood_Elf","Preserve/Grand_Elf",	"Preserve/Druid","Preserve/Druid_Elder","Preserve/Unicorn","Preserve/War_Unicorn","Preserve/Treant","Preserve/Treant_Guardian","Preserve/Green_Dragon","Preserve/Gold_Dragon",
	"Academy/Gremlin","Academy/Master_Gremlin","Academy/Stone_Gargoyle","Academy/Obsidian_Gargoyle","Academy/Iron_Golem","Academy/Steel_Golem","Academy/Magi","Academy/Arch_Magi","Academy/Genie","Academy/Master_Genie","Academy/Rakshasa","Academy/Rakshasa_Rukh","Academy/Giant","Academy/Titan",
	"Dungeon/Scout","Dungeon/Assassin","Dungeon/Witch","Dungeon/Blood_Witch","Dungeon/Minotaur","Dungeon/Minotaur_King","Dungeon/Rider","Dungeon/Ravager","Dungeon/Hydra","Dungeon/Chaos_Hydra","Dungeon/Matron","Dungeon/Matriarch","Dungeon/Deep_Dragon","Dungeon/Black_Dragon",
	"Neutrals/Fire_Elemental","Neutrals/Water_Elemental","Neutrals/Earth_Elemental","Neutrals/Air_Elemental","Neutrals/Black_Knight","Neutrals/Death_Knight","Neutrals/Phoenix",
	"Dwarf/Defender","Dwarf/Stout_Defender","Dwarf/Axe_Fighter","Dwarf/Axe_Thrower","Dwarf/Bear_Raider","Dwarf/Blackbear_Raider","Dwarf/Brawler","Dwarf/Berserker","Dwarf/Rune_Mage","Dwarf/Flame_Mage","Dwarf/Thane","Dwarf/Warlord","Dwarf/Fire_Dragon","Dwarf/Magma_Dragon",
	"Haven/Landlord","Haven/Longbowman","Haven/Vindicator","Haven/BattleGriffin","Haven/Zealot","Haven/Champion","Haven/Seraph",
	"Neutrals/Wolf/name","Neutrals/SnowApe/name","Neutrals/Manticore/name","Neutrals/Mummy/name",
	"Orcs/Goblin1","Orcs/Goblin2","Orcs/Centaur1","Orcs/Centaur2","Orcs/Orc1","Orcs/Orc2","Orcs/Shaman1","Orcs/Shaman2","Orcs/OrcChief1","Orcs/OrcChief2","Orcs/Wyvern1","Orcs/Wyvern2","Orcs/Cyclop1","Orcs/Cyclop2",
	"Inferno/3rd/Quasit_Name","Inferno/3rd/HornedLeaper_Name","Inferno/3rd/FirebreatherHound_Name","Inferno/3rd/SuccubusSeducer_Name","Inferno/3rd/Hellmare_Name","Inferno/3rd/PitSpawn_Name","Inferno/3rd/ArchDemon_Name",
	"Dungeon/3rd/Stalker_Name","Dungeon/3rd/BloodWitch2_Name","Dungeon/3rd/MinotaurCaptain_Name","Dungeon/3rd/BlackRider_Name","Dungeon/3rd/AcidicHydra_Name","Dungeon/3rd/ShadowMistress_Name","Dungeon/3rd/RedDragon_Name",
	"Preserve/3rd/Dryad_Name","Preserve/3rd/BladeSinger_Name","Preserve/3rd/SharpShooter_Name","Preserve/3rd/HighDruid_Name","Preserve/3rd/WhiteUnicorn_Name","Preserve/3rd/AngerTreant_Name","Preserve/3rd/RainbowDragon_Name",
	"Necropolis/3rd/SkeletonWarrior_Name","Necropolis/3rd/DiseaseZombie_Name","Necropolis/3rd/Poltergeist_Name","Necropolis/3rd/Nosferatu_Name",	"Necropolis/3rd/LichMaster_Name","Necropolis/3rd/Banshee_Name","Necropolis/3rd/HorrorDragon_Name",
	"Academy/3rd/GremlinSaboteur_Name","Academy/3rd/MarbleGargoyle_Name","Academy/3rd/ObsidianGolem_Name","Academy/3rd/CombatMage_Name","Academy/3rd/DjinnVizier_Name","Academy/3rd/RakshasaKshatri_Name","Academy/3rd/StormLord_Name",
	"Dwarf/3rd/StoneDefender_Name","Dwarf/3rd/Harpooner_Name","Dwarf/3rd/WhiteBearRider_Name","Dwarf/3rd/BattleRager_Name","Dwarf/3rd/FlameKeeper_Name","Dwarf/3rd/ThunderThane_Name","Dwarf/3rd/LavaDragon_Name",
	"Orcs/3rd/GoblinDefiler_Name","Orcs/3rd/CentaurMaradeur_Name","Orcs/3rd/OrcWarmonger_Name","Orcs/3rd/ShamanHag_Name","Orcs/3rd/OrcchiefChieftain_Name","Orcs/3rd/WyvernPaokai_Name","Orcs/3rd/CyclopBloodeyed_Name",
	"Neutrals/ThunderBird","Neutrals/FireBird",	"Necropolis/Pen","Neutrals/Apocalypse_Knight","Neutrals/UndeadCyclops/name","Neutrals/Ballista/name","Neutrals/Winterwolf/name","Neutrals/Worg/name","Neutrals/ArcaneBlades/name","Neutrals/NatureGiant","Neutrals/PyroGiant","Neutrals/Atlante","Neutrals/GeoGiant","Neutrals/NecroGiant",nil,nil,nil,"Neutrals/Pirate/name","Neutrals/Corsair/name","Neutrals/Vitaler/name","Neutrals/Ice_Elemental","Neutrals/Mist_Elemental","Neutrals/Storm_Elemental","Neutrals/Gaze_Elemental","Neutrals/Magma_Elemental","Neutrals/Obsidian_Elemental","Neutrals/Blaze_Elemental","Neutrals/Energy_Elemental","Neutrals/Satyr/name","Darkness/Fallen_Angel","Darkness/Chaos_Angel","Darkness/Apocalypse_Angel","Neutrals/Enchanter/name","Neutrals/Sun_Warrior/name","Neutrals/Basilisk/name","Neutrals/GreaterBasilisk/name","Neutrals/Salamander/name","Neutrals/Pikeman/name","Neutrals/Witch/name","Neutrals/Minos/name","Neutrals/Dendroid/name","Neutrals/Dendroid_Guardian/name","Neutrals/Dendroid_Soldier/name","Neutrals/Devaster/name","Neutrals/Maradeur/name","Neutrals/Vopar/name","Neutrals/Schismatic/name","Neutrals/Chastener/name","Neutrals/Robber/name","Neutrals/Armatier/name","Neutrals/Hermit/name","Neutrals/Eucharister/name","Neutrals/Guerrier/name","Neutrals/Arsonist/name","Neutrals/Malachite/name","Neutrals/Nunkuga/name","Neutrals/Komthur/name","Neutrals/Sexton/name","Neutrals/Kali/name","Neutrals/Kikimora/name","Neutrals/Pit_Overseer/name","Neutrals/Cherub/name","Neutrals/Kutrub/name","Neutrals/Cadaver/name","Neutrals/Namtar/name","Neutrals/Succubus_Emaciater/name","Neutrals/Gnoll/name","Neutrals/Dragon_Hunter/name","Neutrals/Pegasus/name","Neutrals/Ulfheadnar/name";
	[273] = "Darkness/Shadow_Daughter",[274] = "Darkness/Chaos_Daughter",[275] = "Darkness/Night_Shadow",[276] = "Neutrals/Templar/name",[277] = "Neutrals/Challenger/name",[278] = "Neutrals/Heretic",[279] = "Darkness/Lost_Soul",[280] = "Darkness/Fury_Soul",[281] = "Darkness/Damned_Soul",[282] = "Neutrals/Planeswalker/name",[283] = "Neutrals/Runelord/name",[284] = "Neutrals/Dragon_Knight/name",[285] = "Darkness/Keeper",[286] = "Darkness/Dark_Guard",[287] = "Darkness/Shadow_Guard",[288] = "Neutrals/Animist/name",[289] = "Neutrals/Vala/name",[290] = "Neutral/NCF/Creature_290_Name",[291] = "Neutrals/NCF_Crystal_Dragon/name",[294] = "Neutrals/Mumie/name",[295] = "Neutrals/Mumieigen/name",[297] = "Neutrals/Seviziatrice/name",[298] = "Neutrals/Skeleton_Mage/name",[299] = "Neutrals/Brigand/name",[304] = "Neutral/NecroRakshasa",[311] = "Neutrals/Neutrals/RoyalBasilisk_Name",[312] = "Neutrals/GhostKnight",[313] = "Neutrals/GuardianIdol_Name",[325] = "Neutrals/magog/name",[326] = "Academy/Colossus",[327] = "Dungeon/AcidDragon",[328] = "Dwarf/FieryDragon",[329] = "Haven/GuardianAngel",[330] = "Inferno/3rd/AlphaDevil_Name",[331] = "Necropolis/TerrorDragon",[332] = "Orcs/3rd/CyclopesThrower_Name",[333] = "Preserve/3rd/CrystalDragon_Name",[334] = "Academy/RakshasaRaja",[335] = "Dungeon/Mistress",[336] = "Dwarf/StoneLord",[337] = "Haven/Templar",[338] = "Inferno/Annihilator",[339] = "Necropolis/ColdDeath",[340] = "Orcs/DemonicWyvern",[341] = "Preserve/Treant_Symbiotic",[342] = "Academy/Djinn",[343] = "Dungeon/LavaHydra",[344] = "Dwarf/FireMage",[345] = "Haven/Zelote",[346] = "Inferno/3rd/Frightmare_Name",[347] = "Necropolis/3rd/PoisonousLich_Name",[348] = "Orcs/GiantSlayer",[349] = "Preserve/3rd/Pure_Unicorn_Name",[350] = "Academy/GreaterMage",[351] = "Dungeon/BlackChampion",[352] = "Dwarf/Fighter",[353] = "Haven/WarGriffin",[354] = "Inferno/3rd/HatefulSuccubus_Name",[355] = "Necropolis/MetaVampire_name",[356] = "Orcs/DarkWitch",[357] = "Preserve/HiveDruid_Name",[358] = "Academy/3rd/WarriorGolem_Name",[359] = "Dungeon/Minotaur_Brute",[360] = "Dwarf/Greybear_Raider",[361] = "Haven/Commander",[362] = "Inferno/HellRage",[363] = "Necropolis/3rd/Fantome_Name",[364] = "Orcs/OrcDemon",[365] = "Preserve/3rd/SwiftArcher_Name",[366] = "Academy/3rd/BasaltGargoyle_Name",[367] = "Dungeon/3rd/ShadowWitch2_Name",[368] = "Dwarf/3rd/Blader_Name",[369] = "Neutrals/Artificier",[370] = "Inferno/3rd/BrutalDemon_Name",[371] = "Necropolis/3rd/VampireZombie_Name",[372] = "Orcs/CentaurScout",[373] = "Preserve/3rd/Fly_Dancer_Name",[374] = "Academy/3rd/BazookaGremlin_Name",[375] = "Dungeon/Poisonner",[376] = "Dwarf/ShieldDefender",[377] = "Haven/Simplet",[378] = "Inferno/3rd/MagicImp_Name",[379] = "Necropolis/3rd/SkeletonLegion_Name",[380] = "Orcs/WarriorGoblin",[381] = "Preserve/3rd/Farfadet_Name",[383] = "Neutrals/MystoDragon_Name",[384] = "Neutrals/Ninja_Name",[385] = "Neutrals/LaserDragon_Name",[386] = "Neutrals/ArcaneMaster_Name",[387] = "Neutrals/CaptainCentaur_Name",[388] = "Neutrals/Abyss_Angel/name",[389] = "Neutrals/Balrog/name",[390] = "Neutrals/Abyss_Princess/name",[391] = "Neutrals/RoyalGuard/name",[392] = "Neutrals/Naga/name",[393] = "Neutrals/Wisp/name",[394] = "Neutrals/WispElder/name",[395] = "Neutrals/Meduse_Name",[396] = "Neutrals/PoisonedWisp/name",[397] = "Neutrals/Walk1/name",[398] = "Neutrals/Walk2/name",[399] = "Neutrals/Royal_Guard/name",[400] = "Neutrals/GhostCharger_Name",[401] = "Neutrals/ZombiDog/name",[402] = "Neutrals/SamuraiN",[403] = "Neutrals/MagmaGiant/MagmaGiant",[404] = "Neutrals/Stone_Demon_Name",[405] = "Neutrals/SeasGolem/SeasGolem",[406] = "Neutrals/Doppleganger/name",[407] = "Neutrals/AquamancerN",[408] = "Neutrals/AzureDragon_Name",[409] = "Neutrals/SpEl/SpEl",[412] = "Neutrals/Death_Angel",[413] = "Neutrals/Grunt/Grunt",[414] = "Neutrals/Sp/Sp",[415] = "Neutrals/Garuda_Name",[416] = "Neutrals/NEArcher/NEArcher",[417] = "Neutral/ShivaRakshasa",[418] = "Neutrals/LichKing_Name",[419] = "Neutrals/NEHuntress/NEHuntress",[420] = "Neutrals/Crystal_Name",[423] = "Neutrals/WizardKing_Name",[424] = "Neutrals/Banshee/Banshee",[425] = "Neutrals/TellGolem/TellGolem",[428] = "Neutrals/CentDefender/name",[429] = "Neutrals/Zombie_Warrior/name",[430] = "Neutrals/FeralGriffin/name",[431] = "Neutrals/Tracker/name",[432] = "Neutrals/Incubus/name",[433] = "Neutrals/Feeler/name",[434] = "Neutrals/Meykongr/name",[435] = "Neutrals/Nalstag/name",[436] = "Neutrals/Condotier/name",[437] = "Neutrals/Revenger/name",[438] = "Neutrals/Axeman/name",[439] = "Neutrals/Tirailleur/name",[440] = "Neutrals/Banneret/name",[441] = "Neutrals/Adamant_Golem/name",[442] = "Neutrals/Lazurite/name",[443] = "Neutrals/Maenad/name",[444] = "Neutrals/Pontianak/name",[445] = "Neutrals/Troglodyte/name",[446] = "Neutrals/Peri/name",[447] = "Neutrals/Trollop/name",[448] = "Neutrals/Erinya/name",[449] = "Neutrals/Ulem/name",[450] = "Neutrals/Scorpicore/name",[451] = "Neutrals/Supreme/name",[452] = "Neutrals/Ancient/name",[453] = "Neutrals/Burned/name",[454] = "Neutrals/Summoner/name",[455] = "Neutrals/High_Summoner/name",[456] = "Neutrals/Battle_Summoner/name",[457] = "Neutrals/Asker/name",[458] = "Neutrals/Turgak/name",[459] = "Neutrals/Gaplan/name",[460] = "Neutral/LostMageN",[461] = "Neutral/DecayMageN",[462] = "Neutral/HavocMageN",[471] = "Neutrals/Arcane Bow_Name",[496] = "Neutrals/Lycanthrope/name",[497] = "Neutrals/Zenithale/name",[498] = "Neutrals/Zenithale/name",[499] = "Neutrals/magical_whore/name",[500] = "Neutrals/Ballista01/name",[501] = "Neutrals/Ballista02/name",[502] = "Neutrals/LuckyCharm/name",[511] = "Neutrals/Kvartz/name",[600] = "Haven/Recruit/name",[601] = "Haven/Bowman/name",[602] = "Haven/Kneht/name",[603] = "Haven/Grifon/name",[604] = "Haven/Chaplain/name",[605] = "Haven/Knight/name",[606] = "Haven/ElratAngel/name",[609] = "Neutrals/Spectre/name",[999] = "Neutrals/MemoryMentor/name"
};
--Общий файл для прироста существ после битвы для некоторых специальностей
NHF_textPath_prirost = "/Text/NHF_prirost.txt" ;

--Массив заклинаний
NHF_SPELL_TABLE_NAME = 1;         -- название папки с именем и описанием заклинания
NHF_SPELL_TABLE_SKILL = 2;        -- требуемая школа магии (-1 для походных)
NHF_SPELL_TABLE_SKILL_LEVEL = 3;  -- уровень заклинания
SPELL_EMPOWERED_DEEP_FREEZE = 298;
NHF_spell_table =
{
  [SPELL_MAGIC_ARROW]                = {'Magic_Arrow', SKILL_DESTRUCTIVE_MAGIC, 1},
  [SPELL_EMPOWERED_MAGIC_ARROW]      = {'EmpoweredMagic_Arrow', SKILL_DESTRUCTIVE_MAGIC, 1},
  [SPELL_STONE_SPIKES]               = {'StoneSpikes', SKILL_DESTRUCTIVE_MAGIC, 1},
  [SPELL_EMPOWERED_STONE_SPIKES]     = {'EmpoweredStoneSpikes', SKILL_DESTRUCTIVE_MAGIC, 1},
  [SPELL_LIGHTNING_BOLT]             = {'Lightning_Bolt', SKILL_DESTRUCTIVE_MAGIC, 2},
  [SPELL_EMPOWERED_LIGHTNING_BOLT]   = {'EmpoweredLightning_Bolt', SKILL_DESTRUCTIVE_MAGIC, 2},
  [SPELL_ICE_BOLT]                   = {'Ice_Bolt', SKILL_DESTRUCTIVE_MAGIC, 2},
  [SPELL_EMPOWERED_ICE_BOLT]         = {'EmpoweredIce_Bolt', SKILL_DESTRUCTIVE_MAGIC, 2},
  [SPELL_FIREBALL]                   = {'Fireball', SKILL_DESTRUCTIVE_MAGIC, 3},
  [SPELL_EMPOWERED_FIREBALL]         = {'EmpoweredFireball', SKILL_DESTRUCTIVE_MAGIC, 3},
  [SPELL_FROST_RING]                 = {'Frost_Ring', SKILL_DESTRUCTIVE_MAGIC, 3},
  [SPELL_EMPOWERED_FROST_RING]       = {'EmpoweredFrost_Ring', SKILL_DESTRUCTIVE_MAGIC, 3},
  [SPELL_FIREWALL]                   = {'Firewall', SKILL_DESTRUCTIVE_MAGIC, 3},
  [SPELL_CHAIN_LIGHTNING]            = {'Chain_Lightning', SKILL_DESTRUCTIVE_MAGIC, 4},
  [SPELL_EMPOWERED_CHAIN_LIGHTNING]  = {'EmpoweredChain_Lightning', SKILL_DESTRUCTIVE_MAGIC, 4},
  [SPELL_METEOR_SHOWER]              = {'Meteor_Shower', SKILL_DESTRUCTIVE_MAGIC, 4},
  [SPELL_EMPOWERED_METEOR_SHOWER]    = {'EmpoweredMeteor_Shower', SKILL_DESTRUCTIVE_MAGIC, 4},
  [SPELL_IMPLOSION]                  = {'Implosion', SKILL_DESTRUCTIVE_MAGIC, 5},
  [SPELL_EMPOWERED_IMPLOSION]        = {'EmpoweredImplosion', SKILL_DESTRUCTIVE_MAGIC, 5},
  [SPELL_ARMAGEDDON]                 = {'Armageddon', SKILL_DESTRUCTIVE_MAGIC, 5},
  [SPELL_EMPOWERED_ARMAGEDDON]       = {'EmpoweredArmageddon', SKILL_DESTRUCTIVE_MAGIC, 5},
  [SPELL_DEEP_FREEZE]                = {'DeepFreeze', SKILL_DESTRUCTIVE_MAGIC, 5},
  [SPELL_EMPOWERED_DEEP_FREEZE]      = {'EmpoweredDeepFreeze', SKILL_DESTRUCTIVE_MAGIC, 5},

  [SPELL_BLESS]                      = {'Bless', SKILL_LIGHT_MAGIC, 1},
  [SPELL_HASTE]                      = {'Haste', SKILL_LIGHT_MAGIC, 1},
  [SPELL_STONESKIN]                  = {'Stoneskin', SKILL_LIGHT_MAGIC, 2},
  [SPELL_DISPEL]                     = {'Dispel', SKILL_LIGHT_MAGIC, 2},
  [SPELL_REGENERATION]               = {'Regeneration', SKILL_LIGHT_MAGIC, 2},
  [SPELL_BLOODLUST]                  = {'Bloodlust', SKILL_LIGHT_MAGIC, 3},
  [SPELL_DEFLECT_ARROWS]             = {'Deflect_Arrows', SKILL_LIGHT_MAGIC, 3},
  [SPELL_ANTI_MAGIC]                 = {'Anti-magic', SKILL_LIGHT_MAGIC, 4},
  [SPELL_TELEPORT]                   = {'Teleport', SKILL_LIGHT_MAGIC, 4},
  [SPELL_DIVINE_VENGEANCE]           = {'DivineVengeance', SKILL_LIGHT_MAGIC, 4},
  [SPELL_HOLY_WORD]                  = {'Holy_Word', SKILL_LIGHT_MAGIC, 5},
  [SPELL_RESURRECT]                  = {'Resurrect', SKILL_LIGHT_MAGIC, 5},

  [SPELL_CURSE]                      = {'Curse', SKILL_DARK_MAGIC, 1},
  [SPELL_SORROW]                     = {'SorrowName', SKILL_DARK_MAGIC, 1},
  [SPELL_SLOW]                       = {'Slow', SKILL_DARK_MAGIC, 1},
  [SPELL_DISRUPTING_RAY]             = {'Disrupting_Ray', SKILL_DARK_MAGIC, 2},
  [SPELL_PLAGUE]                     = {'Plague', SKILL_DARK_MAGIC, 2},
  [SPELL_WEAKNESS]                   = {'Weakness', SKILL_DARK_MAGIC, 3},
  [SPELL_FORGETFULNESS]              = {'Forgetfulness', SKILL_DARK_MAGIC, 3},
  [SPELL_BERSERK]                    = {'Berserk', SKILL_DARK_MAGIC, 4},
  [SPELL_BLIND]                      = {'Blind', SKILL_DARK_MAGIC, 4},
  [SPELL_HYPNOTIZE]                  = {'Hypnotize', SKILL_DARK_MAGIC, 5},
  [SPELL_UNHOLY_WORD]                = {'Unholy_Word', SKILL_DARK_MAGIC, 5},
  [SPELL_VAMPIRISM]                  = {'Vampirism', SKILL_DARK_MAGIC, 5},

  [SPELL_MAGIC_FIST]                 = {'Magic_Fist', SKILL_SUMMONING_MAGIC, 1},
  [SPELL_EMPOWERED_MAGIC_FIST]       = {'EmpoweredMagic_Fist', SKILL_SUMMONING_MAGIC, 1},
  [SPELL_LAND_MINE]                  = {'Land_Mine', SKILL_SUMMONING_MAGIC, 1},
  [SPELL_WASP_SWARM]                 = {'Wasp_Swarm', SKILL_SUMMONING_MAGIC, 2},
  [SPELL_ANIMATE_DEAD]               = {'Animate_Dead', SKILL_SUMMONING_MAGIC, 2},
  [SPELL_ARCANE_CRYSTAL]             = {'ArcaneCrystal', SKILL_SUMMONING_MAGIC, 2},
  [SPELL_PHANTOM]                    = {'Phantom', SKILL_SUMMONING_MAGIC, 3},
  [SPELL_EARTHQUAKE]                 = {'Earthquake', SKILL_SUMMONING_MAGIC, 3},
  [SPELL_BLADE_BARRIER]              = {'BladeBarrier', SKILL_SUMMONING_MAGIC, 3},
  [SPELL_SUMMON_ELEMENTALS]          = {'Summon_Elementals', SKILL_SUMMONING_MAGIC, 4},
  [SPELL_SUMMON_HIVE]                = {'SummonHive', SKILL_SUMMONING_MAGIC, 4},
  [SPELL_CELESTIAL_SHIELD]           = {'Celestial_Shield', SKILL_SUMMONING_MAGIC, 5},
  [SPELL_CONJURE_PHOENIX]            = {'ConjurePhoenix', SKILL_SUMMONING_MAGIC, 5},

  [SPELL_SUMMON_BOAT]                = {'Summon_Boat', -1, 2},
  [SPELL_SUMMON_CREATURES]           = {'Summon_Creatures', -1, 3},  
  [SPELL_DIMENSION_DOOR]             = {'DimensionDoor', -1, 4},
  [SPELL_TOWN_PORTAL]                = {'Town_Portal', -1, 5},
  
  [SPELL_WARCRY_RALLING_CRY]		 = {'Warcry_RallingCry', HERO_SKILL_DEMONIC_RAGE, 1},	
  [SPELL_WARCRY_CALL_OF_BLOOD]       = {'Warcry_CallOfBlood', HERO_SKILL_DEMONIC_RAGE, 1},
  [SPELL_WARCRY_WORD_OF_THE_CHIEF]   = {'Warcry_WordOfTheChief', HERO_SKILL_DEMONIC_RAGE, 2},
  [SPELL_WARCRY_FEAR_MY_ROAR]        = {'Warcry_FearMyRoar', HERO_SKILL_DEMONIC_RAGE, 2},
  [SPELL_WARCRY_BATTLECRY]           = {'Warcry_BattleCry', HERO_SKILL_DEMONIC_RAGE, 3},
  [SPELL_WARCRY_SHOUT_OF_MANY]       = {'Warcry_ShoutOfMany', HERO_SKILL_DEMONIC_RAGE, 3}
 };
 
 
 NHF_mass_klich = {[SPELL_WARCRY_RALLING_CRY] = 2, [SPELL_WARCRY_CALL_OF_BLOOD] = 2, [SPELL_WARCRY_WORD_OF_THE_CHIEF] = 6, [SPELL_WARCRY_FEAR_MY_ROAR] = 6, [SPELL_WARCRY_BATTLECRY] = 11, [SPELL_WARCRY_SHOUT_OF_MANY] = 11}; 
-- Массив артефактов
ART_TYPE_WEAPON = 1;    -- оружие
ART_TYPE_SHIELD = 2;    -- щиты
ART_TYPE_BOOTS = 3;     -- сапоги и поножи
ART_TYPE_HELMET = 4;    -- шлемы и шапки
ART_TYPE_ARMOR = 5;     -- кирасы
ART_TYPE_CLOAK = 6;     -- плащи
ART_TYPE_RING = 7;      -- кольца
ART_TYPE_NECKLACE = 8;  -- ожерелья
ART_TYPE_MISC = 9;      -- прочее

ARTEFACT_TABLE_NAME = 1;  -- файл с названием артефакта
ARTEFACT_TABLE_TYPE = 2;  -- тип артефакта
ARTEFACT_TABLE_COST = 3;  -- номинальная цена артефакта 
NHF_artefact_table =
{
	[ARTIFACT_SWORD_OF_RUINS]                = {'SwordOfRuin', ART_TYPE_WEAPON, 5000}, -- Меч Мощи
	[ARTIFACT_GREAT_AXE_OF_GIANT_SLAYING]    = {'Great_Axe_of_giant_slaying', ART_TYPE_WEAPON, 10000}, -- Секира горного короля
	[ARTIFACT_WAND_OF_X]                     = {'Wand_of_x', ART_TYPE_WEAPON, 6700}, -- Палочка с заклинанием
	[ARTIFACT_UNICORN_HORN_BOW]              = {'UnicornHornBow', ART_TYPE_WEAPON, 12000}, -- Лук из рога Единорога
	[ARTIFACT_TITANS_TRIDENT]                = {'Titan`s_trident', ART_TYPE_WEAPON, 6000}, -- Трезубец Титанов
	[ARTIFACT_STAFF_OF_VEXINGS]              = {'Staff_of_vexing', ART_TYPE_WEAPON, 17000}, -- Посох Преисподней
	[ARTIFACT_SHACKLES_OF_WAR]               = {'ShacklesOfWar', ART_TYPE_MISC, 20000}, -- Кандалы неизбежности
	[ARTIFACT_FOUR_LEAF_CLOVER]              = {'Four_leaf_clover', ART_TYPE_MISC, 3000}, -- Четырехлистный клевер
	[ARTIFACT_ICEBERG_SHIELD]                = {'Iceberg_shield', ART_TYPE_SHIELD, 9000}, -- Ледяной щит
	[ARTIFACT_GOLDEN_SEXTANT]                = {'Golden_sextant', ART_TYPE_MISC, 5000}, -- Секстант морских эльфов
	[ARTIFACT_CROWN_OF_COURAGE]              = {'Crown_of_courage', ART_TYPE_HELMET, 12000}, -- Корона льва
	[ARTIFACT_CROWN_OF_MANY_EYES]            = {'Crown_of_many_eyes', ART_TYPE_HELMET, 4000}, -- Корона всевидящего
	[ARTIFACT_PLATE_MAIL_OF_STABILITY]       = {'PlateMailOfStability', ART_TYPE_ARMOR, 28000}, -- Доспехи Забытого Героя
	[ARTIFACT_BREASTPLATE_OF_PETRIFIED_WOOD] = {'Breastplate_of_petrified_wood', ART_TYPE_ARMOR, 5000}, -- Нагрудник огромной мощи
	[ARTIFACT_PEDANT_OF_MASTERY]             = {'Pedant_of_mastery', ART_TYPE_NECKLACE, 20000}, -- Кулон Мастерства
	[ARTIFACT_NECKLACE_OF_BRAVERY]           = {'Necklace_of_bravery', ART_TYPE_NECKLACE, 3000}, -- Ошейник льва
	[ARTIFACT_WEREWOLF_CLAW_NECKLACE]        = {'Werewolf_claw_necklace', ART_TYPE_NECKLACE, 8000}, -- Ожерелье Кровавого Когтя
	[ARTIFACT_EVERCOLD_ICICLE]               = {'Evercold_icicle', ART_TYPE_NECKLACE, 6000}, -- Кулон ледяных объятий
	[ARTIFACT_NECKLACE_OF_POWER]             = {'Necklace_of_power', ART_TYPE_NECKLACE, 10000}, -- Ожерелье победы
	[ARTIFACT_RING_OF_LIGHTING_PROTECTION]   = {'Ring_of_lightning_protection', ART_TYPE_RING, 4000}, -- Кольцо защиты от молний
	[ARTIFACT_RING_OF_LIFE]                  = {'RingOfLife', ART_TYPE_RING, 8000}, -- Кольцо жизненной силы
	[ARTIFACT_RING_OF_HASTE]                 = {'Ring_of_haste', ART_TYPE_RING, 17000}, -- Кольцо скорости
	[ARTIFACT_NIGHTMARISH_RING]              = {'Nightmarish_ring', ART_TYPE_RING, 7000}, -- Кольцо сломленного духа
	[ARTIFACT_BOOTS_OF_SPEED]                = {'BootsOfSpeed', ART_TYPE_BOOTS, 15000}, -- Сапоги путешественника
	[ARTIFACT_GOLDEN_HORSESHOE]              = {'Golden_horseshoe', ART_TYPE_MISC, 6000}, -- Золотая подкова
	[ARTIFACT_WAYFARER_BOOTS]                = {'Wayfarer_boots', ART_TYPE_BOOTS, 11000}, -- Сапоги открытого пути
	[ARTIFACT_BOOTS_OF_INTERFERENCE]         = {'Boots_of_interference', ART_TYPE_BOOTS, 4000}, -- Сапоги магической защиты
	[ARTIFACT_ENDLESS_SACK_OF_GOLD]          = {'EndlessSackOfGold', ART_TYPE_MISC, 10000}, -- Сума бесконечного золота
	[ARTIFACT_ENDLESS_BAG_OF_GOLD]           = {'Endless_bag_of_gold', ART_TYPE_MISC, 3000}, -- Мешочек бесконечного золота
	[ARTIFACT_ANGEL_WINGS]                   = {'Angel_wings', ART_TYPE_CLOAK, 40000}, -- Крылья ангела
	[ARTIFACT_LION_HIDE_CAPE]                = {'Lion_hide_cape', ART_TYPE_CLOAK, 6000}, -- Накидка с гривой льва
	[ARTIFACT_PHOENIX_FEATHER_CAPE]          = {'Phoenix_feather_cape', ART_TYPE_CLOAK, 6000}, -- Накидка из перьев феникса
	[ARTIFACT_CLOAK_OF_MOURNING]             = {'Cloak_of_mourning', ART_TYPE_CLOAK, 13000}, -- Плащ Смертоносной Тени
	[ARTIFACT_HELM_OF_ENLIGHTMENT]           = {'Helm_of_enlightenment', ART_TYPE_HELMET, 6000}, -- Тюрбан просвещенности
	[ARTIFACT_CHAIN_MAIL_OF_ENLIGHTMENT]     = {'Chain_mail_of_enlightenment', ART_TYPE_ARMOR, 10000}, -- Кольчуга просвещенности
	[ARTIFACT_DRAGON_SCALE_ARMOR]            = {'Dragon_scale_armor', ART_TYPE_ARMOR, 10500}, -- Доспехи из чешуи дракона
	[ARTIFACT_DRAGON_SCALE_SHIELD]           = {'DragonscaleShield', ART_TYPE_SHIELD, 10500}, -- Щит из чешуи дракона
	[ARTIFACT_DRAGON_BONE_GRAVES]            = {'Dragon_bone_greaves', ART_TYPE_BOOTS, 10500}, -- Поножи из кости дракона
	[ARTIFACT_DRAGON_WING_MANTLE]            = {'Dragon_wing_mantle', ART_TYPE_CLOAK, 10500}, -- Мантия из крыльев дракона
	[ARTIFACT_DRAGON_TEETH_NECKLACE]         = {'Dragon_teeth_necklace', ART_TYPE_NECKLACE, 10500}, -- Ожерелье из зубов дракона
	[ARTIFACT_DRAGON_TALON_CROWN]            = {'Dragon_talon_crown', ART_TYPE_HELMET, 10500}, -- Корона из когтей дракона
	[ARTIFACT_DRAGON_EYE_RING]               = {'Dragon_eye_ring', ART_TYPE_RING, 13000}, -- Кольцо Глаз дракона
	[ARTIFACT_DRAGON_FLAME_TONGUE]           = {'Dragon_flame_tongue', ART_TYPE_WEAPON, 14000}, -- Пламенный язык дракона
	[ARTIFACT_ROBE_OF_MAGI]                  = {'Robe_of_magi', ART_TYPE_ARMOR, 15000}, -- Халат Сар-Иссы
	[ARTIFACT_STAFF_OF_MAGI]                 = {'Staff_of_magi', ART_TYPE_WEAPON, 20000}, -- Посох Сар-Иссы
	[ARTIFACT_CROWN_OF_MAGI]                 = {'Crown_of_magi', ART_TYPE_HELMET, 15000}, -- Корона Сар-Иссы
	[ARTIFACT_RING_OF_MAGI]                  = {'Ring_of_magi', ART_TYPE_RING, 20000}, -- Кольцо Сар-Иссы
	[ARTIFACT_DWARVEN_MITHRAL_CUIRASS]       = {'Dwarven_mithral_cuirass', ART_TYPE_ARMOR, 17500}, -- Кираса короля гномов
	[ARTIFACT_DWARVEN_MITHRAL_GREAVES]       = {'Dwarven_mithral_greaves', ART_TYPE_BOOTS, 17000}, -- Поножи короля гномов
	[ARTIFACT_DWARVEN_MITHRAL_HELMET]        = {'Dwarven_mithral_helmet', ART_TYPE_HELMET, 17000}, -- Шлем короля гномов
	[ARTIFACT_DWARVEN_MITHRAL_SHIELD]        = {'Dwarven_mithral_shield', ART_TYPE_SHIELD, 17000}, -- Щит короля гномов
	[ARTIFACT_SCROLL_OF_SPELL_X]             = {'ScrollOfSpell', ART_TYPE_MISC, 5000}, -- Магический свиток с заклинанием
	[ARTIFACT_GRAAL]                         = {'Graal', ART_TYPE_MISC, 20000}, -- Слеза Асхи
	[ARTIFACT_BOOTS_OF_LEVITATION]           = {'Boots_of_levitation', ART_TYPE_BOOTS, 20000}, -- Сапоги левитации
	[ARTIFACT_SKULL_HELMET]                  = {'Skull_Helmet', ART_TYPE_HELMET, 5000}, -- Шлем некроманта
	[ARTIFACT_VALORIOUS_ARMOR]               = {'Valorious_Armor', ART_TYPE_ARMOR, 5500}, -- Доспехи бесстрашия
	[ARTIFACT_BOOTS_OF_SWIFTNESS]            = {'Boots_of_Swiftness', ART_TYPE_BOOTS, 7000}, -- Сапоги странника
	[ARTIFACT_MOONBLADE]                     = {'Moonblade', ART_TYPE_WEAPON, 7500}, -- Лунный клинок
	[ARTIFACT_RING_OF_CELERITY]              = {'Ring_of_Celerity', ART_TYPE_RING, 8700}, -- Кольцо стремительности
	[ARTIFACT_BAND_OF_CONJURER]              = {'Band_of_Conjurer', ART_TYPE_RING, 6400}, -- Пояс элементалей
	[ARTIFACT_EARTHSLIDERS]                  = {'Earthsliders', ART_TYPE_BOOTS, 6000}, -- Изумрудные туфли
	[ARTIFACT_RIGID_MANTLE]                  = {'Rigid_Mantle', ART_TYPE_CLOAK, 4000}, -- Плащ Силанны
	[ARTIFACT_JINXING_BAND]                  = {'Jinxing_Band', ART_TYPE_RING, 7000}, -- Проклятое кольцо
	[ARTIFACT_BONESTUDDED_LEATHER]           = {'Bonestudded_Leather', ART_TYPE_ARMOR, 4700}, -- Туника из плоти
	[ARTIFACT_WISPERING_RING]                = {'Wispering_Ring', ART_TYPE_RING, 4500}, -- Кольцо предостережения
	[ARTIFACT_HELM_OF_CHAOS]                 = {'Helm_of_Chaos', ART_TYPE_HELMET, 5500}, -- Шлем Хаоса
	[ARTIFACT_TWISTING_NEITHER]              = {'Twisting_neither', ART_TYPE_NECKLACE, 15000}, -- Кулон Поглощения
	[ARTIFACT_SANDALS_OF_THE_SAINT]          = {'Sandals_of_the_Saint', ART_TYPE_BOOTS, 16000}, -- Сандалии Святого
	[ARTIFACT_SHAWL_OF_GREAT_LICH]           = {'Shawl_of_the_great_lich', ART_TYPE_CLOAK, 20000}, -- Плащ Сандро
	[ARTIFACT_RING_OF_DEATH]                 = {'Ring_of_Death', ART_TYPE_RING, 7000}, -- Кольцо Грешников
	[ARTIFACT_NECROMANCER_PENDANT]           = {'Necromancer_Pendant', ART_TYPE_NECKLACE, 7000}, -- Амулет некроманта
	[ARTIFACT_FREIDA]                        = {'Freida', ART_TYPE_MISC, 999}, -- Фрида (fake)
	[ARTIFACT_RING_OF_THE_SHADOWBRAND]       = {'Ring_of_the_Shadowbrand', ART_TYPE_RING, 999}, -- Кольцо Заклейменных Тенью (fake)
	[ARTIFACT_OGRE_CLUB]                     = {'Ogre_Club', ART_TYPE_WEAPON, 8500}, -- Дубина людоеда
	[ARTIFACT_OGRE_SHIELD]                   = {'Ogre_Shield', ART_TYPE_SHIELD, 8500}, -- Щит людоеда
	[ARTIFACT_TOME_OF_DESTRUCTION]           = {'Tome_of_Destruction', ART_TYPE_MISC, 20000}, -- Том магии Хаоса
	[ARTIFACT_TOME_OF_LIGHT_MAGIC]           = {'Tome_of_Light_Magic', ART_TYPE_MISC, 20000}, -- Том магии Света
	[ARTIFACT_TOME_OF_DARK_MAGIC]            = {'Tome_of_Dark_Magic', ART_TYPE_MISC, 20000}, -- Том магии Тьмы
	[ARTIFACT_TOME_OF_SUMMONING_MAGIC]       = {'Tome_of_Summoning_Magic', ART_TYPE_MISC, 20000}, -- Том магии Призыва
	[ARTIFACT_BEGINNER_MAGIC_STICK]          = {'Beginer_Magic_Stick', ART_TYPE_WEAPON, 5000}, -- Волшебная палочка новичка
	[ARTIFACT_RUNIC_WAR_AXE]                 = {'Runic_War_Axe', ART_TYPE_WEAPON, 10000}, -- Рунный боевой топор
	[ARTIFACT_RUNIC_WAR_HARNESS]             = {'Runic_War_Harness', ART_TYPE_ARMOR, 10000}, -- Рунная боевая упряжь
	[ARTIFACT_SKULL_OF_MARKAL]               = {'Skull_of_Markal', ART_TYPE_MISC, 22000}, -- Череп Маркела
	[ARTIFACT_BEARHIDE_WRAPS]                = {'Bearhide_Wraps', ART_TYPE_CLOAK, 4500}, -- Тайные защитные покровы
	[ARTIFACT_DWARVEN_SMITHY_HUMMER]         = {'Dwarven_Smithy_Hammer', ART_TYPE_WEAPON, 9500}, -- Гномий кузнечный молот
	[ARTIFACT_RUNE_OF_FLAME]                 = {'Rune_of_Flame', ART_TYPE_MISC, 6500}, -- Руна пламени
	[ARTIFACT_TAROT_DECK]                    = {'Tarot_Deck', ART_TYPE_MISC, 5500}, -- Колода Таро
	[ARTIFACT_CROWN_OF_LEADER]               = {'Crown_Of_Leader', ART_TYPE_HELMET, 7000}, -- Корона лидерства
	[ARTIFACT_MASK_OF_DOPPELGANGER]          = {'Mask_Of_Doppelganger', ART_TYPE_HELMET, 20000}, -- Маска справедливости
	[ARTIFACT_EDGE_OF_BALANCE]               = {'Edge_Of_Balance', ART_TYPE_WEAPON, 5500}, -- На грани равновесия
	[ARTIFACT_RING_OF_MACHINE_AFFINITY]      = {'Ring_Of_Machine_Affinity', ART_TYPE_RING, 18000}, -- Кольцо родства с машинами
	[ARTIFACT_HORN_OF_PLENTY]                = {'Horn_Of_Plenty', ART_TYPE_MISC, 10000}, -- Рог изобилия
	[ARTIFACT_RING_OF_UNSUMMONING]           = {'Ring_Of_Unsummoning', ART_TYPE_RING, 4800}, -- Кольцо изгнания
	[ARTIFACT_BOOK_OF_POWER]                 = {'Book_Of_Power', ART_TYPE_MISC, 9000}, -- Том Силы
	[ARTIFACT_TREEBORN_QUIVER]               = {'Treeborn_Quiver', ART_TYPE_MISC, 7000}, -- Изумительный колчан
	[ARTIFACT_PRINCESS]                      = {'Princess_Aelina', ART_TYPE_MISC, 999}, -- Принцесса Аэлина (fake)
};
--Массив всех существ фракции Инферно
NHF_mass_creatures_Inferno = {[15]=1,[16]=1,[131]=1,[17]=1,[18]=1,[132]=1,[19]=1,[20]=1,[133]=1,[21]=1,[22]=1,[134]=1,[23]=1,[24]=1,[135]=1,[25]=1,[26]=1,[136]=1,[27]=1,[18]=1,[137]=1};
------------------------------------- New function ---------------------------------------
-------------------------------------
----------------Запуск следующей функции только тогда, когда завершена предыдущая:-----------------
NHF_threads = {}
function  error_threads_F (func)
	print("error:NHF_threads_F");
end; 
NHF_startExec = function(func)
errorHook(function() %NHF_threads[%func] = nil; errorHook(error_threads_F); end)
	NHF_threads[func] = 1	
	func()
	NHF_threads[func] = nil
end;
function NHF_startThreadOnce(func)
errorHook(error_threads_F);
	if not NHF_threads[func] then
		startThread(NHF_startExec, func)
	end
end;
-- function isFunctionRunning(func)
	-- return %threads[func]
-- end
-------------------------------------
--Проверка героя на карте, замена имени объекта, если герой в городе
function  NHF_tempName_F (hero)
  local temp_name_;
  if GetHeroTown(hero) ~= nil then
		temp_name_ = GetHeroTown(hero);
	else
		temp_name_ = hero;
	end;
	return  temp_name_
end;
-------------------------------------
--Прибавка ресурса для конкретного героя
function  NHF_ChangeResourceHero(resourceKind, quantity, heroName ) 
	if GetHeroTown(heroName) == nil then
		SetPlayerResource( GetObjectOwner(heroName), resourceKind, (GetPlayerResource(GetObjectOwner(heroName), resourceKind ) + quantity), heroName );
	else
		SetPlayerResource( GetObjectOwner(GetHeroTown(heroName)), resourceKind, (GetPlayerResource(GetObjectOwner(GetHeroTown(heroName)), resourceKind ) + quantity));
	end;
	sleep(NHF_slep_singl);
end;
-------------------------------------
--Прикосновение к определённым типам объектов(триггер)
function NHF_TriggerType(type_trigger,type_object, name_function,disable_object)
local name_object ;
local names_objects = GetObjectNamesByType(type_object);
	for i,name_object in names_objects do
		startThread(Trigger,"NHF", type_trigger,name_object,name_function);
		if (disable_object ~= 1) or  (disable_object ~= true) then
			SetObjectEnabled(name_object,nil);
		end;
	end;
end;
-------------------------------------
--Является ли игрок ИИ, с учётом одновременных ходов. Для одновременных ходов GetCurrentPlayer() = -1; --0.81
function NHF_IsAIPlayer (player) 
	local IsAIPlayerYes = 0; 
	if player == -1 then
		IsAIPlayerYes = 0;
	elseif player == 0 then
		IsAIPlayerYes = 0;
	elseif IsAIPlayer(player) == 1 then	
		IsAIPlayerYes = 1;
	else
		IsAIPlayerYes = 0;
	end;
	return IsAIPlayerYes
end;	
-------------------------------------
--Вычисление уровня существа (для стандарта) -- 0.73s - неактуально , теперь есть NHF_tiers_creatures
-- function  NHF_GetHeroTier (creatureID) 
-- local mas_1tier = {1,2,106,15,16,131,29,30,152,43,44,145,57,58,159,71,72,138,92,93,166,117,118,173};
-- local mas_2tier = {3,4,107,17,18,132,31,32,153,45,46,146,59,60,160,73,74,139,94,95,167,119,120,174};
-- local mas_3tier = {5,6,108,19,20,133,33,34,154,47,48,147,61,62,161,75,76,140,96,97,168,121,122,175    ,114};
-- local mas_4tier = {7,8,109,21,22,134,35,36,155,49,50,148,63,64,162,77,78,141,98,99,169,123,124,176    ,85,86,87,88,113};
-- local mas_5tier = {9,10,110,23,24,135,37,38,156,51,52,149,65,66,163,79,80,142,100,101,170,125,126,177    ,116};
-- local mas_6tier = {11,12,111,25,26,136,39,40,157,53,54,150,67,68,164,81,82,143,102,103,171,127,128,178    ,89,90,115};
-- local mas_7tier = {13,14,112,27,28,137,41,42,158,55,56,151,69,70,165,83,84,144,104,105,172,129,130,179};
-- local mas_8tier = {91};
    -- for i1tier,creature in mas_1tier do
        -- if creature == creatureID then
        -- return 1;
        -- end;
    -- end;
    -- for i2tier,creature in mas_2tier do
        -- if creature == creatureID then
        -- return 2;
        -- end;
    -- end;
    -- for i3tier,creature in mas_3tier do
        -- if creature == creatureID then
        -- return 3;
        -- end;
    -- end;
    -- for i4tier,creature in mas_4tier do
        -- if creature == creatureID then
        -- return 4;
        -- end;
    -- end;
    -- for i5tier,creature in mas_5tier do
        -- if creature == creatureID then
        -- return 5;
        -- end;
    -- end;
    -- for i6tier,creature in mas_6tier do
        -- if creature == creatureID then
        -- return 6;
        -- end;
    -- end;
    -- for i7tier,creature in mas_7tier do
        -- if creature == creatureID then
        -- return 7;
        -- end;
    -- end;
    -- for i8tier,creature in mas_8tier do
        -- if creature == creatureID then
        -- return 8;
        -- end;
    -- end;
  -- return 0;
-- end;
--Замена элемента массива 
function NHF_cut_mass(mass, index)
	local mass_temp;
	for i, name in mass do
		if i ~= index then
			mass_temp[i] = name;
		end;
	end;
	return mass_temp
end
--Удаление элемента массива по значениям
function NHF_del_data_mass(mass, data)
if length(mass) == 1 and data ~= mass[1] then
	return mass
end;
if length(mass) <= 1 then
    return {nil}
end;	
	local mass_temp = {};
	local i_del = 0; 
	local k = 0;
	for i, name in mass do
		i_del = i + k;
		if name == data then
			k = -1;
		end;
		mass_temp[i_del] = name;
	end;
	return mass_temp
end
function NHF_Unity_mass(mass1,mass2)
  local mass;
  local long_mass1 = length(mass1);
  local long_mass2 = length(mass2);
    for i = (long_mass1), (long_mass1+long_mass2) do
		if mass2[i-long_mass1] ~= nil then --0.88
			mass1[i] = mass2[i-long_mass1];
		end;
    end;
  mass = mass1;
  return mass
end;
-- --Объединение двух массивов -- изменено 0.82
-- function NHF_Unity_mass(mass1,mass2,uniq)
  -- local mass=mass1;
  -- local mass_temp = mass1;
  -- local long_mass1 = length(mass1);
  -- local long_mass2 = length(mass2);
	-- for i,name in mass1 do
		-- mass[i] = mass1[i];
	-- end;
	-- for i,name in mass2 do
		-- mass[i+long_mass1] = mass2[i];
	-- end; 	 
	-- if (uniq == true) or (uniq == 1) then		
		-- local k = 0;
		-- for i,name_i in mass do
			-- local flag = 0;
			-- for j,name_j in mass do 
				-- if j > i then
					-- if (name_i == name_j) then
						-- flag = 1;	
						-- mass[i] = nil;
						-- break;
					-- end;
				-- end;
			-- end;
			-- if flag == 0 then					
				-- mass_temp[k] = name_i;	
				-- k = k + 1;
			-- end;	
		-- end;
	-- mass = mass_temp;	
	-- end;	
  -- return mass
-- end;
--Инвертирование индексов массива со значениями
function NHF_Invert_mass(mass)
  local mass_temp = {};
	  for i, name in mass do
		 mass_temp[name] = i;
	  end;
  return mass_temp
end;
--Модуль числа "а"
function NHF_modul(a)
  local modul = sqrt(a*a);
  return modul
end;
--Возведение числа в целую степень
function NHF_ceil_stepen(b,s)
  local stepen = 1;
  if (s < 1) or (frac(s) > 0) then
     stepen = 1;
  else
    for i=1,s do
        stepen = b*stepen;
    end;
  end;
  return stepen
end;
--Позволяет писать не очень длинные (до 1000 символов) сообщения прямо в скрипте  by RedHeavenHero --0.71 убрано 0.81 в связи с возможным переводом мода на английский язык
local NHF_env = {
	limit = 1000,
	byte = {["\0"] = 0, ["\1"] = 1, ["\2"] = 2, ["\3"] = 3, ["\4"] = 4, ["\5"] = 5, ["\6"] = 6, ["\7"] = 7, ["\8"] = 8, ["\9"] = 9, ["\n"] = 10, ["\11"] = 11, ["\12"] = 12, ["\13"] = 13, ["\14"] = 14, ["\15"] = 15, ["\16"] = 16, ["\17"] = 17, ["\18"] = 18, ["\19"] = 19, ["\20"] = 20, ["\21"] = 21, ["\22"] = 22, ["\23"] = 23, ["\24"] = 24, ["\25"] = 25, ["\26"] = 26, ["\27"] = 27, ["\28"] = 28, ["\29"] = 29, ["\30"] = 30, ["\31"] = 31, [" "] = 32, ["!"] = 33, ["\""] = 34, ["#"] = 35, ["$"] = 36, ["%"] = 37, ["&"] = 38, ["'"] = 39, ["("] = 40, [")"] = 41, ["*"] = 42, ["+"] = 43, [","] = 44, ["-"] = 45, ["."] = 46, ["/"] = 47, ["0"] = 48, ["1"] = 49, ["2"] = 50, ["3"] = 51, ["4"] = 52, ["5"] = 53, ["6"] = 54, ["7"] = 55, ["8"] = 56, ["9"] = 57, [":"] = 58, [";"] = 59, ["<"] = 60, ["="] = 61, [">"] = 62, ["?"] = 63, ["@"] = 64, A = 65, B = 66, C = 67, D = 68, E = 69, F = 70, G = 71, H = 72, I = 73, J = 74, K = 75, L = 76, M = 77, N = 78, O = 79, P = 80, Q = 81, R = 82, S = 83, T = 84, U = 85, V = 86, W = 87, X = 88, Y = 89, Z = 90, ["["] = 91, ["\\"] = 92, ["]"] = 93, ["^"] = 94, _ = 95, ["`"] = 96, a = 97, b = 98, c = 99, d = 100, e = 101, f = 102, g = 103, h = 104, i = 105, j = 106, k = 107, l = 108, m = 109, n = 110, o = 111, p = 112, q = 113, r = 114, s = 115, t = 116, u = 117, v = 118, w = 119, x = 120, y = 121, z = 122, ["{"] = 123, ["|"] = 124, ["}"] = 125, ["~"] = 126, ["\127"] = 127, ["\128"] = 128, ["\129"] = 129, ["\130"] = 130, ["\131"] = 131, ["\132"] = 132, ["\133"] = 133, ["\134"] = 134, ["\135"] = 135, ["\136"] = 136, ["\137"] = 137, ["\138"] = 138, ["\139"] = 139, ["\140"] = 140, ["\141"] = 141, ["\142"] = 142, ["\143"] = 143, ["\144"] = 144, ["\145"] = 145, ["\146"] = 146, ["\147"] = 147, ["\148"] = 148, ["\149"] = 149, ["\150"] = 150, ["\151"] = 151, ["\152"] = 152, ["\153"] = 153, ["\154"] = 154, ["\155"] = 155, ["\156"] = 156, ["\157"] = 157, ["\158"] = 158, ["\159"] = 159, ["\160"] = 160, ["\161"] = 161, ["\162"] = 162, ["\163"] = 163, ["\164"] = 164, ["\165"] = 165, ["\166"] = 166, ["\167"] = 167, ["\168"] = 168, ["\169"] = 169, ["\170"] = 170, ["\171"] = 171, ["\172"] = 172, ["\173"] = 173, ["\174"] = 174, ["\175"] = 175, ["\176"] = 176, ["\177"] = 177, ["\178"] = 178, ["\179"] = 179, ["\180"] = 180, ["\181"] = 181, ["\182"] = 182, ["\183"] = 183, ["\184"] = 184, ["\185"] = 185, ["\186"] = 186, ["\187"] = 187, ["\188"] = 188, ["\189"] = 189, ["\190"] = 190, ["\191"] = 191, ["\192"] = 192, ["\193"] = 193, ["\194"] = 194, ["\195"] = 195, ["\196"] = 196, ["\197"] = 197, ["\198"] = 198, ["\199"] = 199, ["\200"] = 200, ["\201"] = 201, ["\202"] = 202, ["\203"] = 203, ["\204"] = 204, ["\205"] = 205, ["\206"] = 206, ["\207"] = 207, ["\208"] = 208, ["\209"] = 209, ["\210"] = 210, ["\211"] = 211, ["\212"] = 212, ["\213"] = 213, ["\214"] = 214, ["\215"] = 215, ["\216"] = 216, ["\217"] = 217, ["\218"] = 218, ["\219"] = 219, ["\220"] = 220, ["\221"] = 221, ["\222"] = 222, ["\223"] = 223, ["\224"] = 224, ["\225"] = 225, ["\226"] = 226, ["\227"] = 227, ["\228"] = 228, ["\229"] = 229, ["\230"] = 230, ["\231"] = 231, ["\232"] = 232, ["\233"] = 233, ["\234"] = 234, ["\235"] = 235, ["\236"] = 236, ["\237"] = 237, ["\238"] = 238, ["\239"] = 239, ["\240"] = 240, ["\241"] = 241, ["\242"] = 242, ["\243"] = 243, ["\244"] = 244, ["\245"] = 245, ["\246"] = 246, ["\247"] = 247, ["\248"] = 248, ["\249"] = 249, ["\250"] = 250, ["\251"] = 251, ["\252"] = 252, ["\253"] = 253, ["\254"] = 254, ["\255"] = 255},
	char = {"\1", "\2", "\3", "\4", "\5", "\6", "\7", "\8", "\9", "\n", "\11", "\12", "\13", "\14", "\15", "\16", "\17", "\18", "\19", "\20", "\21", "\22", "\23", "\24", "\25", "\26", "\27", "\28", "\29", "\30", "\31", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "\\", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "{", "|", "}", "~", "\127", "\128", "\129", "\130", "\131", "\132", "\133", "\134", "\135", "\136", "\137", "\138", "\139", "\140", "\141", "\142", "\143", "\144", "\145", "\146", "\147", "\148", "\149", "\150", "\151", "\152", "\153", "\154", "\155", "\156", "\157", "\158", "\159", "\160", "\161", "\162", "\163", "\164", "\165", "\166", "\167", "\168", "\169", "\170", "\171", "\172", "\173", "\174", "\175", "\176", "\177", "\178", "\179", "\180", "\181", "\182", "\183", "\184", "\185", "\186", "\187", "\188", "\189", "\190", "\191", "\192", "\193", "\194", "\195", "\196", "\197", "\198", "\199", "\200", "\201", "\202", "\203", "\204", "\205", "\206", "\207", "\208", "\209", "\210", "\211", "\212", "\213", "\214", "\215", "\216", "\217", "\218", "\219", "\220", "\221", "\222", "\223", "\224", "\225", "\226", "\227", "\228", "\229", "\230", "\231", "\232", "\233", "\234", "\235", "\236", "\237", "\238", "\239", "\240", "\241", "\242", "\243", "\244", "\245", "\246", "\247", "\248", "\249", "\250", "\251", "\252", "\253", "\254", "\255"; [0] = "\0"},
}
function NHF_env.spread(s)
	local t, st, s = {n = 0}, '', s..''
	if s == '' then
		return t
	end
	while t.n < %NHF_env.limit do
		local last = "\255"
		local lastsymbol = ""
		local shift = 0
		local base = 256
		for i=1,8 do
			base = base / 2
			local sym = %NHF_env.char[shift + base]
			local w = st..sym
			if w < s then
				shift = shift + base
				last = w
				lastsymbol = sym			
			elseif w == s then
				t.n = t.n + 1
				t[t.n] = sym
				return t
			end
		end
		t.n = t.n + 1
		t[t.n] = lastsymbol
		st = last
	end
	return t
end
function NHF_rawtext(msg)
	local t = {"/Text/NHF_rawtext_F/message.txt"}
	local st = %NHF_env.spread(msg)
	for i=1,st.n do
		t["l"..i] = "/Text/NHF_rawtext_F/"..%NHF_env.byte[st[i]]..".txt"
	end
	return t
end
-- function NHF_rawtext_standart(msg) -- Убрано 0.81
	-- local t = NHF_rawtext("<bright_color><color=fffff826>"..msg.."<color_default>");
	-- return t
-- end;
--
--Вывод путей названий существ по ID --0.78
function NHF_nameCr_F(ID,msg)
	local t = {"/Text/NHF_rawtext_F/message.txt"}
	local st = %NHF_env.spread(msg)
	t["l"..1] = NHF_rawtext("<bright_color><color=fffff826>");
	t["l"..2] = "/Text/Game/Creatures/"..NHF_mass_name_cr[ID]..".txt";
	for i=1,st.n do
		t["l"..(i+2)] = "/Text/NHF_rawtext_F/"..%NHF_env.byte[st[i]]..".txt";
	end	
	t["l"..(st.n+3)] = NHF_rawtext("<color_default>")
	return t
end;
--Получение пути к имени  заклинания по ID --0.80 
function NHF_GetSpellName_path(id)
  if(NHF_spell_table[id][NHF_SPELL_TABLE_SKILL] == -1) then
    return "/Text/Game/Spells/Adventure/"..NHF_spell_table[id][NHF_SPELL_TABLE_NAME].."/Name.txt"
  elseif(id == SPELL_SORROW) then
    return "/GameMechanics/Spell/Combat_Spells/DarkMagic/Sorrow/SorrowName.txt"
  elseif(NHF_spell_table[id][NHF_SPELL_TABLE_SKILL] == HERO_SKILL_DEMONIC_RAGE) then
	return "/Text/Game/Spells/Hero_Special_Abilities/"..NHF_spell_table[id][NHF_SPELL_TABLE_NAME].."/Name.txt"
  else
    return "/Text/Game/Spells/Combat/"..NHF_spell_table[id][NHF_SPELL_TABLE_NAME].."/Name.txt"
  end;
end;
--Получение имени заклинания по ID --0.80
function NHF_GetSpellName(ID,msg)
	local t = {"/Text/NHF_rawtext_F/message.txt"}
	local st = %NHF_env.spread(msg)
	t["l"..1] = NHF_rawtext("<bright_color><color=fffff826>");	
	for i=1,st.n do
		t["l"..(i+1)] = "/Text/NHF_rawtext_F/"..%NHF_env.byte[st[i]]..".txt";
	end;
	t["l"..(st.n+2)] = NHF_GetSpellName_path(ID);
	t["l"..(st.n+3)] = NHF_rawtext("<color_default>")
	return t
end;
function NHF_GetSpellName_green(ID,msg)
	local t = {"/Text/NHF_rawtext_F/message.txt"}
	local st = %NHF_env.spread(msg)
	t["l"..1] = NHF_rawtext("<bright_color><color=green>");	
	for i=1,st.n do
		t["l"..(i+1)] = "/Text/NHF_rawtext_F/"..%NHF_env.byte[st[i]]..".txt";
	end;
	t["l"..(st.n+2)] = NHF_GetSpellName_path(ID);
	t["l"..(st.n+3)] = NHF_rawtext("<color_default>")
	return t
end;
function NHF_GetSpellName_red(ID,msg)
	local t = {"/Text/NHF_rawtext_F/message.txt"}
	local st = %NHF_env.spread(msg)
	t["l"..1] = NHF_rawtext("<bright_color><color=red>");	
	for i=1,st.n do
		t["l"..(i+1)] = "/Text/NHF_rawtext_F/"..%NHF_env.byte[st[i]]..".txt";
	end;
	t["l"..(st.n+2)] = NHF_GetSpellName_path(ID);
	t["l"..(st.n+3)] = NHF_rawtext("<color_default>")
	return t
end;
--Проверка, сможет ли герой выучить данное заклинание --0.80
function NHF_Hero_Valid_Spell (hero,id)
	local valid = 2;	
	if HasHeroSkill(hero, PERK_WISDOM) == true then
		valid = valid + 1;
		if HasArtefact(hero, ARTIFACT_BOOK_OF_POWER,1) == true then
			valid = valid + 1;
		end;
	end;	
	if (GetHeroSkillMastery(hero,NHF_spell_table[id][NHF_SPELL_TABLE_SKILL]) >= (NHF_spell_table[id][NHF_SPELL_TABLE_SKILL_LEVEL]-valid)) then
		return 1
	else
		return 0
	end;
end;
--Получение пути к имени артефактов по ID --0.80
function NHF_GetArtefactName_path(id)
  if(id == ARTIFACT_BEARHIDE_WRAPS) then
    return '/Text/Game/Artifacts/'..NHF_artefact_table[id][ARTEFACT_TABLE_NAME]..'/name.txt'
  else
    return '/Text/Game/Artifacts/'..NHF_artefact_table[id][ARTEFACT_TABLE_NAME]..'/Name.txt'
  end;
end;
--Получение пути к описаниям артефактов по ID --0.80
function NHF_GetArtefactDesc_path(id)
  return '/Text/Game/Artifacts/'..NHF_artefact_table[id][ARTEFACT_TABLE_NAME]..'/Description.txt'
end;
--Получение имени артефакта по ID --0.80
function NHF_GetArtefactName(ID,msg)
	local t = {"/Text/NHF_rawtext_F/message.txt"}
	local st = %NHF_env.spread(msg)
	t["l"..1] = NHF_rawtext("<bright_color><color=fffff826>");	
	for i=1,st.n do
		t["l"..(i+1)] = "/Text/NHF_rawtext_F/"..%NHF_env.byte[st[i]]..".txt";
	end;
	t["l"..(st.n+2)] = NHF_GetArtefactName_path(ID);
	t["l"..(st.n+3)] = NHF_rawtext("<color_default>")
	return t
end;
function NHF_GetArtefactName_green(ID,msg)
	local t = {"/Text/NHF_rawtext_F/message.txt"}
	local st = %NHF_env.spread(msg)
	t["l"..1] = NHF_rawtext("<bright_color><color=green>");	
	for i=1,st.n do
		t["l"..(i+1)] = "/Text/NHF_rawtext_F/"..%NHF_env.byte[st[i]]..".txt";
	end;
	t["l"..(st.n+2)] = NHF_GetArtefactName_path(ID);
	t["l"..(st.n+3)] = NHF_rawtext("<color_default>")
	return t
end;
function NHF_GetArtefactName_red(ID,msg)
	local t = {"/Text/NHF_rawtext_F/message.txt"}
	local st = %NHF_env.spread(msg)
	t["l"..1] = NHF_rawtext("<bright_color><color=red>");	
	for i=1,st.n do
		t["l"..(i+1)] = "/Text/NHF_rawtext_F/"..%NHF_env.byte[st[i]]..".txt";
	end;
	t["l"..(st.n+2)] = NHF_GetArtefactName_path(ID);
	t["l"..(st.n+3)] = NHF_rawtext("<color_default>")
	return t
end;
--ShowFlyMessage,всплывающее только на ходу текущего игрока -- 0.80 починка бага с неоткрытием интерфейса героя
function  NHF_ShowFlyMessage (tpath,name_object,time_out, ping)
	UnblockGame();
	if ping == nil then 
		ping = 0 
	end;
	if IsAIPlayer(GetObjectOwner(name_object)) ~= 1 then 
		local player_object = GetObjectOwner(name_object);
		while (GetCurrentPlayer() ~= player_object)and(GetCurrentPlayer() ~= -1) do -- 0.81 "or... "
			if GetPlayerState(player_object) ~= 1 then
				break;
			end;
			sleep(1);
			UnblockGame();
		end;
		if (IsObjectExists(name_object) == true) and (GetPlayerState(player_object) == 1) then
			sleep(ping);
			ShowFlyMessage(tpath, name_object, player_object,time_out);
		end;
		UnblockGame(); --0.80		
	end;	
end;
--QuestionBoxForPlayers,всплывающее только на ходу текущего игрока
--function  NHF_QuestionBoxForPlayers (id_player,path,f_yes,f_no)
--	UnblockGame();
--	if IsAIPlayer(id_player) ~= 1 then
--		while (GetCurrentPlayer() ~= id_player)and(GetCurrentPlayer() ~= -1) do 
--			if GetPlayerState(id_player) ~= 1 then
--				break;
--			end;
--			sleep(1);
--			UnblockGame();
--		end;
--		if (GetPlayerState(id_player) == 1) then
--			QuestionBoxForPlayers(GetPlayerFilter(id_player),path,f_yes,f_no);
--			UnblockGame();
--		end;
--		UnblockGame();		
--	end;	
--end;
--MessageBoxForPlayers,всплывающее только на ходу текущего игрока
function  NHF_MessageBoxForPlayers (id_player,path,f_ok)
	UnblockGame();
	if IsAIPlayer(id_player) ~= 1 then 		
		while (GetCurrentPlayer() ~= id_player)and(GetCurrentPlayer() ~= -1) do 
			if GetPlayerState(id_player) ~= 1 then
				break;
			end;
			sleep(1);
			UnblockGame();
		end;
		if (GetPlayerState(id_player) == 1) then
			MessageBoxForPlayers(GetPlayerFilter(id_player),path,f_ok);
			UnblockGame();
		end;
		UnblockGame();		
	end;	
end;
-------------------------------------
--Добавление параметра герою с подсказкой
function NHF_ChangeHeroStat(name_hero, stat, add, time_visible)
local temp_name = NHF_TempName_F(name_hero);
	if not((time_visible ~= nil) and (time_visible ~= 0)) then 
		time_visible = 5;
	end;
	if stat == STAT_ATTACK then
		ChangeHeroStat(name_hero, STAT_ATTACK, add);
		sleep(NHF_slep_singl);
		startThread(NHF_ShowFlyMessage,{"/Text/NHF_add_stat/NHF_Of_prirost.txt";add = add}, temp_name,time_visible);
	elseif stat == STAT_DEFENCE then
		ChangeHeroStat(name_hero, STAT_DEFENCE, add);
		sleep(NHF_slep_singl);
		startThread(NHF_ShowFlyMessage,{"/Text/NHF_add_stat/NHF_Df_prirost.txt";add = add}, temp_name,time_visible);
	elseif stat == STAT_KNOWLEDGE then
		ChangeHeroStat(name_hero, STAT_KNOWLEDGE, add);
		sleep(NHF_slep_singl);
		startThread(NHF_ShowFlyMessage,{"/Text/NHF_add_stat/NHF_Kn_prirost.txt";add = add}, temp_name,time_visible);
	elseif stat == STAT_SPELL_POWER then
		ChangeHeroStat(name_hero, STAT_SPELL_POWER, add);
		sleep(NHF_slep_singl);
		startThread(NHF_ShowFlyMessage,{"/Text/NHF_add_stat/NHF_SP_prirost.txt";add = add}, temp_name,time_visible);
	end;
end;
-------------------------------------
--Прибавка существа для конкретного героя, с учётом существ в армии
function NHF_creatures_prirost_F(hero,prirost,creatures,ID_creature,time_sleep)
local temp_name = NHF_tempName_F(hero);
local creature_mass = {} ;
local flag_dobavka = 0;
local name_creatures = '';
if time_sleep == nil then time_sleep = 5 end;
creature_mass[0], creature_mass[1], creature_mass[2], creature_mass[3], creature_mass[4], creature_mass[5], creature_mass[6]= GetHeroCreaturesTypes(hero);
  for  i, creature in  creature_mass do
    if creature ~= 0 then
		for j, ID_creatures in creatures.ID do
			if ((creature ==  ID_creatures) and (ID_creature == ID_creatures)) or ((creature == ID_creatures) and (ID_creature == nil)) then
				name_creatures = creatures.Name[j];
				AddHeroCreatures(hero, creatures.ID[j], prirost);
				sleep(1);
				flag_dobavka = 1;
				NHF_ShowFlyMessage({NHF_textPath_prirost;creatures=name_creatures,prirost=prirost}, temp_name, time_sleep);
				sleep(2);
				break;
			end;
		end;
    end;
	if flag_dobavka == 1 then		
		break;
	end;
  end;
  if (flag_dobavka == 0) and (ID_creature == nil) then
      name_creatures = creatures.Name[0];
      AddHeroCreatures(hero, creatures.ID[0], prirost);
	  sleep(1);
      flag_dobavka = 1;
      NHF_ShowFlyMessage({NHF_textPath_prirost;creatures=name_creatures,prirost=prirost}, temp_name,time_sleep);
	  sleep(2);
  end;
end;
-- --ShowFlyMessage,всплывающее только на ходу текущего игрока -- 0.80
-- function  NHF_ShowFlyMessage (msg, value,name_object,time_out)
	-- if GetCurrentPlayer()  == GetObjectOwner(name_object) then
		-- ShowFlyMessage(NHF_rawtext_standart(msg..value),name_object , GetObjectOwner(name_object),time_out);
	-- end;	
-- end;
-------------------------------------
--Подсчёт количества существ в армии героя
function  error_NHF_count_creatures_F ()
	print("error:NHF_count_creatures_F");
end;
function NHF_count_creatures(hero)
	errorHook(error_NHF_count_creatures_F);
	local creature_mass = {};
	local count = 0;
	creature_mass[0], creature_mass[1], creature_mass[2], creature_mass[3], creature_mass[4], creature_mass[5], creature_mass[6] = GetHeroCreaturesTypes(hero);
	for  i, creature in  creature_mass do
		if creature ~= 0 then	
			count = GetHeroCreatures(hero, creature) + count;
		end;
	end;
	return count
end;

---------------------------------------------------------------------
--Сокровищницы 
NHF_mass_treasury = {};
NHF_mass_treasury_temp = {};
--Башня элементалей 
NHF_mass_treasury.elemantal_stockpile = {};
NHF_mass_treasury.elemantal_stockpile.day_activity = 28;
NHF_mass_treasury.elemantal_stockpile.name = GetObjectNamesByType("BUILDING_CYCLOPS_STOCKPILE");
NHF_mass_treasury.elemantal_stockpile.abs_day = NHF_Invert_mass(GetObjectNamesByType("BUILDING_CYCLOPS_STOCKPILE"));
NHF_mass_treasury.elemantal_stockpile.name_visible = "/Text/NHF_treasury_F/name_NHF_CYCLOPS_STOCKPILE.txt";
NHF_mass_treasury.elemantal_stockpile.desc_visible_on = "/Text/NHF_treasury_F/desc_on_NHF_CYCLOPS_STOCKPILE.txt";
NHF_mass_treasury.elemantal_stockpile.desc_visible_off = "/Text/NHF_treasury_F/desc_off_NHF_CYCLOPS_STOCKPILE.txt";
for name, abs_day in NHF_mass_treasury.elemantal_stockpile.abs_day do
	NHF_mass_treasury.elemantal_stockpile.abs_day[name] = -28;
	--OverrideObjectTooltipNameAndDescription(name, NHF_mass_treasury.elemantal_stockpile.name_visible,NHF_mass_treasury.elemantal_stockpile.desc_visible_on);
end;
NHF_mass_treasury.elemantal_stockpile.player_id = {};
for i=1,8 do
	NHF_mass_treasury.elemantal_stockpile.player_id[i] = {["hero_touch"] = ""};
	NHF_mass_treasury.elemantal_stockpile.player_id[i] = {["name_touch"] = ""};
	NHF_mass_treasury.elemantal_stockpile.player_id[i] = {["variant"] = {}};
end;
NHF_mass_treasury.elemantal_stockpile.variants = 
{[1] = 
	{
		["chance"] = {["min"]=0,["max"]=0.3}, 
		["guard"] = {4,CREATURE_FIRE_ELEMENTAL,5, CREATURE_WATER_ELEMENTAL,5, CREATURE_EARTH_ELEMENTAL,5, CREATURE_AIR_ELEMENTAL,5,nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {4,4, 4, 4, 4, 4, 0}, 
					  ["spell"]= {},
					  ["arts"]={}
					 },
	},
[2] = 
	{
		["chance"] = {["min"]=0.3,["max"]=0.6},  
		["guard"] = {4,CREATURE_FIRE_ELEMENTAL,10, CREATURE_WATER_ELEMENTAL,10, CREATURE_EARTH_ELEMENTAL,10, CREATURE_AIR_ELEMENTAL,10,nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {6, 6, 6, 6, 6, 6, 0}, 
					  ["spell"]= {},
					  ["arts"]={}
					 },
	},	
[3] = 
	{
		["chance"] = {["min"]=0.6,["max"]=0.9}, 
		["guard"] = {4,CREATURE_FIRE_ELEMENTAL,15, CREATURE_WATER_ELEMENTAL,15, CREATURE_EARTH_ELEMENTAL,15, CREATURE_AIR_ELEMENTAL,15,nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {8, 8, 8, 8, 8, 8, 0}, 
					  ["spell"]= {},
					  ["arts"]={}
					 },
	},	
[4] = 
	{
		["chance"] = {["min"]=0.9,["max"]=1},  
		["guard"] = {4,CREATURE_FIRE_ELEMENTAL,20, CREATURE_WATER_ELEMENTAL,20, CREATURE_EARTH_ELEMENTAL,20, CREATURE_AIR_ELEMENTAL,20,nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {12, 12, 12, 12, 12, 12, 0}, 
					  ["spell"]= {},
					  ["arts"]= {NHF_mass_MinorArt}
					 },
	}	
};
--
--Сокровищница магов
NHF_mass_treasury.MagiVault = {};
NHF_mass_treasury.MagiVault.day_activity = 28;
NHF_mass_treasury.MagiVault.name = GetObjectNamesByType("BUILDING_NAGA_BANK");
NHF_mass_treasury.MagiVault.abs_day = NHF_Invert_mass(GetObjectNamesByType("BUILDING_NAGA_BANK"));
NHF_mass_treasury.MagiVault.name_visible = "/Text/NHF_treasury_F/name_NHF_NAGA_BANK.txt";
NHF_mass_treasury.MagiVault.desc_visible_on = "/Text/NHF_treasury_F/desc_on_NHF_NAGA_BANK.txt";
NHF_mass_treasury.MagiVault.desc_visible_off = "/Text/NHF_treasury_F/desc_off_NHF_NAGA_BANK.txt";
for name, abs_day in NHF_mass_treasury.MagiVault.abs_day do
	NHF_mass_treasury.MagiVault.abs_day[name] = -28;
	--OverrideObjectTooltipNameAndDescription(name, NHF_mass_treasury.MagiVault.name_visible,NHF_mass_treasury.MagiVault.desc_visible_on);
end;
NHF_mass_treasury.MagiVault.player_id = {};
for i=1,8 do
	NHF_mass_treasury.MagiVault.player_id[i] = {["hero_touch"] = ""};
	NHF_mass_treasury.MagiVault.player_id[i] = {["name_touch"] = ""};
	NHF_mass_treasury.MagiVault.player_id[i] = {["variant"] = {}};
end;
NHF_mass_treasury.MagiVault.variants =
{[1] =
	{
		["chance"] = {["min"]=0,["max"]=0.3},
		["guard"] = {3,CREATURE_MAGI,9, CREATURE_OBSIDIAN_GARGOYLE,20, CREATURE_ARCH_MAGI,7, nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,0, 0, 0, 0, 8, 2500},
					  ["spell"]= {NHF_mass_spell_4},
					  ["arts"]={}
					 },
	},
[2] =
	{
		["chance"] = {["min"]=0.3,["max"]=0.8},
		["guard"] = {4,CREATURE_MAGI,15, CREATURE_MASTER_GENIE,13, CREATURE_ARCH_MAGI,12, CREATURE_MAGI,15,nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0, 0, 0, 0, 0, 12, 5000},
					  ["spell"]= {NHF_mass_spell_5},
					  ["arts"]={}
					 },
	},
[3] =
	{
		["chance"] = {["min"]=0.8,["max"]=1},
		["guard"] = {3,CREATURE_MAGI,21, CREATURE_PHOENIX,3, CREATURE_ARCH_MAGI,20, nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0, 0, 0, 0, 0, 12, 7000},
					  ["spell"]= {NHF_mass_spell_4,NHF_mass_spell_5},
					  ["arts"]={NHF_mass_MinorArt}
					 },
	}
};
--
--Склеп
NHF_mass_treasury.Crypt = {};
NHF_mass_treasury.Crypt.day_activity = 28;
NHF_mass_treasury.Crypt.name = GetObjectNamesByType("BUILDING_CRYPT");
NHF_mass_treasury.Crypt.abs_day = NHF_Invert_mass(GetObjectNamesByType("BUILDING_CRYPT"));
NHF_mass_treasury.Crypt.name_visible = "/Text/NHF_treasury_F/name_NHF_CRYPT.txt";
NHF_mass_treasury.Crypt.desc_visible_on = "/Text/NHF_treasury_F/desc_on_NHF_CRYPT.txt";
NHF_mass_treasury.Crypt.desc_visible_off = "/Text/NHF_treasury_F/desc_off_NHF_CRYPT.txt";
for name, abs_day in NHF_mass_treasury.Crypt.abs_day do
	NHF_mass_treasury.Crypt.abs_day[name] = -28;
end;
NHF_mass_treasury.Crypt.player_id = {};
for i=1,8 do
	NHF_mass_treasury.Crypt.player_id[i] = {["hero_touch"] = ""};
	NHF_mass_treasury.Crypt.player_id[i] = {["name_touch"] = ""};
	NHF_mass_treasury.Crypt.player_id[i] = {["variant"] = {}};
end;
NHF_mass_treasury.Crypt.variants =
{[1] =
	{
		["chance"] = {["min"]=0,["max"]=0.25},
		["guard"] = {2,CREATURE_SKELETON_ARCHER,30, CREATURE_ZOMBIE,20, nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,0, 0, 0, 0, 0, 1500},
					  ["spell"]= {},
					  ["arts"]={}
					 },
	},
[2] =
	{
		["chance"] = {["min"]=0.25,["max"]=0.55},
		["guard"] = {3,CREATURE_SKELETON_ARCHER,25, CREATURE_ZOMBIE,20, CREATURE_GHOST,5, nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0, 0, 0, 0, 0, 0, 2000},
					  ["spell"]= {},
					  ["arts"]={}
					 },
	},
[3] =
	{
		["chance"] = {["min"]=0.55,["max"]=0.85},
		["guard"] = {4,CREATURE_SKELETON_ARCHER,20, CREATURE_ZOMBIE,20, CREATURE_GHOST,7, CREATURE_VAMPIRE_LORD,3, nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0, 0, 0, 0, 0, 0, 2500},
					  ["spell"]= {},
					  ["arts"]={NHF_mass_MinorArt}
					 },
	},
[4] =
	{
		["chance"] = {["min"]=0.85,["max"]=1},
		["guard"] = {4,CREATURE_SKELETON_ARCHER,20, CREATURE_ZOMBIE,20, CREATURE_GHOST,6, CREATURE_VAMPIRE_LORD,6, nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0, 0, 0, 0, 0, 0, 5000},
					  ["spell"]= {},
					  ["arts"]={NHF_mass_MinorArt}
					 },
	},	
};
--
--Кровавый храм
NHF_mass_treasury.blood_temple = {};
NHF_mass_treasury.blood_temple.day_activity = 28;
NHF_mass_treasury.blood_temple.name = GetObjectNamesByType("BUILDING_BLOOD_TEMPLE");
NHF_mass_treasury.blood_temple.abs_day = NHF_Invert_mass(GetObjectNamesByType("BUILDING_BLOOD_TEMPLE"));
NHF_mass_treasury.blood_temple.name_visible = "/Text/NHF_treasury_F/name_NHF_BLOOD_TEMPLE.txt";
NHF_mass_treasury.blood_temple.desc_visible_on = "/Text/NHF_treasury_F/desc_on_NHF_BLOOD_TEMPLE.txt";
NHF_mass_treasury.blood_temple.desc_visible_off = "/Text/NHF_treasury_F/desc_off_NHF_BLOOD_TEMPLE.txt";
for name, abs_day in NHF_mass_treasury.blood_temple.abs_day do
	NHF_mass_treasury.blood_temple.abs_day[name] = -28;
	--OverrideObjectTooltipNameAndDescription(name, NHF_mass_treasury.blood_temple.name_visible,NHF_mass_treasury.blood_temple.desc_visible_on);
end;
NHF_mass_treasury.blood_temple.player_id = {};
for i=1,8 do
	NHF_mass_treasury.blood_temple.player_id[i] = {["hero_touch"] = ""};
	NHF_mass_treasury.blood_temple.player_id[i] = {["name_touch"] = ""};
	NHF_mass_treasury.blood_temple.player_id[i] = {["variant"] = {}};
end;
NHF_mass_treasury.blood_temple.variants = 
{[1] = 
	{
		["chance"] = {["min"]=0,["max"]=0.34}, 
		["guard"] = {3,CREATURE_BLOOD_WITCH,20, CREATURE_BLOOD_WITCH,20, CREATURE_MATRON,5, nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,0, 0, 0, 0, 0, 2500}, 
					  ["spell"]= {},
					  ["arts"]={}
					 },
	},
[2] = 
	{
		["chance"] = {["min"]=0.34,["max"]=0.67},  
		["guard"] = {4,CREATURE_BLOOD_WITCH,40, CREATURE_BLOOD_WITCH,40, CREATURE_MATRON,5, CREATURE_MATRON,5,nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,0, 0, 0, 0, 0, 4000}, 
					  ["spell"]= {},
					  ["arts"]={NHF_mass_MinorArt}
					 },
	},	
[3] = 
	{
		["chance"] = {["min"]=0.67,["max"]=1}, 
		["guard"] = {4,CREATURE_BLOOD_WITCH,60, CREATURE_BLOOD_WITCH,60, CREATURE_MATRON,10, CREATURE_MATRON,10,nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,0, 0, 0, 0, 0, 5500}, 
					  ["spell"]= {NHF_mass_spell_1},
					  ["arts"]= {NHF_mass_MajorArt}
					 },
	}
};
--
--Пирамида
NHF_mass_treasury.pyramid = {};
NHF_mass_treasury.pyramid.day_activity = 28;
NHF_mass_treasury.pyramid.name = GetObjectNamesByType("BUILDING_PYRAMID");
NHF_mass_treasury.pyramid.abs_day = NHF_Invert_mass(GetObjectNamesByType("BUILDING_PYRAMID"));
NHF_mass_treasury.pyramid.name_visible = "/Text/NHF_treasury_F/name_NHF_PYRAMID.txt";
NHF_mass_treasury.pyramid.desc_visible_on = "/Text/NHF_treasury_F/desc_on_NHF_PYRAMID.txt";
NHF_mass_treasury.pyramid.desc_visible_off = "/Text/NHF_treasury_F/desc_off_NHF_PYRAMID.txt";
for name, abs_day in NHF_mass_treasury.pyramid.abs_day do
	NHF_mass_treasury.pyramid.abs_day[name] = -28;
	--OverrideObjectTooltipNameAndDescription(name, NHF_mass_treasury.pyramid.name_visible,NHF_mass_treasury.pyramid.desc_visible_on);
end;
NHF_mass_treasury.pyramid.player_id = {};
for i=1,8 do
	NHF_mass_treasury.pyramid.player_id[i] = {["hero_touch"] = ""};
	NHF_mass_treasury.pyramid.player_id[i] = {["name_touch"] = ""};
	NHF_mass_treasury.pyramid.player_id[i] = {["variant"] = {}};
end;
NHF_mass_treasury.pyramid.variants = 
{[1] = 
	{
		["chance"] = {["min"]=0,["max"]=0.99}, 
		["guard"] = {2,CREATURE_IRON_GOLEM,40, CREATURE_STEEL_GOLEM,20,  nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,0, 0, 0, 0, 0, 0}, 
					  ["spell"]= {NHF_mass_spell_4},
					  ["arts"]={}
					 },
	},
[2] = 
	{
		["chance"] = {["min"]=0.99,["max"]=1},  
		["guard"] = {1,CREATURE_SKELETON,666, nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,0, 0, 0, 0, 0, 0}, 
					  ["spell"]= {NHF_mass_spell_5},
					  ["arts"]= {}
					 },
	}
};
--Сокровищница гномов
NHF_mass_treasury.dwarven_treasure = {};
NHF_mass_treasury.dwarven_treasure.day_activity = 28;
NHF_mass_treasury.dwarven_treasure.name = GetObjectNamesByType("BUILDING_DWARVEN_TREASURE");
NHF_mass_treasury.dwarven_treasure.abs_day = NHF_Invert_mass(GetObjectNamesByType("BUILDING_DWARVEN_TREASURE"));
NHF_mass_treasury.dwarven_treasure.name_visible = "/Text/NHF_treasury_F/name_NHF_DWARVEN_TREASURE.txt";
NHF_mass_treasury.dwarven_treasure.desc_visible_on = "/Text/NHF_treasury_F/desc_on_NHF_DWARVEN_TREASURE.txt";
NHF_mass_treasury.dwarven_treasure.desc_visible_off = "/Text/NHF_treasury_F/desc_off_NHF_DWARVEN_TREASURE.txt";
for name, abs_day in NHF_mass_treasury.dwarven_treasure.abs_day do
	NHF_mass_treasury.dwarven_treasure.abs_day[name] = -28;
	--OverrideObjectTooltipNameAndDescription(name, NHF_mass_treasury.dwarven_treasure.name_visible,NHF_mass_treasury.dwarven_treasure.desc_visible_on);
end;
NHF_mass_treasury.dwarven_treasure.player_id = {};
for i=1,8 do
	NHF_mass_treasury.dwarven_treasure.player_id[i] = {["hero_touch"] = ""};
	NHF_mass_treasury.dwarven_treasure.player_id[i] = {["name_touch"] = ""};
	NHF_mass_treasury.dwarven_treasure.player_id[i] = {["variant"] = {}};
end;
NHF_mass_treasury.dwarven_treasure.variants = 
{[1] = 
	{
		["chance"] = {["min"]=0,["max"]=0.34}, 
		["guard"] = {4,CREATURE_STOUT_DEFENDER,25, CREATURE_STOUT_DEFENDER,25,CREATURE_AXE_THROWER,5,CREATURE_AXE_THROWER,5,  nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,0, 0, 5, 0, 5, 1000}, 
					  ["spell"]= {},
					  ["arts"]={}
					 },
	},
[2] = 
	{
		["chance"] = {["min"]=0.34,["max"]=0.67}, 
		["guard"] = {4,CREATURE_STOUT_DEFENDER,50, CREATURE_STOUT_DEFENDER,50,CREATURE_AXE_THROWER,10,CREATURE_AXE_THROWER,10,  nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,0, 0, 10, 0, 10, 2500}, 
					  ["spell"]= {},
					  ["arts"]={}
					 },
	},
[3] = 
	{
		["chance"] = {["min"]=0.67,["max"]=1}, 
		["guard"] = {5,CREATURE_STOUT_DEFENDER,75, CREATURE_STOUT_DEFENDER,75,CREATURE_AXE_THROWER,15,CREATURE_AXE_THROWER,15,CREATURE_WARLORD,5,  nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,0, 0, 15, 0, 15, 5000}, 
					  ["spell"]= {},
					  ["arts"]={}
					 },
	}	
};
--
--Гаргульница
NHF_mass_treasury.gargoyle_stonevault = {};
NHF_mass_treasury.gargoyle_stonevault.day_activity = 28;
NHF_mass_treasury.gargoyle_stonevault.name = GetObjectNamesByType("BUILDING_GARGOYLE_STONEVAULT");
NHF_mass_treasury.gargoyle_stonevault.abs_day = NHF_Invert_mass(GetObjectNamesByType("BUILDING_GARGOYLE_STONEVAULT"));
NHF_mass_treasury.gargoyle_stonevault.name_visible = "/Text/NHF_treasury_F/name_NHF_GARGOYLE_STONEVAULT.txt";
NHF_mass_treasury.gargoyle_stonevault.desc_visible_on = "/Text/NHF_treasury_F/desc_on_NHF_GARGOYLE_STONEVAULT.txt";
NHF_mass_treasury.gargoyle_stonevault.desc_visible_off = "/Text/NHF_treasury_F/desc_off_NHF_GARGOYLE_STONEVAULT.txt";
for name, abs_day in NHF_mass_treasury.gargoyle_stonevault.abs_day do
	NHF_mass_treasury.gargoyle_stonevault.abs_day[name] = -28;
	--OverrideObjectTooltipNameAndDescription(name, NHF_mass_treasury.gargoyle_stonevault.name_visible,NHF_mass_treasury.gargoyle_stonevault.desc_visible_on);
end;
NHF_mass_treasury.gargoyle_stonevault.player_id = {};
for i=1,8 do
	NHF_mass_treasury.gargoyle_stonevault.player_id[i] = {["hero_touch"] = ""};
	NHF_mass_treasury.gargoyle_stonevault.player_id[i] = {["name_touch"] = ""};
	NHF_mass_treasury.gargoyle_stonevault.player_id[i] = {["variant"] = {}};
end;
NHF_mass_treasury.gargoyle_stonevault.variants = 
{[1] = 
	{
		["chance"] = {["min"]=0,["max"]=0.34}, 
		["guard"] = {3,CREATURE_STONE_GARGOYLE,20, CREATURE_STONE_GARGOYLE,20,CREATURE_STONE_GARGOYLE,20,  nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,5, 0, 0, 0, 0, 1000}, 
					  ["spell"]= {},
					  ["arts"]={}
					 },
	},
[2] = 
	{
		["chance"] = {["min"]=0.34,["max"]=0.67}, 
		["guard"] = {4,CREATURE_OBSIDIAN_GARGOYLE,30, CREATURE_OBSIDIAN_GARGOYLE,30,CREATURE_OBSIDIAN_GARGOYLE,30, CREATURE_IRON_GOLEM,10, nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,10, 0, 0, 0, 0, 2000}, 
					  ["spell"]= {},
					  ["arts"]={}
					 },
	},	
[3] = 
	{
		["chance"] = {["min"]=0.67,["max"]=1}, 
		["guard"] = {4,CREATURE_OBSIDIAN_GARGOYLE,40, CREATURE_OBSIDIAN_GARGOYLE,40,CREATURE_OBSIDIAN_GARGOYLE,40, CREATURE_STEEL_GOLEM,20, nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,15, 0, 0, 0, 0, 3000}, 
					  ["spell"]= {},
					  ["arts"]={}
					 },
	}	
};
--Чаща энтов
NHF_mass_treasury.treant_thicket = {};
NHF_mass_treasury.treant_thicket.day_activity = 28;
NHF_mass_treasury.treant_thicket.name = GetObjectNamesByType("BUILDING_TREANT_THICKET");
NHF_mass_treasury.treant_thicket.abs_day = NHF_Invert_mass(GetObjectNamesByType("BUILDING_TREANT_THICKET"));
NHF_mass_treasury.treant_thicket.name_visible = "/Text/NHF_treasury_F/name_NHF_TREANT_THICKET.txt";
NHF_mass_treasury.treant_thicket.desc_visible_on = "/Text/NHF_treasury_F/desc_on_NHF_TREANT_THICKET.txt";
NHF_mass_treasury.treant_thicket.desc_visible_off = "/Text/NHF_treasury_F/desc_off_NHF_TREANT_THICKET.txt";
for name, abs_day in NHF_mass_treasury.treant_thicket.abs_day do
	NHF_mass_treasury.treant_thicket.abs_day[name] = -28;
	--OverrideObjectTooltipNameAndDescription(name, NHF_mass_treasury.treant_thicket.name_visible,NHF_mass_treasury.treant_thicket.desc_visible_on);
end;
NHF_mass_treasury.treant_thicket.player_id = {};
for i=1,8 do
	NHF_mass_treasury.treant_thicket.player_id[i] = {["hero_touch"] = ""};
	NHF_mass_treasury.treant_thicket.player_id[i] = {["name_touch"] = ""};
	NHF_mass_treasury.treant_thicket.player_id[i] = {["variant"] = {}};
end;
NHF_mass_treasury.treant_thicket.variants = 
{[1] = 
	{
		["chance"] = {["min"]=0,["max"]=0.34}, 
		["guard"] = {4,CREATURE_TREANT,15, CREATURE_TREANT,15,CREATURE_WOOD_ELF,30,CREATURE_WOOD_ELF,30,  nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {10,0, 0, 0, 0, 0, 5000}, 
					  ["spell"]= {},
					  ["arts"]={}
					 },
	},
[2] = 
	{
		["chance"] = {["min"]=0.34,["max"]=0.67}, 
		["guard"] = {4,CREATURE_TREANT_GUARDIAN,15, CREATURE_TREANT_GUARDIAN,15,CREATURE_WOOD_ELF,30,CREATURE_WOOD_ELF,30,  nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {20,0, 0, 0, 0, 0, 7500}, 
					  ["spell"]= {},
					  ["arts"]={}
					 },
	},
[3] = 
	{
		["chance"] = {["min"]=0.67,["max"]=1}, 
		["guard"] = {5,CREATURE_TREANT_GUARDIAN,20, CREATURE_TREANT_GUARDIAN,20,CREATURE_GRAND_ELF,30,CREATURE_GRAND_ELF,30,CREATURE_DRUID_ELDER,10,  nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {30,0, 0, 0, 0, 0, 10000}, 
					  ["spell"]= {},
					  ["arts"]={}
					 },
	}	
};
--
--Утопия драконов
NHF_mass_treasury.dragon_utopia = {};
NHF_mass_treasury.dragon_utopia.day_activity = 28;
NHF_mass_treasury.dragon_utopia.name = GetObjectNamesByType("BUILDING_DRAGON_UTOPIA");
NHF_mass_treasury.dragon_utopia.abs_day = NHF_Invert_mass(GetObjectNamesByType("BUILDING_DRAGON_UTOPIA"));
NHF_mass_treasury.dragon_utopia.name_visible = "/Text/NHF_treasury_F/name_NHF_DRAGON_UTOPIA.txt";
NHF_mass_treasury.dragon_utopia.desc_visible_on = "/Text/NHF_treasury_F/desc_on_NHF_DRAGON_UTOPIA.txt";
NHF_mass_treasury.dragon_utopia.desc_visible_off = "/Text/NHF_treasury_F/desc_off_NHF_DRAGON_UTOPIA.txt";
for name, abs_day in NHF_mass_treasury.dragon_utopia.abs_day do
	NHF_mass_treasury.dragon_utopia.abs_day[name] = -28;
	--OverrideObjectTooltipNameAndDescription(name, NHF_mass_treasury.dragon_utopia.name_visible,NHF_mass_treasury.dragon_utopia.desc_visible_on);
end;
NHF_mass_treasury.dragon_utopia.player_id = {};
for i=1,8 do
	NHF_mass_treasury.dragon_utopia.player_id[i] = {["hero_touch"] = ""};
	NHF_mass_treasury.dragon_utopia.player_id[i] = {["name_touch"] = ""};
	NHF_mass_treasury.dragon_utopia.player_id[i] = {["variant"] = {}};
end;
NHF_mass_treasury.dragon_utopia.variants = 
{[1] = 
	{
		["chance"] = {["min"]=0,["max"]=0.40}, 
		["guard"] = {2,CREATURE_GOLD_DRAGON,9,CREATURE_BLACK_DRAGON,6,nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,0, 0, 0, 0, 0, 12000}, 
					  ["spell"]= {NHF_mass_spell_4,NHF_mass_spell_4},
					  ["arts"]={NHF_mass_RelictArt,NHF_mass_MajorArt,NHF_mass_MajorArt,NHF_mass_MajorArt}
					 },
	},
[2] = 
	{
		["chance"] = {["min"]=0.40,["max"]=0.60}, 
		["guard"] = {3,CREATURE_SHADOW_DRAGON,11,CREATURE_DEEP_DRAGON,6,CREATURE_BLACK_DRAGON,5,nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,0, 0, 0, 0, 0, 14000}, 
					  ["spell"]= {NHF_mass_spell_4,NHF_mass_spell_5},
					  ["arts"]={NHF_mass_RelictArt,NHF_mass_MajorArt,NHF_mass_MajorArt,NHF_mass_MinorArt,NHF_mass_MinorArt,NHF_mass_MinorArt}
					 },
	},
[3] = 
	{
		["chance"] = {["min"]=0.60,["max"]=1}, 
		["guard"] = {4,CREATURE_GREEN_DRAGON,8,CREATURE_DEEP_DRAGON,6,CREATURE_GOLD_DRAGON,4,CREATURE_BLACK_DRAGON,4,nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,0, 0, 0, 0, 0, 20000}, 
					  ["spell"]= {NHF_mass_spell_4,NHF_mass_spell_4,NHF_mass_spell_5},
					  ["arts"]={NHF_mass_RelictArt,NHF_mass_RelictArt,NHF_mass_MajorArt,NHF_mass_MajorArt,NHF_mass_MajorArt,NHF_mass_MajorArt}
					 },
	}		
};
--Затонувший храм
NHF_mass_treasury.sunken_temple = {};
NHF_mass_treasury.sunken_temple.day_activity = 28;
NHF_mass_treasury.sunken_temple.name = GetObjectNamesByType("BUILDING_SUNKEN_TEMPLE");
NHF_mass_treasury.sunken_temple.abs_day = NHF_Invert_mass(GetObjectNamesByType("BUILDING_SUNKEN_TEMPLE"));
NHF_mass_treasury.sunken_temple.name_visible = "/Text/NHF_treasury_F/name_NHF_SUNKEN_TEMPLE.txt";
NHF_mass_treasury.sunken_temple.desc_visible_on = "/Text/NHF_treasury_F/desc_on_NHF_SUNKEN_TEMPLE.txt";
NHF_mass_treasury.sunken_temple.desc_visible_off = "/Text/NHF_treasury_F/desc_off_NHF_SUNKEN_TEMPLE.txt";
for name, abs_day in NHF_mass_treasury.sunken_temple.abs_day do
	NHF_mass_treasury.sunken_temple.abs_day[name] = -28;
end;
NHF_mass_treasury.sunken_temple.player_id = {};
for i=1,8 do
	NHF_mass_treasury.sunken_temple.player_id[i] = {["hero_touch"] = ""};
	NHF_mass_treasury.sunken_temple.player_id[i] = {["name_touch"] = ""};
	NHF_mass_treasury.sunken_temple.player_id[i] = {["variant"] = {}};
end;
NHF_mass_treasury.sunken_temple.variants = 
{[1] = 
	{
		["chance"] = {["min"]=0,["max"]=0.40}, 
		["guard"] = {2,CREATURE_TITAN,7,CREATURE_WATER_ELEMENTAL,40,nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,0, 0, 0, 0, 0, 12000}, 
					  ["spell"]= {NHF_mass_spell_4,NHF_mass_spell_4},
					  ["arts"]={NHF_mass_RelictArt,NHF_mass_MajorArt,NHF_mass_MajorArt}
					 },
	},
[2] = 
	{
		["chance"] = {["min"]=0.40,["max"]=0.60}, 
		["guard"] = {3,CREATURE_GIANT,11,CREATURE_TITAN,6,CREATURE_WATER_ELEMENTAL,50,nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,0, 0, 0, 0, 0, 14000}, 
					  ["spell"]= {NHF_mass_spell_4,NHF_mass_spell_5},
					  ["arts"]={NHF_mass_RelictArt,NHF_mass_MajorArt,NHF_mass_MajorArt,NHF_mass_MinorArt}
					 },
	},
[3] = 
	{
		["chance"] = {["min"]=0.60,["max"]=1}, 
		["guard"] = {4,CREATURE_GIANT,8,CREATURE_WATER_ELEMENTAL,60,CREATURE_TITAN,4,CREATURE_WATER_ELEMENTAL,40,nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,0, 0, 0, 0, 0, 20000}, 
					  ["spell"]= {NHF_mass_spell_4,NHF_mass_spell_4,NHF_mass_spell_5},
					  ["arts"]={NHF_mass_RelictArt,NHF_mass_RelictArt,NHF_mass_MajorArt,NHF_mass_MajorArt,NHF_mass_MajorArt}
					 },
	}		
};
--Обломки судна(+остов галеона,остов галеры)
NHF_mass_treasury.demolish = {};
NHF_mass_treasury.demolish.day_activity = 28;
NHF_mass_treasury.demolish.name = GetObjectNamesByType("BUILDING_DEMOLISH");
NHF_mass_treasury.demolish.abs_day = NHF_Invert_mass(GetObjectNamesByType("BUILDING_DEMOLISH"));
NHF_mass_treasury.demolish.name_visible = "/Text/NHF_treasury_F/name_NHF_DEMOLISH.txt";
NHF_mass_treasury.demolish.desc_visible_on = "/Text/NHF_treasury_F/desc_on_NHF_DEMOLISH.txt";
NHF_mass_treasury.demolish.desc_visible_off = "/Text/NHF_treasury_F/desc_off_NHF_DEMOLISH.txt";
for name, abs_day in NHF_mass_treasury.demolish.abs_day do
	NHF_mass_treasury.demolish.abs_day[name] = -28;
end;
NHF_mass_treasury.demolish.player_id = {};
for i=1,8 do
	NHF_mass_treasury.demolish.player_id[i] = {["hero_touch"] = ""};
	NHF_mass_treasury.demolish.player_id[i] = {["name_touch"] = ""};
	NHF_mass_treasury.demolish.player_id[i] = {["variant"] = {}};
end;
NHF_mass_treasury.demolish.variants =
{[1] =
	{
		["chance"] = {["min"]=0,["max"]=0.30},
		["guard"] = {2,CREATURE_MANES,22, CREATURE_WALKING_DEAD,17, nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0,0, 0, 0, 0, 0, 2500},
					  ["spell"]= {},
					  ["arts"]={}
					 },
	},
[2] =
	{
		["chance"] = {["min"]=0.30,["max"]=0.60},
		["guard"] = {2,CREATURE_GHOST,15, CREATURE_MANES,15, nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0, 0, 0, 0, 0, 0, 3000},
					  ["spell"]= {},
					  ["arts"]={}
					 },
	},
[3] =
	{
		["chance"] = {["min"]=0.60,["max"]=0.90},
		["guard"] = {2,CREATURE_WALKING_DEAD,75, CREATURE_SKELETON,15, nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0, 0, 0, 0, 0, 0, 5000},
					  ["spell"]= {},
					  ["arts"]={NHF_mass_MinorArt}
					 },
	},
[4] =
	{
		["chance"] = {["min"]=0.90,["max"]=1},
		["guard"] = {3,CREATURE_GHOST,15, CREATURE_MANES,21, CREATURE_WRAITH,2, nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0, 0, 0, 0, 0, 0, 5000},
					  ["spell"]= {},
					  ["arts"]={NHF_mass_MajorArt}
					 },
	},	
};
--Старые обломки (+ветхая галера, потрёпанный галеон)
NHF_mass_treasury.unkempt = {};
NHF_mass_treasury.unkempt.day_activity = 28;
NHF_mass_treasury.unkempt.name = GetObjectNamesByType("BUILDING_UNKEMPT");
NHF_mass_treasury.unkempt.abs_day = NHF_Invert_mass(GetObjectNamesByType("BUILDING_UNKEMPT"));
NHF_mass_treasury.unkempt.name_visible = "/Text/NHF_treasury_F/name_NHF_UNKEMPT.txt";
NHF_mass_treasury.unkempt.desc_visible_on = "/Text/NHF_treasury_F/desc_on_NHF_UNKEMPT.txt";
NHF_mass_treasury.unkempt.desc_visible_off = "/Text/NHF_treasury_F/desc_off_NHF_UNKEMPT.txt";
for name, abs_day in NHF_mass_treasury.unkempt.abs_day do
	NHF_mass_treasury.unkempt.abs_day[name] = -28;
end;
NHF_mass_treasury.unkempt.player_id = {};
for i=1,8 do
	NHF_mass_treasury.unkempt.player_id[i] = {["hero_touch"] = ""};
	NHF_mass_treasury.unkempt.player_id[i] = {["name_touch"] = ""};
	NHF_mass_treasury.unkempt.player_id[i] = {["variant"] = {}};
end;
NHF_mass_treasury.unkempt.variants =
{[1] =
	{
		["chance"] = {["min"]=0,["max"]=0.25},
		["guard"] = {2,CREATURE_ARCHER,38, CREATURE_PEASANT,75, nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {5,0, 0, 0, 0, 0, 3000},
					  ["spell"]= {},
					  ["arts"]={}
					 },
	},
[2] =
	{
		["chance"] = {["min"]=0.25,["max"]=0.50},
		["guard"] = {1,CREATURE_WATER_ELEMENTAL,15, nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0, 0, 0, 0, 0, 0, 3000},
					  ["spell"]= {},
					  ["arts"]={}
					 },
	},
[3] =
	{
		["chance"] = {["min"]=0.50,["max"]=0.75},
		["guard"] = {1,CREATURE_AIR_ELEMENTAL,40, nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0, 0, 0, 0, 0, 0, 4000},
					  ["spell"]= {},
					  ["arts"]={NHF_mass_MinorArt}
					 },
	},
[4] =
	{
		["chance"] = {["min"]=0.75,["max"]=1},
		["guard"] = {3,CREATURE_ASSASSIN,30, CREATURE_MATRON,2, CREATURE_ASSASSIN,30, nil,"NHF_Touch_hero_treasury_reward_F",nil, not nil},
		["reward"] = {
					  ["resurse"]= {0, 0, 0, 0, 0, 0, 5000},
					  ["spell"]= {},
					  ["arts"]={NHF_mass_MajorArt}
					 },
	},	
};
--

--Открытие карты для тестирования
-- OpenCircleFog(200,200,0,900,1);
-- if GetMaxFloor() == 1 then
	-- OpenCircleFog(200,200,1,900,1);
-- end;

-----------------------------------------------------------------------------------
----------------Проверка режима игры, через который запущена карта  ч.2-------------
sleep(2);
--Проверка, является ли карта совместимой с NHF 
function NHF_ME_Yes_F()
	--Loose();
end;
function NHF_Map_Yes_F()
	--ExitGame(); --0.84 Убрано для совместимости с EWA
end;
if not(NHF_UNNAMED_OBJECTS) then 
	MessageBox("/Text/NHF_Map.txt", "NHF_Map_Yes_F");
else
	if NHF_multiplayer == 0 then
		NHF_slep_singl = 1;		
		--MessageBox("/Text/NHF_ME.txt", "NHF_ME_Yes_F");
	else
		NHF_slep_singl = 0.1;
	end;
end;

----------------Загрузка констант специализаций героев----------------------------------
doFile("/scripts/NHF_Heroes_spec.lua");


--print("Start game NHF 0.88");

