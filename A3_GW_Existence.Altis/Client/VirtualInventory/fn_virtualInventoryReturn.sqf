#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_virtualInventoryGet.sqf
*
*    Parameter(s):
*        0: OBJECT - Container which inventory is attached to
*
*    Returns:
*        ARRAY
*
*    Description:
*        Returns virtual inventory from an object
*/
scriptName "GW_client_fnc_virtualInventoryReturn: main";
scopeName "main";

if !params [["_container", objNull, [objNull]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Return
_container getVariable ["virtualinventory_items", []]
