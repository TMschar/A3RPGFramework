#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_playerSyncRequest.sqf
 *
 * Parameter(s):
 *     0 (OPTIONAL): BOOLEAN - Show Sync Notification
 *     1 (OPTIONAL): BOOLEAN - Send UID or player (sending UID will not check on serverside)
 *
 * Description:
 *     Send request of sync to server
 */
scriptName "GW_client_fnc_playerSyncRequest: main";
scopeName "main";

disableSerialization;
params [
    ["_showNotification", false, [false]],
    ["_sendUID", false, [true]]
];

// Send steam ID instead of player (only for bleedout) as
// dead players will be recognized as objNull by server.
private _unit = [player, getPlayerUID player] select _sendUID;

// Get virtual inventory
private _virtualInventory = player getVariable ["virtualinventory_items", []];

// Update playtime
private _timeGathered = time - GW_player_timeJoined;
private _timeGatheredMinutes = _timeGathered / 60;
private _playtime = [[], missionNamespace, "GW_player_playtime", str playerSide] call GW_client_fnc_dictGetValueByKey;
private _playtimeAddedBefore = missionNamespace getVariable ["GW_player_playtimeAdded", 0];
private _newPlayTime = (_playtime + _timeGatheredMinutes) - _playtimeAddedBefore;
GW_player_playtimeAdded = _timeGatheredMinutes;

// Update dictionaries
[[], missionNamespace, "GW_player_bodyStats", "damage", damage player] call GW_client_fnc_dictSetValueByKey;
[[], missionNamespace, "GW_player_gear", str playerSide, getUnitLoadout player] call GW_client_fnc_dictSetValueByKey;
[[], missionNamespace, "GW_player_playtime", str playerSide, _newPlayTime] call GW_client_fnc_dictSetValueByKey;

// Send sync request to server
[1, "GW_DATABASE_SYNCPLAYERDATA", [_unit, [
    GW_player_playtime,
    GW_player_alive,
    [["CASH", CASH], ["BANK", BANK]],
    GW_player_bodyStats,
    GW_player_experience,
    GW_player_licenses,
    GW_player_gear,
    _virtualInventory
]]] call GW_ext_fnc_networkPublicVariable;

// Log
[LOG_INFO, "Sync request sent to server", _fnc_scriptName] call GW_server_fnc_log;
