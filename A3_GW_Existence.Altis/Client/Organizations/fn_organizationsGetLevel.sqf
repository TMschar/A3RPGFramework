#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_organizationsGetLevel.sqf
*
*    Parameter(s):
*        0: GROUP - Group to get level for
*
*    Returns:
*        NUMBER - Level
*
*    Description:
*        Checks points of group (organization) towards the level configuration for organizations and returns level
*/
scriptName "GW_client_fnc_organizationsGetLevel: main";
scopeName "main";

if !(params [
    ["_group", grpNull, [grpNull]]
]) exitWith {
    [LOG_WARNING, "NOT ENOUGH PARAMS PASSED", _fnc_scriptName] call GW_server_fnc_log
};

private _points = _group getVariable ["organization_points", 0];
private _level = 1;
_level
