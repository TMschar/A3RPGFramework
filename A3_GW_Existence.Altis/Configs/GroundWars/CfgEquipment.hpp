/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: CfgEquipment.hpp
*/

/**
*    Equipment Array
*       0: Classname
*       1: Price of buy
*       2: Price of sell
*       3: Level Category Index
*       4: Level of Category
*       5: Condition
*       6: Override DisplayName
*/
class CfgEquipment {
    taserDistance       = 50;
    tasers[]            = {
        "hgun_Pistol_heavy_01_MRD_F",   // .45 Heavy ACP
        "SMG_02_F"                      // 9mm Sting
    };
    taserProjectiles[]  = {
        "B_45ACP_Ball",             // .45 Heavy ACP
        "B_9x21_Ball_Tracer_Red"    // 9mm Sting
    };
    class Shops {
        class Police {
            displayName = "RMP Equipment";
            condition   = "playerSide isEqualTo west";
            equipment[] = {
                {"ItemRadio",                            0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"ItemGPS",                              0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"ItemMap",                              0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"ItemCompass",                          0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"ItemWatch",                            0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"FirstAidKit",                          0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"ToolKit",                              0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"Rangefinder",                          0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                //{"LaserDesignator",                      0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      },
                {"Binocular",                            0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"NVGoggles",                            0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"NVGoggles_OPFOR",                      0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"NVGoggles_INDEP",                      0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"NVGoggles_tna_F",                      0, -1, -1, -1. "call GW_Player_sideRank >= 1", ""                      },
                {"SmokeShell",                           0, -1, -1, -1, "call GW_Player_sideRank >= 6", ""                      },
                {"B_IR_Grenade",                         0, -1, -1, -1, "call GW_Player_sideRank >= 6", ""                      },

                // Attachments
                {"acc_pointer_IR",                       0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"acc_flashlight",                       0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"acc_flashlight_pistol",                0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                {"optic_Yorris",                         0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_MRD",                            0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_Aco",                            0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_ACO_grn",                        0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_ACO_grn_smg",                    0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_Aco_smg",                        0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                {"optic_Holosight",                      0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_Holosight_blk_F",                0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_Holosight_khk_F",                0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_Holosight_smg",                  0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_Holosight_smg_blk_F",            0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                {"optic_Hamr",                           0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      }, // RCO
                {"optic_Hamr_khk_F",                     0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      }, // RCO

                {"optic_Arco",                           0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_Arco_blk_F",                     0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                {"optic_ERCO_blk_F",                     0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_ERCO_khk_F",                     0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_ERCO_snd_F",                     0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                {"optic_MRCO",                           0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                {"optic_NVS",                            0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_DMS",                            0, -1, -1, -1, "call GW_Player_sideRank >= 6", ""                      }, // DMS
                {"optic_AMS",                            0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // AMS
                {"optic_AMS_khk",                        0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // AMS
                {"optic_AMS_snd",                        0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // AMS
                {"optic_KHS_blk",                        0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // Khalia
                {"optic_KHS_tan",                        0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // Khalia
                {"optic_SOS",                            0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // MOS
                {"optic_SOS_khk_F",                      0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // MOS
                {"optic_LRPS",                           0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // LRPS
                {"optic_LRPS_tna_F",                     0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // LRPS

                // Smokes
                {"1Rnd_Smoke_Grenade_shell",             0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"1Rnd_SmokeRed_Grenade_shell",          0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"1Rnd_SmokeGreen_Grenade_shell",        0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"1Rnd_SmokeYellow_Grenade_shell",       0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"1Rnd_SmokePurple_Grenade_shell",       0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"1Rnd_SmokeBlue_Grenade_shell",         0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"1Rnd_SmokeOrange_Grenade_shell",       0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },

                {"3Rnd_Smoke_Grenade_shell",             0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"3Rnd_SmokeRed_Grenade_shell",          0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"3Rnd_SmokeGreen_Grenade_shell",        0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"3Rnd_SmokeYellow_Grenade_shell",       0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"3Rnd_SmokePurple_Grenade_shell",       0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"3Rnd_SmokeBlue_Grenade_shell",         0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"3Rnd_SmokeOrange_Grenade_shell",       0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },

                // .45 ACP
                {"hgun_Pistol_heavy_01_F",               0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"hgun_Pistol_heavy_01_MRD_F",           0, -1, -1, -1, "call GW_Player_sideRank >= 1", "Taser"                 },
                {"11Rnd_45ACP_Mag",                      0, -1, -1, -1, "call GW_Player_sideRank >= 1", "Taser Cartridge"       },
                {"hgun_ACPC2_F",                         0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"9Rnd_45ACP_Mag",                       0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"muzzle_snds_acp",                      0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                {"hgun_Pistol_heavy_02_F",               0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"hgun_Pistol_heavy_02_Yorris_F",        0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                // 9mm Handguns
                {"hgun_Rook40_F",                        0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"hgun_P07_F",                           0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"hgun_P07_khk_F",                       0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"muzzle_snds_L",                        0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"16Rnd_9x21_Mag",                       0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"16Rnd_9x21_red_Mag",                   0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"16Rnd_9x21_green_Mag",                 0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"16Rnd_9x21_yellow_Mag",                0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_9x21_Mag",                       0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_9x21_Red_Mag",                   0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_9x21_Yellow_Mag",                0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_9x21_Green_Mag",                 0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                {"SMG_02_F",                             0, -1, -1, -1, "call GW_Player_sideRank >= 1", "Taser Rifle"           },
                {"30Rnd_9x21_Mag_SMG_02",                0, -1, -1, -1, "call GW_Player_sideRank >= 1", "Lethal Magazine"       },
                {"30Rnd_9x21_Mag_SMG_02_Tracer_Red",     0, -1, -1, -1, "call GW_Player_sideRank >= 1", "Taser Rifle Cartridge" },

                {"hgun_PDW2000_F",                       0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"SMG_01_F",                             0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_45ACP_Mag_SMG_01",               0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_45ACP_Mag_SMG_01_tracer_green",  0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_45ACP_Mag_SMG_01_Tracer_Red",    0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow", 0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                {"SMG_05_F",                             0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_9x21_Mag_SMG_02",                0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_9x21_Mag_SMG_02_Tracer_Red",     0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",  0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_9x21_Mag_SMG_02_Tracer_Green",   0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                // 5.56
                {"arifle_Mk20C_plain_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 2", ""                      },
                {"arifle_Mk20_plain_F",                  0, -1, -1, -1, "call GW_Player_sideRank >= 3", ""                      },
                {"arifle_Mk20_GL_plain_F",               0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"UGL_FlareCIR_F",                       0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // IR Flare

                // Normal SPAR-16
                {"arifle_SPAR_01_blk_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 3", ""                      }, // SPAR-16 Black
                {"arifle_SPAR_01_khk_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 3", ""                      }, // SPAR-16 Khaki
                {"arifle_SPAR_01_snd_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 3", ""                      }, // SPAR-16 Sand

                // GL SPAR-16
                {"arifle_SPAR_01_GL_blk_F",              0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      }, // SPAR-16 GL Black
                {"arifle_SPAR_01_GL_khk_F",              0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      }, // SPAR-16 GL Khaki
                {"arifle_SPAR_01_GL_snd_F",              0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      }, // SPAR-16 GL Sand

                {"30Rnd_556x45_Stanag",                  0, -1, -1, -1, "call GW_Player_sideRank >= 2", ""                      },
                {"30Rnd_556x45_Stanag_Tracer_Red",       0, -1, -1, -1, "call GW_Player_sideRank >= 2", ""                      },
                {"30Rnd_556x45_Stanag_Tracer_Green",     0, -1, -1, -1, "call GW_Player_sideRank >= 2", ""                      },
                {"30Rnd_556x45_Stanag_Tracer_Yellow",    0, -1, -1, -1, "call GW_Player_sideRank >= 2", ""                      },
                {"30Rnd_556x45_Stanag_red",              0, -1, -1, -1, "call GW_Player_sideRank >= 2", ""                      },
                {"30Rnd_556x45_Stanag_green",            0, -1, -1, -1, "call GW_Player_sideRank >= 2", ""                      },

                // LMG SPAR-16(S)
                {"arifle_SPAR_02_blk_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // SPAR-16S Black
                {"arifle_SPAR_02_khk_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // SPAR-16S Khaki
                {"arifle_SPAR_02_snd_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // SPAR-16S Sand

                // Drum Mags, SPAR-16S
                {"150Rnd_556x45_Drum_Mag_F",             0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // SPAR-16S Sand
                {"150Rnd_556x45_Drum_Mag_Tracer_F",      0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // SPAR-16S Sand

                // LIM-85
                {"LMG_03_F",                             0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // LIM-85 5.56
                {"200Rnd_556x45_Box_Red_F",              0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // LIM-85 5.56
                {"200Rnd_556x45_Box_F",                  0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // LIM-85 5.56
                {"200Rnd_556x45_Box_Tracer_Red_F",       0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // LIM-85 5.56
                {"200Rnd_556x45_Box_Tracer_F",           0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // LIM-85 5.56

                // 5.8
                {"arifle_CTAR_blk_F",                    0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      }, // CAR-95
                {"arifle_CTAR_GL_blk_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 6", ""                      }, // CAR-95 GL
                {"arifle_CTARS_blk_F",                   0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // CAR-95S (LMG)

                {"30Rnd_580x42_Mag_F",                   0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      }, // 5.8mm 30rnd
                {"30Rnd_580x42_Mag_Tracer_F",            0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      }, // 5.8mm 30rnd Tracer

                {"100Rnd_580x42_Mag_F",                  0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // 5.8mm 100rnd
                {"100Rnd_580x42_Mag_Tracer_F",           0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // 5.8mm 100rnd Tracer

                // 6.5
                {"arifle_MXC_F",                         0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"arifle_MXC_Black_F",                   0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"arifle_MX_F",                          0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      },
                {"arifle_MX_Black_F",                    0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      },
                {"arifle_MX_GL_F",                       0, -1, -1, -1, "call GW_Player_sideRank >= 6", ""                      },
                {"arifle_MX_GL_Black_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 6", ""                      },
                {"arifle_MX_SW_F",                       0, -1, -1, -1, "call GW_Player_sideRank >= 10", ""                      },
                {"arifle_MX_SW_Black_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 10", ""                      },
                {"arifle_MXM_F",                         0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      },
                {"arifle_MXM_Black_F",                   0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      },

                {"30Rnd_65x39_caseless_mag",             0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // MX Caseless Mag
                {"30Rnd_65x39_caseless_mag_Tracer",      0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // MX Caseless Tracer Mag

                // Katiba
                {"arifle_Katiba_C_F",                    0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // Katiba C
                {"arifle_Katiba_F",                      0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      }, // Katiba Normal
                {"arifle_Katiba_GL_F",                   0, -1, -1, -1, "call GW_Player_sideRank >= 6", ""                      }, // Katiba GL

                // Type .115
                {"arifle_ARX_blk_F",                     0, -1, -1, -1, "call GW_Player_sideRank >= 6", ""                      }, // Type .115 Black
                {"10Rnd_50BW_Mag_F",                     0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // .50 BW

                // CMR-76 6.5
                {"srifle_DMR_07_blk_F",                  0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // Type .115 Black

                {"muzzle_snds_H",                        0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // 6.5 Suppressor
                {"muzzle_snds_65_TI_blk_F",              0, -1, -1, -1, "call GW_Player_sideRank >= 6", ""                      }, // 6.5 Stealth Suppressor

                // 6.5 LMG Suppressors
                {"muzzle_snds_H_MG_blk_F",               0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // 6.5 Suppressor
                {"muzzle_snds_H_MG",                     0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // 6.5 Suppressor
                {"muzzle_snds_H_MG_khk_F",               0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // 6.5 Suppressor

                {"30Rnd_65x39_caseless_green",           0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // 6.5 caseless mag
                {"30Rnd_65x39_caseless_green_mag_Tracer",0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // 6.5 caseless tracer mag

                // MK200 6.5
                {"LMG_Mk200_F",                          0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK200 6.5mm
                {"200Rnd_65x39_cased_Box",               0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK200 6.5mm
                {"200Rnd_65x39_Belt",                    0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK200 6.5mm
                {"200Rnd_65x39_Belt_Tracer_Green",       0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK200 6.5mm
                {"200Rnd_65x39_Belt_Tracer_Red",         0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK200 6.5mm
                {"200Rnd_65x39_Belt_Tracer_Yellow",      0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK200 6.5mm
                {"200Rnd_65x39_cased_Box_Tracer",        0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK200 6.5mm

                // 7.62
                {"srifle_DMR_06_olive_F",                0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // MK14
                {"srifle_EBR_F",                         0, -1, -1, -1, "call GW_Player_sideRank >= 10", ""                      }, // MK18 ABR
                {"srifle_DMR_03_F",                      0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK-1 Black
                {"srifle_DMR_03_khaki_F",                0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK-1 Khaki
                {"srifle_DMR_03_multicam_F",             0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK-1 Multicamo
                {"srifle_DMR_03_woodland_F",             0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK-1 Woodland
                {"srifle_DMR_03_tan_F",                  0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK-1 Sand
                {"LMG_Zafir_F",                          0, -1, -1, -1, "call GW_Player_sideRank >= 10", ""                      }, // Zafir

                // 7.62 suppressors
                {"muzzle_snds_B",                        0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK-1 Woodland
                {"muzzle_snds_B_khk_F",                  0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK-1 Sand
                {"muzzle_snds_B_snd_F",                  0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // Zafir

                {"20Rnd_762x51_Mag",                     0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // 7.62 20rnd Mag

                {"30Rnd_762x39_Mag_F",                   0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // 7.62 30rnd Mag
                {"30Rnd_762x39_Mag_Green_F",             0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // 7.62 30rnd Mag Tracer
                {"30Rnd_762x39_Mag_Tracer_Green_F",      0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // 7.62 30rnd Mag Tracer
                {"30Rnd_762x39_Mag_Tracer_F",            0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // 7.62 30rnd Mag Tracer

                {"150Rnd_762x51_Box",                    0, -1, -1, -1, "call GW_Player_sideRank >= 10", ""                      }, // 7.62 150rnd Mag
                {"150Rnd_762x54_Box",                    0, -1, -1, -1, "call GW_Player_sideRank >= 10", ""                      }, // 7.62 150rnd Mag
                {"150Rnd_762x51_Box_Tracer",             0, -1, -1, -1, "call GW_Player_sideRank >= 10", ""                      }, // 7.62 150rnd Mag Tracer
                {"150Rnd_762x54_Box_Tracer",             0, -1, -1, -1, "call GW_Player_sideRank >= 10", ""                      }  // 7.62 150rnd Mag Tracer
            };
        };
        class RMPSafe {
            displayName = "RMP Equipment Safe";
            condition   = "playerSide isEqualTo west && {[] call GW_client_fnc_equipmentSafeIsUnlocked}";
            equipment[] = {
                {"ItemRadio",                            0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"ItemGPS",                              0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"ItemMap",                              0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"ItemCompass",                          0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"ItemWatch",                            0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"FirstAidKit",                          0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"ToolKit",                              0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"Rangefinder",                          0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                //{"LaserDesignator",                      0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      },
                {"Binocular",                            0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"NVGoggles",                            0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"NVGoggles_OPFOR",                      0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"NVGoggles_INDEP",                      0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"NVGoggles_tna_F",                      0, -1, -1, -1. "call GW_Player_sideRank >= 1", ""                      },
                {"SmokeShell",                           0, -1, -1, -1, "call GW_Player_sideRank >= 6", ""                      },
                {"B_IR_Grenade",                         0, -1, -1, -1, "call GW_Player_sideRank >= 6", ""                      },

                // Attachments
                {"acc_pointer_IR",                       0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"acc_flashlight",                       0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"acc_flashlight_pistol",                0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                {"optic_Yorris",                         0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_MRD",                            0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_Aco",                            0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_ACO_grn",                        0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_ACO_grn_smg",                    0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_Aco_smg",                        0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                {"optic_Holosight",                      0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_Holosight_blk_F",                0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_Holosight_khk_F",                0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_Holosight_smg",                  0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_Holosight_smg_blk_F",            0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                {"optic_Hamr",                           0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      }, // RCO
                {"optic_Hamr_khk_F",                     0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      }, // RCO

                {"optic_Arco",                           0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_Arco_blk_F",                     0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                {"optic_ERCO_blk_F",                     0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_ERCO_khk_F",                     0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_ERCO_snd_F",                     0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                {"optic_MRCO",                           0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                {"optic_NVS",                            0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"optic_DMS",                            0, -1, -1, -1, "call GW_Player_sideRank >= 6", ""                      }, // DMS
                {"optic_AMS",                            0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // AMS
                {"optic_AMS_khk",                        0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // AMS
                {"optic_AMS_snd",                        0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // AMS
                {"optic_KHS_blk",                        0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // Khalia
                {"optic_KHS_tan",                        0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // Khalia
                {"optic_SOS",                            0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // MOS
                {"optic_SOS_khk_F",                      0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // MOS
                {"optic_LRPS",                           0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // LRPS
                {"optic_LRPS_tna_F",                     0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // LRPS

                // Smokes
                {"1Rnd_Smoke_Grenade_shell",             0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"1Rnd_SmokeRed_Grenade_shell",          0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"1Rnd_SmokeGreen_Grenade_shell",        0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"1Rnd_SmokeYellow_Grenade_shell",       0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"1Rnd_SmokePurple_Grenade_shell",       0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"1Rnd_SmokeBlue_Grenade_shell",         0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"1Rnd_SmokeOrange_Grenade_shell",       0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },

                {"3Rnd_Smoke_Grenade_shell",             0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"3Rnd_SmokeRed_Grenade_shell",          0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"3Rnd_SmokeGreen_Grenade_shell",        0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"3Rnd_SmokeYellow_Grenade_shell",       0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"3Rnd_SmokePurple_Grenade_shell",       0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"3Rnd_SmokeBlue_Grenade_shell",         0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"3Rnd_SmokeOrange_Grenade_shell",       0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },

                // .45 ACP
                {"hgun_Pistol_heavy_01_F",               0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"hgun_Pistol_heavy_01_MRD_F",           0, -1, -1, -1, "call GW_Player_sideRank >= 1", "Taser"                 },
                {"11Rnd_45ACP_Mag",                      0, -1, -1, -1, "call GW_Player_sideRank >= 1", "Taser Cartridge"       },
                {"hgun_ACPC2_F",                         0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"9Rnd_45ACP_Mag",                       0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"muzzle_snds_acp",                      0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                {"hgun_Pistol_heavy_02_F",               0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"hgun_Pistol_heavy_02_Yorris_F",        0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                // 9mm Handguns
                {"hgun_Rook40_F",                        0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"hgun_P07_F",                           0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"hgun_P07_khk_F",                       0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"muzzle_snds_L",                        0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"16Rnd_9x21_Mag",                       0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"16Rnd_9x21_red_Mag",                   0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"16Rnd_9x21_green_Mag",                 0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"16Rnd_9x21_yellow_Mag",                0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_9x21_Mag",                       0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_9x21_Red_Mag",                   0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_9x21_Yellow_Mag",                0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_9x21_Green_Mag",                 0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                {"SMG_02_F",                             0, -1, -1, -1, "call GW_Player_sideRank >= 1", "Taser Rifle"           },
                {"30Rnd_9x21_Mag_SMG_02",                0, -1, -1, -1, "call GW_Player_sideRank >= 1", "Lethal Magazine"       },
                {"30Rnd_9x21_Mag_SMG_02_Tracer_Red",     0, -1, -1, -1, "call GW_Player_sideRank >= 1", "Taser Rifle Cartridge" },

                {"hgun_PDW2000_F",                       0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"SMG_01_F",                             0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_45ACP_Mag_SMG_01",               0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_45ACP_Mag_SMG_01_tracer_green",  0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_45ACP_Mag_SMG_01_Tracer_Red",    0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow", 0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                {"SMG_05_F",                             0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_9x21_Mag_SMG_02",                0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_9x21_Mag_SMG_02_Tracer_Red",     0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",  0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },
                {"30Rnd_9x21_Mag_SMG_02_Tracer_Green",   0, -1, -1, -1, "call GW_Player_sideRank >= 1", ""                      },

                // 5.56
                {"arifle_Mk20C_plain_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 2", ""                      },
                {"arifle_Mk20_plain_F",                  0, -1, -1, -1, "call GW_Player_sideRank >= 3", ""                      },
                {"arifle_Mk20_GL_plain_F",               0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"UGL_FlareCIR_F",                       0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // IR Flare

                // Normal SPAR-16
                {"arifle_SPAR_01_blk_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 3", ""                      }, // SPAR-16 Black
                {"arifle_SPAR_01_khk_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 3", ""                      }, // SPAR-16 Khaki
                {"arifle_SPAR_01_snd_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 3", ""                      }, // SPAR-16 Sand

                // GL SPAR-16
                {"arifle_SPAR_01_GL_blk_F",              0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      }, // SPAR-16 GL Black
                {"arifle_SPAR_01_GL_khk_F",              0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      }, // SPAR-16 GL Khaki
                {"arifle_SPAR_01_GL_snd_F",              0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      }, // SPAR-16 GL Sand

                {"30Rnd_556x45_Stanag",                  0, -1, -1, -1, "call GW_Player_sideRank >= 2", ""                      },
                {"30Rnd_556x45_Stanag_Tracer_Red",       0, -1, -1, -1, "call GW_Player_sideRank >= 2", ""                      },
                {"30Rnd_556x45_Stanag_Tracer_Green",     0, -1, -1, -1, "call GW_Player_sideRank >= 2", ""                      },
                {"30Rnd_556x45_Stanag_Tracer_Yellow",    0, -1, -1, -1, "call GW_Player_sideRank >= 2", ""                      },
                {"30Rnd_556x45_Stanag_red",              0, -1, -1, -1, "call GW_Player_sideRank >= 2", ""                      },
                {"30Rnd_556x45_Stanag_green",            0, -1, -1, -1, "call GW_Player_sideRank >= 2", ""                      },

                // LMG SPAR-16(S)
                {"arifle_SPAR_02_blk_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // SPAR-16S Black
                {"arifle_SPAR_02_khk_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // SPAR-16S Khaki
                {"arifle_SPAR_02_snd_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // SPAR-16S Sand

                // Drum Mags, SPAR-16S
                {"150Rnd_556x45_Drum_Mag_F",             0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // SPAR-16S Sand
                {"150Rnd_556x45_Drum_Mag_Tracer_F",      0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // SPAR-16S Sand

                // LIM-85
                {"LMG_03_F",                             0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // LIM-85 5.56
                {"200Rnd_556x45_Box_Red_F",              0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // LIM-85 5.56
                {"200Rnd_556x45_Box_F",                  0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // LIM-85 5.56
                {"200Rnd_556x45_Box_Tracer_Red_F",       0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // LIM-85 5.56
                {"200Rnd_556x45_Box_Tracer_F",           0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // LIM-85 5.56

                // 5.8
                {"arifle_CTAR_blk_F",                    0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      }, // CAR-95
                {"arifle_CTAR_GL_blk_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 6", ""                      }, // CAR-95 GL
                {"arifle_CTARS_blk_F",                   0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // CAR-95S (LMG)

                {"30Rnd_580x42_Mag_F",                   0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      }, // 5.8mm 30rnd
                {"30Rnd_580x42_Mag_Tracer_F",            0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      }, // 5.8mm 30rnd Tracer

                {"100Rnd_580x42_Mag_F",                  0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // 5.8mm 100rnd
                {"100Rnd_580x42_Mag_Tracer_F",           0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // 5.8mm 100rnd Tracer

                // 6.5
                {"arifle_MXC_F",                         0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"arifle_MXC_Black_F",                   0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      },
                {"arifle_MX_F",                          0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      },
                {"arifle_MX_Black_F",                    0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      },
                {"arifle_MX_GL_F",                       0, -1, -1, -1, "call GW_Player_sideRank >= 6", ""                      },
                {"arifle_MX_GL_Black_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 6", ""                      },
                {"arifle_MX_SW_F",                       0, -1, -1, -1, "call GW_Player_sideRank >= 10", ""                      },
                {"arifle_MX_SW_Black_F",                 0, -1, -1, -1, "call GW_Player_sideRank >= 10", ""                      },
                {"arifle_MXM_F",                         0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      },
                {"arifle_MXM_Black_F",                   0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      },

                {"30Rnd_65x39_caseless_mag",             0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // MX Caseless Mag
                {"30Rnd_65x39_caseless_mag_Tracer",      0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // MX Caseless Tracer Mag

                // Katiba
                {"arifle_Katiba_C_F",                    0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // Katiba C
                {"arifle_Katiba_F",                      0, -1, -1, -1, "call GW_Player_sideRank >= 5", ""                      }, // Katiba Normal
                {"arifle_Katiba_GL_F",                   0, -1, -1, -1, "call GW_Player_sideRank >= 6", ""                      }, // Katiba GL

                // Type .115
                {"arifle_ARX_blk_F",                     0, -1, -1, -1, "call GW_Player_sideRank >= 6", ""                      }, // Type .115 Black
                {"10Rnd_50BW_Mag_F",                     0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // .50 BW

                // CMR-76 6.5
                {"srifle_DMR_07_blk_F",                  0, -1, -1, -1, "call GW_Player_sideRank >= 7", ""                      }, // Type .115 Black

                {"muzzle_snds_H",                        0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // 6.5 Suppressor
                {"muzzle_snds_65_TI_blk_F",              0, -1, -1, -1, "call GW_Player_sideRank >= 6", ""                      }, // 6.5 Stealth Suppressor

                // 6.5 LMG Suppressors
                {"muzzle_snds_H_MG_blk_F",               0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // 6.5 Suppressor
                {"muzzle_snds_H_MG",                     0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // 6.5 Suppressor
                {"muzzle_snds_H_MG_khk_F",               0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // 6.5 Suppressor

                {"30Rnd_65x39_caseless_green",           0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // 6.5 caseless mag
                {"30Rnd_65x39_caseless_green_mag_Tracer",0, -1, -1, -1, "call GW_Player_sideRank >= 4", ""                      }, // 6.5 caseless tracer mag

                // MK200 6.5
                {"LMG_Mk200_F",                          0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK200 6.5mm
                {"200Rnd_65x39_cased_Box",               0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK200 6.5mm
                {"200Rnd_65x39_Belt",                    0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK200 6.5mm
                {"200Rnd_65x39_Belt_Tracer_Green",       0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK200 6.5mm
                {"200Rnd_65x39_Belt_Tracer_Red",         0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK200 6.5mm
                {"200Rnd_65x39_Belt_Tracer_Yellow",      0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK200 6.5mm
                {"200Rnd_65x39_cased_Box_Tracer",        0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK200 6.5mm

                // 7.62
                {"srifle_DMR_06_olive_F",                0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // MK14
                {"srifle_EBR_F",                         0, -1, -1, -1, "call GW_Player_sideRank >= 10", ""                      }, // MK18 ABR
                {"srifle_DMR_03_F",                      0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK-1 Black
                {"srifle_DMR_03_khaki_F",                0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK-1 Khaki
                {"srifle_DMR_03_multicam_F",             0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK-1 Multicamo
                {"srifle_DMR_03_woodland_F",             0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK-1 Woodland
                {"srifle_DMR_03_tan_F",                  0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK-1 Sand
                {"LMG_Zafir_F",                          0, -1, -1, -1, "call GW_Player_sideRank >= 10", ""                      }, // Zafir

                // 7.62 suppressors
                {"muzzle_snds_B",                        0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK-1 Woodland
                {"muzzle_snds_B_khk_F",                  0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // MK-1 Sand
                {"muzzle_snds_B_snd_F",                  0, -1, -1, -1, "call GW_Player_sideRank >= 9", ""                      }, // Zafir

                {"20Rnd_762x51_Mag",                     0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // 7.62 20rnd Mag

                {"30Rnd_762x39_Mag_F",                   0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // 7.62 30rnd Mag
                {"30Rnd_762x39_Mag_Green_F",             0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // 7.62 30rnd Mag Tracer
                {"30Rnd_762x39_Mag_Tracer_Green_F",      0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // 7.62 30rnd Mag Tracer
                {"30Rnd_762x39_Mag_Tracer_F",            0, -1, -1, -1, "call GW_Player_sideRank >= 8", ""                      }, // 7.62 30rnd Mag Tracer

                {"150Rnd_762x51_Box",                    0, -1, -1, -1, "call GW_Player_sideRank >= 10", ""                      }, // 7.62 150rnd Mag
                {"150Rnd_762x54_Box",                    0, -1, -1, -1, "call GW_Player_sideRank >= 10", ""                      }, // 7.62 150rnd Mag
                {"150Rnd_762x51_Box_Tracer",             0, -1, -1, -1, "call GW_Player_sideRank >= 10", ""                      }, // 7.62 150rnd Mag Tracer
                {"150Rnd_762x54_Box_Tracer",             0, -1, -1, -1, "call GW_Player_sideRank >= 10", ""                      }  // 7.62 150rnd Mag Tracer
            };
        };
        class Rebel {
            displayName = "Rebel Equipment Vendor";
            condition   = "playerSide isEqualTo civilian && {['CivilianRebel'] call GW_client_fnc_licensingHasLicense}";
            equipment[] = {
                {"ItemRadio",                            150, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"ItemGPS",                              500, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"ItemMap",                              150, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"ItemCompass",                          150, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"ItemWatch",                            150, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"FirstAidKit",                          2000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"ToolKit",                              5000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"Rangefinder",                          7500, -1, LEVEL_WEAPONS, 2, "", ""                     },
                {"Binocular",                            2500, -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"NVGoggles",                            5000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"NVGoggles_OPFOR",                      5000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"NVGoggles_INDEP",                      5000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"NVGoggles_tna_F",                      5000, -1, LEVEL_WEAPONS, 0. "", ""                     },
                {"SmokeShell",                           5000, -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"SmokeShellBlue",                       5000, -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"SmokeShellGreen",                      5000, -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"SmokeShellOrange",                     5000, -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"SmokeShellPurple",                     5000, -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"SmokeShellRed",                        5000, -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"SmokeShellYellow",                     5000, -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"B_IR_Grenade",                         5000, -1, LEVEL_WEAPONS, 1, "", ""                     },

                // Attachments
                {"acc_pointer_IR",                       1000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"acc_flashlight",                       1000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"acc_flashlight_pistol",                1000, -1, LEVEL_WEAPONS, 0, "", ""                     },

                //{"optic_Yorris",                         1500, -1, LEVEL_WEAPONS, -1, "", ""                  },
                //{"optic_MRD",                            1500, -1, LEVEL_WEAPONS, -1, "", ""                  },
                {"optic_Aco",                            2500, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"optic_ACO_grn",                        2500, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"optic_ACO_grn_smg",                    2500, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"optic_Aco_smg",                        2500, -1, LEVEL_WEAPONS, 0, "", ""                     },

                {"optic_Holosight",                      15000, -1, LEVEL_WEAPONS, 0, "", ""                    },
                {"optic_Holosight_blk_F",                15000, -1, LEVEL_WEAPONS, 0, "", ""                    },
                {"optic_Holosight_khk_F",                15000, -1, LEVEL_WEAPONS, 0, "", ""                    },
                {"optic_Holosight_smg",                  15000, -1, LEVEL_WEAPONS, 0, "", ""                    },
                {"optic_Holosight_smg_blk_F",            15000, -1, LEVEL_WEAPONS, 0, "", ""                    },

                {"optic_Hamr",                           20000, -1, LEVEL_WEAPONS, 1, "", ""                    }, // RCO
                {"optic_Hamr_khk_F",                     20000, -1, LEVEL_WEAPONS, 1, "", ""                    }, // RCO

                {"optic_Arco",                           20000, -1, LEVEL_WEAPONS, 1, "", ""                    },
                {"optic_Arco_blk_F",                     20000, -1, LEVEL_WEAPONS, 1, "", ""                    },

                {"optic_ERCO_blk_F",                     20000, -1, LEVEL_WEAPONS, 1, "", ""                    },
                {"optic_ERCO_khk_F",                     20000, -1, LEVEL_WEAPONS, 1, "", ""                    },
                {"optic_ERCO_snd_F",                     20000, -1, LEVEL_WEAPONS, 1, "", ""                    },

                {"optic_MRCO",                           20000, -1, LEVEL_WEAPONS, 1, "", ""                    },

                //{"optic_NVS",                            75000, -1,  LEVEL_WEAPONS, 4, "", ""                 },
                {"optic_DMS",                            50000, -1,  LEVEL_WEAPONS, 3, "", ""                   }, // DMS
                {"optic_AMS",                            125000, -1, LEVEL_WEAPONS, 9, "", ""                   }, // AMS
                {"optic_AMS_khk",                        125000, -1, LEVEL_WEAPONS, 9, "", ""                   }, // AMS
                {"optic_AMS_snd",                        125000, -1, LEVEL_WEAPONS, 9, "", ""                   }, // AMS
                {"optic_KHS_blk",                        125000, -1, LEVEL_WEAPONS, 9, "", ""                   }, // Khalia
                {"optic_KHS_tan",                        125000, -1, LEVEL_WEAPONS, 9, "", ""                   }, // Khalia
                {"optic_SOS",                            75000, -1,  LEVEL_WEAPONS, 6, "", ""                   }, // MOS
                {"optic_SOS_khk_F",                      75000, -1,  LEVEL_WEAPONS, 6, "", ""                   }, // MOS
                {"optic_LRPS",                           200000, -1, LEVEL_WEAPONS, 11, "", ""                  }, // LRPS
                {"optic_LRPS_tna_F",                     200000, -1, LEVEL_WEAPONS, 11, "", ""                  }, // LRPS

                // Smokes
                {"1Rnd_Smoke_Grenade_shell",             2500, -1, LEVEL_WEAPONS, 3, "", ""                      },
                {"1Rnd_SmokeRed_Grenade_shell",          2500, -1, LEVEL_WEAPONS, 3, "", ""                      },
                {"1Rnd_SmokeGreen_Grenade_shell",        2500, -1, LEVEL_WEAPONS, 3, "", ""                      },
                {"1Rnd_SmokeYellow_Grenade_shell",       2500, -1, LEVEL_WEAPONS, 3, "", ""                      },
                {"1Rnd_SmokePurple_Grenade_shell",       2500, -1, LEVEL_WEAPONS, 3, "", ""                      },
                {"1Rnd_SmokeBlue_Grenade_shell",         2500, -1, LEVEL_WEAPONS, 3, "", ""                      },
                {"1Rnd_SmokeOrange_Grenade_shell",       2500, -1, LEVEL_WEAPONS, 3, "", ""                      },

                {"3Rnd_Smoke_Grenade_shell",             3000, -1, LEVEL_WEAPONS, 3, "", ""                      },
                {"3Rnd_SmokeRed_Grenade_shell",          3000, -1, LEVEL_WEAPONS, 3, "", ""                      },
                {"3Rnd_SmokeGreen_Grenade_shell",        3000, -1, LEVEL_WEAPONS, 3, "", ""                      },
                {"3Rnd_SmokeYellow_Grenade_shell",       3000, -1, LEVEL_WEAPONS, 3, "", ""                      },
                {"3Rnd_SmokePurple_Grenade_shell",       3000, -1, LEVEL_WEAPONS, 3, "", ""                      },
                {"3Rnd_SmokeBlue_Grenade_shell",         3000, -1, LEVEL_WEAPONS, 3, "", ""                      },
                {"3Rnd_SmokeOrange_Grenade_shell",       3000, -1, LEVEL_WEAPONS, 3, "", ""                      },

                // 9mm Handguns
                {"hgun_Pistol_01_F",                     10000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"hgun_Rook40_F",                        15000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"hgun_P07_F",                           13000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"hgun_P07_khk_F",                       13000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"muzzle_snds_L",                        15000, -1,  LEVEL_WEAPONS, 0, "", ""                    },
                {"16Rnd_9x21_Mag",                       1200, -1,  LEVEL_WEAPONS, 0, "", ""                     },
                {"16Rnd_9x21_red_Mag",                   1200, -1,  LEVEL_WEAPONS, 0, "", ""                     },
                {"16Rnd_9x21_green_Mag",                 1200, -1,  LEVEL_WEAPONS, 0, "", ""                     },
                {"16Rnd_9x21_yellow_Mag",                1200, -1,  LEVEL_WEAPONS, 0, "", ""                     },
                {"30Rnd_9x21_Mag",                       1200, -1,  LEVEL_WEAPONS, 0, "", ""                     },
                {"30Rnd_9x21_Red_Mag",                   1200, -1,  LEVEL_WEAPONS, 0, "", ""                     },
                {"30Rnd_9x21_Yellow_Mag",                1200, -1,  LEVEL_WEAPONS, 0, "", ""                     },
                {"30Rnd_9x21_Green_Mag",                 1200, -1,  LEVEL_WEAPONS, 0, "", ""                     },

                // .45 ACP
                {"hgun_Pistol_heavy_02_F",               17500, -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"hgun_ACPC2_F",                         22500, -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"hgun_Pistol_heavy_01_F",               25000, -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"9Rnd_45ACP_Mag",                       1000,  -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"muzzle_snds_acp",                      20000, -1, LEVEL_WEAPONS, 1, "", ""                     },

                {"hgun_PDW2000_F",                       30000, -1, LEVEL_WEAPONS, 1, "", ""                     }, // PDW
                {"SMG_05_F",                             38000, -1, LEVEL_WEAPONS, 1, "", ""                     }, // Protector
                {"SMG_02_F",                             38000, -1, LEVEL_WEAPONS, 1, "", "",                    }, // Sting
                {"30Rnd_9x21_Mag_SMG_02",                1500,  -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"30Rnd_9x21_Mag_SMG_02_Tracer_Red",     1550,  -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",  1550,  -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"30Rnd_9x21_Mag_SMG_02_Tracer_Green",   1550,  -1, LEVEL_WEAPONS, 1, "", ""                     },

                {"SMG_01_F",                             48000, -1, LEVEL_WEAPONS, 2, "", ""                     }, // Vermin .45 ACP
                {"30Rnd_45ACP_Mag_SMG_01",               2500,  -1, LEVEL_WEAPONS, 2, "", ""                     },
                {"30Rnd_45ACP_Mag_SMG_01_tracer_green",  2500,  -1, LEVEL_WEAPONS, 2, "", ""                     },
                {"30Rnd_45ACP_Mag_SMG_01_Tracer_Red",    2500,  -1, LEVEL_WEAPONS, 2, "", ""                     },
                {"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow", 2500,  -1, LEVEL_WEAPONS, 2, "", ""                     },

                // MK20
                {"arifle_Mk20C_F",                       60000, -1, LEVEL_WEAPONS, 2, "", ""                   },
                {"arifle_Mk20_F",                        70000, -1, LEVEL_WEAPONS, 2, "", ""                   },
                {"arifle_Mk20_GL_F",                     80000, -1, LEVEL_WEAPONS, 3, "", ""                   },
                {"UGL_FlareCIR_F",                       2500,  -1, LEVEL_WEAPONS, 3, "", ""                   }, // IR Flare

                // TRG
                {"arifle_TRG20_F",                       60000, -1, LEVEL_WEAPONS, 2, "", ""                     },
                {"arifle_TRG21_F",                       70000, -1, LEVEL_WEAPONS, 2, "", ""                     },
                {"arifle_TRG21_GL_F",                    80000, -1, LEVEL_WEAPONS, 3, "", ""                     },

                // Normal SPAR-16
                {"arifle_SPAR_01_blk_F",                 80000, -1, LEVEL_WEAPONS, 2, "", ""                     }, // SPAR-16 Black
                {"arifle_SPAR_01_khk_F",                 80000, -1, LEVEL_WEAPONS, 2, "", ""                     }, // SPAR-16 Khaki
                {"arifle_SPAR_01_snd_F",                 80000, -1, LEVEL_WEAPONS, 2, "", ""                     }, // SPAR-16 Sand

                // GL SPAR-16
                {"arifle_SPAR_01_GL_blk_F",              90000, -1, LEVEL_WEAPONS, 3, "", ""                     }, // SPAR-16 GL Black
                {"arifle_SPAR_01_GL_khk_F",              90000, -1, LEVEL_WEAPONS, 3, "", ""                     }, // SPAR-16 GL Khaki
                {"arifle_SPAR_01_GL_snd_F",              90000, -1, LEVEL_WEAPONS, 3, "", ""                     }, // SPAR-16 GL Sand

                {"30Rnd_556x45_Stanag",                  4000, -1, LEVEL_WEAPONS, 2, "", ""                      },
                {"30Rnd_556x45_Stanag_Tracer_Red",       4000, -1, LEVEL_WEAPONS, 2, "", ""                      },
                {"30Rnd_556x45_Stanag_Tracer_Green",     4000, -1, LEVEL_WEAPONS, 2, "", ""                      },
                {"30Rnd_556x45_Stanag_Tracer_Yellow",    4000, -1, LEVEL_WEAPONS, 2, "", ""                      },
                {"30Rnd_556x45_Stanag_red",              4000, -1, LEVEL_WEAPONS, 2, "", ""                      },
                {"30Rnd_556x45_Stanag_green",            4000, -1, LEVEL_WEAPONS, 2, "", ""                      },

                // LMG SPAR-16(S)
                {"arifle_SPAR_02_blk_F",                 220000, -1, LEVEL_WEAPONS, 5, "", ""                    }, // SPAR-16S Black
                {"arifle_SPAR_02_khk_F",                 220000, -1, LEVEL_WEAPONS, 5, "", ""                    }, // SPAR-16S Khaki
                {"arifle_SPAR_02_snd_F",                 220000, -1, LEVEL_WEAPONS, 5, "", ""                    }, // SPAR-16S Sand

                // Drum Mags, SPAR-16S
                {"150Rnd_556x45_Drum_Mag_F",             10000, -1, LEVEL_WEAPONS, 5, "", ""                     }, // SPAR-16S Sand
                {"150Rnd_556x45_Drum_Mag_Tracer_F",      10000, -1, LEVEL_WEAPONS, 5, "", ""                     }, // SPAR-16S Sand

                // LIM-85
                {"LMG_03_F",                             350000, -1, LEVEL_WEAPONS, 6, "", ""                    }, // LIM-85 5.56
                {"200Rnd_556x45_Box_Red_F",              12500,   -1, LEVEL_WEAPONS, 6, "", ""                   }, // LIM-85 5.56
                {"200Rnd_556x45_Box_F",                  12500,   -1, LEVEL_WEAPONS, 6, "", ""                   }, // LIM-85 5.56
                {"200Rnd_556x45_Box_Tracer_Red_F",       12500,   -1, LEVEL_WEAPONS, 6, "", ""                   }, // LIM-85 5.56
                {"200Rnd_556x45_Box_Tracer_F",           12500,   -1, LEVEL_WEAPONS, 6, "", ""                   }, // LIM-85 5.56

                // 5.8
                {"arifle_CTAR_blk_F",                    95000, -1, LEVEL_WEAPONS, 2, "", ""                     }, // CAR-95
                {"arifle_CTAR_hex_F",                    95000, -1, LEVEL_WEAPONS, 2, "", ""                     }, // CAR-95
                {"arifle_CTAR_ghex_F",                   95000, -1, LEVEL_WEAPONS, 2, "", ""                     }, // CAR-95

                {"arifle_CTAR_GL_blk_F",                 105000, -1, LEVEL_WEAPONS, 3, "", ""                    }, // CAR-95 GL
                {"arifle_CTAR_GL_ghex_F",                105000, -1, LEVEL_WEAPONS, 3, "", ""                    }, // CAR-95 GL
                {"arifle_CTAR_GL_hex_F",                 105000, -1, LEVEL_WEAPONS, 3, "", ""                    }, // CAR-95 GL

                {"30Rnd_580x42_Mag_F",                   4000, -1, LEVEL_WEAPONS, 2, "", ""                      }, // 5.8mm 30rnd
                {"30Rnd_580x42_Mag_Tracer_F",            4000, -1, LEVEL_WEAPONS, 2, "", ""                      }, // 5.8mm 30rnd Tracer

                {"arifle_CTARS_blk_F",                   240000, -1, LEVEL_WEAPONS, 5, "", ""                    }, // CAR-95S (LMG)
                {"arifle_CTARS_ghex_F",                  240000, -1, LEVEL_WEAPONS, 5, "", ""                    }, // CAR-95S (LMG)
                {"arifle_CTARS_hex_F",                   240000, -1, LEVEL_WEAPONS, 5, "", ""                    }, // CAR-95S (LMG)

                {"100Rnd_580x42_Mag_F",                  12500, -1, LEVEL_WEAPONS, 6, "", ""                     }, // 5.8mm 100rnd
                {"100Rnd_580x42_Mag_Tracer_F",           12500, -1, LEVEL_WEAPONS, 6, "", ""                     }, // 5.8mm 100rnd Tracer

                // 6.5
                {"arifle_MXC_F",                         115000, -1, LEVEL_WEAPONS, 2, "", ""                    },
                {"arifle_MXC_Black_F",                   115000, -1, LEVEL_WEAPONS, 2, "", ""                    },
                {"arifle_MXC_khk_F",                     115000, -1, LEVEL_WEAPONS, 2, "", ""                    },

                {"arifle_MX_F",                          115000, -1, LEVEL_WEAPONS, 3, "", ""                    },
                {"arifle_MX_Black_F",                    115000, -1, LEVEL_WEAPONS, 3, "", ""                    },
                {"arifle_MX_khk_F",                      115000, -1, LEVEL_WEAPONS, 3, "", ""                    },

                {"arifle_MX_GL_F",                       140000, -1, LEVEL_WEAPONS, 4, "", ""                    },
                {"arifle_MX_GL_Black_F",                 140000, -1, LEVEL_WEAPONS, 4, "", ""                    },
                {"arifle_MX_GL_khk_F",                   140000, -1, LEVEL_WEAPONS, 4, "", ""                    },

                {"arifle_MXM_F",                         170000, -1, LEVEL_WEAPONS, 4, "", ""                    },
                {"arifle_MXM_Black_F",                   170000, -1, LEVEL_WEAPONS, 4, "", ""                    },
                {"arifle_MXM_khk_F",                     170000, -1, LEVEL_WEAPONS, 4, "", ""                    },

                {"30Rnd_65x39_caseless_mag",             5000,   -1, LEVEL_WEAPONS, 2, "", ""                    }, // MX Caseless Mag
                {"30Rnd_65x39_caseless_mag_Tracer",      6000,   -1, LEVEL_WEAPONS, 2, "", ""                    }, // MX Caseless Tracer Mag

                {"arifle_MX_SW_F",                       290000, -1, LEVEL_WEAPONS, 5, "", ""                    },
                {"arifle_MX_SW_Black_F",                 290000, -1, LEVEL_WEAPONS, 5, "", ""                    },
                {"arifle_MX_SW_khk_F",                   290000, -1, LEVEL_WEAPONS, 5, "", ""                    },

                // Katiba
                {"arifle_Katiba_C_F",                    120000, -1, LEVEL_WEAPONS, 3, "", ""                    }, // Katiba C
                {"arifle_Katiba_F",                      145000, -1, LEVEL_WEAPONS, 4, "", ""                    }, // Katiba Normal
                {"arifle_Katiba_GL_F",                   155000, -1, LEVEL_WEAPONS, 5, "", ""                    }, // Katiba GL

                // Type .115
                {"arifle_ARX_blk_F",                     230000, -1, LEVEL_WEAPONS, 6, "", ""                    }, // Type .115 Black
                {"10Rnd_50BW_Mag_F",                     120000,  -1, LEVEL_WEAPONS, 9, "", ""                   }, // .50 BW

                // CMR-76 6.5
                {"srifle_DMR_07_blk_F",                  170000, -1, LEVEL_WEAPONS, 4, "", ""                    }, // CMR-76
                {"srifle_DMR_07_ghex_F",                 170000, -1, LEVEL_WEAPONS, 4, "", ""                    }, // CMR-76
                {"srifle_DMR_07_hex_F",                  170000, -1, LEVEL_WEAPONS, 4, "", ""                    }, // CMR-76

                {"muzzle_snds_H",                        70000,  -1, LEVEL_WEAPONS, 5, "", ""                    }, // 6.5 Suppressor
                {"muzzle_snds_65_TI_blk_F",              80000,  -1, LEVEL_WEAPONS, 6, "", ""                    }, // 6.5 Stealth Suppressor

                // 6.5 LMG Suppressors
                {"muzzle_snds_H_MG_blk_F",               75000,  -1, LEVEL_WEAPONS, 6, "", ""                    }, // 6.5 Suppressor
                {"muzzle_snds_H_MG",                     75000,  -1, LEVEL_WEAPONS, 6, "", ""                    }, // 6.5 Suppressor
                {"muzzle_snds_H_MG_khk_F",               75000,  -1, LEVEL_WEAPONS, 6, "", ""                    }, // 6.5 Suppressor

                // MK200 6.5
                {"LMG_Mk200_F",                          440000, -1, LEVEL_WEAPONS, 8, "", ""                    }, // MK200 6.5mm
                {"200Rnd_65x39_cased_Box",               17500,  -1, LEVEL_WEAPONS, 8, "", ""                    }, // MK200 6.5mm
                {"200Rnd_65x39_Belt",                    17500,  -1, LEVEL_WEAPONS, 8, "", ""                    }, // MK200 6.5mm
                {"200Rnd_65x39_Belt_Tracer_Green",       17500,  -1, LEVEL_WEAPONS, 8, "", ""                    }, // MK200 6.5mm
                {"200Rnd_65x39_Belt_Tracer_Red",         17500,  -1, LEVEL_WEAPONS, 8, "", ""                    }, // MK200 6.5mm
                {"200Rnd_65x39_Belt_Tracer_Yellow",      17500,  -1, LEVEL_WEAPONS, 8, "", ""                    }, // MK200 6.5mm
                {"200Rnd_65x39_cased_Box_Tracer",        17500,  -1, LEVEL_WEAPONS, 8, "", ""                    }, // MK200 6.5mm

                // 7.62
                {"srifle_DMR_01_F",                      180000, -1, LEVEL_WEAPONS, 4, "", ""                    }, // Rahim

                {"arifle_AKM_F",                         200000, -1, LEVEL_WEAPONS, 5, "", ""                    }, // AKM
                {"arifle_AKM_FL_F",                      200000, -1, LEVEL_WEAPONS, 5, "", ""                    }, // AKM

                {"srifle_DMR_06_olive_F",                260000, -1, LEVEL_WEAPONS, 6, "", ""                    }, // MK14
                {"srifle_DMR_06_camo_F",                 260000, -1, LEVEL_WEAPONS, 6, "", ""                    }, // MK14

                {"arifle_SPAR_03_blk_F",                 315000, -1, LEVEL_WEAPONS, 7, "", ""                    }, // SPAR-17
                {"arifle_SPAR_03_khk_F",                 315000, -1, LEVEL_WEAPONS, 7, "", ""                    }, // SPAR-17
                {"arifle_SPAR_03_snd_F",                 315000, -1, LEVEL_WEAPONS, 7, "", ""                    }, // SPAR-17

                {"srifle_EBR_F",                         370000, -1, LEVEL_WEAPONS, 8, "", ""                    }, // MK18 ABR

                {"srifle_DMR_03_F",                      400000, -1, LEVEL_WEAPONS, 8, "", ""                    }, // MK-1 Black
                {"srifle_DMR_03_khaki_F",                400000, -1, LEVEL_WEAPONS, 8, "", ""                    }, // MK-1 Khaki
                {"srifle_DMR_03_multicam_F",             400000, -1, LEVEL_WEAPONS, 8, "", ""                    }, // MK-1 Multicamo
                {"srifle_DMR_03_woodland_F",             400000, -1, LEVEL_WEAPONS, 8, "", ""                    }, // MK-1 Woodland
                {"srifle_DMR_03_tan_F",                  400000, -1, LEVEL_WEAPONS, 8, "", ""                    }, // MK-1 Sand

                // 7.62 suppressors
                {"muzzle_snds_B",                        100000, -1, LEVEL_WEAPONS, 9, "", ""                    },
                {"muzzle_snds_B_khk_F",                  100000, -1, LEVEL_WEAPONS, 9, "", ""                    },
                {"muzzle_snds_B_snd_F",                  100000, -1, LEVEL_WEAPONS, 9, "", ""                    },

                {"20Rnd_762x51_Mag",                     15000, -1, LEVEL_WEAPONS, 6, "", ""                     }, // 7.62 20rnd Mag
                {"30Rnd_762x39_Mag_F",                   16000, -1, LEVEL_WEAPONS, 6, "", ""                     }, // 7.62 30rnd Mag
                {"30Rnd_762x39_Mag_Green_F",             16000, -1, LEVEL_WEAPONS, 6, "", ""                     }, // 7.62 30rnd Mag Tracer
                {"30Rnd_762x39_Mag_Tracer_Green_F",      16000, -1, LEVEL_WEAPONS, 6, "", ""                     }, // 7.62 30rnd Mag Tracer
                {"30Rnd_762x39_Mag_Tracer_F",            16000, -1, LEVEL_WEAPONS, 6, "", ""                     }, // 7.62 30rnd Mag Tracer

                {"LMG_Zafir_F",                          1000000, -1, LEVEL_WEAPONS, 10, "", ""                  }, // Zafir

                {"150Rnd_762x51_Box",                    45000, -1, LEVEL_WEAPONS, 10, "", ""                    }, // 7.62 150rnd Mag
                {"150Rnd_762x54_Box",                    45000, -1, LEVEL_WEAPONS, 10, "", ""                    }, // 7.62 150rnd Mag
                {"150Rnd_762x51_Box_Tracer",             50000, -1, LEVEL_WEAPONS, 10, "", ""                    }, // 7.62 150rnd Mag Tracer
                {"150Rnd_762x54_Box_Tracer",             50000, -1, LEVEL_WEAPONS, 10, "", ""                    }, // 7.62 150rnd Mag Tracer

                // .338
                {"srifle_DMR_02_F",                      1500000, -1, LEVEL_WEAPONS, 10, "", ""                  }, // MAR-10
                {"srifle_DMR_02_camo_F",                 1500000, -1, LEVEL_WEAPONS, 10, "", ""                  }, // MAR-10
                {"srifle_DMR_02_sniper_F",               1500000, -1, LEVEL_WEAPONS, 10, "", ""                  }, // MAR-10

                // 9.3
                {"srifle_DMR_05_blk_F",                  1750000, -1, LEVEL_WEAPONS, 11, "", ""                  }, // Cyrus 9.3
                {"srifle_DMR_05_hex_F",                  1750000, -1, LEVEL_WEAPONS, 11, "", ""                  }, // Cyrus 9.3
                {"srifle_DMR_05_tan_f",                  1750000, -1, LEVEL_WEAPONS, 11, "", ""                  }  // Cyrus 9.3
            };
        };
        class LegalGunStore {
            displayName = "Legal Gun Store";
            condition   = "['CivilianGunLicense'] call GW_client_fnc_licensingHasLicense";
            equipment[] = {
                {"ItemRadio",                            150, -1, LEVEL_WEAPONS, 0, "", ""                       },
                {"ItemGPS",                              500, -1, LEVEL_WEAPONS, 0, "", ""                       },
                {"ItemMap",                              150, -1, LEVEL_WEAPONS, 0, "", ""                       },
                {"ItemCompass",                          150, -1, LEVEL_WEAPONS, 0, "", ""                       },
                {"ItemWatch",                            150, -1, LEVEL_WEAPONS, 0, "", ""                       },
                {"FirstAidKit",                          2000, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"ToolKit",                              5000, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"Rangefinder",                          7500, -1, LEVEL_WEAPONS, 2, "", ""                      },
                {"Binocular",                            2500, -1, LEVEL_WEAPONS, 1, "", ""                      },
                {"NVGoggles",                            5000, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"NVGoggles_OPFOR",                      5000, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"NVGoggles_INDEP",                      5000, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"NVGoggles_tna_F",                      5000, -1, LEVEL_WEAPONS, 0. "", ""                      },

                // Attachments
                {"acc_pointer_IR",                       1000, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"acc_flashlight",                       1000, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"acc_flashlight_pistol",                1000, -1, LEVEL_WEAPONS, 0, "", ""                      },

                //{"optic_Yorris",                         1500, -1, LEVEL_WEAPONS, -1, "", ""                   },
                //{"optic_MRD",                            1500, -1, LEVEL_WEAPONS, -1, "", ""                   },
                {"optic_Aco",                            2500, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"optic_ACO_grn",                        2500, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"optic_ACO_grn_smg",                    2500, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"optic_Aco_smg",                        2500, -1, LEVEL_WEAPONS, 0, "", ""                      },

                {"optic_Holosight",                      15000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"optic_Holosight_blk_F",                15000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"optic_Holosight_khk_F",                15000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"optic_Holosight_smg",                  15000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"optic_Holosight_smg_blk_F",            15000, -1, LEVEL_WEAPONS, 0, "", ""                     },

                // 9mm Handguns
                {"hgun_Pistol_01_F",                     10000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"hgun_Rook40_F",                        15000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"hgun_P07_F",                           13000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"hgun_P07_khk_F",                       13000, -1, LEVEL_WEAPONS, 0, "", ""                     },
                {"muzzle_snds_L",                        15000, -1,  LEVEL_WEAPONS, 0, "", ""                    },
                {"16Rnd_9x21_Mag",                       1200, -1,  LEVEL_WEAPONS, 0, "", ""                     },
                {"16Rnd_9x21_red_Mag",                   1200, -1,  LEVEL_WEAPONS, 0, "", ""                     },
                {"16Rnd_9x21_green_Mag",                 1200, -1,  LEVEL_WEAPONS, 0, "", ""                     },
                {"16Rnd_9x21_yellow_Mag",                1200, -1,  LEVEL_WEAPONS, 0, "", ""                     },
                {"30Rnd_9x21_Mag",                       1200, -1,  LEVEL_WEAPONS, 0, "", ""                     },
                {"30Rnd_9x21_Red_Mag",                   1200, -1,  LEVEL_WEAPONS, 0, "", ""                     },
                {"30Rnd_9x21_Yellow_Mag",                1200, -1,  LEVEL_WEAPONS, 0, "", ""                     },
                {"30Rnd_9x21_Green_Mag",                 1200, -1,  LEVEL_WEAPONS, 0, "", ""                     },

                // .45 ACP
                {"hgun_Pistol_heavy_02_F",               17500, -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"hgun_ACPC2_F",                         22500, -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"hgun_Pistol_heavy_01_F",               25000, -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"9Rnd_45ACP_Mag",                       1000,  -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"muzzle_snds_acp",                      20000, -1, LEVEL_WEAPONS, 1, "", ""                     },

                {"hgun_PDW2000_F",                       30000, -1, LEVEL_WEAPONS, 1, "", ""                     }, // PDW
                {"SMG_05_F",                             38000, -1, LEVEL_WEAPONS, 1, "", ""                     }, // Protector
                {"SMG_02_F",                             38000, -1, LEVEL_WEAPONS, 1, "", "",                    }, // Sting
                {"30Rnd_9x21_Mag_SMG_02",                1500,  -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"30Rnd_9x21_Mag_SMG_02_Tracer_Red",     1550,  -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",  1550,  -1, LEVEL_WEAPONS, 1, "", ""                     },
                {"30Rnd_9x21_Mag_SMG_02_Tracer_Green",   1550,  -1, LEVEL_WEAPONS, 1, "", ""                     },

                {"SMG_01_F",                             48000, -1, LEVEL_WEAPONS, 2, "", ""                     }, // Vermin .45 ACP
                {"30Rnd_45ACP_Mag_SMG_01",               2500,  -1, LEVEL_WEAPONS, 2, "", ""                     },
                {"30Rnd_45ACP_Mag_SMG_01_tracer_green",  2500,  -1, LEVEL_WEAPONS, 2, "", ""                     },
                {"30Rnd_45ACP_Mag_SMG_01_Tracer_Red",    2500,  -1, LEVEL_WEAPONS, 2, "", ""                     },
                {"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow", 2500,  -1, LEVEL_WEAPONS, 2, "", ""                     }
            };
        };
        class GeneralStore {
            displayName = "General Store";
            condition   = "playerSide isEqualTo civilian";
            equipment[] = {
                {"ItemRadio",                            150, -1, LEVEL_WEAPONS,  0, "", ""                      },
                {"ItemGPS",                              500, -1, LEVEL_WEAPONS,  0, "", ""                      },
                {"ItemMap",                              150, -1, LEVEL_WEAPONS,  0, "", ""                      },
                {"ItemCompass",                          150, -1, LEVEL_WEAPONS,  0, "", ""                      },
                {"ItemWatch",                            150, -1, LEVEL_WEAPONS,  0, "", ""                      },
                {"FirstAidKit",                          2000, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"ToolKit",                              5000, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"Rangefinder",                          7500, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"Binocular",                            2500, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"NVGoggles",                            5000, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"NVGoggles_OPFOR",                      5000, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"NVGoggles_INDEP",                      5000, -1, LEVEL_WEAPONS, 0, "", ""                      },
                {"NVGoggles_tna_F",                      5000, -1, LEVEL_WEAPONS, 0, "", ""                      }
            };
        };
        class IHAS {
            displayName = "IHAS Equipment";
            condition   = "playerSide isEqualTo independent";
            equipment[] = {
                {"ItemRadio",                            0, -1, LEVEL_WEAPONS,  0, "", ""                       },
                {"ItemGPS",                              0, -1, LEVEL_WEAPONS,  0, "", ""                       },
                {"ItemMap",                              0, -1, LEVEL_WEAPONS,  0, "", ""                       },
                {"ItemCompass",                          0, -1, LEVEL_WEAPONS,  0, "", ""                       },
                {"ItemWatch",                            0, -1, LEVEL_WEAPONS,  0, "", ""                       },
                {"FirstAidKit",                          0, -1, LEVEL_WEAPONS,  0, "", ""                       },
                {"ToolKit",                              0, -1, LEVEL_WEAPONS,  0, "", ""                       },
                {"Rangefinder",                          0, -1, LEVEL_WEAPONS,  0, "", ""                       },
                {"Binocular",                            0, -1, LEVEL_WEAPONS,  0, "", ""                       },
                {"NVGoggles",                            0, -1, LEVEL_WEAPONS,  0, "", ""                       },
                {"NVGoggles_OPFOR",                      0, -1, LEVEL_WEAPONS,  0, "", ""                       },
                {"NVGoggles_INDEP",                      0, -1, LEVEL_WEAPONS,  0, "", ""                       },
                {"NVGoggles_tna_F",                      0, -1, LEVEL_WEAPONS,  0, "", ""                       }
            };
        };
    };
};
