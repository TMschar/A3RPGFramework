#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_vehicleGiveKeys.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit to give keys to
 *     1: OBJECT - Vehicle to give keys of
 */
scriptName "GW_client_fnc_vehicleGiveKeys: main";
scopeName "main";

if !(params [["_unit", objNull, [objNull]], ["_vehicle", objNull, [objNull]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
    false;
};

private _keys = _unit call GW_client_fnc_vehicleGetUnitVehicles;
private _vehicleRegistration = _vehicle getVariable ["vehicle_registration", []];

// Error checks
if (_vehicle in _keys) exitWith { false; };
if (_unit in _vehicleRegistration) exitWith { false; };

// Push into arrays
_keys pushbackUnique _vehicle;
_vehicleRegistration pushbackUnique [_unit, 1];

// Broadcast
_unit setVariable ["keys", _keys, true];
_vehicle setVariable ["vehicle_registration", _vehicleRegistration, true];

// Log
[LOG_INFO, format ["Gave %1:%2 keys to a vehicle (%2)", name _unit, getPlayerUID _unit, _vehicle], _fnc_scriptName] call GW_server_fnc_log;

// Return true for success
true;