#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_guiDisplayActive.sqf
*
*    Parameter(s):
*        0: STRING - Display Class
*
*    Returns:
*        BOOLEAN
*
*    Description:
*        Checks if a display is active
*/
scriptName "GW_client_fnc_guiDisplayActive: main";
scopeName "main";

if !params [["_class", "", [""]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Return bool (true or false)
!isNull (uiNamespace getVariable [_class, displayNull])
