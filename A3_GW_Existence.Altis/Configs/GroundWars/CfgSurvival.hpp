/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: CfgSurvival.hpp
 */

class CfgSurvival
{
    defaultVirtualInventory = 5;
    class Backpacks
    {
        class Altis
        {
            class C_UAV_06_medical_backpack_F
            {
                virtualInventorySpace = 90;
            };

            class B_LegStrapBag_Black_F
            {
                virtualInventorySpace = 5;
            };
            class B_LegStrapBag_coyote_F: B_LegStrapBag_Black_F {};
            class B_LegStrapBag_olive_F:  B_LegStrapBag_Black_F {};

            class B_Messenger_Black_F
            {
                virtualInventorySpace = 10;
            };
            class B_Messenger_Coyote_F: B_Messenger_Black_F {};
            class B_Messenger_Gray_F:   B_Messenger_Black_F {};
            class B_Messenger_Oilve_F:  B_Messenger_Black_F {};
            class B_Messenger_IDAP_F:   B_Messenger_Black_F {};

            class B_AssaultPack_blk
            {
                virtualInventorySpace = 20;
            };
            class B_AssaultPack_cbr  : B_AssaultPack_blk {};
            class B_AssaultPack_dgtl : B_AssaultPack_blk {};
            class B_AssaultPack_rgr  : B_AssaultPack_blk {};
            class B_AssaultPack_ocamo: B_AssaultPack_blk {};
            class B_AssaultPack_khk  : B_AssaultPack_blk {};
            class B_AssaultPack_mcamo: B_AssaultPack_blk {};
            class B_AssaultPack_sgg  : B_AssaultPack_blk {};
            class B_AssaultPack_tna_F: B_AssaultPack_blk {};

            class B_FieldPack_blk
            {
                virtualInventorySpace = 30;
            };
            class B_FieldPack_cbr    : B_FieldPack_blk {};
            class B_FieldPack_ghex_F : B_FieldPack_blk {};
            class B_FieldPack_ocamo  : B_FieldPack_blk {};
            class B_FieldPack_khk    : B_FieldPack_blk {};
            class B_FieldPack_oli    : B_FieldPack_blk {};
            class B_FieldPack_oucamo : B_FieldPack_blk {};

            class B_TacticalPack_blk
            {
                virtualInventorySpace = 40;
            };
            class B_TacticalPack_rgr   : B_TacticalPack_blk {};
            class B_TacticalPack_ocamo : B_TacticalPack_blk {};
            class B_TacticalPack_mcamo : B_TacticalPack_blk {};
            class B_TacticalPack_oli   : B_TacticalPack_blk {};

            class B_ViperLightHarness_blk_F
            {
                virtualInventorySpace = 40;
            };
            class B_ViperLightHarness_ghex_F  : B_ViperLightHarness_blk_F {};
            class B_ViperLightHarness_ocamo_F : B_ViperLightHarness_blk_F {};
            class B_ViperLightHarness_khk_F   : B_ViperLightHarness_blk_F {};
            class B_ViperLightHarness_oli_F   : B_ViperLightHarness_blk_F {};

            class B_Kitbag_cbr
            {
                virtualInventorySpace = 50;
            };
            class B_Kitbag_rgr   : B_Kitbag_cbr {};
            class B_Kitbag_mcamo : B_Kitbag_cbr {};
            class B_Kitbag_sgg   : B_Kitbag_cbr {};

            class B_ViperHarness_blk_F
            {
                virtualInventorySpace = 50;
            };
            class B_ViperHarness_ocamo_F : B_ViperHarness_blk_F {};
            class B_ViperHarness_khk_F   : B_ViperHarness_blk_F {};
            class B_ViperHarness_oli_F   : B_ViperHarness_blk_F {};

            class B_Carryall_cbr
            {
                virtualInventorySpace = 70;
            };
            class B_Carryall_ghex_f : B_Carryall_cbr {};
            class B_Carryall_ocamo  : B_Carryall_cbr {};
            class B_Carryall_khk    : B_Carryall_cbr {};
            class B_Carryall_mcamo  : B_Carryall_cbr {};
            class B_Carryall_oli    : B_Carryall_cbr {};
            class B_Carryall_oucamo : B_Carryall_cbr {};

            class B_Bergen_dgtl_F
            {
                virtualInventorySpace = 90;
            };
            class B_Bergen_ocamo_F : B_Bergen_dgtl_F {};
            class B_Bergen_mcamo_F : B_Bergen_dgtl_F {};
            class B_Bergen_tna_F   : B_Bergen_dgtl_F {};
        };
        class Malden
        {
            class B_OutdoorPack_blk
            {
                virtualInventorySpace = 35;
            };

            class B_AssaultPack_khk
            {
                virtualInventorySpace = 40;
            };

            class B_AssaultPack_dgtl:   B_AssaultPack_khk {};
            class B_AssaultPack_rgr:    B_AssaultPack_khk {};
            class B_AssaultPack_sgg:    B_AssaultPack_khk {};
            class B_AssaultPack_blk:    B_AssaultPack_khk {};
            class B_AssaultPack_cbr:    B_AssaultPack_khk {};
            class B_AssaultPack_mcamo:  B_AssaultPack_khk {};

            class B_TacticalPack_oli
            {
                virtualInventorySpace = 45;
            };

            class B_Kitbag_mcamo
            {
                virtualInventorySpace = 65;
            };
            class B_Kitbag_sgg: B_Kitbag_mcamo {};
            class B_Kitbag_cbr: B_Kitbag_mcamo {};

            class B_FieldPack_blk
            {
                virtualInventorySpace = 55;
            };
            class B_FieldPack_ocamo:  B_FieldPack_blk {};
            class B_FieldPack_oucamo: B_FieldPack_blk {};

            class B_Bergen_sgg
            {
                virtualInventorySpace = 65;
            };
            class B_Bergen_hex_F: B_Bergen_sgg {};
            class B_Bergen_mcamo: B_Bergen_sgg {};
            class B_Bergen_rgr:   B_Bergen_sgg {};
            class B_Bergen_blk:   B_Bergen_sgg {};

            class B_ViperHarness_khk_F
            {
                virtualInventorySpace = 75;
            };
            class B_ViperLightHarness_blk_F:  B_ViperHarness_khk_F {};
            class B_ViperHarness_blk_F:       B_ViperHarness_khk_F {};
            class B_ViperHarness_ghex_F:      B_ViperHarness_khk_F {};
            class B_ViperHarness_hex_F:       B_ViperHarness_khk_F {};
            class B_ViperHarness_oli_F:       B_ViperHarness_khk_F {};

            class B_Carryall_ocamo
            {
                virtualInventorySpace = 75;
            };
            class B_Carryall_oucamo:  B_Carryall_ocamo {};
            class B_Carryall_mcamo:   B_Carryall_ocamo {};
            class B_Carryall_oli:     B_Carryall_ocamo {};
            class B_Carryall_khk:     B_Carryall_ocamo {};
            class B_Carryall_cbr:     B_Carryall_ocamo {};

            class B_Bergen_tna_F
            {
                virtualInventorySpace = 90;
            };
            class B_Bergen_mcamo_F:  B_Bergen_tna_F {};
        };
    };
};
