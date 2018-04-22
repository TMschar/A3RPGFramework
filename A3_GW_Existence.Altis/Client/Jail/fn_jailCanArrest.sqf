#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_jailCanArrest.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit to arrest
 *
 * Returns:
 *     BOOLEAN
 */
#define CONFIG_SPAWNPOINTS (missionConfigFile >> "CfgSpawns" >> worldName)
#define ARRAY_SPAWNPOINTS_WEST ("true" configClasses (CONFIG_SPAWNPOINTS >> "West"))

scriptName "GW_client_fnc_jailCanArrest: main";
scopeName "main";

params [["_unit", objNull, [objNull]]];

private _stations = {
    private _marker = getText (_x >> "marker");
    private _position = markerPos _marker;
    private _distance = _unit distance _position;
    _distance < 100
} count ARRAY_SPAWNPOINTS_WEST;

// Return
isPlayer _unit && {_stations > 0}