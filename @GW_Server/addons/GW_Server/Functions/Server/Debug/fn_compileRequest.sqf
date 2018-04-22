#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_compileRequest.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): STRING - Code to compile
 *     1 (REQUIRED): STRING - Targets, machines to execute on
 *     2 (OPTIONAL): OBJECT - Target machine to execute on in case target is a singular player
 */
scriptName "GW_server_fnc_compileRequest: main";
scopeName "main";

params [["_code", "", [""]], ["_targets", "", [""]], ["_targetObject", objNull, [objNull]]];

// Error checks
if (_code isEqualTo "") exitWith {};
if (_targets isEqualTo "") exitWith {};

private _unitExecutor = [remoteExecutedOwner] call GW_client_fnc_getUnitByOwnerID;
private _unitUID = getPlayerUID _unitExecutor;
private _unitName = name _unitExecutor;
private _admins = call GW_admins;

// Make sure only admins is compiling
if !(_unitUID in _admins) exitWith {
    [LOG_CRITICAL, format [
        "Unauthorized machine request compile (%1:%2)",
        _unitName,
        _unitUID
    ], _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];
};

// Switch on target
switch (_targets) do {
    case "PLAYER": {
        // Make sure there is an object to execute on
        if (isNull _targetObject) exitWith {breakOut "main"};

        // Compile on target
        [_code, _unitExecutor] remoteExecCall ["GW_server_fnc_compile", _targetObject];
    };
    case "GLOBAL": {
        // Compile on ALL machines
        [_code, _unitExecutor] remoteExecCall ["GW_server_fnc_compile", 0];
    };
    case "SERVER": {
        // Compile on server
        [_code, _unitExecutor] remoteExecCall ["GW_server_fnc_compile", 2];
    };
};

// Log
[LOG_STAFF, format [
    "Developer console executed code (%1) from (%2:%3)",
    _code,
    _unitName,
    _unitUID
], _fnc_scriptName] call GW_server_fnc_log;
