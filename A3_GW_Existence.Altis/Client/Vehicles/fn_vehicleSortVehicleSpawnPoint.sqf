#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_vehicleSortVehicleSpawnPoint.sqf
*
* Parameter(s):
*     0: ARRAY - Spawnpoints
*
* Returns:
*     STRING
*
* Description:
*     Returns an empty spawnpoint from an array of spawn points.
*     Should only be used for vehicle spawn points.
*     Returns "" if no spawn marker available, otherwise spawn maker name.
*/
scriptName "GW_client_fnc_vehicleSortVehicleSpawnPoint: main";
scopeName "main";

if !params [["_spawnMarkers", [], [[]]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
    ""
};

// Select unoccupied spawn points
private _spawnMarkersAvailable = _spawnMarkers select {
    nearestObjects [getMarkerPos _x, ["Car", "Ship", "Tank", "Air"], 5] isEqualTo []
};

// No spawn available
if (_spawnMarkersAvailable isEqualTo []) then {
    "" breakOut "main"
};

// Return first spawn marker in array
_spawnMarkersAvailable param [0, "", [""]]