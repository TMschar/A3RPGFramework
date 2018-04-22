#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_initServer.sqf
 */
scriptName "GW_server_fnc_initServer: main";
scopeName "main";

[LOG_INFO, "Initializing Server", _fnc_scriptName] call GW_server_fnc_log;
private _time = diag_tickTime;

// Default Headless Client to not active
missionNamespace setVariable ["GW_HC_isActive", false, true];
missionNamespace setVariable ["GW_database_loaded_HC", false, true];

[LOG_INFO, "Initializing Database", _fnc_scriptName] call GW_server_fnc_log;
if !(call GW_db_fnc_connectDB) exitWith {};

// Run SQL stored procedures
["PLAYERS_RESETALIVESTATES", 1, [1]] call GW_db_fnc_queryDB;
["VEHICLES_RESETACTIVESTATES", 1, [1]] call GW_db_fnc_queryDB;

// Setup admins array
private _admins = ["GETADMINS", 2, [1]] call GW_db_fnc_queryDB;
[0, "GW_admins", _admins] call GW_client_fnc_setConstant;

// Create cleanup loop
[] spawn GW_server_fnc_worldCleanup;

// Initialize banks
try { [] call GW_server_fnc_banksInit; } catch {
    [LOG_CRITICAL, format [
        "Exception thrown in bank init: %1",
        _exception
    ], _fnc_scriptName] call GW_server_fnc_log;
};

// Initialize capture zones
try { [] call GW_server_fnc_captureZonesInit; } catch {
    [LOG_CRITICAL, format [
        "Exception thrown in capture zones init: %1",
        _exception
    ], _fnc_scriptName] call GW_server_fnc_log;
};

// Initialize petrol stations
try { [] call GW_server_fnc_petrolStationsInit; } catch {
    [LOG_CRITICAL, format [
        "Exception thrown in petrol stations init: %1",
        _exception
    ], _fnc_scriptName] call GW_server_fnc_log;
};

// Call functions
[] call GW_server_fnc_worldApplyWeather;
[] call GW_server_fnc_propertyInit;
[] call GW_server_fnc_createRadioChannels;
[] call GW_server_fnc_scriptMonitor;
[] call GW_server_fnc_communicationInitChat;

// Spawn a new thread to handle notifications
[] spawn {
    scriptName "GW_server_fnc_initServer: restartNotificationsLoop";
    scopeName "main";
    for "_i" from 0 to 1 step 0 do {
        uiSleep (5 * 60);
        [
            "This server restarts every 5 hours; 00:00, 05:00, 10:00, 15:00, 20:00 GMT. This message is the only restart message at the moment.",
            "GWExistence"
        ] call GW_client_fnc_communicationSendChat;
    };
};

// Log time it took to initialize
private _initTime = diag_Ticktime - _time;
[LOG_INFO, format [
    "Server took %1 seconds to initialize, and started at %2.",
    _initTime,
    missionStart
], _fnc_scriptName] call GW_server_fnc_log;

[LOG_INFO, "Server initialization completed.", _fnc_scriptName] call GW_server_fnc_log;
