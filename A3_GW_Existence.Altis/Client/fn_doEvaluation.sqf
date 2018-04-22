#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_doEvaluation.sqf
*
*    Parameter(s):
*        0: STRING - Conditions
*
*    Returns:
*        BOOLEAN
*
*    Description:
*        Evaluates a condition to true or false
*/
scriptName "GW_client_fnc_doEvaluation: main";
scopeName "main";

if !(params [
    ["_condition", "", [""]]
]) exitWith {
    [LOG_WARNING, "Not enough parameters passed", _fnc_scriptName] call GW_server_fnc_log;
    false
};

if (_condition isEqualTo "") exitWith {true};

private _evaluation = call compile _condition;
if !(_evaluation isEqualType true) exitWith {true};

_evaluation
