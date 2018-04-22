#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_virtualInventoryCanAddItem.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Object attached to virtual container
 *     1: STRING - Class name of item
 *
 * Returns:
 *     BOOLEAN
 *
 * Description:
 *     Checks if unit has enough inventory to carry the item
 */
scriptName "GW_client_fnc_virtualInventoryCanAddItem: main";
scopeName "main";

if !(params [["_container", objNull, [objNull]], ["_className", "", [""]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

private _itemConfigClass = missionConfigFile >> "CfgVirtualItems" >> "Items" >> _className;
private _itemWeight = getNumber (_itemConfigClass >> "weight");
private _totalWeight = _container call GW_client_fnc_virtualInventoryCalculateTotalWeight;
private _inventorySpace = _container getVariable ["virtualinventory_space", 0];

!((_itemWeight + _totalWeight) > _inventorySpace)
