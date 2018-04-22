#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor & Fallen, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_survivalHandleHandicaps.sqf
 */
#define SETTINGS_CONFIGCLASS (missionConfigFile >> "CfgGroundWars" >> "GameProperties")

scriptName "GW_client_fnc_survivalHandleHandicaps: main";
scopeName "main";

params [["_reset", false, [true]]];
private _threadHandle = missionNamespace getVariable ["GW_handicap_threadHandle", scriptNull];
if (_reset) then {
    // Disable fatigue and stamina
    player enableStamina (getNumber (SETTINGS_CONFIGCLASS >> "enableStamina") isEqualTo 1);
    player enableFatigue (getNumber (SETTINGS_CONFIGCLASS >> "enableFatigue") isEqualTo 1);
    player setFatigue 0;

    // Set default coefficeints
    player setCustomAimCoef (getNumber (SETTINGS_CONFIGCLASS >> "customSwayCoef"));
    player setUnitRecoilCoefficient (getNumber (SETTINGS_CONFIGCLASS >> "unitRecoilCoefficient"));
    player setAnimSpeedCoef (getNumber (SETTINGS_CONFIGCLASS >> "animSpeedCoef"));

    // Destroy ppEffects
    GW_survival_handicapEffect1 ppEffectEnable false;
    GW_survival_handicapEffect2 ppEffectEnable false;
    ppEffectDestroy [GW_survival_handicapEffect1, GW_survival_handicapEffect2];

    // Destroys cam shake
    terminate _threadHandle;

    // Notify
    [HINT_NORMAL, "Survival Notice", "You are no longer starving or dehydrated."] call GW_client_fnc_notificationsAdd;
} else {
    GW_handicap_threadHandle = [] spawn {
        // Blurry Screen
        GW_survival_handicapEffect1 = ppEffectCreate ["colorCorrections", 1500];
        GW_survival_handicapEffect2 = ppEffectCreate ["ChromAberration", 200];
        GW_survival_handicapEffect1 ppEffectEnable true;
        GW_survival_handicapEffect2 ppEffectEnable true;
        GW_survival_handicapEffect1 ppEffectAdjust [0.9, 1, 0, [0.4, 0.4, 0.4, 0.5], [0.6, 0.6, 0.6, 0.3], [0.4, 0.4, 0.4, 0.5]];
        GW_survival_handicapEffect2 ppEffectAdjust [0.05, 0.05, true];
        GW_survival_handicapEffect1 ppEffectCommit 3;
        GW_survival_handicapEffect2 ppEffectCommit 3;

        // Set coefficients
        player setAnimSpeedCoef 0.8;
        player setUnitRecoilCoefficient 1.8;
        player setCustomAimCoef 1.8;

        // Enable stamina and set max fatigue
        player enableStamina true;
        player enableFatigue true;
        player setFatigue 1;

        // Notify
        [HINT_WARNING, "Survival Notice", "You are either dehydrated or starving. Go find some food quick!"] call GW_client_fnc_notificationsAdd;

        // Cam shake (infinite loop)
        for "_i" from 0 to 1 step 0 do {
            addCamShake [6, 4, 6];
            uiSleep 3;
        };
    };
};
