#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_resourceWhich.sqf
 *
 * Parameter(s):
 *     0: ARRAY - Position of Unit
 *
 * Returns:
 *     STRING
 *
 * Description:
 *     Checks at what resource the player is at
 */
#define CONFIGCLASS_RESOURCESFIELDS (missionConfigFile >> "CfgResources" >> "Fields" >> worldName)
#define CONFIGCLASS_RESOURCESFISHING (missionConfigFile >> "CfgResources" >> "FishingSpots" >> worldName)
#define CLASSES_RESOURCES (("true" configClasses CONFIGCLASS_RESOURCESFIELDS) + ("true" configClasses CONFIGCLASS_RESOURCESFISHING))

scriptName "GW_client_fnc_resourceWhich: main";
scopeName "main";

if (!params [["_unitPosition", [], [[]], 3]]) throw "Param error, expected parameters.";

private _resource = "";
{
    private _markers = getArray (_x >> "markers");
    private _radius = getNumber (_x >> "radius");
    if ({getMarkerPos _x distance player <= _radius} count _markers > 0) exitWith { _resource = configName _x; };
    true;
} count CLASSES_RESOURCES;

// Return
_resource breakOut "main";
