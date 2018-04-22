#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_organizationsGetRank.sqf
*
*    Parameter(s):
*        0: OBJECT - Unit to check rank of
*
*    Returns:
*        NUMBER
*
*    Description:
*        Iterates through member array of said organization and checks a certain units rank
*/
scriptName "GW_client_fnc_organizationsGetRank: main";
scopeName "main";

if !(params [
    ["_unit", objNull, [objNull]]
]) exitWith {
    [LOG_WARNING, "NOT ENOUGH PARAMS PASSED", _fnc_scriptName] call GW_server_fnc_log
};

private _members = group _unit getVariable ["organization_members", []];
if (_members isEqualTo []) exitWith {-1};

// Select all entries where member
private _unitUID = getPlayerUID _unit;
private _memberMatches = _members select {
    _x params [
        ["_name", "", [""]],
        ["_uid", "", [""]],
        ["_rank", 0, [0]]
    ];

    // Select the element that equals the same ID of the unit to check
    _uid isEqualTo _unitUID
};

if (count _memberMatches > 1) exitWith {0};
_memberMatches params [["_memberElement", [], [[]]]];
_memberElement params [
    ["_name", "", [""]],
    ["_uid", "", [""]],
    ["_rank", 0, [0]]
];

_rank
