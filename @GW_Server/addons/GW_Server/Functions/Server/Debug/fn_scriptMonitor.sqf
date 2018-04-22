#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_scriptMonitor.sqf
 */
scriptName "GW_server_fnc_scriptMonitor: main";
scopeName "main";

private _sqfScripts = diag_activeSQFScripts;
private _fsmScripts = diag_activeMissionFSMs;
private _serverOrClient = ["CLIENT", "SERVER"] select isServer;
private _timeSinceStart = (time / 60) toFixed 2;

// Log
[LOG_INFO, format ["Running script monitor for %1", _serverOrClient], _fnc_scriptName] call GW_server_fnc_log;
[LOG_INFO, format ["Time since mission start: %1 min(s)", _timeSinceStart], _fnc_scriptName] call GW_server_fnc_log;

// Print all different SQF scripts
[LOG_INFO, format ["Active SQF scripts: %1", count _sqfScripts], _fnc_scriptName] call GW_server_fnc_log;
{
    // Log
    [LOG_INFO, format [
        "Active SQF script %1: %2",
        _forEachIndex + 1,
        _x
    ], _fnc_scriptName] call GW_server_fnc_log;
} forEach _sqfScripts;

// Print all different FSM's
[LOG_INFO, format ["Active FSM scripts: %1", count _fsmScripts], _fnc_scriptName] call GW_server_fnc_log;
{
    // Log
    [LOG_INFO, format [
        "Active FSM script %1: %2",
        _forEachIndex + 1,
        _x
    ], _fnc_scriptName] call GW_server_fnc_log;
} forEach _fsmScripts;
