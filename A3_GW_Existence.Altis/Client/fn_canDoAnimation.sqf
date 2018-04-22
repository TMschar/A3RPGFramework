#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_canDoAnimation.sqf
*
*    Parameter(s):
*        0: OBJECT - Unit to check
*
*    Returns:
*        BOOLEAN
*
*    Description:
*        Checks if a unit can do a animation
*/
scriptName "GW_client_fnc_canDoAnimation: main";
scopeName "main";

params [["_unit", objNull, [objNull]]];

if (isNull _unit) exitWith {false};

alive _unit && {!(_unit getVariable ["tased", false])} && {!(_unit getVariable ["incapacitated", false])}
