#include "script_component.hpp"
/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: fn_hideTerrainObjects.sqf

    Parameter(s):
        0: OBJECT - Object to get radius from
        1: ARRAY - Array with object types to hide
        2: NUMBER - Radius of objects to be hidden

    Returns:
        NOTHING

    Description:
        Used for hiding objects in terrain
*/
scriptName "GW_client_fnc_hideTerrainObjects: main";
scopeName "main";

if !(params [
    ["_object", objNull, [objNull]],
    ["_objectClasses", [], [[]]],
    ["_radius", 0, [0]]
]) exitWith {};

private _terrainObjects = nearestTerrainObjects [_object, [], _radius];
{
    _x hideObjectGlobal true;
    true
} count _terrainObjects
