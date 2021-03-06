--NHF----------------Лара---------------------	
lara_spec =
{
    path = "/MapObjects/Academy/NewHeroes/Lara/",
    heroes = {'Lara', 'Lara_copy_1', 'Lara_copy_2', 'Lara_copy_3', 'Lara_copy_4', 'Lara_copy_5', 'Lara_copy_6', 'Lara_copy_7', 'Lara_copy_8'},
    banks = 
    {
        ['bank_crypt_01'] =
        {
            guards =
            {
            {
                [CREATURE_SKELETON_COPY] = {45, 45},
                [CREATURE_SKELETON_ARCHER_COPY] = {30, 30}
            },
            {
                [CREATURE_WALKING_DEAD_COPY] = {30, 30},
                [CREATURE_ZOMBIE_COPY] = {20, 20}
            },
            },
            reward = {res = {[GOLD] = {1500, 1500}}}
        },
        --
        ['bank_crypt_02'] =
        {
            guards =
            {
            {
                [CREATURE_SKELETON_COPY] = {30, 30},
                [CREATURE_SKELETON_ARCHER_COPY] = {25, 25}
            },
            {
                [CREATURE_WALKING_DEAD_COPY] = {30, 30},
                [CREATURE_ZOMBIE_COPY] = {20, 20}
            },
            {
                [CREATURE_MANES_COPY] = {5, 5},
                [CREATURE_GHOST_COPY] = {5, 5}
            }
            },
            reward = {res = {[GOLD] = {2000, 2000}}}
        },
        --
        ['bank_crypt_03'] =
        {
            guards =
            {
            {
                [CREATURE_SKELETON_COPY] = {35, 35},
                [CREATURE_SKELETON_ARCHER_COPY] = {20, 20}
            },
            {
                [CREATURE_WALKING_DEAD_COPY] = {25, 25},
                [CREATURE_ZOMBIE_COPY] = {20, 20}
            },
            {
                [CREATURE_MANES_COPY] = {10, 10},
                [CREATURE_GHOST_COPY] = {6, 7}
            },
            {
                [CREATURE_VAMPIRE_COPY] = {5, 5},
                [CREATURE_VAMPIRE_LORD_COPY] = {3, 3}
            }
            },
            reward = {res = {[GOLD] = {2500, 2500}}}
        },
        --
        ['bank_crypt_04'] =
        {
            guards =
            {
            {
                [CREATURE_SKELETON_COPY] = {35, 35},
                [CREATURE_SKELETON_ARCHER_COPY] = {20, 20}
            },
            {
                [CREATURE_WALKING_DEAD_COPY] = {25, 25},
                [CREATURE_ZOMBIE_COPY] = {20, 20}
            },
            {
                [CREATURE_MANES_COPY] = {10, 10},
                [CREATURE_GHOST_COPY] = {6, 6}
            },
            {
                [CREATURE_LICH_COPY] = {5, 6},
                [CREATURE_VAMPIRE_LORD_COPY] = {5, 6}
            }
            },
            reward = {res = {[GOLD] = {5000, 5000}}, art = {[ART_TIER_MINOR] = {1, 1}}}
        },
        
        -- ��������
        ['bank_pyramid_01'] =
        {
            guards =
            {
            {
                [CREATURE_IRON_GOLEM_COPY] = {40, 40},
            },
            {
                [CREATURE_STEEL_GOLEM_COPY] = {20, 20}
            }
            },
            reward = {spell = {count = {1, 1}, lvl = {1, 5}}}
        },
        --
        ['bank_pyramid_02'] =
        {
            guards =
            {
            {
                [CREATURE_SKELETON_COPY] = {666, 666}
            }
            },
            reward = {spell = {count = {1, 2}, lvl = {2, 4}}}
        },
        
        -- ������������ �����
        ['bank_magi_vault_01'] =
        {
            guards =
            {
            {
                [CREATURE_MAGI_COPY] = {7, 7},
                [CREATURE_MAGI_COPY] = {9, 9}
            },
            {
                [CREATURE_STONE_GARGOYLE_COPY] = {25, 25},
                [CREATURE_OBSIDIAN_GARGOYLE_COPY] = {20, 20}
            },
            {
                [CREATURE_ARCH_MAGI_COPY] = {5, 5},
                [CREATURE_ARCH_MAGI_COPY] = {7, 7}
            }
            },
            reward = {res = {[GEM] = {8, 8}, [GOLD] = {2500, 2500}}, spell = {count = {1, 1}, lvl = {4, 4}}}
        },
        --
        ['bank_magi_vault_02'] =
        {
            guards =
            {
            {
                [CREATURE_MAGI_COPY] = {15, 15}
            },
            {
                [CREATURE_GENIE_COPY] = {15, 15},
                [CREATURE_MASTER_GENIE_COPY] = {13, 13}
            },
            {
                [CREATURE_MAGI_COPY] = {20, 20},
                [CREATURE_ARCH_MAGI_COPY] = {12, 12}
            },
            {
                [CREATURE_MAGI_COPY] = {15, 15}
            }
            },
            reward = {res = {[GEM] = {12, 12}, [GOLD] = {5000, 5000}}, spell = {count = {1, 2}, lvl = {4, 5}}}
        },
        --
        ['bank_magi_vault_03'] =
        {
            guards =
            {
            {
                [CREATURE_MAGI_COPY] = {21, 21},
                [CREATURE_ARCH_MAGI_COPY] = {12, 12}
            },
            {
                [CREATURE_RAKSHASA_RUKH_COPY] = {5, 5},
                [CREATURE_PHOENIX_COPY] = {3, 3}
            },
            {
                [CREATURE_MAGI_COPY] = {20, 2},
                [CREATURE_ARCH_MAGI_COPY] = {20, 20}
            }
            },
            reward = {res = {[GEM] = {12, 12}, [GOLD] = {7000, 7000}}, art = {[ART_TIER_MINOR] = {0, 1}}, spell = {count = {2, 2}, lvl = {5, 5}}}
        },
        
        -- ������
        ['bank_utopia_01'] =
        {
            guards =
            {
            {
                [CREATURE_GREEN_DRAGON_COPY] = {9, 9},
                [CREATURE_GOLD_DRAGON_COPY] = {7, 7}
            },
            {
                [CREATURE_DEEP_DRAGON_COPY] = {6, 6},
                [CREATURE_BLACK_DRAGON_COPY] = {4, 4}
            }
            },
            reward = {res = {[GOLD] = {12000, 20000}}, art = {[ART_TIER_MAJOR] = {2, 3}, [ART_TIER_RELIC] = {1, 1}}, spell = {count = {2, 2}, lvl = {4, 5}}}
        },
        --
        ['bank_utopia_02'] =
        {
            guards =
            {
            {
                [CREATURE_SHADOW_DRAGON_COPY] = {11, 11},
            },
            {
                [CREATURE_DEEP_DRAGON_COPY] = {6, 6},
            },
            {
                [CREATURE_BLACK_DRAGON_COPY] = {5, 5}
            }
            },
            reward = {res = {[GOLD] = {14000, 14000}}, art = {[ART_TIER_MINOR] = {1, 3}, [ART_TIER_MAJOR] = {2, 2}, [ART_TIER_RELIC] = {1, 1}}, spell = {count = {2, 2}, lvl = {4, 5}}}
        },
        --
        ['bank_utopia_03'] =
        {
            guards =
            {
            {
                [CREATURE_GREEN_DRAGON_COPY] = {8, 8},
            },
            {
                [CREATURE_DEEP_DRAGON_COPY] = {6, 6},
            },
            {
                [CREATURE_GOLD_DRAGON_COPY] = {4, 4},
            },
            {
                [CREATURE_BLACK_DRAGON_COPY] = {4, 4}
            }
            },
            reward = {res = {[GOLD] = {20000, 20000}}, art = {[ART_TIER_MAJOR] = {3, 4}, [ART_TIER_RELIC] = {2, 2}}, spell = {count = {3, 3}, lvl = {5, 5}}}
        },
        
        --
        ['bank_elems_01'] =
        {
            guards =
            {
            {
                [CREATURE_FIRE_ELEMENTAL_COPY] = {5, 5},
            },
            {
                [CREATURE_AIR_ELEMENTAL_COPY] = {5, 5},
            },
            {
                [CREATURE_WATER_ELEMENTAL_COPY] = {5, 5},
            },
            {
                [CREATURE_EARTH_ELEMENTAL_COPY] = {5, 5},
            }
            },
            reward = {res = {[WOOD] = {4, 4}, [ORE] = {4, 4}, [MERCURY] = {4, 4}, [SULFUR] = {4, 4}, [GEM] = {4, 4}, [CRYSTAL] = {4, 4}}}
        },
        --
        ['bank_elems_02'] =
        {
            guards =
            {
            {
                [CREATURE_FIRE_ELEMENTAL_COPY] = {10, 10},
            },
            {
                [CREATURE_AIR_ELEMENTAL_COPY] = {10, 10},
            },
            {
                [CREATURE_WATER_ELEMENTAL_COPY] = {10, 10},
            },
            {
                [CREATURE_EARTH_ELEMENTAL_COPY] = {10, 10},
            }
            },
            reward = {res = {[WOOD] = {6, 6}, [ORE] = {6, 6}, [MERCURY] = {6, 6}, [SULFUR] = {6, 6}, [GEM] = {6, 6}, [CRYSTAL] = {6, 6}}}
        },
        --
        ['bank_elems_03'] =
        {
            guards =
            {
            {
                [CREATURE_FIRE_ELEMENTAL_COPY] = {15, 15},
            },
            {
                [CREATURE_AIR_ELEMENTAL_COPY] = {15, 15},
            },
            {
                [CREATURE_WATER_ELEMENTAL_COPY] = {15, 15},
            },
            {
                [CREATURE_EARTH_ELEMENTAL_COPY] = {15, 15},
            }
            },
            reward = {res = {[WOOD] = {8, 10}, [ORE] = {8, 10}, [MERCURY] = {8, 10}, [SULFUR] = {8, 10}, [GEM] = {8, 10}, [CRYSTAL] = {8, 10}}}
        },
        --
        ['bank_elems_04'] =
        {
            guards =
            {
            {
                [CREATURE_FIRE_ELEMENTAL_COPY] = {20, 20},
            },
            {
                [CREATURE_AIR_ELEMENTAL_COPY] = {20, 20},
            },
            {
                [CREATURE_WATER_ELEMENTAL_COPY] = {20, 20},
            },
            {
                [CREATURE_EARTH_ELEMENTAL_COPY] = {20, 20},
            }
            },
            reward = {res = {[WOOD] = {10, 12}, [ORE] = {10, 12}, [MERCURY] = {10, 12}, [SULFUR] = {10, 12}, [GEM] = {10, 12}, [CRYSTAL] = {10, 12}}, art = {[ART_TIER_MINOR] = {1, 1}}}
        },

        --
        ['bank_demolish_01'] =
        {
            guards =
            {
            {
                [CREATURE_GHOST_COPY] = {15, 15},
                [CREATURE_MANES_COPY] = {22, 22}
            },
            {
                [CREATURE_SKELETON_COPY] = {21, 21},
                [CREATURE_WALKING_DEAD_COPY] = {17, 17}
            }
            },
            reward = {res = {[GOLD] = {2500, 2500}}}
        },
        --
        ['bank_demolish_02'] =
        {
            guards =
            {
            {
                [CREATURE_GHOST_COPY] = {15, 15},
            },
            {
                [CREATURE_MANES_COPY] = {15, 15}
            }
            },
            reward = {res = {[GOLD] = {3000, 3000}}}
        },
        --
        ['bank_demolish_03'] =
        {
            guards =
            {
            {
                [CREATURE_GHOST_COPY] = {25, 25},
                [CREATURE_WALKING_DEAD_COPY] = {75, 75}
            },
            {
                [CREATURE_SKELETON_COPY] = {15, 15},
            }
            },
            reward = {res = {[GOLD] = {5000, 5000}}, art = {[ART_TIER_MINOR] = {1, 1}}}
        },
        --
        ['bank_demolish_04'] =
        {
            guards =
            {
            {
                [CREATURE_GHOST_COPY] = {15, 15},
            },
            {
                [CREATURE_MANES_COPY] = {21, 21},
            },
            {
                [CREATURE_WIGHT_COPY] = {4, 4},
                [CREATURE_WRAITH_COPY] = {2, 2}
            }
            },
            reward = {res = {[GOLD] = {5000, 5000}}, art = {[ART_TIER_MAJOR] = {1, 1}}}
        },
        
        --
        ['bank_unkempt_01'] =
        {
            guards =
            {
            {
                [CREATURE_ARCHER_COPY] = {38, 38}
            },
            {
                [CREATURE_PEASANT_COPY] = {75, 75}
            }
            },
            reward = {red = {[GOLD] = {3000, 3000}}}
        },
        --
        ['bank_unkempt_02'] =
        {
            guards =
            {
            {
                [CREATURE_WATER_ELEMENTAL_COPY] = {15, 15}
            },
            },
            reward = {red = {[GOLD] = {3000, 3000}}, art = {[ART_TIER_MAJOR] = {1, 1}}}
        },
        --
        ['bank_unkempt_03'] =
        {
            guards =
            {
            {
                [CREATURE_AIR_ELEMENTAL_COPY] = {35, 40}
            },
            },
            reward = {red = {[GOLD] = {4000, 4000}}, art = {[ART_TIER_MINOR] = {1, 1}}}
        },
        --
        ['bank_unkempt_04'] =
        {
            guards =
            {
            {
                [CREATURE_SCOUT_COPY] = {40, 40},
                [CREATURE_ASSASSIN_COPY] = {30, 30}
            },
            {
                [CREATURE_HYDRA_COPY] = {6, 6},
                [CREATURE_MATRON_COPY] = {2, 2}
            },
            {
                [CREATURE_SCOUT_COPY] = {40, 40},
                [CREATURE_ASSASSIN_COPY] = {30, 30}
            },
            },
            reward = {red = {[GOLD] = {5000, 5000}}, art = {[ART_TIER_MAJOR] = {1, 1}}}
        },
        
        --
        ['bank_dwarven_01'] =
        {
            guards =
            {
            {
                [CREATURE_STOUT_DEFENDER_COPY] = {50, 50},
            },
        --       {
        --         [CREATURE_STOUT_DEFENDER_COPY] = {25, 25},
        --       },
            {
                [CREATURE_AXE_THROWER_COPY] = {10, 10},
            },
        --       {
        --         [CREATURE_AXE_THROWER_COPY] = {5, 5},
        --       }
            },
            reward = {res = {[GEM] = {5, 5}, [CRYSTAL] = {5, 5}, [GOLD] = {1000, 1000}}}
        },
        --
        ['bank_dwarven_02'] =
        {
            guards =
            {
            {
                [CREATURE_STOUT_DEFENDER_COPY] = {100, 100},
            },
        --       {
        --         [CREATURE_STOUT_DEFENDER_COPY] = {50, 50},
        --       },
            {
                [CREATURE_AXE_THROWER_COPY] = {20, 20},
            },
        --       {
        --         [CREATURE_AXE_THROWER_COPY] = {10, 10},
        --       }
            },
            reward = {res = {[GEM] = {10, 10}, [CRYSTAL] = {10, 10}, [GOLD] = {2500, 2500}}}
        },
        --
        ['bank_dwarven_03'] =
        {
            guards =
            {
            {
                [CREATURE_STOUT_DEFENDER_COPY] = {150, 150},
            },
        --       {
        --         [CREATURE_STOUT_DEFENDER_COPY] = {75, 75},
        --       },
            {
                [CREATURE_AXE_THROWER_COPY] = {30, 30},
            },
        --       {
        --         [CREATURE_AXE_THROWER_COPY] = {15, 15},
        --       },
            {
                [CREATURE_WARLORD_COPY] = {5, 5},
            }
            },
            reward = {res = {[GEM] = {15, 15}, [CRYSTAL] = {15, 15}, [GOLD] = {5000, 5000}}}
        },
        
        --
        ['bank_blood_temple_01'] =
        {
            guards =
            {
            {
                [CREATURE_BLOOD_WITCH_COPY] = {40, 40},
            },
        --       {
        --         [CREATURE_BLOOD_WITCH_COPY] = {20, 20},
        --       },
            {
                [CREATURE_MATRON_COPY] = {5, 5},
            },
            },
            reward = {res = {[GOLD] = {2500, 2500}}}
        },
        --
        ['bank_blood_temple_02'] =
        {
            guards =
            {
            {
                [CREATURE_BLOOD_WITCH_COPY] = {80, 80},
            },
        --       {
        --         [CREATURE_BLOOD_WITCH_COPY] = {40, 40},
        --       },
            {
                [CREATURE_MATRON_COPY] = {10, 10},
            },
        --       {
        --         [CREATURE_MATRON_COPY] = {5, 5},
        --       },
            {
                [CREATURE_MATRIARCH_COPY] = {5, 5},
            },
            },
            reward = {res = {[GOLD] = {4000, 4000}}, art = {[ART_TIER_MINOR] = {1, 1}}}
        },
        --
        ['bank_blood_temple_02'] =
        {
            guards =
            {
            {
                [CREATURE_BLOOD_WITCH_COPY] = {120, 120},
            },
        --       {
        --         [CREATURE_BLOOD_WITCH_COPY] = {60, 60},
        --       },
            {
                [CREATURE_MATRON_COPY] = {20, 20},
            },
        --       {
        --         [CREATURE_MATRON_COPY] = {10, 10},
        --       },
            {
                [CREATURE_MATRIARCH_COPY] = {10, 10},
            },
            },
            reward = {res = {[GOLD] = {5500, 5500}}, art = {[ART_TIER_MAJOR] = {1, 1}}}
        },
        
        --
        ['bank_treant_tricket_01'] =
        {
            guards =
            {
            {
                [CREATURE_TREANT_COPY] = {30, 30},
            },
        --       {
        --         [CREATURE_TREANT_COPY] = {15, 15},
        --       },
            {
                [CREATURE_WOOD_ELF_COPY] = {60, 60},
            },
        --       {
        --         [CREATURE_WOOD_ELF_COPY] = {30, 30},
        --       },
            },
            reward = {res = {[WOOD] = {10, 10}, [GOLD] = {5500, 5500}}}
        },
        --
        ['bank_treant_tricket_02'] =
        {
            guards =
            {
            {
                [CREATURE_TREANT_GUARDIAN_COPY] = {30, 30},
            },
        --       {
        --         [CREATURE_TREANT_GUARDIAN_COPY] = {15, 15},
        --       },
            {
                [CREATURE_WOOD_ELF_COPY] = {60, 60},
            },
        --       {
        --         [CREATURE_WOOD_ELF_COPY] = {30, 30},
        --       },
            },
            reward = {res = {[WOOD] = {20, 20}, [GOLD] = {7500, 7500}}}
        },
        --
        ['bank_treant_tricket_03'] =
        {
            guards =
            {
            {
                [CREATURE_TREANT_GUARDIAN_COPY] = {40, 40},
            },
        --       {
        --         [CREATURE_TREANT_GUARDIAN_COPY] = {20, 20},
        --       },
            {
                [CREATURE_GRAND_ELF_COPY] = {60, 60},
            },
        --       {
        --         [CREATURE_GRAND_ELF_COPY] = {30, 30},
        --       },
            {
                [CREATURE_DRUID_ELDER_COPY] = {10, 10},
            },
            },
            reward = {res = {[WOOD] = {30, 30}, [GOLD] = {10000, 10000}}}
        },
        
        --
        ['bank_gargoyle_stone_01'] =
        {
            guards =
            {
            {
                [CREATURE_STONE_GARGOYLE_COPY] = {60, 60},
            },
        --       {
        --         [CREATURE_STONE_GARGOYLE_COPY] = {20, 20},
        --       },
        --       {
        --         [CREATURE_STONE_GARGOYLE_COPY] = {20, 20},
        --       }
            },
            reward = {res = {[ORE] = {5, 5}, [GOLD] = {1000, 1000}}}
        },
        --
        ['bank_gargoyle_stone_02'] =
        {
            guards =
            {
            {
                [CREATURE_OBSIDIAN_GARGOYLE_COPY] = {90, 90},
            },
        --       {
        --         [CREATURE_OBSIDIAN_GARGOYLE_COPY] = {30, 30},
        --       },
        --       {
        --         [CREATURE_OBSIDIAN_GARGOYLE_COPY] = {30, 30},
        --       },
            {
                [CREATURE_IRON_GOLEM_COPY] = {20, 20},
            }
            },
            reward = {res = {[ORE] = {10, 10}, [GOLD] = {2000, 2000}}}
        },
        --
        ['bank_gargoyle_stone_03'] =
        {
            guards =
            {
            {
                [CREATURE_OBSIDIAN_GARGOYLE_COPY] = {120, 120},
            },
        --       {
        --         [CREATURE_OBSIDIAN_GARGOYLE_COPY] = {40, 40},
        --       },
        --       {
        --         [CREATURE_OBSIDIAN_GARGOYLE_COPY] = {40, 40},
        --       },
            {
                [CREATURE_STEEL_GOLEM_COPY] = {20, 20},
            }
            },
            reward = {res = {[ORE] = {15, 15}, [GOLD] = {3000, 3000}}}
        },
        
        --
        ['bank_sunken_temple_01'] =
        {
            guards =
            {
            {
                [CREATURE_GIANT_COPY] = {11, 11},
                [CREATURE_TITAN_COPY] = {7, 7}
            },
            {
                [CREATURE_WATER_ELEMENTAL_COPY] = {50, 50},
                [CREATURE_WATER_ELEMENTAL_COPY] = {40, 40}
            }
            },
            reward = {res = {[GOLD] = {12000, 20000}}, art = {[ART_TIER_MAJOR] = {2, 3}, [ART_TIER_RELIC] = {1, 1}}, spell = {count = {2, 2}, lvl = {4, 5}}}
        },
        --
        ['bank_sunken_temple_02'] =
        {
            guards =
            {
            {
                [CREATURE_GIANT_COPY] = {11, 11},
            },
            {
                [CREATURE_TITAN_COPY] = {6, 6}
            },
            {
                [CREATURE_WATER_ELEMENTAL_COPY] = {50, 50},
            }
            },
            reward = {res = {[GOLD] = {14000, 14000}}, art = {[ART_TIER_MINOR] = {1, 3}, [ART_TIER_MAJOR] = {2, 2}, [ART_TIER_RELIC] = {1, 1}}, spell = {count = {2, 2}, lvl = {4, 5}}}
        },
        --
        ['bank_sunken_temple_03'] =
        {
            guards =
            {
            {
                [CREATURE_GIANT_COPY] = {8, 8},
            },
            {
                [CREATURE_WATER_ELEMENTAL_COPY] = {100, 100},
            },
            {
                [CREATURE_TITAN_COPY] = {4, 4}
            },
        --       {
        --         [CREATURE_WATER_ELEMENTAL_COPY] = {40, 40},
        --       }
            },
            reward = {res = {[GOLD] = {20000, 20000}}, art = {[ART_TIER_MAJOR] = {3, 4}, [ART_TIER_RELIC] = {2, 2}}, spell = {count = {3, 3}, lvl = {4, 5}}}
        },
        
        --
        ['bank_naga_temple_01'] =
        {
            guards =
            {
            {
                [CREATURE_GIANT_COPY] = {9, 9},
                [CREATURE_TITAN_COPY] = {7, 7}
            },
            },
            reward = {res = {[GOLD] = {12000, 20000}}, art = {[ART_TIER_MAJOR] = {2, 3}, [ART_TIER_RELIC] = {1, 1}}, spell = {count = {2, 2}, lvl = {4, 5}}}
        },
    }
}

