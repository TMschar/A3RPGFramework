#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_virtualInventoryIsOverweight.sqf
*
*    Parameter(s):
*        0: OBJECT - Container to check if it's overweighted
*
*    Returns:
*        BOOLEAN
*
*    Description:
*        Checks if an inventory is overweight or not
*/
scriptName "GW_client_fnc_virtualInventoryIsOverweight: main";
scopeName "main";

if !params [["_container", objNull, [objNull]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

private _totalContainerWeight = _container call GW_client_fnc_virtualInventoryCalculateTotalWeight;
private _containerInventorySpace = _container getVariable ["virtualinventory_space", 0];

// Return boolean
_containerInventorySpace < _totalContainerWeight