#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleRevokeKeys.sqf
*
*    Parameter(s):
*        0: OBJECT - Unit to revoke the keys from
*        1: OBJECT - Vehicle to revoke keys to
*
*    Returns:
*        BOOLEAN
*
*    Description:
*        Revoke keys for a unit. Returns true if successfull, if not; it returns false.
*/
scriptName "GW_client_fnc_vehicleRevokeKeys: main";
scopeName "main";

if !params [
    ["_unit", objNull, [objNull]],
    ["_vehicle", objNull, [objNull]]
] exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

// Get index of vehicle to delete
private _vehicles = _unit call Gw_client_fnc_vehicleGetUnitVehicles;
if (_vehicles isEqualTo []) exitWith {false};

private _index = [_vehicles, _vehicle] call GW_client_fnc_numbersIndex;

// Delete vehicle from keychain and update
_vehicles deleteAt _index;
_unit setVariable ["keys", _vehicles, true];

[LOG_INFO, format ["Keys revoked for %1:%2", name _unit, getPlayerUID _unit], _fnc_scriptName] call GW_server_fnc_log;
true
