#include "script_component.hpp"
/*
* Copyright (C) SimZor, SimZor Studios 2017
* All Rights Reserved
*
* Filename: fn_syncAnimation.sqf
*
* Parameter(s):
*     0: OBJECT - Object to carry the animation
*     1: STRING - Animation to switch to
*/
scriptName "GW_client_fnc_syncAnimation: main";
scopeName "main";

// Get parameters and make sure they are passed
if !params [["_unit", objNull, [objNull]], ["_animation", "", [""]]] exitWith {};

// Make sure the unit is not in a vehicle
if ([_unit] call GW_client_fnc_vehicleUnitInVehicle) exitWith {
    ["Unit is in a vehicle", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Do animation
_unit switchMove _animation;
