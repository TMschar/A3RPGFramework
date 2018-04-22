#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_vehicleGetInactiveVehicles.sqf
*
* Parameter(s):
*     0: OBJECT - Unit to get vehicles for
*     1: STRING - Vehicle Type ("Ground", "Air", "Ship")
*
* Description:
*     Get all inactive vehicles. That will say, all vehicles that are not pulled out. Used mainly for garage.
*/
scriptName "GW_client_fnc_vehicleGetInactiveVehicles: main";
scopeName "main";

if !params [["_unit", objNull, [objNull]], ["_vehicleType", "", [""]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

private _unitUID = getPlayerUID _unit;
private _vehicleSide = switch side _unit do {
    case west:        {"West"};
    case east:        {"East"};
    case independent: {"Guer"};
    case civilian:    {"Civ"};
};

// Run a SQL query
private _queryRequest = [
    "VEHICLES_GETINACTIVE",
    2,
    [
        _unitUID,
        toUpper _vehicleType,
        toUpper _vehicleSide
    ]
] call GW_db_fnc_queryDB;

// Send back to client in a public variable
[
    0,
    "GW_vehicleGetInactiveVehicles_serverReturn",
    _queryRequest,
    owner _unit
] call GW_ext_fnc_networkPublicVariable
