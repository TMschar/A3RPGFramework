#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_actionRestrain.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): OBJECT - Unit to restrain
 *     1 (OPTIONAL): STRING - Animation
 *
 * Description:
 *     This function is used for restraining another unit.
 */
scriptName "GW_client_fnc_actionRestrain: main";
scopeName "main";

params [["_targetUnit", objNull, [objNull]], ["_animation", "AmovPercMstpSnonWnonDnon_Ease", [""]]];

// Error checks
if (isNull _targetUnit) exitWith {};
if (playerSide isEqualTo west && {side _targetUnit isEqualTo west}) exitWith {};
if (side _targetUnit isEqualTo independent) exitWith {};
if (playerSide isEqualTo independent) exitWith {};

// If player is civilian, make sure he has hancuffs
private _hasHandcuffs = [player, "Handcuffs"] call GW_client_fnc_virtualInventoryHasItem;
private _isCivilian = playerSide isEqualTo civilian;
if (_isCivilian && {!_hasHandcuffs}) exitWith {
    ["Does not have handcuffs", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
};

// Already restrained
if (_targetUnit getVariable ["restrained", false]) exitWith {};

// Make sure the target unit is surrendered
private _isSurrendered = _targetUnit getVariable ["surrendered", false];
private _isIncapacitated = _targetUnit getVariable ["incapacitated", false];
private _isTased = _targetUnit getVariable ["tased", false];
if (!_isSurrendered && {!_isIncapacitated} && {!_isTased}) exitWith {
    ["Target not restrained or incapacitated.", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
};

// Run on target
[_animation, player] remoteExec ["GW_client_fnc_actionRestrainHandler", _targetUnit];
