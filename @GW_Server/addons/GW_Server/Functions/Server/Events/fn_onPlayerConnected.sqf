#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_onPlayerConnected.sqf
 * 
 * Parameter(s):
 *     0: NUMBER
 *     1: STRING
 *     2: STRING
 *     3: BOOLEAN
 *     4: NUMBER
 */
scriptName "GW_server_fnc_onPlayerConnected: main";
scopeName "main";

// Don't get server
if (isServer) exitWith {};

params [
    ["_id", 0, [1]],
    ["_uid", "", [""]],
    ["_profileName", "", [""]],
    ["_jip", false, [true]],
    ["_owner", 0, [0]]
];

// Log
[LOG_INFO, format ["%1:%2 connected to the server", _profileName, _uid], _fnc_scriptName] call GW_server_fnc_log;

// Get Unit from UID
private _unit = [_uid] call GW_client_fnc_getUnitByUID;

// Send chat message
[format["%1 connected.", name _unit], "GW Existence"] call GW_client_fnc_communicationSendChat;

// Initialize AntiHack on Unit
_owner publicVariableClient "GW_server_fnc_antiHackInit";
[_unit] remoteExec ["GW_server_fnc_antiHackInit", _unit];
