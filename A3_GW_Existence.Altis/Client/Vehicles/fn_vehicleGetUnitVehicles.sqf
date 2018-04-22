#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleGetUnitVehicles.sqf
*
*    Parameter(s):
*        0: OBJECT - Unit to get vehicles of
*
*    Returns:
*        ARRAY
*
*    Description:
*        Checks what vehicles said unit has access to and returns it as an array
*/
scriptName "GW_client_fnc_vehicleGetUnitVehicles: main";
scopeName "main";

params [["_unit", objNull, [objNull]]];
if isNull _unit exitWith {[]};

_unit getVariable ["keys", []]
