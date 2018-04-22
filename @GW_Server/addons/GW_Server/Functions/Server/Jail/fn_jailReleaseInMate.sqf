#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_jailReleaseInMate.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): STRING - Name of public variable
 *     1 (REQUIRED): OBJECT - The unit to be released
 *
 * Description:
 *     Releases an inmate from jail.
 */
scriptName "GW_server_fnc_jailReleaseInMate: main";
scopeName "main";

if (!params [["_variableName", "", [""]], ["_unit", objNull, [objNull]]]) exitWith {};

// Make sure the unit is not already in jail
if ({_x select 0 isEqualTo _unit} count GW_jail_inMates < 1) exitWith {
    ["Unit is not in jail", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Loop through inmates
private _jailClass = configNull;
{
    _x params [
        ["_arrestedUnit", objNull, [objNull]],
        ["_sentenceTime", 0, [0]],
        ["_reason", "", [""]],
        ["_jailClass", "", [""]]
    ];

    if (_unit isEqualTo _arrestedUnit) then {
        // Set jail config
        _jailClass = missionConfigFile >> "CfgJail" >> "Centers" >> worldName >> _jailClass;

        // Delete from array
        GW_jail_inMates deleteAt _forEachIndex;
    };
} forEach GW_jail_inMates;

// Make sure there is a class
if (!isClass _jailClass) exitWith {
    ["No class with that name", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Get displayname of jail
private _jailDisplayName = getText (_jailClass >> "name");

// Get information from config
private _releaseClass = _jailClass >> "ReleaseArea";
private _releasePositionATL = getArray (_releaseClass >> "positionATL");
private _releaseDirection = getNumber (_releaseClass >> "direction");

// Error check entries
if (_releasePositionATL isEqualTo []) exitWith {["No release position", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};
if (_releaseDirection isEqualTo 0) exitWith {["No release direction", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

// Query DB
private _unitUID = getPlayerUID _unit;
["JAIL_CHANGEJAILTIME", 1, [0, _unitUID]] call GW_db_fnc_queryDB;

// Exec release function on player
[] remoteExecCall ["GW_client_fnc_jailOnRelease", _unit];

// Set position
_unit setPosATL _releasePositionATL;
_unit setDir _releaseDirection;

// Add log entry
[LOG_INFO, format [
    "%1:%2 was released from jail",
    _unit,
    _unitUID
], _fnc_scriptName] call GW_server_fnc_log;