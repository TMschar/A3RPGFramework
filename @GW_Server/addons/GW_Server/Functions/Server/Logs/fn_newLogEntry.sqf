#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_newLogEntry.sqf
 *
 * Parameter(s):
 *     0: STRING - Public variable name
 *     1: ARRAY  - Value of the public variable
 */
scriptName "GW_server_fnc_newLogEntry: main";
scopeName "main";

params [["_name", "", [""]], ["_value", [], [[]]]];
_value params [
    ["_category", 0, [0]],
    ["_logText", "", [""]],
    ["_scriptName", "", [""]],
    ["_playerName", "", [""]],
    ["_playerUID", "", [""]]
];

// Error check
if (_logText isEqualTo "") exitWith {};

// Select category
private _category = [
    "MISC",
    "ACTION",
    "WARNING",
    "INFO",
    "CRITICAL",
    "STAFF LOGS",
    "BAN LOG",
    "DEBUG"
] select _category;

// Log
diag_log format [
    "[GROUNDWARS LOG][%1][%2][%3][%4] %5",
    _category,
    _scriptName,
    _playerName,
    _playerUID,
    _logText
];
