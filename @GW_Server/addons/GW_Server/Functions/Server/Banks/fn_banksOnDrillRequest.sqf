#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_banksOnDrillRequest.sqf
 *
 * Parameter(s):
 *     0: STRING - Variable Name
 *     1: ARRAY  - Array with arguments from public variable
 */
scriptName "GW_server_fnc_banksOnDrillRequest: main";
scopeName "main";

if !(params [
    ["_variableName", "", [""]],
    ["_args", [], [[]]]
]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

if !(_args params [
    ["_unit", objNull, [objNull]],
    ["_building", objNull, [objNull]],
    ["_door", 0, [0]]]
) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Debug log entry
["PVAR Eventhandler called", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;

// Error checks
if (_door isEqualTo 0) exitWith {};
if (isNull _building) exitWith {};
if (isNull _unit) exitWith {};

private _beingDrilled = _building getVariable ["drilling", false];
if (!_beingDrilled) then {
    // Start drilling on clients / units machine
    [_building, _door] remoteExec ["GW_client_fnc_banksDrill", _unit];

    // Call breach function to handle it
    [_building] call GW_server_fnc_banksOnBreach;
} else {
    [HINT_AMBER, "Drilling Failed", "Either this or another vault inside the bank is already being drilled into"] remoteExecCall ["GW_client_fnc_notificationsAdd", _unit];
};