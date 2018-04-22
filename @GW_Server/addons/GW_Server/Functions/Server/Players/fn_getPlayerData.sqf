#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_getPlayerData.sqf
 *
 * Parameter(s):
 *     0: OBJECT  - Unit to get player data for
 *     1: NUMBER  - Amount of input attempts
 *     2: BOOLEAN - If it is a new player or not
 */
scriptName "GW_server_fnc_getPlayerData: main";
scopeName "main";

params [["_unit", objNull, [objNull]], ["_insertAttempts", 0, [0]], ["_newPlayer", false, [false]]];

private _playerUID = getPlayerUID _unit;
private _playerName = name _unit;

// Log
[LOG_INFO, format [
    "Player data requested for %1:%2", _playerName, _playerUID
], _fnc_scriptName] call GW_server_fnc_log;

// Only let it try it 4 times in order to not deadlock server
// this would most times be required due to the time it takes
// to insert player data.
if (isNull _unit || {_playerUID isEqualTo ""} || {_insertAttempts >= 5}) exitWith {
    [false] remoteExecCall ["GW_client_fnc_receivePlayerData", _unit];
};

// Store an array of new users. This is particularly
// useful for admins but also so we can send messages
// depending on if the user is new or not.
if (_newPlayer) then {
    // Get the current array of new users
    private _currentNewPlayers = missionNamespace getVariable ["GW_server_newPlayers", []];

    // If the player is not already inside the array
    // then push him into the array
    _currentNewPlayers pushBackUnique _playerUID;

    // Broadcast to all users
    [PVAR, "GW_server_newPlayers", _currentNewPlayers] call GW_ext_fnc_networkPublicVariable;
};

// Query data for user
private _queryResult = ["PLAYERS_GETPLAYER", 2, [_playerUID]] call GW_db_fnc_queryDB;

// No data was found so insert data for player
if (_queryResult isEqualTo []) exitWith { [_unit, _playerUID, _playerName, _insertAttempts] call GW_server_fnc_insertPlayerData; };

// Sort out player data
_queryResult params [["_playerData", [], [[]]]];
_playerData params [
    ["_id", 0, [0]],
    ["_aliases", [], [[]]],
    ["_dictRanks", [], [[]], 6],
    ["_dictPlaytimes", [], [[]], 4],
    ["_alive", 0, [0]],
    ["_dictMoney", [], [[0]], 2],
    ["_dictGear", [], [[]], 4],
    ["_dictBodyStats", [], [[]], 3],
    ["_experience", [], [[]], 6],
    ["_licenses", [], [[]]],
    ["_inventory", [], [[]]],
    ["_jailTime", 0, [0]],
    ["_jail", "", [""]]
];

// Update alive state to alive
["UPDATE_PLAYERALIVESTATE_PLAYERIDSPECIFIC", 1, [1, _playerUID]] call GW_db_fnc_queryDB;

// Send to client
[
    true,
    _newPlayer,
    _id,
    _dictRanks,
    _dictPlaytimes,
    _dictMoney,
    _dictGear,
    _dictBodyStats,
    _licenses,
    _experience,
    _inventory,
    _jailTime,
    _jail,
    _alive
] remoteExecCall ["GW_client_fnc_receivePlayerData", _unit];
