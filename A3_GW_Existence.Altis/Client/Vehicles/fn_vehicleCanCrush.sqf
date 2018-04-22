#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_vehicleCanCrush.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Vehicle to check if crushable
 *
 * Returns:
 *     BOOLEAN
 */
scriptName "GW_client_fnc_vehicleCanCrush: main";
scopeName "main";

params [["_vehicle", objNull, [objNull]]];

private _stations = {
    private _marker = getText (_x >> "marker");
    private _position = markerPos _marker;
    private _distance = _vehicle distance _position;
    _distance < 100
} count ARRAY_SPAWNPOINTS_WEST;

// Return
_stations > 0
&& {call GW_player_sideRank >= 3}
&& {playerSide isEqualTo west}
&& {count crew _vehicle == 0}
&& {!((_vehicle getVariable ["db_insert", []]) isEqualTo [])}