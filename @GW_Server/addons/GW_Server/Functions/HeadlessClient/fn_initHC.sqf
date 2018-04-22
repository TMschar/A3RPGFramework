#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_initHC.sqf
 *
 * Description:
 *     Initializes Headless Client
 */
scriptName "GW_hc_fnc_initHC: main";
scopeName "main";

// Log
[LOG_INFO, "Initializing Headless Client"] call GW_server_fnc_log;

// Initialize database
[LOG_INFO, "Initializing Database", _fnc_scriptName] call GW_server_fnc_log;
if !(call GW_db_fnc_connectDB) exitWith {};

// Initialize public variables
[LOG_INFO, "Initializing Public Variable EVH's", _fnc_scriptName] call GW_server_fnc_log;
[] call GW_server_fnc_initPublicVariableEventHandlers;

// Log ready
[LOG_INFO, "Headless client finished initialization and now ready to serve", _fnc_scriptName] call GW_server_fnc_log;

// Set ready
missionNamespace setVariable ["GW_HC_isActive", true, true];
