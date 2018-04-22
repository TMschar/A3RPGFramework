#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_actionEscort.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit to escort
 *
 * Description:
 *     Action for escorting a unit when said unit is restrained
 */
scriptName "GW_client_fnc_actionEscort: main";
scopeName "main";

if !(params [
	["_unit", objNull, [objNull]]
]) exitWith {
	[LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

if (isNull _unit) exitWith {};

_unit setVariable ["escorting", true, true];
_unit attachTo [player, [0.1, 1.1, 0]];