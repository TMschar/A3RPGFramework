#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_error.sqf
*
*    Parameter(s):
*        0: STRING  - Error Message
*		 1: BOOLEAN - Log
*
*    Returns:
*        NOTHING
*
*    Description:
*        Throws an error
*/
scriptName "GW_client_fnc_error: main";
scopeName "main";

if !params [
	["_errorMsg", "", [""]],
	["_log", true, [true]]
] exitWith {
	[LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

// Pop up error on screen
_errorMsg call BIS_fnc_error;

// Log to RPT
if _log then {
	[LOG_WARNING, format ["Error occured (%1)", _errorMsg], _fnc_scriptName] call GW_server_log
}