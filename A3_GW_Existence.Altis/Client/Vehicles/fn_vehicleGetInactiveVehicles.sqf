#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_vehicleGetInactiveVehicles.sqf
*
* Parameter(s):
*     0: OBJECT - Object to receive vehicles for
*     1: STRING - Vehicle types to receive (either Ground, Air or Ship)
*
* Returns:
*     ARRAY
*
* Description:
*     Makes a call to server and waits for a response, then returns the SQL query as an array.
*     Must be ran in a scheduled environment.
*/
if !canSuspend exitWith {["Suspension must be allowed", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};
if !params [["_unit", objNull, [objNull]], ["_vehicleType", "GROUND", [""]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Remote execute to server
[
    [player, _vehicleType],
    "GW_server_fnc_vehicleGetInactiveVehicles"
] call GW_ext_fnc_networkCallServer;

// Wait for a return
private _value = nil;
GW_vehicleGetInactiveVehicles_serverReturn = nil;
waitUntil {
    _value = missionNamespace getVariable ["GW_vehicleGetInactiveVehicles_serverReturn", nil];
    !(isNil "_value");
};

// Return value
_value