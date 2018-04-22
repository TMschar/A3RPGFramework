#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_getDisplayScript.sqf
*
*    Parameter(s):
*        0: STRING - Classname of display
*        1: NUMBER - Type of return to make (0 for code, 1 for scriptName (string))
*
*    Returns:
*        CODE || STRING
*
*    Description:
*        Checks if a script is in the displays whitelist and returns if
*        OK. This function is in place to prevent anyone from injecting
*        code through the display system.
*/
scriptName "GW_client_fnc_getDisplayScript: main";
scopeName "main";

// Get parameters and make sure they are passed
if !params [
    ["_displayClass", "", [""]],
    ["_type", 0, [0]]
] exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

// Set Script Name
private _scriptName = toUpper (_displayClass + "_script");

// Check if script name is in the whitelisted array of display scripts
// in order to make sure that hackers do not use this method to inject code.
if !(_scriptName in call GW_displaysWhitelist) exitWith {
    [
        LOG_CRITICAL,
        "Attempted to execute non-whitelisted display function",
        _fnc_scriptName
    ] call GW_server_fnc_log
};

// Return
[
    missionNamespace getVariable [_scriptName, {}],
    _scriptName
] select _type
