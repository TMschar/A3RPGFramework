#include "script_component.hpp"
/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: fn_propertyOwned.sqf

    Parameter(s):
        0: OBJECT - Property to check

    Returns:
        BOOLEAN
*/
scriptName "GW_client_fnc_propertyOwned: main";
scopeName "main";

if !(params [
    ["_property", objNull, [objNull]]
]) exitWith {[LOG_WARNING, "NOT ENOUGH PARAMS PASSED", _fnc_scriptName] call GW_server_fnc_log};

private _owner = _property getVariable ["propertyOwner", ""];

!(_owner isEqualTo "")
