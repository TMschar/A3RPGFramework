#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_banksDrill.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Building vault is in
 *     1: NUMBER - Door number
 */
#define DRILL_TEXT "Drilling into vault"
#define SUCCESS_TITLE "Vault Opened"
#define SUCCESS_TEXT "You successfully broke into the vault."
#define FAIL_TITLE "Drilling Failed"
#define FAIL_TEXT "You failed to drill the vault."

scriptName "GW_client_fnc_banksDrill: main";
scopeName "main";

// Error checks
if (!canSuspend) exitWith { ["Cannot suspend", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (!isRemoteExecuted) exitWith { ["Was not remotely executed", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Get parameters
if (!params [
    ["_building", objNull, [objNull]],
    ["_door", -1, [-1]]
]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Get bank properties
private _bankClass = _building getVariable ["bankClass", ""];
private _bankVault = _building getVariable ["bankVault", ""];

// Get bank config class
private _bankConfigClass = missionConfigFile >> "CfgBanks" >> worldName >> _bankClass >> "Vaults" >> _bankVault;
if (!isClass _bankConfigClass) exitWith { ["No bank config class", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Get drill time
private _drillTime = getNumber (_bankConfigClass >> "timer");
if (_drillTime isEqualTo 0) exitWith { ["No timer", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Set conditions for the drilling to continue
private _conditionArgs = [player, getPosATL player];
private _conditionCode = {
    params [["_unit", objNull, [objNull]], ["_startPos", [], [[]]]];
    getPosATL _unit distance _startPos < 2
    && {alive _unit}
    && {!isNull _unit}
    && {!(_unit getVariable ["incapacitated", false])}
};

// Successfull if this function returns true
if (["", [_drillTime, DRILL_TEXT, "", ""], _conditionArgs, _conditionCode] call GW_client_fnc_startProgress) then {
    // Notify about success
    [HINT_NORMAL, SUCCESS_TITLE, SUCCESS_TEXT] call GW_client_fnc_notificationsAdd;

    // Add experience
    [LEVEL_REBELLIOUS, 100, "Drilling into vault"] call GW_client_fnc_experienceCategoryAddExperience;

    // Unlock door
    [_building, _door, 0] call GW_client_fnc_worldDoorChangeLockstate;

    // Animate door
    _building animate [format ["door_%1_rot", _door], 1];

    // Set breached so we can collect moneybags from box in vault
    private _vaultBox = _building getVariable ["bankVaultBox", objNull];
    _vaultBox setVariable ["breached", true, true];
} else {
    // Notify about fail
    [HINT_WARNING, FAIL_TITLE, FAIL_TEXT] call GW_client_fnc_notificationsAdd;
};

// No longer drilling, let others use the function
_building setVariable ["drilling", false, true];