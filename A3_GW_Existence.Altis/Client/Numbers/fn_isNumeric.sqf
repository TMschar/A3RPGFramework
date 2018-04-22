#include "script_component.hpp"
/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: fn_isNumeric.sqf

    Parameter(s):
        0: STRING - String to check if its numeric

    Returns:
        BOOLEAN
*/
scriptName "GW_client_fnc_isNumeric: main";
scopeName "main";

if !(params [
    ["_string", "", [""]]
]) exitWith {[LOG_INFO, "NOT ENOUGH PARAMS PASSED", _fnc_scriptName] call GW_server_fnc_log};

private _allowedCharacters = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
private _characters = _string splitString "";

private _numeric = false;
{
    if !(_x in _allowedCharacters) exitWith {
        _numeric = false
    };
    _numeric = true;
    true
} count _characters;

_numeric
