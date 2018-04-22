#include "script_component.hpp"
/**
 *  Copyright (c) 2017 SimZor, SimZor Studios
 *   All Rights Reserved
 *
 * Filename: fn_initSetPlayerSettings.sqf
 *
 * Description:
 *     Sets up player with specific settings
 */
#define SETTINGS_CONFIGCLASS (missionConfigFile >> "CfgGroundWars" >> "GameProperties")

scriptName "GW_client_fnc_initSetPlayerSettings: main";
scopeName "main";

// Enable/Disable Stamina
player enableStamina (getNumber (SETTINGS_CONFIGCLASS >> "enableStamina") isEqualTo 1);
player enableFatigue (getNumber (SETTINGS_CONFIGCLASS >> "enableFatigue") isEqualTo 1);

// Override Sway
player setCustomAimCoef (getNumber (SETTINGS_CONFIGCLASS >> "customSwayCoef"));
player setUnitRecoilCoefficient (getNumber (SETTINGS_CONFIGCLASS >> "unitRecoilCoefficient"));
player setAnimSpeedCoef (getNumber (SETTINGS_CONFIGCLASS >> "animSpeedCoef"));

// Set View Distance
setViewDistance (profileNamespace getVariable ["GW_viewDistance", 500]);
setObjectViewDistance (profileNamespace getVariable ["GW_objectRenderDistance", 500]);

// Set HUD settings
showHUD [
    true,
    true,
    true,
    true,
    false,
    false,
    false,
    true,
    true
];
