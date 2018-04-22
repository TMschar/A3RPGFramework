#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_moneyRobberyRobbed.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit that carried out robbery
 */
scriptName "GW_client_fnc_moneyRobberyRobbed: main";
scopeName "main";

if (!params [ ["_unit", objNull, [objNull]] ]) throw "Expected unit as parameter";
if (isNull _unit) exitWith { ["Robber is NULL", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Send back to robber
[CASH, player] remoteExecCall ["GW_client_fnc_moneyRobberyReceive", _unit];

// Notify
[
    HINT_WARNING,
    "Robbery Notice",
    format
    [
        "You have been robbed. The robber got away with %1. A warrant for his arrest has been issued.",
        [CASH] call GW_client_fnc_currencyFormat
    ]
] call GW_client_fnc_notificationsAdd;

// Add robbery log
[LOG_INFO, format ["Was robbed by %1:%2", name _unit, getPlayerUID _unit], _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];