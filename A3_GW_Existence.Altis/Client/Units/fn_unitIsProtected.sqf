#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_unitIsProtected.sqf
*
* Parameter(s):
*     0 (REQUIRED): OBJECT - Unit to check if is protected or not
*
* Returns:
*    BOOLEAN
*
* Description:
*     Checks if a unit is protected or not. Especially useful for example admins
*     who do not want to be seen on things like keychain and similar.
*/
scriptName "GW_client_fnc_unitIsProtected: main";
scopeName "main";

if !params [["_unit", objNull, [objNull]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

_unit getVariable ["invisible", false]