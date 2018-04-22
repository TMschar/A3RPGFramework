#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_propertyDoorsLocked.sqf
*
*    Parameter(s):
*        0: OBJECT - Property to check
*
*    Returns:
*        BOOLEAN
*
*    Description:
*        Checks if doors on a property is locked
*/
scriptName "GW_client_fnc_propertyDoorsLocked: main";
scopeName "main";

if !(params [
    ["_propertyObject", objNull, [objNull]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

private _isLocked = false;
private _doorCount = getNumber (configFile >> "CfgVehicles" >> typeOf _propertyObject >> "numberOfDoors");
for "_i" from 0 to _doorCount do {
    if ((_propertyObject getVariable [format ["bis_disabled_door_%1", _i], 0]) isEqualTo 1) exitWith {
        _isLocked = true
    }
};

_isLocked
