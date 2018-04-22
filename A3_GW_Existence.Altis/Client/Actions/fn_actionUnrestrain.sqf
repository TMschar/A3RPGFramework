
#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_actionUnrestrain.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit to unrestrain
 *
 * Description:
 *     Unrestrains a unit
 */
scriptName "GW_client_fnc_actionUnrestrain: main";
scopeName "main";

if (!params [["_unit", objNull, [objNull]]]) exitWith {["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

// Stop escorting if unit is being escorted
if (_unit getVariable ["escorting", false]) then {
    [_unit] call GW_client_fnc_actionEscortRelease;
};

// Unrestrain
_unit setVariable ["restrained", false, true];

// Play handcuff remove sound
[_unit, "HandcuffsRemove"] remoteExecCall ["GW_client_fnc_say3D", -2];

// Log
[LOG_INFO, format [
    "Unrestrained %1:%2",
    name _unit,
    getPlayerUID _unit
], _fnc_scriptName] call GW_server_fnc_log;

// Show message
[
    HINT_NORMAL,
    "You have been unrestrained",
    "You have been unrestrained. If this was malicious, please report it to police!"
] remoteExecCall ["GW_client_fnc_notificationsAdd", _unit];