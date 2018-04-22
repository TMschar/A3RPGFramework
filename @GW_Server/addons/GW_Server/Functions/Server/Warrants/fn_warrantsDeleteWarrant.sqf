#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_warrantsDeleteWarrant.sqf
 *
 * Parameter(s):
 *     0: NUMBER - Warrants ID
 *
 * Description:
 *     Deletes a warrant from the database
 */
scriptName "GW_server_fnc_warrantsDeleteWarrant: main";
scopeName "main";

if !params [["_warrantsID", 0, [0]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Run query
["WARRANTS_DELETEWARRANT", 1, [_warrantsID]] call GW_db_fnc_queryDB;