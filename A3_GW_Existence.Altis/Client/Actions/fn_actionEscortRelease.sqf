#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_actionEscortRelease.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit to detach and stop escorting escort
 *
 * Description:
 *     Detach target and stop escorting.
 */
scriptName "GW_client_fnc_actionEscortRelease: main";
scopeName "main";

if !(params [
    ["_unit", objNull, [objNull]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

if (isNull _unit) exitWith {};

_unit setVariable ["escorting", false, true];
detach _unit;