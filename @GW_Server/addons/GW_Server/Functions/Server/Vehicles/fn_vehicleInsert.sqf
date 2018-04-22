#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleInsert.sqf
*
*    Parameter(s):
*        0: OBJECT - Unit
*        0: OBJECT - Vehicle
*        0: STRING - Texture Identifier (Used for retrieving same texture back again)
*
*    Description:
*        Inserts a new vehicle into database
*/
scriptName "GW_server_fnc_vehicleInsert: main";
scopeName "main";

if !params [
    ["_unit", objNull, [objNull]],
    ["_vehicle", objNull, [objNull]],
    ["_textureIdentifier", "", [""]]
] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

private _playerUID = getPlayerUID _unit;
private _playerSide = toUpper str (side group _unit);
private _vehicleUID = 10 call GW_server_fnc_randomCharacterGenerator;

// Check for errors
if (
    isNull _vehicle
    || {!alive _vehicle}
    || {isNull _unit}
    || {_playerUID isEqualTo ""}
) exitWith {
    [LOG_WARNING, "Vehicle insertion failed", _fnc_scriptName] call GW_server_fnc_log
};

private _vehicleType = switch true do {
    case (
        _vehicle isKindOf "Car"
        || {_vehicle isKindOf "Tank"}
    ): {"GROUND"};
    case (_vehicle isKindOf "Air"): {"AIR"};
    case (_vehicle isKindOf "Ship"): {"SHIP"}
};

// Run a SQL query
[
    "VEHICLES_INSERTNEWVEHICLE",
    1,
    [
        _playerUID,
        _vehicleUID,
        _vehicleType,
        typeOf _vehicle,
        _playerside,
        _textureIdentifier,
        1,
        1
    ]
] call GW_db_fnc_queryDB;

// Set vehicle database information
_vehicle setVariable ["db_insert", [_playerUID, _vehicleUID], true];

// Set Vehicle ID (Not implemented on main branch yet)
// _vehicle setPlateNumber _vehicleUID;
