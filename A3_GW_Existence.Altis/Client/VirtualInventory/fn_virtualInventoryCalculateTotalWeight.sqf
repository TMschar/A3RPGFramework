#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_virtualInventoryCalculateTotalWeight.sqf
*
*    Parameter(s):
*        0: (REQUIRED) OBJECT - Object to calculate total weight of
*
*    Returns:
*        NUMBER
*
*    Description:
*        Adds all inventory item spaces together and returns a number
*/
scriptName "GW_client_fnc_virtualInventoryCalculateTotalWeight: main";
scopeName "main";

if !(params [["_object", objNull, [objNull]]]) exitwith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

private _inventory = _object call GW_client_fnc_virtualInventoryReturn;
private _weight = 0;
{
    private _itemWeight = getNumber (missionConfigFile >> "CfgVirtualItems" >> "Items" >> _x >> "weight");
    _weight = _weight + _itemWeight;

    true
} count _inventory;

_weight
