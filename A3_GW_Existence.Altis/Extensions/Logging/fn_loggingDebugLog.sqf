#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_loggingDebugLog.sqf
 *
 * Parameter(s):
 *     0: (REQUIRED) STRING - Debug Message
 *     1: (OPTIONAL) STRING - Script Name
 *
 * Description:
 *     A helper for interacting with the log
 */
scriptName "GW_ext_fnc_loggingDebugLog: main";
scopeName "main";

params [ ["_debugMessage", "", [""]], ["_scriptName", "", [""]] ];

// Error checking
if (!([] call GW_client_fnc_helpersIsDevelopment) || {_debugMessage isEqualTo ""}) exitWith {};

// Set script name
_scriptName = [_scriptName, "Unknown Script"] select (_scriptName isEqualTo "");

// Error popup
[_debugMessage, false] call GW_client_fnc_error;

// New log entry
[LOG_DEBUG, format [
    "%1 (From: %2)",
    _debugMessage,
    _scriptName
], _fnc_scriptName] call GW_server_fnc_log;

// Log to local RPT
diag_log [_debugMessage];