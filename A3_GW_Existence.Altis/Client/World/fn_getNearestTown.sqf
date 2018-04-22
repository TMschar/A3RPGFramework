#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_getNearestTown.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit to check
 *     1: NUMBER - Radius in which to check towns of
 *
 * Returns:
 *     STRING
 *
 * Description:
 *     Checks what the closest town of player is
 */
scriptName "GW_client_fnc_getNearestTown: main";
scopeName "main";

params [["_unit", objNull, [objNull]], ["_radius", 10000, [10000]]];

// Error check
if (isNull _unit) exitWith {};

// Get town name
private _location = nearestLocations [_unit, ["NameCityCapital", "NameCity", "NameVillage"], _radius];
_location params [["_nameTown", locationNull, [locationNull]]];

// Return
text _nameTown;
