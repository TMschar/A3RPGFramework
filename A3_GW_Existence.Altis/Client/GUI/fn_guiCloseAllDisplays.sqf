#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_guiCloseAllDisplays.sqf
*
*    Parameter(s):
*        NONE
*
*    Returns:
*        NOTHING
*
*    Description:
*        Closes all displays except for whitelisted ones. Good for usage on death, logout etc.
*/
scriptName "GW_client_fnc_guiCloseAllDisplays: main";
scopeName "main";

disableSerialization;

private _displayWhitelist = [
    findDisplay 0,
    findDisplay 8,
    findDisplay 12,
    findDisplay 17,
    findDisplay 18,
    findDisplay 46,
    findDisplay 70
];
private _displays = allDisplays select {!(_x in _displayWhitelist)};

{
    _x closeDisplay 2;
    true
} count _displays
