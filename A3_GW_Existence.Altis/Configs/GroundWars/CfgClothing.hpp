/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: CfgClothing.hpp
*/

/**
*    Clothing Array
*       0: STRING - Classname
*       1: NUMBER - Price of buy
*       2: NUMBER - Price of sell
*       3: NUMBER - Level Category Index
*       4: NUMBER - Level of Category
*       5: STRING - Condition
*       6: STRING - Override DisplayName
*/
class CfgClothing {
    masks[] = {
        "G_Balaclava_TI_blk_F",
        "G_Balaclava_blk",
        "G_Balaclava_combat",
        "G_Balaclava_lowprofile"
    };
    class Shops {
        class Police {
            displayName = "RMP Clothing Locker";
            condition   = "playerSide isEqualTo west";
            clothing[]  = {
                // Normal Hivis Uniforms
                {"U_B_CombatUniform_mcam",          0, -1, -1, -1, "true", "Patrol Uniform"             },
                {"U_B_CombatUniform_mcam_vest",     0, -1, -1, -1, "true", "Patrol Uniform Rolled Up"   },
                {"U_B_CombatUniform_mcam_tshirt",   0, -1, -1, -1, "true", "Patrol Uniform T-shirt"     },

                // Operations Uniforms
                {"U_I_CombatUniform",               0, -1, -1, -1, "true", "Operations Uniform"            },
                {"U_I_CombatUniform_shortsleeve",   0, -1, -1, -1, "true", "Operations Uniform Shortsleeve"},

                // CTRG Sand Uniforms
                {"U_B_CTRG_1",                      0, -1, -1, -1, "true", ""                              }, // Normal
                {"U_B_CTRG_2",                      0, -1, -1, -1, "true", ""                              }, // Tee
                {"U_B_CTRG_3",                      0, -1, -1, -1, "true", ""                              }, // Rolled up

                // CTRG Urban Uniforms
                {"U_B_CTRG_Soldier_urb_1_F",        0, -1, -1, -1, "true", ""                              }, // Normal
                {"U_B_CTRG_Soldier_urb_2_F",        0, -1, -1, -1, "true", ""                              }, // Tee
                {"U_B_CTRG_Soldier_urb_3_F",        0, -1, -1, -1, "true", ""                              }, // Rolled Up

                // CTRG Stealth Uniforms
                {"U_B_CTRG_Soldier_F",              0, -1, -1, -1, "true", ""                              }, // Normal
                {"U_B_CTRG_Soldier_2_F",            0, -1, -1, -1, "true", ""                              }, // Tee
                {"U_B_CTRG_Soldier_3_F",            0, -1, -1, -1, "true", ""                              }, // Rolled up

                // Half Ghillies
                {"U_B_GhillieSuit",                 0, -1, -1, -1, "true", ""                              },

                // Full Ghillies
                {"U_B_FullGhillie_ard",             0, -1, -1, -1, "true", ""                              }, // Arid
                {"U_B_FullGhillie_sard",            0, -1, -1, -1, "true", ""                              }, // Semi-Arid
                {"U_B_FullGhillie_lsh",             0, -1, -1, -1, "true", ""                              }, // Lush

                // Pilot Coveralls
                {"U_B_HeliPilotCoveralls",          0, -1, -1, -1, "true", ""                              }, // Heli Pilot Coveralls
                {"U_B_PilotCoveralls",              0, -1, -1, -1, "true", ""                              }, // Pilot Coveralls

                // Wetsuit
                {"U_B_Wetsuit",                     0, -1, -1, -1, "true", ""                              },
                {"V_RebreatherB",                   0, -1, -1, -1, "true", ""                              },

                {"V_TacChestrig_grn_F",             0, -1, -1, -1, "true", ""                              },
                {"V_TacChestrig_oli_F",             0, -1, -1, -1, "true", ""                              },
                {"V_TacChestrig_cbr_F",             0, -1, -1, -1, "true", ""                              },

                {"V_Rangemaster_belt",              0, -1, -1, -1, "true", ""                              },
                {"V_TacVest_blk_POLICE",            0, -1, -1, -1, "true", ""                              },

                {"V_PlateCarrier1_blk",             0, -1, -1, -1, "true", ""                              },
                {"V_PlateCarrier2_blk",             0, -1, -1, -1, "true", ""                              },

                {"V_PlateCarrier1_rgr_noflag_F",    0, -1, -1, -1, "true", ""                              },
                {"V_PlateCarrier2_rgr_noflag_F",    0, -1, -1, -1, "true", ""                              },

                {"V_PlateCarrierL_CTRG",            0, -1, -1, -1, "true", ""                              },
                {"V_PlateCarrierH_CTRG",            0, -1, -1, -1, "true", ""                              },

                // Glasses
                {"G_Tactical_Clear",                0, -1, -1, -1, "true", ""                              },
                {"G_Tactical_Black",                0, -1, -1, -1, "true", ""                              },
                {"G_B_Diving",                      0, -1, -1, -1, "true", ""                              },
                {"G_Aviator",                       0, -1, -1, -1, "true", ""                              },

                // Balaclavas
                {"G_Balaclava_TI_blk_F",            0, -1, -1, -1, "true", ""                              },
                {"G_Balaclava_blk",                 0, -1, -1, -1, "true", ""                              },
                {"G_Balaclava_combat",              0, -1, -1, -1, "true", ""                              },
                {"G_Balaclava_lowprofile",          0, -1, -1, -1, "true", ""                              },

                // Caps
                {"H_Cap_headphones",                0, -1, -1, -1, "true", ""                              },
                {"H_Cap_tan_specops_US",            0, -1, -1, -1, "true", ""                              },
                {"H_Cap_khaki_specops_UK",          0, -1, -1, -1, "true", ""                              },
                {"H_Cap_police",                    0, -1, -1, -1, "true", ""                              },
                {"H_MilCap_mcamo",                  0, -1, -1, -1, "true", ""                              },
                {"H_MilCap_blue",                   0, -1, -1, -1, "true", ""                              },
                {"H_MilCap_gen_F",                  0, -1, -1, -1, "true", ""                              },
                {"H_Watchcap_blk",                  0, -1, -1, -1, "true", ""                              },

                // Berets
                {"H_Beret_blk_POLICE",              0, -1, -1, -1, "true", ""                              },
                {"H_Beret_02",                      0, -1, -1, -1, "true", ""                              },
                {"H_Beret_Colonel",                 0, -1, -1, -1, "true", ""                              },

                // Boonies
                {"H_Booniehat_khk",                 0, -1, -1, -1, "true", ""                              },
                {"H_Booniehat_oli",                 0, -1, -1, -1, "true", ""                              },
                {"H_Booniehat_mcamo",               0, -1, -1, -1, "true", ""                              },
                {"H_Booniehat_grn",                 0, -1, -1, -1, "true", ""                              },
                {"H_Booniehat_tan",                 0, -1, -1, -1, "true", ""                              },
                {"H_Booniehat_dirty",               0, -1, -1, -1, "true", ""                              },
                {"H_Booniehat_khk_hs",              0, -1, -1, -1, "true", ""                              },

                // Bandanas
                {"H_Bandanna_surfer",               0, -1, -1, -1, "true", ""                              },
                {"H_Bandanna_sand",                 0, -1, -1, -1, "true", ""                              },
                {"H_Bandanna_surfer_blk",           0, -1, -1, -1, "true", ""                              },
                {"H_Bandanna_surfer_grn",           0, -1, -1, -1, "true", ""                              },
                {"H_Bandanna_gry",                  0, -1, -1, -1, "true", ""                              },

                // Light combat helmets
                {"H_HelmetB_light",                 0, -1, -1, -1, "true", ""                              },
                {"H_HelmetB_light_grass",           0, -1, -1, -1, "true", ""                              },
                {"H_HelmetB_light_snakeskin",       0, -1, -1, -1, "true", ""                              },
                {"H_HelmetB_light_desert",          0, -1, -1, -1, "true", ""                              },
                {"H_HelmetB_light_black",           0, -1, -1, -1, "true", ""                              },
                {"H_HelmetB_light_sand",            0, -1, -1, -1, "true", ""                              },

                // Pilot Helmets
                {"H_PilotHelmetHeli_B",             0, -1, -1, -1, "true", ""                              },
                {"H_CrewHelmetHeli_B",              0, -1, -1, -1, "true", ""                              },
                {"H_PilotHelmetFighter_B",          0, -1, -1, -1, "true", ""                              },

                // Combat Helmets
                {"H_HelmetB_plain_blk",             0, -1, -1, -1, "true", ""                              },
                {"H_HelmetB_plain_mcamo",           0, -1, -1, -1, "true", ""                              },
                {"H_HelmetB_camo",                  0, -1, -1, -1, "true", ""                              },
                {"H_HelmetB_paint",                 0, -1, -1, -1, "true", ""                              },

                // Enhanced Combat Helmets
                {"H_HelmetSpecB",                   0, -1, -1, -1, "true", ""                              },
                {"H_HelmetSpecB_paint1",            0, -1, -1, -1, "true", ""                              },
                {"H_HelmetSpecB_paint2",            0, -1, -1, -1, "true", ""                              },
                {"H_HelmetSpecB_blk",               0, -1, -1, -1, "true", ""                              },
                {"H_HelmetSpecB_snakeskin",         0, -1, -1, -1, "true", ""                              },
                {"H_HelmetSpecB_sand",              0, -1, -1, -1, "true", ""                              },

                // Parachute
                {"B_Parachute",                     0, -1, -1, -1, "true", ""                              },

                // Backpacks
                {"B_Messenger_Black_F",             0, -1, -1, -1, "true", ""                              },
                {"B_Messenger_Coyote_F",            0, -1, -1, -1, "true", ""                              },
                {"B_Messenger_Gray_F",              0, -1, -1, -1, "true", ""                              },
                {"B_Messenger_Olive_F",             0, -1, -1, -1, "true", ""                              },

                {"B_AssaultPack_blk",               0, -1, -1, -1, "true", ""                              },
                {"B_AssaultPack_cbr",               0, -1, -1, -1, "true", ""                              },
                {"B_AssaultPack_khk",               0, -1, -1, -1, "true", ""                              },
                {"B_AssaultPack_sgg",               0, -1, -1, -1, "true", ""                              },

                {"B_TacticalPack_blk",              0, -1, -1, -1, "true", ""                              },
                {"B_TacticalPack_rgr",              0, -1, -1, -1, "true", ""                              },
                {"B_TacticalPack_oli",              0, -1, -1, -1, "true", ""                              },

                {"B_FieldPack_blk",                 0, -1, -1, -1, "true", ""                              },
                {"B_FieldPack_cbr",                 0, -1, -1, -1, "true", ""                              },
                {"B_FieldPack_khk",                 0, -1, -1, -1, "true", ""                              },
                {"B_FieldPack_oli",                 0, -1, -1, -1, "true", ""                              },

                {"B_Kitbag_cbr",                    0, -1, -1, -1, "true", ""                              },
                {"B_Kitbag_rgr",                    0, -1, -1, -1, "true", ""                              },
                {"B_Kitbag_sgg",                    0, -1, -1, -1, "true", ""                              },

                {"B_Carryall_cbr",                  0, -1, -1, -1, "true", ""                              },
                {"B_Carryall_khk",                  0, -1, -1, -1, "true", ""                              },
                {"B_Carryall_oli",                  0, -1, -1, -1, "true", ""                              },

                {"B_ViperLightHarness_blk_F",       0, -1, -1, -1, "true", ""                              },
                {"B_ViperLightHarness_khk_F",       0, -1, -1, -1, "true", ""                              },
                {"B_ViperLightHarness_oli_F",       0, -1, -1, -1, "true", ""                              },

                {"B_ViperHarness_blk_F",            0, -1, -1, -1, "true", ""                              },
                {"B_ViperHarness_khk_F",            0, -1, -1, -1, "true", ""                              },
                {"B_ViperHarness_oli_F",            0, -1, -1, -1, "true", ""                              },

                {"B_Bergen_tna_F",                  0, -1, -1, -1, "true", ""                              },
                {"B_Bergen_mcamo_F",                0, -1, -1, -1, "true", "Invisible Backpack"            }
            };
        };
        class RMPSafe {
            displayName = "RMP Clothing Safe";
            condition   = "playerSide isEqualTo west && {[] call GW_client_fnc_equipmentSafeIsUnlocked}";
            clothing[]  = {
                // Normal Hivis Uniforms
                {"U_B_CombatUniform_mcam",          0, -1, -1, -1, "true", "Patrol Uniform"             },
                {"U_B_CombatUniform_mcam_vest",     0, -1, -1, -1, "true", "Patrol Uniform Rolled Up"   },
                {"U_B_CombatUniform_mcam_tshirt",   0, -1, -1, -1, "true", "Patrol Uniform T-shirt"     },

                // Operations Uniforms
                {"U_I_CombatUniform",               0, -1, -1, -1, "true", "Operations Uniform"            },
                {"U_I_CombatUniform_shortsleeve",   0, -1, -1, -1, "true", "Operations Uniform Shortsleeve"},

                // CTRG Sand Uniforms
                {"U_B_CTRG_1",                      0, -1, -1, -1, "true", ""                              }, // Normal
                {"U_B_CTRG_2",                      0, -1, -1, -1, "true", ""                              }, // Tee
                {"U_B_CTRG_3",                      0, -1, -1, -1, "true", ""                              }, // Rolled up

                // CTRG Urban Uniforms
                {"U_B_CTRG_Soldier_urb_1_F",        0, -1, -1, -1, "true", ""                              }, // Normal
                {"U_B_CTRG_Soldier_urb_2_F",        0, -1, -1, -1, "true", ""                              }, // Tee
                {"U_B_CTRG_Soldier_urb_3_F",        0, -1, -1, -1, "true", ""                              }, // Rolled Up

                // CTRG Stealth Uniforms
                {"U_B_CTRG_Soldier_F",              0, -1, -1, -1, "true", ""                              }, // Normal
                {"U_B_CTRG_Soldier_2_F",            0, -1, -1, -1, "true", ""                              }, // Tee
                {"U_B_CTRG_Soldier_3_F",            0, -1, -1, -1, "true", ""                              }, // Rolled up

                // Half Ghillies
                {"U_B_GhillieSuit",                 0, -1, -1, -1, "true", ""                              },

                // Full Ghillies
                {"U_B_FullGhillie_ard",             0, -1, -1, -1, "true", ""                              }, // Arid
                {"U_B_FullGhillie_sard",            0, -1, -1, -1, "true", ""                              }, // Semi-Arid
                {"U_B_FullGhillie_lsh",             0, -1, -1, -1, "true", ""                              }, // Lush

                // Pilot Coveralls
                {"U_B_HeliPilotCoveralls",          0, -1, -1, -1, "true", ""                              }, // Heli Pilot Coveralls
                {"U_B_PilotCoveralls",              0, -1, -1, -1, "true", ""                              }, // Pilot Coveralls

                // Wetsuit
                {"U_B_Wetsuit",                     0, -1, -1, -1, "true", ""                              },
                {"V_RebreatherB",                     0, -1, -1, -1, "true", ""                            },

                {"V_TacChestrig_grn_F",             0, -1, -1, -1, "true", ""                              },
                {"V_TacChestrig_oli_F",             0, -1, -1, -1, "true", ""                              },
                {"V_TacChestrig_cbr_F",             0, -1, -1, -1, "true", ""                              },

                {"V_Rangemaster_belt",              0, -1, -1, -1, "true", ""                              },
                {"V_TacVest_blk_POLICE",            0, -1, -1, -1, "true", ""                              },

                {"V_PlateCarrier1_blk",             0, -1, -1, -1, "true", ""                              },
                {"V_PlateCarrier2_blk",             0, -1, -1, -1, "true", ""                              },

                {"V_PlateCarrier1_rgr_noflag_F",    0, -1, -1, -1, "true", ""                              },
                {"V_PlateCarrier2_rgr_noflag_F",    0, -1, -1, -1, "true", ""                              },

                {"V_PlateCarrierL_CTRG",            0, -1, -1, -1, "true", ""                              },
                {"V_PlateCarrierH_CTRG",            0, -1, -1, -1, "true", ""                              },

                // Glasses
                {"G_Tactical_Clear",                0, -1, -1, -1, "true", ""                              },
                {"G_Tactical_Black",                0, -1, -1, -1, "true", ""                              },
                {"G_B_Diving",                      0, -1, -1, -1, "true", ""                              },
                {"G_Aviator",                       0, -1, -1, -1, "true", ""                              },

                // Balaclavas
                {"G_Balaclava_TI_blk_F",            0, -1, -1, -1, "true", ""                              },
                {"G_Balaclava_blk",                 0, -1, -1, -1, "true", ""                              },
                {"G_Balaclava_combat",              0, -1, -1, -1, "true", ""                              },
                {"G_Balaclava_lowprofile",          0, -1, -1, -1, "true", ""                              },

                // Caps
                {"H_Cap_headphones",                0, -1, -1, -1, "true", ""                              },
                {"H_Cap_tan_specops_US",            0, -1, -1, -1, "true", ""                              },
                {"H_Cap_khaki_specops_UK",          0, -1, -1, -1, "true", ""                              },
                {"H_Cap_police",                    0, -1, -1, -1, "true", ""                              },
                {"H_MilCap_mcamo",                  0, -1, -1, -1, "true", ""                              },
                {"H_MilCap_blue",                   0, -1, -1, -1, "true", ""                              },
                {"H_MilCap_gen_F",                  0, -1, -1, -1, "true", ""                              },
                {"H_Watchcap_blk",                  0, -1, -1, -1, "true", ""                              },

                // Berets
                {"H_Beret_blk_POLICE",              0, -1, -1, -1, "true", ""                              },
                {"H_Beret_02",                      0, -1, -1, -1, "true", ""                              },
                {"H_Beret_Colonel",                 0, -1, -1, -1, "true", ""                              },

                // Boonies
                {"H_Booniehat_khk",                 0, -1, -1, -1, "true", ""                              },
                {"H_Booniehat_oli",                 0, -1, -1, -1, "true", ""                              },
                {"H_Booniehat_mcamo",               0, -1, -1, -1, "true", ""                              },
                {"H_Booniehat_grn",                 0, -1, -1, -1, "true", ""                              },
                {"H_Booniehat_tan",                 0, -1, -1, -1, "true", ""                              },
                {"H_Booniehat_dirty",               0, -1, -1, -1, "true", ""                              },
                {"H_Booniehat_khk_hs",              0, -1, -1, -1, "true", ""                              },

                // Bandanas
                {"H_Bandanna_surfer",               0, -1, -1, -1, "true", ""                              },
                {"H_Bandanna_sand",                 0, -1, -1, -1, "true", ""                              },
                {"H_Bandanna_surfer_blk",           0, -1, -1, -1, "true", ""                              },
                {"H_Bandanna_surfer_grn",           0, -1, -1, -1, "true", ""                              },
                {"H_Bandanna_gry",                  0, -1, -1, -1, "true", ""                              },

                // Light combat helmets
                {"H_HelmetB_light",                 0, -1, -1, -1, "true", ""                              },
                {"H_HelmetB_light_grass",           0, -1, -1, -1, "true", ""                              },
                {"H_HelmetB_light_snakeskin",       0, -1, -1, -1, "true", ""                              },
                {"H_HelmetB_light_desert",          0, -1, -1, -1, "true", ""                              },
                {"H_HelmetB_light_black",           0, -1, -1, -1, "true", ""                              },
                {"H_HelmetB_light_sand",            0, -1, -1, -1, "true", ""                              },

                // Pilot Helmets
                {"H_PilotHelmetHeli_B",             0, -1, -1, -1, "true", ""                              },
                {"H_CrewHelmetHeli_B",              0, -1, -1, -1, "true", ""                              },
                {"H_PilotHelmetFighter_B",          0, -1, -1, -1, "true", ""                              },

                // Combat Helmets
                {"H_HelmetB_plain_blk",             0, -1, -1, -1, "true", ""                              },
                {"H_HelmetB_plain_mcamo",           0, -1, -1, -1, "true", ""                              },
                {"H_HelmetB_camo",                  0, -1, -1, -1, "true", ""                              },
                {"H_HelmetB_paint",                 0, -1, -1, -1, "true", ""                              },

                // Enhanced Combat Helmets
                {"H_HelmetSpecB",                   0, -1, -1, -1, "true", ""                              },
                {"H_HelmetSpecB_paint1",            0, -1, -1, -1, "true", ""                              },
                {"H_HelmetSpecB_paint2",            0, -1, -1, -1, "true", ""                              },
                {"H_HelmetSpecB_blk",               0, -1, -1, -1, "true", ""                              },
                {"H_HelmetSpecB_snakeskin",         0, -1, -1, -1, "true", ""                              },
                {"H_HelmetSpecB_sand",              0, -1, -1, -1, "true", ""                              },

                // Parachute
                {"B_Parachute",                     0, -1, -1, -1, "true", ""                              },

                // Backpacks
                {"B_Messenger_Black_F",             0, -1, -1, -1, "true", ""                              },
                {"B_Messenger_Coyote_F",            0, -1, -1, -1, "true", ""                              },
                {"B_Messenger_Gray_F",              0, -1, -1, -1, "true", ""                              },
                {"B_Messenger_Olive_F",             0, -1, -1, -1, "true", ""                              },

                {"B_AssaultPack_blk",               0, -1, -1, -1, "true", ""                              },
                {"B_AssaultPack_cbr",               0, -1, -1, -1, "true", ""                              },
                {"B_AssaultPack_khk",               0, -1, -1, -1, "true", ""                              },
                {"B_AssaultPack_sgg",               0, -1, -1, -1, "true", ""                              },

                {"B_TacticalPack_blk",              0, -1, -1, -1, "true", ""                              },
                {"B_TacticalPack_rgr",              0, -1, -1, -1, "true", ""                              },
                {"B_TacticalPack_oli",              0, -1, -1, -1, "true", ""                              },

                {"B_FieldPack_blk",                 0, -1, -1, -1, "true", ""                              },
                {"B_FieldPack_cbr",                 0, -1, -1, -1, "true", ""                              },
                {"B_FieldPack_khk",                 0, -1, -1, -1, "true", ""                              },
                {"B_FieldPack_oli",                 0, -1, -1, -1, "true", ""                              },

                {"B_Kitbag_cbr",                    0, -1, -1, -1, "true", ""                              },
                {"B_Kitbag_rgr",                    0, -1, -1, -1, "true", ""                              },
                {"B_Kitbag_sgg",                    0, -1, -1, -1, "true", ""                              },

                {"B_Carryall_cbr",                  0, -1, -1, -1, "true", ""                              },
                {"B_Carryall_khk",                  0, -1, -1, -1, "true", ""                              },
                {"B_Carryall_oli",                  0, -1, -1, -1, "true", ""                              },

                {"B_ViperLightHarness_blk_F",       0, -1, -1, -1, "true", ""                              },
                {"B_ViperLightHarness_khk_F",       0, -1, -1, -1, "true", ""                              },
                {"B_ViperLightHarness_oli_F",       0, -1, -1, -1, "true", ""                              },

                {"B_ViperHarness_blk_F",            0, -1, -1, -1, "true", ""                              },
                {"B_ViperHarness_khk_F",            0, -1, -1, -1, "true", ""                              },
                {"B_ViperHarness_oli_F",            0, -1, -1, -1, "true", ""                              },

                {"B_Bergen_tna_F",                  0, -1, -1, -1, "true", ""                              },
                {"B_Bergen_mcamo_F",                0, -1, -1, -1, "true", "Invisible Backpack"            }
            };
        };
        class Rebel {
            displayName = "Rebel Clothing Shop";
            condition   = "['CivilianRebel'] call GW_client_fnc_licensingHasLicense";
            clothing[] = {
                // Safety
                //{"G_WirelessEarpiece_F",             1500, -1, -1, -1, "true", ""                       },
                //{"G_Respirator_blue_F",              1000, -1, -1, -1, "true", ""                       },
                //{"G_Respirator_white_F",             1000, -1, -1, -1, "true", ""                       },
                //{"G_Respirator_yellow_F",            1000, -1, -1, -1, "true", ""                       },

                // Bandages
                {"H_HeadBandage_clean_F",            100, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_HeadBandage_stained_F",          100, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_HeadBandage_bloody_F",           100, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },

                // Glasses
                {"G_Aviator",                        750, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"G_Lady_Blue",                      500, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"G_Lowprofile",                     500, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"G_EyeProtectors_F",                500, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"G_Shades_Black",                   500, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"G_Shades_Blue",                    500, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"G_Shades_Green",                   500, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"G_Shades_Blue",                    500, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"G_Shades_Red",                     500, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"G_Spectacles",                     500, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"G_Sport_Red",                      500, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"G_Sport_Blackyellow",              500, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"G_Sport_BlackWhite",               500, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"G_Sport_Checkered",                500, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"G_Sport_Blackred",                 500, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"G_Sport_Greenblack",               500, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"G_Squares_Tinted",                 500, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"G_Squares",                        500, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"G_Spectacles_Tinted",              500, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },

                // Bandanas
                {"G_Bandanna_aviator",               1250, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"G_Bandanna_beast",                 1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"G_Bandanna_blk",                   1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"G_Bandanna_khk",                   1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"G_Bandanna_oli",                   1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"G_Bandanna_shades",                1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"G_Bandanna_sport",                 1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"G_Bandanna_tan",                   1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },

                // Hats
                {"H_Bandanna_gry",                   1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"H_Bandanna_blu",                   1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"H_Bandanna_cbr",                   1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"H_Bandanna_khk_hs",                1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"H_Bandanna_khk",                   1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"H_Bandanna_sgg",                   1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"H_Bandanna_sand",                  1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"H_Bandanna_surfer",                1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"H_Bandanna_surfer_blk",            1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"H_Bandanna_surfer_grn",            1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },

                // Booniehats
                {"H_Booniehat_khk_hs",               250, -1, LEVEL_REBELLIOUS, 1, "true", ""                               },
                {"H_Booniehat_khk",                  250, -1, LEVEL_REBELLIOUS, 1, "true", ""                               },
                {"H_Booniehat_oli",                  250, -1, LEVEL_REBELLIOUS, 1, "true", ""                               },
                {"H_Booniehat_tan",                  250, -1, LEVEL_REBELLIOUS, 1, "true", ""                               },
                {"H_Booniehat_dgtl",                 250, -1, LEVEL_REBELLIOUS, 1, "true", ""                               },

                // Caps
                {"H_Cap_blk_Raven",                  250, -1, LEVEL_REBELLIOUS, 1, "true", ""                               },
                {"H_Cap_brn_SPECOPS",                250, -1, LEVEL_REBELLIOUS, 1, "true", ""                               },
                {"H_Cap_grn_BI",                     250, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_Cap_blk",                        250, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_Cap_blu",                        250, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_Cap_blk_CMMG",                   250, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_Cap_grn",                        250, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_Cap_blk_ION",                    250, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_Cap_oli",                        250, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_Cap_oli_hs",                     250, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_Cap_press",                      250, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_Cap_red",                        250, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_Cap_surfer",                     250, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_Cap_tan",                        250, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_Cap_marshal",                    250, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_MilCap_ocamo",                   250, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_MilCap_dgtl",                    250, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_MilCap_gry",                     250, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_MilCap_ghex_F",                  250, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },

                // Hats
                {"H_Hat_blue",                       150, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_Hat_brown",                      150, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_Hat_camo",                       150, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_Hat_checker",                    150, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_Hat_grey",                       150, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_Hat_tan",                        150, -1, LEVEL_REBELLIOUS, 0, "true", ""                               },
                {"H_StrawHat",                       50, -1, LEVEL_REBELLIOUS, 0, "true", ""                                },
                {"H_StrawHat_dark",                  50, -1, LEVEL_REBELLIOUS, 0, "true", ""                                },

                // Shemags
                {"H_Shemag_olive",                   1500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"H_Shemag_olive_hs",                1500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"H_ShemagOpen_tan",                 1500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"H_ShemagOpen_khk",                 1500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },

                // Balaclavas
                {"G_Balaclava_blk",                  1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"G_Balaclava_combat",               1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"G_Balaclava_lowprofile",           1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"G_Balaclava_oli",                  1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },

                // Basic Helmets (Orange)
                {"H_PASGT_basic_blue_F",             7500, -1, LEVEL_REBELLIOUS, 2, "true", ""                              },
                {"H_PASGT_basic_olive_F",            7500, -1, LEVEL_REBELLIOUS, 2, "true", ""                              },
                {"H_PASGT_basic_white_F",            7500, -1, LEVEL_REBELLIOUS, 2, "true", ""                              },
                {"H_PASGT_basic_black_F",            7500, -1, LEVEL_REBELLIOUS, 2, "true", ""                              },

                // Normal Helmets
                {"H_HelmetIA",                       10000, -1, LEVEL_REBELLIOUS, 3, "true", ""                             }, // Modular AAF Helmet

                // Assasin Helmets
                {"H_HelmetSpecO_blk",                25000, -1, LEVEL_REBELLIOUS, 4, "true", ""                             }, // Assasin Helmet Black (CSAT OP)
                {"H_HelmetSpecO_ocamo",              25000, -1, LEVEL_REBELLIOUS, 4, "true", ""                             }, // Assasin Helmet Hex (CSAT OP)
                {"H_HelmetSpecO_ghex_F",             25000, -1, LEVEL_REBELLIOUS, 4, "true", ""                             }, // Assasin Helmet CSAT Green Hex

                // Defender Helmets
                {"H_HelmetLeaderO_ocamo",            30000, -1, LEVEL_REBELLIOUS, 6, "true", ""                             }, // Defender Helmet CSAT OP (HEX)
                {"H_HelmetLeaderO_oucamo",           30000, -1, LEVEL_REBELLIOUS, 6, "true", ""                             }, // Defender Helmet CSAT OP (Urban)
                {"H_HelmetLeaderO_ghex_F",           30000, -1, LEVEL_REBELLIOUS, 6, "true", ""                             }, // Defender Helmet Green Hex

                // Protector Helmets
                {"H_HelmetO_ocamo",                  20000, -1, LEVEL_REBELLIOUS, 4, "true", ""                             }, // Protector Helmet CSAT (Hex)
                {"H_HelmetO_oucamo",                 20000, -1, LEVEL_REBELLIOUS, 4, "true", ""                             }, // Protector Helmet CSAT (Urban)
                {"H_HelmetO_ghex_F",                 20000, -1, LEVEL_REBELLIOUS, 4, "true", ""                             }, // Protector Helmet CSAT (Urban)

                // Special Purpose Helmets
                //{"H_HelmetO_ViperSP_ghex_F",         150000, -1, LEVEL_REBELLIOUS, -1, "true", ""                         }, // Green Hex (SUPER FUCKING OP)
                //{"H_HelmetO_ViperSP_hex_F",          150000, -1, LEVEL_REBELLIOUS, -1, "true", ""                         }, // Hex       (SUPER FUCKING OP)

                // Heli Crew Helmets
                {"H_PilotHelmetHeli_I",              15000, -1, LEVEL_REBELLIOUS, 2, "true", ""                             }, // Heli Pilot Helmet AAF
                {"H_PilotHelmetHeli_O",              15000, -1, LEVEL_REBELLIOUS, 2, "true", ""                             }, // Heli Pilot Helmet CSAT
                {"H_CrewHelmetHeli_O",               15000, -1, LEVEL_REBELLIOUS, 2, "true", ""                             }, // Heli Crew Helmet [CSAT]
                {"H_CrewHelmetHeli_I",               15000, -1, LEVEL_REBELLIOUS, 2, "true", ""                             }, // Heli Crew Helmet [AAF]

                // Crew Helmets
                {"H_HelmetCrew_I",                   15000, -1, LEVEL_REBELLIOUS, 3, "true", ""                             }, // Crew Helmet Independent
                {"H_HelmetCrew_O",                   15000, -1, LEVEL_REBELLIOUS, 3, "true", ""                             }, // Crew Helmet CSAT (CSAT OP)
                {"H_HelmetCrew_O_ghex_F",            15000, -1, LEVEL_REBELLIOUS, 3, "true", ""                             }, // Crew Helmet CSAT (CSAT OP) Green Hex

                // Fighter Pilot Helmets
                {"H_PilotHelmetFighter_I",           50000, -1, LEVEL_REBELLIOUS, 6, "true", ""                             }, // Pilot Fighter Helmet (Full Screen NV -. AAF)
                {"H_PilotHelmetFighter_O",           50000, -1, LEVEL_REBELLIOUS, 6, "true", ""                             }, // Pilot Fighter Helmet (Full Screen NV -. CSAT)
                {"H_PilotHelmetFighter_B",           50000, -1, LEVEL_REBELLIOUS, 6, "true", ""                             }, // Pilot Fighter Helmet (Full Screen NV -. NATO)

                // Guerilla
                {"U_BG_Guerrilla_6_1",               10000, -1, LEVEL_REBELLIOUS, 2, "true", ""                             }, // Guerilla Apparel
                {"U_BG_Guerilla1_1",                 10000, -1, LEVEL_REBELLIOUS, 2, "true", ""                             }, // Guerilla Garment
                {"U_BG_leader",                      10000, -1, LEVEL_REBELLIOUS, 2, "true", ""                             }, // Guerilla Leader

                // Paramilitary
                {"U_I_C_Soldier_Para_2_F",           7500, -1, LEVEL_REBELLIOUS, 1, "true", ""                              }, // Paramilitary Garb
                {"U_I_C_Soldier_Para_3_F",           7500, -1, LEVEL_REBELLIOUS, 1, "true", ""                              }, // Paramilitary (Shirt)
                {"U_I_C_Soldier_Para_5_F",           7500, -1, LEVEL_REBELLIOUS, 1, "true", ""                              }, // Paramilitary Shorts
                {"U_I_C_Soldier_Para_4_F",           7500, -1, LEVEL_REBELLIOUS, 1, "true", ""                              }, // Paramilitary Tanktop
                {"U_I_C_Soldier_Para_1_F",           7500, -1, LEVEL_REBELLIOUS, 1, "true", ""                              }, // Paramilitary Tshirts

                // Uniforms
                {"U_I_G_resistanceLeader_F",         10000, -1, LEVEL_REBELLIOUS, 4, "true", ""                             }, // Combat Fatigues (Stavrou)
                {"U_O_CombatUniform_ocamo",          80000, -1, LEVEL_REBELLIOUS, 3, "true", ""                             }, // HEX CSAT Fatigues (OP ARMOUR)
                {"U_O_CombatUniform_oucamo",         80000, -1, LEVEL_REBELLIOUS, 3, "true", ""                             }, // Urban CSAT Fatigues (OP Armour)
                {"U_O_T_Soldier_F",                  80000, -1, LEVEL_REBELLIOUS, 3, "true", ""                             }, // Green Hex CSAT Fatigues (OP Armour)
                {"U_I_CombatUniform",                7500, -1, LEVEL_REBELLIOUS, 3, "true", ""                              }, // AAF Combat Fatigues
                {"U_I_CombatUniform_shortsleeve",    7500, -1, LEVEL_REBELLIOUS, 3, "true", ""                              }, // AAF Combat Fatigues (Rolled up)
                {"U_I_OfficerUniform",               7500, -1, LEVEL_REBELLIOUS, 3, "true", ""                              }, // AAF Officer Fatigues
                {"U_I_CombatUniform_tshirt",         7500, -1, LEVEL_REBELLIOUS, 3, "true", ""                              }, // AAF Officer Fatigues (Rolled Up TShirt)
                {"U_O_OfficerUniform_ocamo",         7500, -1, LEVEL_REBELLIOUS, 2, "true", ""                              }, // Officer Fatigues (CSAT, Non-OP)
                {"U_O_T_Officer_F",                  7500, -1, LEVEL_REBELLIOUS, 2, "true", ""                              }, // Officer Fatigues Green Hex (CSAT, Non-OP)

                // Half Ghillies
                {"U_O_T_Sniper_F",                   180000, -1, LEVEL_REBELLIOUS, 7, "true", ""                            }, // Half Ghillie Green Hex (CSAT)
                {"U_O_GhillieSuit",                  100000, -1, LEVEL_REBELLIOUS, 4, "true", ""                            }, // Half Ghillie (CSAT)
                {"U_I_GhillieSuit",                  50000, -1, LEVEL_REBELLIOUS, 4, "true", ""                             }, // Half Ghillie (AAF)

                // Full Ghillies
                {"U_O_FullGhillie_sard",             180000, -1, LEVEL_REBELLIOUS, 7, "true", ""                            }, // Full Ghillie (CSAT Semi-Arid (SUPER FUCKING OP))
                {"U_O_T_FullGhillie_tna_F",          180000, -1, LEVEL_REBELLIOUS, 7, "true", ""                            }, // Full Jungle (CSAT (SUPER FUCKING OP))
                {"U_O_FullGhillie_lsh",              180000, -1, LEVEL_REBELLIOUS, 5, "true", ""                            }, // Full Ghillie (CSAT Lush (SUPER FUCKING OP))
                {"U_O_FullGhillie_ard",              180000, -1, LEVEL_REBELLIOUS, 5, "true", ""                            }, // Full Ghillie (CSAT Arid (SUPER FUCKING OP))
                {"U_I_FullGhillie_ard",              150000, -1, LEVEL_REBELLIOUS, 5, "true", ""                            }, // Full Ghillie (AAF Arid)
                {"U_I_FullGhillie_lsh",              150000, -1, LEVEL_REBELLIOUS, 5, "true", ""                            }, // Full Ghillie (AAF Lush)
                {"U_I_FullGhillie_sard",             150000, -1, LEVEL_REBELLIOUS, 5, "true", ""                            }, // Full Ghillie (AAF Semi-Arid)

                // Pilot Coveralls
                {"U_O_PilotCoveralls",               95000, -1, LEVEL_REBELLIOUS, 6, "true", ""                             }, // CSAT Pilot Coveralls (SUPER FUCKING OP)
                {"U_I_HeliPilotCoveralls",           15000, -1, LEVEL_REBELLIOUS, 2, "true", ""                             }, // AAF Heili Coveralls
                {"U_I_pilotCoveralls",               15000, -1, LEVEL_REBELLIOUS, 2, "true", ""                             }, // AAF Pilot Coveralls

                // Special Purpose Suits
                //{"U_O_V_Soldier_Viper_F",            800000, -1, LEVEL_REBELLIOUS, -1, "true", ""                         }, // Green Hex (SUPER FUCKING OP)
                //{"U_O_V_Soldier_Viper_hex_F",        800000, -1, LEVEL_REBELLIOUS, -1, "true", ""                         }, // Hex       (SUPER FUCKING OP)

                // Leg Straps
                {"V_LegStrapBag_black_F",            1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"V_LegStrapBag_coyote_F",           1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"V_LegStrapBag_olive_F",            1000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },

                // Multi Pocket Vests
                {"V_Pocketed_black_F",               2000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"V_Pocketed_coyote_F",              2000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"V_Pocketed_olive_F",               2000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },

                // Bandolliers
                {"V_BandollierB_blk",                5000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"V_BandollierB_cbr",                5000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"V_BandollierB_ghex_F",             5000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"V_BandollierB_rgr",                5000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"V_BandollierB_khk",                5000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"V_BandollierB_oli",                5000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },

                // Harnesses
                {"V_HarnessOGL_ghex_F",              10000, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"V_HarnessO_ghex_F",                10000, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"V_HarnessO_brn",                   10000, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"V_HarnessOGL_brn",                 8000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"V_HarnessOGL_gry",                 8000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"V_HarnessO_gry",                   8000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },

                // Chest Rigs
                {"V_Chestrig_blk",                   100000, -1, LEVEL_REBELLIOUS, 0, "true", ")"                           },
                {"V_Chestrig_rgr",                   100000, -1, LEVEL_REBELLIOUS, 0, "true", ""                            },
                {"V_Chestrig_khk",                   100000, -1, LEVEL_REBELLIOUS, 0, "true", ""                            },
                {"V_Chestrig_oli",                   100000, -1, LEVEL_REBELLIOUS, 0, "true", ""                            },
                {"V_TacChestrig_cbr_F",              7500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"V_TacChestrig_grn_F",              7500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"V_TacChestrig_oli_F",              7500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },

                // Rebreathers
                //{"V_RebreatherIA",                   20000, -1, LEVEL_REBELLIOUS, -1, "true", ""                          }, // AAF
                //{"V_RebreatherIR",                   20000, -1, LEVEL_REBELLIOUS, -1, "true", ""                          }, // CSAT

                // Tactical Vests
                {"V_I_G_resistanceLeader_F",         30000, -1, LEVEL_REBELLIOUS, 3, "true", ""                             },
                {"V_TacVest_blk",                    30000, -1, LEVEL_REBELLIOUS, 1, "true", ""                             },
                {"V_TacVest_brn",                    30000, -1, LEVEL_REBELLIOUS, 1, "true", ""                             },
                {"V_TacVest_camo",                   30000, -1, LEVEL_REBELLIOUS, 1, "true", ""                             },
                {"V_TacVest_khk",                    30000, -1, LEVEL_REBELLIOUS, 1, "true", ""                             },
                {"V_TacVest_oli",                    30000, -1, LEVEL_REBELLIOUS, 1, "true", ""                             },

                // AAF Carriers
                {"V_PlateCarrierIA2_dgtl",           70000, -1, LEVEL_REBELLIOUS, 2, "true", ""                             }, // Carrier Rig AAF
                {"V_PlateCarrierIAGL_oli",           70000, -1, LEVEL_REBELLIOUS, 2, "true", ""                             }, // Carrier GL Rig AAF Olive
                {"V_PlateCarrierIAGL_dgtl",          70000, -1, LEVEL_REBELLIOUS, 2, "true", ""                             }, // Carrier GL Rig AAF Digital
                {"V_PlateCarrierIA1_dgtl",           70000, -1, LEVEL_REBELLIOUS, 1, "true", ""                             }, // Carrier Lite AAF

                // Backpacks
                {"B_Messenger_Black_F",              1500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_Messenger_Coyote_F",             1500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_Messenger_Gray_F",               1500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_Messenger_Olive_F",              1500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_Messenger_IDAP_F",               1500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },

                {"B_AssaultPack_blk",                2500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_AssaultPack_cbr",                2500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_AssaultPack_dgtl",               2500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_AssaultPack_rgr",                2500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_AssaultPack_ocamo",              2500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_AssaultPack_khk",                2500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_AssaultPack_mcamo",              2500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_AssaultPack_sgg",                2500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_AssaultPack_tna_F",              2500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },


                {"B_TacticalPack_blk",               6500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_TacticalPack_rgr",               6500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_TacticalPack_oli",               6500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_TacticalPack_mcamo",             6500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_TacticalPack_ocamo",             6500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },

                {"B_FieldPack_blk",                  4000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_FieldPack_cbr",                  4000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_FieldPack_khk",                  4000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_FieldPack_oli",                  4000, -1, LEVEL_REBELLIOUS, 0, "true", ")"                             },
                {"B_FieldPack_oucamo",               4000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_FieldPack_ghex_F",               4000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_FieldPack_ocamo",                4000, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },

                {"B_Kitbag_cbr",                     10000, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"B_Kitbag_rgr",                     10000, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"B_Kitbag_sgg",                     10000, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"B_Kitbag_mcamo",                   10000, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },


                {"B_Carryall_cbr",                   17500, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"B_Carryall_ghex_f",                17500, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"B_Carryall_ocamo",                 17500, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"B_Carryall_khk",                   17500, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"B_Carryall_mcamo",                 17500, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"B_Carryall_oli",                   17500, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"B_Carryall_oucamo",                17500, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },

                {"B_ViperLightHarness_blk_F",        7500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_ViperLightHarness_ghex_F",       7500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_ViperLightHarness_ocamo_F",      7500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_ViperLightHarness_khk_F",        7500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },
                {"B_ViperLightHarness_oli_F",        7500, -1, LEVEL_REBELLIOUS, 0, "true", ""                              },


                {"B_ViperHarness_blk_F",             12500, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"B_ViperHarness_ghex_F",            12500, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"B_ViperHarness_ocamo_F",           12500, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"B_ViperHarness_khk_F",             12500, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"B_ViperHarness_oli_F",             12500, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },

                {"B_Bergen_dgtl_F",                  22500, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"B_Bergen_ocamo_F",                 22500, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"B_Bergen_mcamo_F",                 22500, -1, LEVEL_REBELLIOUS, 0, "true", ""                             },
                {"B_Bergen_tna_F",                   22500, -1, LEVEL_REBELLIOUS, 0, "true", ""                             }

            };
        };
        class Civilian {
            displayName = "Civilian Clothing Shop";
            condition   = "playerSide isEqualTo civilian";
            clothing[] = {
                // Safety
                {"G_WirelessEarpiece_F",             1500, -1, -1, -1, "true", ""                               },
                {"G_Respirator_blue_F",              1000, -1, -1, -1, "true", ""                               },
                {"G_Respirator_white_F",             1000, -1, -1, -1, "true", ""                               },
                {"G_Respirator_yellow_F",            1000, -1, -1, -1, "true", ""                               },

                // Bandages
                {"H_HeadBandage_clean_F",            100, -1, -1, 0, "true", ""                                 },
                {"H_HeadBandage_stained_F",          100, -1, -1, 0, "true", ""                                 },
                {"H_HeadBandage_bloody_F",           100, -1, -1, 0, "true", ""                                 },

                // Glasses
                {"G_Aviator",                        750, -1, -1, 0, "true", ""                                 },
                {"G_Lady_Blue",                      500, -1, -1, 0, "true", ""                                 },
                {"G_Lowprofile",                     500, -1, -1, 0, "true", ""                                 },
                {"G_EyeProtectors_F",                500, -1, -1, 0, "true", ""                                 },
                {"G_Shades_Black",                   500, -1, -1, 0, "true", ""                                 },
                {"G_Shades_Blue",                    500, -1, -1, 0, "true", ""                                 },
                {"G_Shades_Green",                   500, -1, -1, 0, "true", ""                                 },
                {"G_Shades_Blue",                    500, -1, -1, 0, "true", ""                                 },
                {"G_Shades_Red",                     500, -1, -1, 0, "true", ""                                 },
                {"G_Spectacles",                     500, -1, -1, 0, "true", ""                                 },
                {"G_Sport_Red",                      500, -1, -1, 0, "true", ""                                 },
                {"G_Sport_Blackyellow",              500, -1, -1, 0, "true", ""                                 },
                {"G_Sport_BlackWhite",               500, -1, -1, 0, "true", ""                                 },
                {"G_Sport_Checkered",                500, -1, -1, 0, "true", ""                                 },
                {"G_Sport_Blackred",                 500, -1, -1, 0, "true", ""                                 },
                {"G_Sport_Greenblack",               500, -1, -1, 0, "true", ""                                 },
                {"G_Squares_Tinted",                 500, -1, -1, 0, "true", ""                                 },
                {"G_Squares",                        500, -1, -1, 0, "true", ""                                 },
                {"G_Spectacles_Tinted",              500, -1, -1, 0, "true", ""                                 },


                // Bandanas
                {"G_Bandanna_aviator",               1250, -1, -1, 0, "true", ""                                },
                {"G_Bandanna_beast",                 1000, -1, -1, 0, "true", ""                                },
                {"G_Bandanna_blk",                   1000, -1, -1, 0, "true", ""                                },
                {"G_Bandanna_khk",                   1000, -1, -1, 0, "true", ""                                },
                {"G_Bandanna_oli",                   1000, -1, -1, 0, "true", ""                                },
                {"G_Bandanna_shades",                1000, -1, -1, 0, "true", ""                                },
                {"G_Bandanna_sport",                 1000, -1, -1, 0, "true", ""                                },
                {"G_Bandanna_tan",                   1000, -1, -1, 0, "true", ""                                },

                // Hats
                {"H_Bandanna_gry",                   1000, -1, -1, 0, "true", ""                                },
                {"H_Bandanna_blu",                   1000, -1, -1, 0, "true", ""                                },
                {"H_Bandanna_cbr",                   1000, -1, -1, 0, "true", ""                                },
                {"H_Bandanna_khk_hs",                1000, -1, -1, 0, "true", ""                                },
                {"H_Bandanna_khk",                   1000, -1, -1, 0, "true", ""                                },
                {"H_Bandanna_sgg",                   1000, -1, -1, 0, "true", ""                                },
                {"H_Bandanna_sand",                  1000, -1, -1, 0, "true", ""                                },
                {"H_Bandanna_surfer",                1000, -1, -1, 0, "true", ""                                },
                {"H_Bandanna_surfer_blk",            1000, -1, -1, 0, "true", ""                                },
                {"H_Bandanna_surfer_grn",            1000, -1, -1, 0, "true", ""                                },

                // Booniehats
                {"H_Booniehat_khk_hs",               250, -1, -1, 1, "true", ""                                 },
                {"H_Booniehat_khk",                  250, -1, -1, 1, "true", ""                                 },
                {"H_Booniehat_oli",                  250, -1, -1, 1, "true", ""                                 },
                {"H_Booniehat_tan",                  250, -1, -1, 1, "true", ""                                 },
                {"H_Booniehat_dgtl",                 250, -1, -1, 1, "true", ""                                 },

                // Caps
                {"H_Cap_blk_Raven",                  250, -1, -1, 1, "true", ""                                 },
                {"H_Cap_brn_SPECOPS",                250, -1, -1, 1, "true", ""                                 },
                {"H_Cap_grn_BI",                     250, -1, -1, 0, "true", ""                                 },
                {"H_Cap_blk",                        250, -1, -1, 0, "true", ""                                 },
                {"H_Cap_blu",                        250, -1, -1, 0, "true", ""                                 },
                {"H_Cap_blk_CMMG",                   250, -1, -1, 0, "true", ""                                 },
                {"H_Cap_grn",                        250, -1, -1, 0, "true", ""                                 },
                {"H_Cap_blk_ION",                    250, -1, -1, 0, "true", ""                                 },
                {"H_Cap_oli",                        250, -1, -1, 0, "true", ""                                 },
                {"H_Cap_oli_hs",                     250, -1, -1, 0, "true", ""                                 },
                {"H_Cap_press",                      250, -1, -1, 0, "true", ""                                 },
                {"H_Cap_red",                        250, -1, -1, 0, "true", ""                                 },
                {"H_Cap_surfer",                     250, -1, -1, 0, "true", ""                                 },
                {"H_Cap_tan",                        250, -1, -1, 0, "true", ""                                 },
                {"H_Cap_marshal",                    250, -1, -1, 0, "true", ""                                 },
                {"H_MilCap_ocamo",                   250, -1, -1, 0, "true", ""                                 },
                {"H_MilCap_dgtl",                    250, -1, -1, 0, "true", ""                                 },
                {"H_MilCap_gry",                     250, -1, -1, 0, "true", ""                                 },
                {"H_MilCap_ghex_F",                  250, -1, -1, 0, "true", ""                                 },

                // Hats
                {"H_Hat_blue",                       150, -1, -1, 0, "true", ""                                 },
                {"H_Hat_brown",                      150, -1, -1, 0, "true", ""                                 },
                {"H_Hat_camo",                       150, -1, -1, 0, "true", ""                                 },
                {"H_Hat_checker",                    150, -1, -1, 0, "true", ""                                 },
                {"H_Hat_grey",                       150, -1, -1, 0, "true", ""                                 },
                {"H_Hat_tan",                        150, -1, -1, 0, "true", ""                                 },
                {"H_StrawHat",                       50, -1, -1, 0, "true", ""                                  },
                {"H_StrawHat_dark",                  50, -1, -1, 0, "true", ""                                  },

                // Helmets
                {"H_Helmet_Skate",                   300, -1, -1, 0, "true", ""                                 },

                // Racing Helmets
                {"H_RacingHelmet_1_black_F",         2500, -1, -1, 0, "true", ""                                },
                {"H_RacingHelmet_1_blue_F",          2500, -1, -1, 0, "true", ""                                },
                {"H_RacingHelmet_2_F",               2500, -1, -1, 0, "true", ""                                },
                {"H_RacingHelmet_1_F",               2500, -1, -1, 0, "true", ""                                },
                {"H_RacingHelmet_1_green_F",         2500, -1, -1, 0, "true", ""                                },
                {"H_RacingHelmet_1_orange_F",        2500, -1, -1, 0, "true", ""                                },
                {"H_RacingHelmet_1_red_F",           2500, -1, -1, 0, "true", ""                                },
                {"H_RacingHelmet_3_F",               2500, -1, -1, 0, "true", ""                                },
                {"H_RacingHelmet_4_F",               2500, -1, -1, 0, "true", ""                                },
                {"H_RacingHelmet_1_white_F",         2500, -1, -1, 0, "true", ""                                },
                {"H_RacingHelmet_1_yellow_F",        2500, -1, -1, 0, "true", ""                                },

                // Shirts
                {"U_C_Journalist",                   500, -1, -1, 0, "true", ""                                 },
                {"U_C_Man_casual_2_F",               300, -1, -1, 0, "true", ""                                 },
                {"U_C_Man_casual_3_F",               300, -1, -1, 0, "true", ""                                 },
                {"U_C_Man_casual_1_F",               300, -1, -1, 0, "true", ""                                 },
                {"U_C_man_sport_1_F",                300, -1, -1, 0, "true", ""                                 },
                {"U_C_man_sport_3_F",                300, -1, -1, 0, "true", ""                                 },
                {"U_C_Man_casual_6_F",               300, -1, -1, 0, "true", ""                                 },
                {"U_C_man_sport_2_F",                300, -1, -1, 0, "true", ""                                 },
                {"U_C_Man_casual_4_F",               300, -1, -1, 0, "true", ""                                 },
                {"U_C_Man_casual_5_F",               300, -1, -1, 0, "true", ""                                 },
                {"U_C_Poloshirt_blue",               250, -1, -1, 0, "true", ""                                 },
                {"U_C_Poloshirt_burgundy",           250, -1, -1, 0, "true", ""                                 },
                {"U_C_Poloshirt_redwhite",           250, -1, -1, 0. "true", ""                                 },
                {"U_C_Poloshirt_salmon",             250, -1, -1, 0, "true", ""                                 },
                {"U_C_Poloshirt_stripped",           250, -1, -1, 0, "true", ""                                 },
                {"U_C_Poloshirt_tricolour",          250, -1, -1, 0, "true", ""                                 },
                {"U_Competitor",                     250, -1, -1, 0, "true", ""                                 },
                {"U_C_Mechanic_01_F",                250, -1, -1, 0, "true", ""                                 },
                {"U_Marshal",                        200, -1, -1, 0, "true", ""                                 },
                {"U_C_Poor_1",                       150, -1, -1, 0, "true", ""                                 },

                // Special
                {"U_C_HunterBody_grn",               2000, -1, -1, 0, "true", ""                                },
                {"U_C_WorkerCoveralls",              2000, -1, -1, 0, "true", ""                                },
                {"U_OrestesBody",                    300, -1, -1, 0, "true", ""                                 },
                {"U_C_Mechanic_01_F",                250, -1, -1, 0, "true", ""                                 },

                // IDAP
                //{"U_C_IDAP_Man_cargo_F",             8000, -1, -1, -1, "true", ""                             },
                //{"U_C_IDAP_Man_Jeans_F",             8000, -1, -1, -1, "true", ""                             },
                //{"U_C_IDAP_Man_casual_F",            8000, -1, -1, -1, "true", ""                             },
                //{"U_C_IDAP_Man_shorts_F",            8000, -1, -1, -1, "true", ""                             },
                //{"U_C_IDAP_Man_Tee_F",               8000, -1, -1, -1, "true", ""                             },
                //{"U_C_IDAP_Man_TeeShorts_F",         8000, -1, -1, -1, "true", ""                             },

                // Bandit
                {"U_I_C_Soldier_Bandit_4_F",         150, -1, -1, 0, "true", ""                                 },
                {"U_I_C_Soldier_Bandit_1_F",         150, -1, -1, 0, "true", ""                                 },
                {"U_I_C_Soldier_Bandit_2_F",         150, -1, -1, 0, "true", ""                                 },
                {"U_I_C_Soldier_Bandit_5_F",         150, -1, -1, 0, "true", ""                                 },
                {"U_I_C_Soldier_Bandit_3_F",         150, -1, -1, 0, "true", ""                                 },

                // Guerilla
                {"U_BG_Guerilla2_2",                 7000, -1, -1, 2, "true", ""                                },
                {"U_BG_Guerilla2_1",                 7000, -1, -1, 2, "true", ""                                },
                {"U_BG_Guerilla2_3",                 7000, -1, -1, 2, "true", ""                                },
                {"U_BG_Guerilla3_1",                 7000, -1, -1, 2, "true", ""                                },

                // Driver coveralls
                {"U_C_Driver_1_black",               5000, -1, -1, 2, "true", ""                                },
                {"U_C_Driver_1_blue",                5000, -1, -1, 2, "true", ""                                },
                {"U_C_Driver_2",                     5000, -1, -1, 2, "true", ""                                },
                {"U_C_Driver_1",                     5000, -1, -1, 2, "true", ""                                },
                {"U_C_Driver_1_green",               5000, -1, -1, 2, "true", ""                                },
                {"U_C_Driver_1_orange",              5000, -1, -1, 2, "true", ""                                },
                {"U_C_Driver_1_red",                 5000, -1, -1, 2, "true", ""                                },
                {"U_C_Driver_3",                     5000, -1, -1, 2, "true", ""                                },
                {"U_C_Driver_4",                     5000, -1, -1, 2, "true", ""                                },
                {"U_C_Driver_1_white",               5000, -1, -1, 2, "true", ""                                },
                {"U_C_Driver_1_yellow",              5000, -1, -1, 2, "true", ""                                },

                // Vests
                //{"V_RebreatherIA",                   10000, -1, -1, -1, "true", ""                            },
                {"V_Press_F",                        25000, -1, -1, 1, "true", ""                               },
                {"V_Pocketed_black_F",               2000, -1, -1, 0, "true", ""                                },
                {"V_Pocketed_coyote_F",              2000, -1, -1, -1, "true", ""                               },
                {"V_Pocketed_olive_F",               2000, -1, -1, -1, "true", ""                               },
                {"V_LegStrapBag_black_F",            1000, -1, -1, 0, "true", ""                                },
                {"V_LegStrapBag_coyote_F",           1000, -1, -1, 0, "true", ""                                },
                {"V_LegStrapBag_olive_F",            1000, -1, -1, 0, "true", ""                                },
                {"V_Safety_blue_F",                  500, -1, -1, -1, "true", ""                                },
                {"V_Plain_medical_F",                500, -1, -1, 0, "true", ""                                 }, // IDAP


                // Backpacks
                {"B_Messenger_Black_F",              1500, -1, -1, 0, "true", ""                                },
                {"B_Messenger_Coyote_F",             1500, -1, -1, 0, "true", ""                                },
                {"B_Messenger_Gray_F",               1500, -1, -1, 0, "true", ""                                },
                {"B_Messenger_Olive_F",              1500, -1, -1, 0, "true", ""                                },
                {"B_Messenger_IDAP_F",               1500, -1, -1, 0, "true", ""                                },

                {"B_AssaultPack_blk",                2500, -1, -1, 0, "true", ""                                },
                {"B_AssaultPack_cbr",                2500, -1, -1, 0, "true", ""                                },
                {"B_AssaultPack_dgtl",               2500, -1, -1, 0, "true", ""                                },
                {"B_AssaultPack_rgr",                2500, -1, -1, 0, "true", ""                                },
                {"B_AssaultPack_ocamo",              2500, -1, -1, 0, "true", ""                                },
                {"B_AssaultPack_khk",                2500, -1, -1, 0, "true", ""                                },
                {"B_AssaultPack_mcamo",              2500, -1, -1, 0, "true", ""                                },
                {"B_AssaultPack_sgg",                2500, -1, -1, 0, "true", ""                                },
                {"B_AssaultPack_tna_F",              2500, -1, -1, 0, "true", ""                                },


                {"B_TacticalPack_blk",               6500, -1, -1, 0, "true", ""                                },
                {"B_TacticalPack_rgr",               6500, -1, -1, 0, "true", ""                                },
                {"B_TacticalPack_oli",               6500, -1, -1, 0, "true", ""                                },
                {"B_TacticalPack_mcamo",             6500, -1, -1, 0, "true", ""                                },
                {"B_TacticalPack_ocamo",             6500, -1, -1, 0, "true", ""                                },

                {"B_FieldPack_blk",                  4000, -1, -1, 0, "true", ""                                },
                {"B_FieldPack_cbr",                  4000, -1, -1, 0, "true", ""                                },
                {"B_FieldPack_khk",                  4000, -1, -1, 0, "true", ""                                },
                {"B_FieldPack_oli",                  4000, -1, -1, 0, "true", ""                                },
                {"B_FieldPack_oucamo",               4000, -1, -1, 0, "true", ""                                },
                {"B_FieldPack_ghex_F",               4000, -1, -1, 0, "true", ""                                },
                {"B_FieldPack_ocamo",                4000, -1, -1, 0, "true", ""                                },

                {"B_Kitbag_cbr",                     10000, -1, -1, 0, "true", ""                               },
                {"B_Kitbag_rgr",                     10000, -1, -1, 0, "true", ""                               },
                {"B_Kitbag_sgg",                     10000, -1, -1, 0, "true", ""                               },
                {"B_Kitbag_mcamo",                   10000, -1, -1, 0, "true", ""                               },


                {"B_Carryall_cbr",                   17500, -1, -1, 0, "true", ""                               },
                {"B_Carryall_ghex_f",                17500, -1, -1, 0, "true", ""                               },
                {"B_Carryall_ocamo",                 17500, -1, -1, 0, "true", ""                               },
                {"B_Carryall_khk",                   17500, -1, -1, 0, "true", ""                               },
                {"B_Carryall_mcamo",                 17500, -1, -1, 0, "true", ""                               },
                {"B_Carryall_oli",                   17500, -1, -1, 0, "true", ""                               },
                {"B_Carryall_oucamo",                17500, -1, -1, 0, "true", ""                               },


                {"B_Bergen_dgtl_F",                  22500, -1, -1, 0, "true", ""                               },
                {"B_Bergen_ocamo_F",                 22500, -1, -1, 0, "true", ""                               },
                {"B_Bergen_mcamo_F",                 22500, -1, -1, 0, "true", ""                               },
                {"B_Bergen_tna_F",                   22500, -1, -1, 0, "true",                                  }
            };
        };
        class IHAS {
            displayName = "IHAS Clothing";
            condition   = "playerSide isEqualTo independent";
            clothing[] = {
                // Safety
                {"G_Respirator_blue_F",              0, -1, -1, -1, "true", ""                        },
                {"G_Respirator_white_F",             0, -1, -1, -1, "true", ""                        },
                {"G_Respirator_yellow_F",            0, -1, -1, -1, "true", ""                        },

                // Helmets
                {"H_Construction_basic_black_F",     0, -1, -1, -1, "true", ""                        },
                {"H_Construction_earprot_black_F",   0, -1, -1, -1, "true", ""                        },
                {"H_Construction_headset_black_F",   0, -1, -1, -1, "true", ""                        },
                {"H_Cap_marshal",                    0, -1, -1, -1, "true", ""                        },
                /*{"H_Construction_earprot_orange_F",  0, -1, -1, -1, "true", ""                      },
                {"H_Construction_basic_orange_F",    0, -1, -1, -1, "true", ""                        },
                {"H_Construction_earprot_orange_F",  0, -1, -1, -1, "true", ""                        },
                {"H_Construction_headset_orange_F",  0, -1, -1, -1, "true", ""                        },
                {"H_Construction_basic_red_F",       0, -1, -1, -1, "true", ""                        },
                {"H_Construction_earprot_red_F",     0, -1, -1, -1, "true", ""                        },
                {"H_Construction_headset_red_F",     0, -1, -1, -1, "true", ""                        },
                {"H_Construction_basic_white_F",     0, -1, -1, -1, "true", ""                        },
                {"H_Construction_basic_yellow_F",    0, -1, -1, -1, "true", ""                        },
                {"H_Construction_earprot_yellow_F",  0, -1, -1, -1, "true", ""                        },
                {"H_Construction_headset_yellow_F",  0, -1, -1, -1, "true", ""                        },*/

                // Glasses
                {"G_Spectacles",                     0, -1, -1, -1, "true", ""                        },
                {"G_Tactical_Clear",                 0, -1, -1, -1, "true", ""                        },
                {"G_Tactical_Black",                 0, -1, -1, -1, "true", ""                        },
                {"G_EyeProtectors_F",                0, -1, -1, -1, "true", ""                        },
                {"G_EyeProtectors_Earpiece_F",       0, -1, -1, -1, "true", ""                        },

                // Hearing
                {"H_EarProtectors_black_F",          0, -1, -1, -1, "true", ""                        },
                {"H_EarProtectors_orange_F",         0, -1, -1, -1, "true", ""                        },
                {"H_EarProtectors_red_F",            0, -1, -1, -1, "true", ""                        },
                {"H_EarProtectors_white_F",          0, -1, -1, -1, "true", ""                        },
                {"H_EarProtectors_yellow_F",         0, -1, -1, -1, "true", ""                        },
                {"H_HeadSet_black_F",                0, -1, -1, -1, "true", ""                        },
                {"H_HeadSet_yellow_F",               0, -1, -1, -1, "true", ""                        },
                {"H_HeadSet_red_F",                  0, -1, -1, -1, "true", ""                        },
                {"H_HeadSet_orange_F",               0, -1, -1, -1, "true", ""                        },
                {"H_HeadSet_white_F",                0, -1, -1, -1, "true", ""                        },
                {"H_WirelessEarpiece_F",             0, -1, -1, -1, "true", ""                        },

                {"U_C_Paramedic_01_F",               0, -1, -1, -1, "true", "Ambulance Uniform"       },
                {"U_C_ConstructionCoverall_Black_F", 0, -1, -1, -1, "true", "Assistance Uniform Black"},

                // Vests
                {"U_B_Wetsuit",                      0, -1, -1, -1, "true", ""                        },
                {"V_Safety_yellow_F",                0, -1, -1, -1, "true", ""                        },

                // Backpacks
                {"B_Messenger_Black_F",              0, -1, -1, -1, "true", ""                        },
                {"C_UAV_06_backpack_F",              0, -1, -1, -1, "true", ""                        },
                {"C_UAV_06_medical_backpack_F",      0, -1, -1, -1, "true", ""                        }
            };
        };
    };
};
