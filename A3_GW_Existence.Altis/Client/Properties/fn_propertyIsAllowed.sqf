#include "script_component.hpp"
/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: fn_propertyIsAllowed.sqf

    Parameter(s):
        0: OBJECT - Property to check

    Returns:
        BOOLEAN
*/
scriptName "GW_client_fnc_propertyIsAllowed: main";
scopeName "main";

if !(params [
    ["_target", objNull, [objNull]]
]) exitWith {[LOG_INFO, "NOT ENOUGH PARAMS PASSED", _fnc_scriptName] call GW_server_fnc_log};

([typeOf _target] call GW_client_fnc_propertyTypeName) in ["house", "garage", "safehouse"]
