#include "script_component.hpp"
/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: fn_moveUnitIntoVehicle.sqf

    Parameter(s):
        NONE

    Returns:
        NOTHING
*/
scriptName "GW_client_fnc_moveUnitIntoVehicle: main";
scopeName "main";

if !(params [
    ["_unit",    objNull, [objNull]],
    ["_vehicle", objNull, [objNull]],
    ["_type",    0,       [0]]
]) exitWith {[LOG_WARNING, "NOT ENOUGH PARAMETERS PASSED", _fnc_scriptName] call GW_server_fnc_log};

switch _type do {
    case 0: {
        _unit moveInDriver _vehicle
    };
    case 1: {
        _unit moveInCargo _vehicle
    }
};
