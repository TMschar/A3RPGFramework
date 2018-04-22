#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_vehicleLocked.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Vehicle to check
 */
scriptName "GW_client_fnc_vehicleLocked: main";
scopeName "main";

if !params [["_vehicle", objNull, [objNull]]] exitWith {["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

private _bool = locked _vehicle in [2, 3];
_bool breakOut "main";