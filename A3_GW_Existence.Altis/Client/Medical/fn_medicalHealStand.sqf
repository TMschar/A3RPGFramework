#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_medicalHealStand.sqf
*
*    Parameter(s):
*        0: OBJECT
*
*    Returns:
*        NOTHING
*
*    Description:
*        Function to fully heal to a 100%
*/
scriptName "GW_client_fnc_medicalHealStand: main";
scopeName "main";

if (GW_medicalHealStand_Cooldown - time > 0) exitWith {};
if (damage player < 0.01) exitWith {};

if !(isNil "GW_medicalHealStand_healHandle") then {terminate GW_medicalHealStand_healHandle};
GW_medicalHealStand_healHandle = [_fnc_scriptName] spawn {
    private _fnc_terminate = {
        terminate GW_medicalHealStand_healHandle;
        GW_medicalHealStand_healHandle = nil
    };

    private _healPrice = 2000;
    if (CASH < _healPrice) exitWith {
        [HINT_AMBER, "Insufficient Money", format ["You do not carry £%, which is required in order to heal yourself.", _healPrice]] call GW_client_fnc_notificationsAdd;
    };

    if (["Are you sure you want to heal?",
        "Healing will cost £" + str _healPrice,
        "HEAL",
        "DO NOT HEAL",
        findDisplay 46
    ] call GW_client_fnc_guiPrompt) then {
        if (["HealStand"] call GW_client_fnc_startProgress) then {
            player setDamage 0;
            GW_medicalHealStand_Cooldown = time + (60 * 5);

            // Take payment
            [0, _healPrice, 1] call GW_client_fnc_playersHandleMoney;

            [LEVEL_MEDICAL, 20, "Fully healed"] call GW_client_fnc_experienceCategoryAddExperience;
            [LOG_INFO, "Healed", _this param [0, "", [""]]] call GW_server_fnc_log
        };

        call _fnc_terminate
    } else {
        call _fnc_terminate
    }
};
