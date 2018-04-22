#include "script_component.hpp"
/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: fn_propertyType.sqf

    Parameter(s):
        0: STRING - Class Name of Property

    Returns:
        STRING
*/
scriptName "GW_server_fnc_propertyType: main";
scopeName "main";

if !(params [
    ["_className", "", [""]]
]) exitWith {[LOG_INFO, "NOT ENOUGH PARAMS PASSED", _fnc_scriptName]};

private _propertiesConfig = missionConfigFile >> "CfgProperties" >> worldName;
private _propertyType = getNumber (_propertiesConfig >> _className >> "propertyType");

// Return empty string if property not available
if !(isClass (_propertiesConfig >> _className)) exitWith {""};

// Return type of property
[
    "house",
    "garage",
    "safehouse"
] select _propertyType;
