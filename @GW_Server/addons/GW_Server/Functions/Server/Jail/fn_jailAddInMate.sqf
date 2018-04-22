#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_jailAddInMate.sqf
 *
 * Parameter(s):
 *     0: STRING - Name of public variable
 *     1: ARRAY  - Array with inmates
 */
scriptName "GW_server_fnc_jailAddInMate: main";
scopeName "main";

params [["_variableName", "", [""]], ["_inMateArray", [], [[]]]];

// Sort out passed values
_inMateArray params [
    ["_unit", objNull, [objNull]],
    ["_sentenceTime", 0, [0]],
    ["_reason", "", [""]],
    ["_jailClass", "", [""]]
];

// Make sure the unit is not already in jail
if ({_x select 0 isEqualTo _unit} count GW_jail_inMates > 0) exitWith {
    ["This unit is already in jail", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

private _jailConfigClass = missionConfigFile >> "CfgJail" >> "Centers" >> worldName >> _jailClass;
if (!isClass _jailConfigClass) exitWith {["No class with that name", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

// Get displayname
private _jailDisplayName = getText (_jailConfigClass >> "name");

// Get direction and position
private _processing = _jailConfigClass >> "ProcessingArea";
private _direction = getNumber (_proccessing >> "direction");
private _posATL = getArray (_processing >> "positionATL");

// Error check
if (_posATL isEqualTo []) exitWith {["No processing position", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};
if (_direction isEqualTo 0) exitWith {["No processing direction", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

// Add to array of inmates
private _startTime = time;
GW_jail_inMates pushback [_unit, _sentenceTime, _reason, _jailClass, _startTime];

// Query DB
private _unitUID = getPlayerUID _unit;
["JAIL_CHANGEJAILTIME", 1, [_sentenceTime, _unitUID]] call GW_db_fnc_queryDB;
["JAIL_UPDATEJAIL", 1, [_jailClass, _unitUID]] call GW_db_fnc_queryDB;

// Incarceration on client
[_jailDisplayName, _sentenceTime, _startTime, _reason] remoteExecCall ["GW_client_fnc_jailOnIncarceration", _unit];

// Broadcast
[format ["%1 was incarcerated.", name _unit], _jailDisplayName] call GW_client_fnc_communicationSendChat;

// Teleport to processing area in jail
_unit setPosATL _posATL;
_unit setDir _direction;

// Add log entry
[LOG_INFO, format [
    "%1:%2 was incarcerated into jail",
    name _unit,
    _unitUID
], _fnc_scriptName] call GW_server_fnc_log;