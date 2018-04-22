#include "script_component.hpp"
/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: fn_connectToDatabase.sqf

    Parameter(s):
        NONE

    Returns:
        BOOLEAN
*/
scriptName "GW_client_fnc_checkDatabaseConnection: main";
scopeName "main";

#define INIT_TEXT GW_InitPlayer_InitText

waitUntil {!isNil "GW_Database_Loaded_Server"};

if !(GW_Database_Loaded_Server) exitWith {
    INIT_TEXT = "Database connection failed...";
    [LOG_WARNING, "Database connection failed", _fnc_scriptName] call GW_server_fnc_log;

    false
};

if (GW_hc_isActive && {isNil "GW_Database_Loaded_HC" || !GW_Database_Loaded_HC}) exitWith {
    INIT_TEXT = "Database connection failed...";
    [LOG_WARNING, "Database connection failed", _fnc_scriptName] call GW_server_fnc_log;

    false
};

true
