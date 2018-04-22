#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_virtualInventoryGetItemInfo.sqf
*
* Parameter(s):
*     0: STRING - Class name of item
*
* Returns:
*     ARRAY
*
* Description:
*     Returns information about a item within the virtual inventory system
*/
#define CONFIG_ITEMS (missionConfigFile >> "CfgVirtualItems" >> "Items")

scriptName "GW_client_fnc_virtualInventoryGetItemInfo";
scopeName "main";

if !params [["_className", "", [""]]] exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

// Item class
private _itemClass = CONFIG_ITEMS >> _className;

// Define item properties
private _displayName = getText (_itemClass >> "displayName");
private _condition = getText (_itemClass >> "condition");
private _weight = getNumber (_itemClass >> "weight");
private _buyPrice = getNumber (_itemClass >> "buy");
private _sellPrice = getNumber (_itemClass >> "sell");
private _illegal = getNumber (_itemClass >> "illegal") isEqualTo 1;
private _iconPath = getText (_itemClass >> "icon");
private _edible = getNumber (_itemClass >> "edible") isEqualTo 1;
private _healthIncrease = getNumber (_itemClass >> "healthIncrease");
private _function = getText (_itemClass >> "function");
private _type = getNumber (_itemClass >> "type");

// Return
[
    _displayName,
    _iconPath,
    _weight,
    _function,
    _condition,
    [
        _buyPrice,
        _sellPrice
    ],
    [
        _edible,
        _type,
        _healthIncrease
    ],
    _illegal
];