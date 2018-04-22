#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_getDisplay.sqf
*
*    Parameter(s):
*        0: STRING - ClassName
*
*    Returns:
*        DISPLAY
*
*    Description:
*        Returns a active display (if active) connected to a display class
*/
scriptName "GW_client_fnc_getDisplay: main";
scopeName "main";

if !params [["_displayClass", "", [""]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Return display
uiNamespace getVariable [_displayClass, displayNull]
