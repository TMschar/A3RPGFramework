#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_vehicleUpdateStatus.sqf
*
* Parameter(s):
*     0: OBJECT - Vehicle to update status for
*     1: NUMBER - Mode to set
*
* Description:
*     Updates a vehicle's status in database
*/
scriptName "GW_server_fnc_vehicleUpdateStatus: main";
scopeName "main";

if !params [["_vehicle", objNull, [objNull]], ["_mode", 0, [0]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Null check
if isNull _vehicle exitWith {
    ["Vehicle is null", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

private _databaseInfo = _vehicle getVariable ["db_insert", []];
if (_databaseInfo isEqualTo []) exitWith {};

// Query DB
_databaseInfo params [["_vehicleOwnerUID", "", [""]], ["_vehicleUID", "", [""]]];
 ["VEHICLES_UPDATEVEHICLESTATUS", 1, [_mode, _vehicleUID]] call GW_db_fnc_queryDB;

// Log to debug log
[format ["Updated vehicle status to %1", _mode], _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;

// Send back to client that the vehicle status is updated
[
    PVAR_CLIENT,
    "GW_vehicleActiveState_updated",
    true,
    remoteExecutedOwner
] call GW_ext_fnc_networkPublicVariable