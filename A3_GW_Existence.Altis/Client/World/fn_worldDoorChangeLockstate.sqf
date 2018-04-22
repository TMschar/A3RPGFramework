#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_worldDoorChangeLockstate.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Building door belongs to
 *     1: NUMBER - Door number
 *     2: NUMBER - State (1 for locked, 0 for unlocked)
 */
scriptName "GW_client_fnc_worldDoorChangeLockstate: main";
scopeName "main";

params [
    ["_building", objNull, [objNull]],
    ["_doorNumber", -1, [-1]],
    ["_lockState", 1, [1]]
];

// Error checks
if (isNull _building) exitWith {};
if (_doorNumber isEqualTo -1) exitWith {};

// Update door variable
_building setVariable [format [
    "bis_disabled_door_%1",
    _doorNumber
], _lockState, true];