#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_virtualInventoryHasItem.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Container to check
 *     1: STRING - Item Class Name
 *
 * Returns:
 *     BOOLEAN
 *
 * Description:
 *     Checks if unit has a item in their virtual inventory
 */
scriptName "GW_client_fnc_virtualInventoryHasItem: main";
scopeName "main";

if (!params [["_container", objNull, [objNull]], ["_item", "", [""]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
};

private _inventory = _container getVariable ["virtualinventory_items", []];
toLower _item in _inventory
