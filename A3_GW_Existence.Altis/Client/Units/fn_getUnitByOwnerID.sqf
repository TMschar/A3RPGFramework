#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_getUnitByOwnerID.sqf
*
* Parameter(s):
*     0: NUMBER - Owner ID of desired unit
*
* Returns:
*     OBJECT - Unit matching owner id passed in as an argument
*/
scriptName "GW_client_fnc_getUnitByOwnerID: main";
scopeName "main";

if !(isServer) exitWith {["This function is only beneficial for server", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};
if !(params [["_ownerID", 0, [0]]]) exitWith {["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

private _unit = objNull;
{
    if (owner _x isEqualTo _ownerID) exitWith {_unit = _x};
    true;
} count ALLPLAYERSNOHC;

// Return
_unit breakOut "main";