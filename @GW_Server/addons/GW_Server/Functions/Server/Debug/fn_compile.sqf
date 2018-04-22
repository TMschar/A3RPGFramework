#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_compile.sqf
 *
 * Parameter(s):
 *     0: STRING - String to compile
 *     1: OBJECT - Object that executed (should be sent with remote execution)
 */
scriptName "GW_server_fnc_compile: main";
scopeName "main";

if (!params [["_string", "", [""]], ["_unitExecutor", objNull, [objNull]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
};

// Make sure that this is remotely executed and that the
// executor is server.
if (!isRemoteExecuted || {remoteExecutedOwner != 2}) exitWith {
    // Log
    [LOG_CRITICAL, format [
        "Unauthorized machine tried to compile (%1:%2)",
        name _unitExecutor,
        getPlayerUID _unitExecutor
    ], _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];
};

// Compile
[] call compile _string;
