#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_vehicleOpenGarage.sqf
*
* Parameter(s):
*     0: STRING - Side in String (Can't be datatype side because of compatibility errors with compile)
*     1: STRING - Type of Garage (Ground, Air, Ship)
*     2: ARRAY  - Array with possible spawn locations for vehicle
*/
scriptName "GW_client_fnc_vehicleOpenGarage: main";
scopeName "main";

if !params [
    ["_garageSide", "", [""]],
    ["_garageType", "GROUND", [""]],
    ["_spawnMarkers", [], [[]]]
] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

if (_spawnMarkers isEqualTo []) exitWith {
    ["No spawn markers", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

_garageSide = switch (toUpper _garageSide) do {
    case "CIV";
    case "CIVILIAN": {civilian};
    case "OPFOR";
    case "EAST": {east};
    case "WEST";
    case "BLUFOR": {west};
    case "GUER";
    case "INDEPENDENT": {independent};
};

// Side validation
if !(playerSide isEqualTO _garageSide) exitWith {
    [
        HINT_AMBER,
        "No Access",
        "You do not have access to this garage."
    ] call GW_client_fnc_notificationsAdd
};

GW_displayGarage_garageType = _garageType;
GW_displayGarage_spawnMarkers = _spawnMarkers;

createDialog "GW_displayGarage"
