#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_actionOpenPhysicalInventory.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit to search inventory of
 */
scriptName "GW_client_fnc_actionOpenPhysicalInventory: main";
scopeName "main";

if (!params [["_unit", objNull, [objNull]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Start progress bar
if (["OpenPhysicalInventory"] call GW_client_fnc_startProgress) then {
    // Open inventory
    player action ['Gear', _unit];

    // Log
    [LOG_INFO, "Opened another players inventory", _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];
};