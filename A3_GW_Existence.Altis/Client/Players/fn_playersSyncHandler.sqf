#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_playersSyncHandler.sqf
 *
 * Parameter(s):
 *     0: BOOLEAN - start or stop handler
 *
 * Description:
 *     Main handle for syncing player data
 */
#define SYNC_COOLDOWN 5

scriptName "GW_client_fnc_playersSyncHandler: main";
scopeName "main";

params [["_start", false, [false]]];

// Stop syncing
if (!_start) exitWith {
    // Terminate thread
    terminate GW_playerSyncHandler_threadHandle;

    // Log
    [LOG_INFO, "Stopped syncing data for player", _fnc_scriptName] call GW_server_fnc_log
};

// Check if thread is already active
private _scriptHandle = missionNamespace getVariable ["GW_playerSyncHandler_threadHandle", scriptNull];
if (!isNull _scriptHandle) exitWith {
    [LOG_WARNING, "Sync handler already running", _fnc_scriptName] call GW_server_fnc_log
};

// Add handler for syncing
GW_playerSyncHandler_threadHandle = [] spawn {
    uiSleep (SYNC_COOLDOWN * 60);

    // Request sync
    [true] call GW_client_fnc_playerSyncRequest
};
