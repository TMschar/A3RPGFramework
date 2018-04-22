#include "script_component.hpp"
/**
 * Copyright (C) SimZor, SimZor Studios 2017
 * All Rights Reserved
 *
 *  Filename: fn_onPlayerConnected.sqf
 *
 * Parameter(s):
 *     0: NUMBER - Unique DirectPlay ID
 *     1: NUMBER - UID of joining client
 *     2: STRING - Profile name of joining client
 *     3: BOOLEAN - Join in progress
 *     4: NUMBER - Owner id of connecting client
 */
scriptName "GW_server_fnc_onPlayerDisconnected: main";
scopeName "main";

if (isServer) exitWith {};

params [
    ["_id", 0, [0]],
    ["_uid", "", [""]],
    ["_name", "", [""]],
    ["_jip", false, [false]],
    ["_owner", 0, [0]]
];

// Inactivate Headless Client
private _hc = owner HEADLESSCLIENT;
if (_owner isEqualTo _hc) exitWith {
    missionNamespace setVariable ["GW_HC_isActive", false, true];
    [LOG_INFO, "Headless Client Disconnected", _fnc_scriptName] call GW_server_fnc_log
};