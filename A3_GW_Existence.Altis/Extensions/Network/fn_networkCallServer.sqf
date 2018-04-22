#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_networkCallServer.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): ARRAY   - Array with arguments to pass with remote execution
 *     1 (REQUIRED): STRING  - Function to call
 *     2 (OPTIONAL): BOOLEAN - Create a new thread (run in scheduled environment)
 */
#define OWNER_SERVER 2

scriptName "GW_ext_fnc_networkCallServer: main";
scopeName "main";

params
[
    ["_args", [], [[]]],
    ["_function", "", [""]],
    ["_runScheduled", false, [true]]
];

// Make sure a function is passed
if (_function isEqualTo "") throw "Expected function to be passed as string";

private _hcActive = missionNamespace getVariable ["GW_HC_isActive", false];
private _headlessClient = missionNamespace getVariable [STR_HC, objNull];
private _target = [OWNER_SERVER, _headlessClient] select _hcActive;

// Call remote target
if (_runScheduled) then
{
    _args remoteExec [_function, _target];
}
else
{
    _args remoteExecCall [_function, _target];
};