#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_licensingOpenVendor.sqf
*
*    Parameter(s):
*        0: STRING - Class of Licenses
*
*    Returns:
*        NOTHING
*
*    Description:
*        Main vendor function for opening display and passing vars to it
*/
scriptName "GW_client_fnc_licensingOpenVendor: main";
scopeName "main";

if !(params [
    ["_type", "", [""]]
]) exitWith {
    [LOG_WARNING, "Not enough params passed", _fnc_scriptName] call GW_server_fnc_log
};

GW_displayLicenses_licensesType = _type;
createDialog "GW_displayLicenses"
