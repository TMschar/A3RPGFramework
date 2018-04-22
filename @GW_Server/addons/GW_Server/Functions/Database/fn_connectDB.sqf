#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_connectDB.sqf
 *
 * Description:
 *     Connects server to database
 */
#define CONFIG_DB (configFile >> "GW_CfgServer" >> "Database")
#define DB_NAME (getText (CONFIG_DB >> "databaseName"))
#define LOCK_DB (getNumber (CONFIG_DB >> "lockServer"))
#define SQL_CUSTOM_FILENAME (getText (CONFIG_DB >> "sqlCustomFile"))

scriptName "GW_client_fnc_connectDB: main";
scopeName "main";

// Random ID so no one can hijack session
private _sqlID = [24] call GW_server_fnc_randomCharacterGenerator;

// Set constant - this must be made a string like so ""random""
// since it will make it a constant and will result in {random}
// otherwise.
[0, "GW_sqlID", str _sqlID] call GW_client_fnc_setConstant;

// Add and connect database
private _extDBConnect = "extDB3" callExtension format [
    "9:ADD_DATABASE:%1",
    DB_NAME
];

// Add SQL Custom
_extDBConnect = "extDB3" callExtension format [
    "9:ADD_DATABASE_PROTOCOL:%1:SQL_CUSTOM:%2:%3",
    DB_NAME,
    _sqlID,
    SQL_CUSTOM_FILENAME
];

// Database connection failed
if (_extDBConnect != "[1]") then {
    [LOG_CRITICAL, "Connection to database failed", _fnc_scriptName] call GW_server_fnc_log;

    // Set variable and exit
    missionNamespace setVariable ["GW_Database_Loaded_Server", false, true];
    false breakOut "main";
};

// Lock extDB
if (LOCK_DB isEqualTo 1) then {"extDB3" callExtension "9:LOCK"};

// Log success
[LOG_INFO, "Connected to database", _fnc_scriptName] call GW_server_fnc_log;

// Set variable and return true for success
missionNamespace setVariable ["GW_Database_Loaded_Server", true, true];
true;