AddEvent(combat_results_events, 'NHF_lara_spec_combat_result',
function(fight_id)
    local winner = GetSavedCombatArmyHero(fight_id, 1)
    if winner and contains(lara_spec.heroes, winner) then
        --
        local multiplier = 1
        local chance = 100 -- NHF_Lara_percent * GetHeroLevel(winner) * 100
        print("Lara's chance to increase rewards: ", chance)
        if chance <= 100 then
            local try = random(100) + 1
            print('random: ', try)
            if try > chance then
                print('no more rewards')
                return
            else
                multiplier = 2
            end
            else
            if (random(100) + 1) <= (chance - 100) then
                multiplier = 3
            else
                multiplier = 2
            end
            end
            --
            if multiplier ~= 1 then
                print('Multiplier: ', multiplier)
                local reward_to_increase = {}
                local stacks = GetSavedCombatArmyCreaturesCount(fight_id,0);
                -- �� ���� ������
                for bank, info in lara_spec.banks do
                    local check = 1
                    -- �������� �� ������ ������ �������
                    for i = 0, stacks - 1 do
                        creature, count, dead = GetSavedCombatArmyCreatureInfo(fight_id, 0, i)
                        local curr_id_check
                        -- ���� ��������� ������ ��������...
                        for j, pair in info.guards do
                            for type, range in pair do
                            -- ������� ���� �� � ����� �� ��������� ������� ����� � ������ ����������
                            if type == creature and (dead >= range[1] and dead <= range[2]) then
                                curr_id_check = 1 -- ���������� �����
                                break
                            end
                            end
                        end
                        -- ���� �������� �� ������� � ������ �����
                        if not curr_id_check then
                            check = nil -- ��������� �������� ��� ��������
                            break
                        end
                    end
                    -- ���� ����� ���� �������� ���� ����������� - ������ ���� ������ � ������������ ��� ������� ��� ����������
                    if check then
                        reward_to_increase = info.reward
                        print('Lara was in ', bank)
                    end
                end
                --
                if len(reward_to_increase) ~= 0 then
                    --
                    if reward_to_increase.res then
                        for res, counts in reward_to_increase.res do
                            local count_to_add = GetRandFromT(counts) * (multiplier - 1)
                            local curr_count = GetPlayerResource(GetObjectOwner(winner), res)
                            SetPlayerResource(GetObjectOwner(winner), res, curr_count + count_to_add)
                        end
                    end
                    --
                    if reward_to_increase.art then
                        for art_tier, counts in reward_to_increase.art do
                            local count_to_add = GetRandFromT(counts) * (multiplier - 1)
                            for i = 1, count_to_add do
                                local art = GetRandomArt(art_tier)
                                print('art = ', art)
                                GiveArtefact(winner, art)
                            end
                        end
                    end
                    --
                    if reward_to_increase.spell then
                        local curr_count = GetRandFromT(reward_to_increase.spell.count)
                        for i = 1, curr_count do
                            local curr_lvl = GetRandFrom(reward_to_increase.spell.lvl)
                            local mastery = curr_lvl - 2
                            local spells = GetAllSpellsByMastery(mastery)
                            local lara_unknown_spells = {}, n
                            for i, spell in spells do
                                if not KnowHeroSpell(winner, spell) then
                                    n = n + 1
                                    lara_unknown_spells[n] = spell
                                end
                            end
                            if n ~= 0 then
                                TeachHeroSpell(winner, GetRandFromT(lara_unknown_spells))
                            end
                        end
                    end
                    --
                    if multiplier == 2 then
                        startThread(ShowFlyingSign, lara_spec.path..'double_reward.txt', winner, GetObjectOwner(winner), 7.0)
                    else
                        startThread(ShowFlyingSign, lara_spec.path..'triple_reward.txt', winner, GetObjectOwner(winner), 7.0)
                    end
                end
            end
        end
    end
end)

combat_scripts_paths[length(combat_scripts_paths) + 1] = 'scripts/combat/NHF/Lara.lua'