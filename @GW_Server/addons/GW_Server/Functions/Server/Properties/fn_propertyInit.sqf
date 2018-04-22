#include "script_component.hpp"
/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: fn_propertyInit.sqf

    Parameter(s):
        NONE

    Returns:
        NOTHING
*/
scriptName "GW_server_fnc_propertyInit: main";
scopeName "main";

private _propertiesQueryResult = ["PROPERTIES_RECEIVE", 2, [worldName]] call GW_db_fnc_queryDB;
if (_propertiesQueryResult isEqualTo []) exitWith {
    [LOG_INFO, "NO PROPERTIES TO SETUP", _fnc_scriptName] call GW_server_fnc_log
};

{
    _x call GW_server_fnc_propertySetup;
    true
} count _propertiesQueryResult
