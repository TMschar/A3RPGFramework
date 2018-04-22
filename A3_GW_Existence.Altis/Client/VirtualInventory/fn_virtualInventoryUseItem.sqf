#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_virtualInventoryUseItem.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): STRING - Item classname
 *     1 (OPTIONAL): ARRAY  - Arguments
 *
 * Description:
 *     Used for using an item, pass class and function will do all the work for you.
 */
#define CONFIG_ITEMS missionConfigFile >> "CfgVirtualItems" >> "Items"
#define SHOW_MESSAGE false
#define REMOVE 0

scriptName "GW_client_fnc_virtualInventoryUseItem: main";
scopeName "main";

params [["_itemClassname", "", [""]], ["_arguments", [], [[]]]];
if (_itemClassname isEqualTo "") exitWith {};

private _configClass = CONFIG_ITEMS >> _itemClassname;

// Error checks
if !(isClass _configClass) exitWith {};
if !(isText _function) exitWith {
    [HINT_WARNING, "Item not usable", "This item cannot be used or eaten."] call GW_client_fnc_notificationsAdd
};

private _displayName = getText (_configClass >> "displayName");
private _function = getText (_configClass >> "function");
private _code = missionNamespace getVariable [_function, {}];

// Call function
if !(_arguments call _code) exitWith {};

// Delete item
[player, _itemClassname, REMOVE, SHOW_MESSAGE] call GW_client_fnc_virtualInventoryChange;

// Debug log
[format ["Used item (%1)", _displayName], _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
