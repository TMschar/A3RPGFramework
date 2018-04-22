#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_vehicleHasKeys.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit to check
 *     1: OBJECT - Object which keys work for
 *
 * Returns:
 *     BOOLEAN
 */
scriptName "GW_client_fnc_vehicleGetTexturePaths: main";
scopeName "main";

if !(params [["_unit", objNull, [objNull]], ["_vehicle", objNull, [objNull]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
    false;
};

// Get owner of vehicle
private _dbInfo = _vehicle getVariable ["db_insert", []];
private _ownerUID = _dbInfo param [0, "", [""]];

// Return
_vehicle in (_unit getVariable ["keys", []])
|| {getPlayerUID player == _ownerUID};