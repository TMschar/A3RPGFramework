#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_worldNearestDoor.sqf
 *
 * Parameter(s):
 *     0: OBJCT - Building
 *
 * Returns:
 *     NUMBER - Door number
 */
scriptName "GW_client_fnc_worldNearestDoor: main";
scopeName "main";

if (!params [["_building", objNull, [objNull]]]) exitWith {["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};
if (isNull _building) exitWith {0};

private _door = 0;
private _doors = getNumber (configFile >> "CfgVehicles" >> typeOf _building >> "numberOfDoors");
private _lastDistance = 10e10;
private _newDistance = 0;

// Loop for as many doors
for "_i" from 1 to _doors do {
    private _selectionPosition = _building selectionPosition format ["Door_%1_trigger", _i];
    private _positionDoor = _building modelToWorld _selectionPosition;

    // If last distance is larger than the new distance
    // set that door to nearest one instead. It will always
    // be bigger the first time so it can at least set it
    // once.
    private _newDistance = _positionDoor distance player;
    if (_lastDistance > _newDistance) then {
        _lastDistance = _newDistance;
        _door = _i;
    };
};

// Return door no.
_door;