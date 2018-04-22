#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_organizationsInitPlayerResponse.sqf
*
*    Parameter(s):
*        0: GROUP    - Group to add player to
*        1: BOOLEAN  - End mission (for fails etc...)
*
*    Returns:
*        NOTHING
*
*    Description:
*        Receives response from server and puts player in group
*/
scriptName "GW_client_fnc_organizationsInitPlayerResponse: main";
scopeName "main";

if !(params [
    ["_group", grpNull, [grpNull]],
    ["_endMission", false, [false]]
]) exitWith {
    [LOG_WARNING, "PARAM ERROR", _fnc_scriptName] call GW_server_fnc_log
};

if _endMission exitWith {endMission "GW_DataError"};
if (isNull _group) exitWith {GW_Organizations_Initiated = true};

// Join group
[player] joinSilent _group;

// Log
private _name = _group getVariable ["organizationName", ""];
private _tag = _group getVariable ["organization_tag", ""];
[LOG_INFO, format ["Joined Group (%1:%2)", _name, _tag], _fnc_scriptName] call GW_server_fnc_log;

GW_Organizations_Initiated = true
