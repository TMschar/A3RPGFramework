#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_captureZonesStart.sqf
 */
scriptName "GW_server_fnc_captureZonesCaptureStart: main";
scopeName "main";

if (!params [
    ["_group", grpNull, [grpNull]],
    ["_marker", "", [""]],
    ["_displayName", "", [""]]
]) throw "Param error";

private _groupID = groupID _group;

// Broadcast to all players
[HINT_AMBER, "Capture Zones Notice", format [
    "The %1 is being captured by %2",
    _displayName,
    _groupID
]] remoteExecCall ["GW_client_fnc_notificationsAdd", -2];

// Log
[LOG_INFO, format ["%1 started capturing %2", _groupID, _displayName], _fnc_scriptName] call GW_server_fnc_log;