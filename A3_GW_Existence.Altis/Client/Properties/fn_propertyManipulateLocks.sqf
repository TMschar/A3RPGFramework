#include "script_component.hpp"
/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: fn_propertyManipulateLocks.sqf

    Parameter(s):
        NONE

    Returns:
        NOTHING
*/
scriptName "GW_client_fnc_propertyManipulateLocks: main";
scopeName "main";

if !(params [
    ["_lockState", 0, [0]],
    ["_propertyObject", objNull, [objNull]]
]) exitWith {};

private _doorCount = getNumber (configFile >> "CfgVehicles" >> typeOf _propertyObject >> "numberOfDoors");
for "_i" from 0 to _doorCount do {
    _propertyObject setVariable [format ["bis_disabled_door_%1", _i], _lockState, true]
}
