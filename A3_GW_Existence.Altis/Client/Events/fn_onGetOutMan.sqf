#include "script_component.hpp"
/*
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_onGetOutMan.sqf
 *
 * Parameter(s):
 *     0: OBJECT
 *     1: STRING
 *     2: OBJECT
 *     3: ARRAY
 */
scriptName "GW_client_fnc_onGetOutMan: main";
scopeName "main";

params [
    ["_unit", objNull, [objNull]],
    ["_position", "", [""]],
    ["_vehicle", objNull, [objNull]],
    ["_turret", [], [[]]]
];

setViewDistance (profileNamespace getVariable ["GW_viewDistance_foot", 0]);