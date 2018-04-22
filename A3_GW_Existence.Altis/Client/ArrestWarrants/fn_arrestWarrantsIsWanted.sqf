#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_arrestWarrantsIsWanted.sqf
*
*    Parameter(s):
*        0: OBJECT
*
*    Returns:
*        NOTHING
*
*    Description:
*        Checks if a unit is wanted
*/
scriptName "GW_client_fnc_arrestWarrantsIsWanted: main";
scopeName "main";

if !(params [
    ["_unit", objNull, [objNull]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

false
