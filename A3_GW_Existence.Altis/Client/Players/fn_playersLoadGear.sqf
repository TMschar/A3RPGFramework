#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_playersLoadGear.sqf
 *
 * Description:
 *     Loads player with gear for the rank and playerside he/she is
 */
scriptName "GW_client_fnc_playersLoadGear: main";
scopeName "main";

// Remove any previous default gear
[player] call GW_client_fnc_stripDownUnit;

// Add gear depending on player side
private _goggles = selectRandom ["G_Tactical_Clear", "G_Tactical_Black"];
switch playerSide do {
    case west: {
        player forceAddUniform "U_B_CombatUniform_mcam";
        player addVest "V_PlateCarrierL_CTRG";
        player addHeadgear "H_Beret_02";
        player addGoggles _goggles;
        player addBackpack "B_AssaultPack_grn";

        player addItem "ItemMap";
        player assignItem "ItemMap";
        player addItem "ItemCompass";
        player assignItem "ItemCompass";
        player addItem "ItemWatch";
        player assignItem "ItemWatch";
        player addItem "ItemRadio";
        player assignItem "ItemRadio";
        player addItem "ItemGPS";
        player assignItem "ItemGPS";
        player addItem "LaserDesignator";
        player linkItem "LaserDesignator";

        player addWeapon "hgun_Pistol_heavy_01_MRD_F";
        player addSecondaryWeaponItem "acc_flashlight_pistol";
        player addMagazine ["11Rnd_45ACP_Mag", 3]
    };
    case independent: {
        player forceAddUniform "U_C_Paramedic_01_F";
        player addHeadgear "H_Cap_blu";
        player addGoggles _goggles;
        player addBackpack "B_Messenger_Black_F";

        player addItem "ItemMap";
        player assignItem "ItemMap";
        player addItem "ItemCompass";
        player assignItem "ItemCompass";
        player addItem "ItemWatch";
        player assignItem "ItemWatch";
        player addItem "ItemRadio";
        player assignItem "ItemRadio";
        player addItem "ItemGPS";
        player assignItem "ItemGPS";
        player addItem "Rangefinder";
        player linkItem "Rangefinder";
    };
    case east: {};
    case civilian: {
        private _uniforms = [
            "U_NikosBody",
            "U_C_Poloshirt_blue",
            "U_C_Poloshirt_burgundy",
            "U_Competitor"
        ];
        private _apexUniforms = [
            "U_C_man_sport_1_F",
            "U_C_man_sport_3_F",
            "U_C_man_sport_2_F",
            "U_C_Man_casual_6_F",
            "U_C_Man_casual_4_F",
            "U_C_Man_casual_5_F",
            "U_C_Man_casual_1_F",
            "U_C_Man_casual_3_F",
            "U_C_Man_casual_2_F",
            "U_I_C_Soldier_Bandit_1_F"
        ];

        // Check for Apex DLC ownership
        if (395180 in (getDLCs 1)) then {
            {
                _uniforms pushback _x;
                true
            } count _apexUniforms
        };

        player forceAddUniform (selectRandom _uniforms);
        player addHeadgear (selectRandom [
            "H_StrawHat",
            "H_StrawHat_dark",
            "H_Hat_blue",
            "H_Hat_brown",
            "H_Hat_grey",
            "H_Hat_checker",
            "H_Hat_tan",
            "H_Helmet_Skate"
        ]);
        player addBackpack (selectRandom [
            "B_AssaultPack_khk",
            "B_AssaultPack_dgtl",
            "B_AssaultPack_rgr",
            "B_AssaultPack_sgg",
            "B_AssaultPack_cbr",
            "B_AssaultPack_blk",
            "B_AssaultPack_cbr"
        ]);

        player addItem "ItemMap";
        player assignItem "ItemMap";
        player addItem "ItemCompass";
        player assignItem "ItemCompass";
        player addItem "ItemWatch";
        player assignItem "ItemWatch";
        player addItem "ItemRadio";
        player assignItem "ItemRadio"
    }
};

[player] call GW_client_fnc_unitSetTextures;
[LOG_INFO, "Loaded default gear", _fnc_scriptName] call GW_server_fnc_log
