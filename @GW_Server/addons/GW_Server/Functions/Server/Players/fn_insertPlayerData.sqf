#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_insertPlayerData.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit to insert data for
 *     1: STRING - Player UID
 *     2: STRING - Name of player
 *     3: NUMBER - Amount of times player data has been tried to be inserted
 */
#define ARRAY_STARTEXP [[0], [0], [0], [0], [0], [0]]

scriptName "GW_server_fnc_insertPlayerData: main";
scopeName "main";

if (!params [
    ["_unit", objNull, [objNull]],
    ["_playerUID", "", [""]],
    ["_playerName", "", [""]],
    ["_insertAttempts", 0, [0]]
]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Increment insert attempts
_insertAttempts = _insertAttempts + 1;

// Query
["PLAYERS_INSERT", 1, [
    _playerUID,
    _playerName,
    [_playerName],
    [["WEST", 0], ["GUER", 0], ["EAST", 0], ["CIV", 0]],
    [["WEST", 0], ["GUER", 0], ["EAST", 0], ["CIV", 0], ["ADMIN", 0], ["DONOR", 0]],
    [["CASH", 0], ["BANK", 0]],
    [["WEST", []], ["GUER", []], ["EAST", []], ["CIV", []]],
    [["DAMAGE", 0], ["THIRST", 0], ["HUNGER", 0]],
    ARRAY_STARTEXP,
    [],
    [],
    ""
]] call GW_db_fnc_queryDB;

// Log insert
[LOG_INFO, format ["Inserted data for %1:%2 (new player)", _playerName, _playerUID], _fnc_scriptName] call GW_server_fnc_log;

// New scheduled thread to sleep in case of slow return from database
[_fnc_scriptName, _unit, _playerUID, _playerName, _insertAttempts] spawn {
    scriptName "GW_server_fnc_insertPlayerData: waiting to get data";
    scopeName "main";

    params [
        ["_fnc_scriptName", "", [""]],
        ["_unit", objNull, [objNull]],
        ["_playerUID", "", [""]],
        ["_playerName", "", [""]],
        ["_insertAttempts", 0, [0]]
    ];

    // Wait 5 seconds for insert
    uiSleep 5;

    // Get player data again
    [_unit, _insertAttempts, true] call GW_server_fnc_getPlayerData;
};
