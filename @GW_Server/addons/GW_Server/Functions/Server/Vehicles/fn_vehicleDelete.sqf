#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleDelete.sqf
*
*    Parameter(s):
*        0: OBJECT - Vehicle to delete
*
*    Returns:
*        NOTHING
*
*    Description:
*        Deletes a vehicle from database
*/
scriptName "GW_client_fnc_vehicleDelete: main";
scopeName "main";

try {
    if !(params [
        ["_vehicle", objNull, [objNull]]
    ]) throw "Not enough params passed";
    if (isNull _vehicle) throw "Vehicle is null";

    private _dbInfo = _vehicle getVariable ["db_insert", []];
    if (_dbInfo isEqualTo []) throw "Vehicle does not have any database information";

    // Delete from database
    _dbInfo params [
        ["_ownerUID", "", [""]],
        ["_vehicleUID", "", [""]]
    ];
    ["VEHICLES_DELETEVEHICLE", 1, [_vehicleUID]] call GW_db_fnc_queryDB;

    // Log
    [LOG_INFO, format ["Deleted vehicle from database: %1:%2", _ownerUID, _vehicleUID], _fnc_scriptName] call GW_server_fnc_log;

    // Send back ready to client
    [PVAR_CLIENT, "GW_Player_VehicleCrush_Deleted", true, remoteExecutedOwner] call GW_ext_fnc_networkPublicVariable
} catch {
    [LOG_WARNING, "Exception thrown: " + str _exception, _fnc_scriptName] call GW_server_fnc_log
}
