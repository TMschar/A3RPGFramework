#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_worldDoorIsLocked.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Building
 *     1: NUMBER - Door number
 *
 * Returns:
 *     BOOLEAN
 */
scriptName "GW_client_fnc_worldDoorIsLocked: main";
scopeName "main";

if (!params [["_building", objNull, [objNull]], ["_doorNumber", 0, [0]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Get lock state (0 or 1)
private _lockState = _building getVariable [format ["bis_disabled_door_%1", _doorNumber], 0];

// Return boolean (locked if 1)
_lockState isEqualTo 1;