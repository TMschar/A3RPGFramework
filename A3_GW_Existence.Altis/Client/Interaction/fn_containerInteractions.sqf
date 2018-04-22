#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_containerInteractions.sqf
 *
 * Parameter(s):
 *     0: OBJECT
 */
#define ACTIONS GW_displayInteractionMenu_Actions

scriptName "GW_client_fnc_containerInteractions: main";
scopeName "main";

if (!params [["_target", objNull, [objNull]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (isNull _target) exitWith {};

ACTIONS pushback [
    "Virtual Inventory",
    "",
    "[_this] call GW_client_fnc_virtualInventoryRequestInventory",
    "inventory"
];