#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_setupVirtualInventoryContainer.sqf
*
*    Parameter(s):
*        0: OBJECT - Object to add virtual inventory to
*        1: NUMBER - Inventory space
*        2: ARRAY  - Array with items
*/
scriptName "GW_client_fnc_setupVirtualInventoryContainer: main";
scopeName "main";

if !params [
    ["_containerObject", objNull, [objNull]],
    ["_containerSpace", 0, [0]],
    ["_containerItems", [], [[]]]
] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Set properties of object
_containerObject setVariable ["virtualinventory_space", _containerSpace, true];
_containerObject setVariable ["virtualinventory_items", _containerItems, true];

// New debug log entry
[
    format [
        "Container setup with virtual inventory (%1:%2:%3)",
        _containerObject,
        _containerSpace,
        _containerItems
    ],
    _fnc_scriptName
] call GW_ext_fnc_loggingDebugLog