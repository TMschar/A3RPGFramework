#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_vehicleIsDamaged.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Vehicle to check
 *
 * Returns:
 *     BOOLEAN
 */
scriptName "GW_clietn_fnc_vehicleIsDamaged: main";
scopeName "main";

if (!params [["_vehicle", objNull, [objNull]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

private _hitpointsDamageArray = getAllHitPointsDamage _vehicle;
private _damageArray = _hitpointsDamageArray param [2, [], [[]]];
private _greatestDamage = selectMax _damageArray;

// Return boolean
_greatestDamage > 0.01;