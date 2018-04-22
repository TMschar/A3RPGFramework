#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_organizationsInitPlayerRequest.sqf
 *
 * Parameter(s):
 *     0: STRING - Name of variable
 *     1: ARRAY  - Array containing values from variable
 *
 * Description:
 *     Initializes organistaion and creates a group, then sets all variables to that group and remoteexecs setup to client
 */
scriptName "GW_server_organizationsInitPlayerRequest: main";
scopeName "main";

if (
    !params
    [
        ["_variableName", "", [""]],
        ["_variableValue", [], [[]]]
    ]
) throw "Expected parrameters";

_variableValue params
[
    ["_unit", objNull, [objNull]],
    ["_overrideArguments", [], [[]]]
];

// Log
[LOG_INFO, format ["Organization data requested for %1:%2", name _unit, getPlayerUID _unit], _fnc_scriptName] call GW_server_fnc_log;

// Set organization query depending on if it's a new organization or not, if new organization, _overrideArguments will be filled with elements
private _organizationQuery = [];
if (_overrideArguments isEqualTo []) then {
    //diag_log "no override arguments";

    private _queryIdentifier = format ["%2%1%2", getPlayerUID _unit, "%"];
    _organizationQuery = ["ORGANIZATIONS_RECEIVE_BYIDENTIFIER", 2, [_queryIdentifier]] call GW_db_fnc_queryDB;

    // No organization data so exit and
    if (_organizationQuery isEqualTo []) then
    {
        [grpNull, false] remoteExecCall ["GW_client_fnc_organizationsInitPlayerResponse", _unit];
        breakOut "main";
    };

    // Handle for multiple organizations returned
    if (count _organizationQuery > 1) then
    {
        [LOG_CRITICAL, format ["Array larger than 1 element", name _unit, getPlayerUID _unit], _fnc_scriptName] call GW_server_fnc_log;
        [grpNull, true] remoteExecCall ["GW_client_fnc_organizationsInitPlayerResponse", _unit];
        breakOut "main";
    };
}
else
{
    if !(
        _overrideArguments params
        [
            ["_name", "", [""]],
            ["_tag", "", [""]],
            ["_initialMembers", [], [[]]]
        ]
    ) throw "Param error";

    _organizationQuery =
    [
        [
            getPlayerUID _unit,                     // Owner UID
            _tag,                                   // Organization Tag
            _name,                                  // Organization Name
            0,                                      // Organization Bank
            0,                                      // Organization Points
            _initialMembers                         // Initial Organization Members
        ]
    ];
};

// Sort out organization data
_organizationQuery params [["_organizationData", [], [[]]]];
if !(_organizationData params [
    ["_ownerID", "", [""]],
    ["_tag", "", [""]],
    ["_name", "", [""]],
    ["_bank", 0, [0]],
    ["_points", 0, [0]],
    ["_members", [], [[]]]
]) exitWith {
    [LOG_WARNING, localize "STR_GW_SERVER_LOG_PARAMERROR", _fnc_scriptName] call GW_server_fnc_log;
    [grpNull] remoteExecCall ["GW_client_fnc_organizationsInitPlayerResponse", _unit]
};

private _organizationVariableName = "organization_" + _ownerID;
private _group = missionNamespace getVariable [_organizationVariableName, grpNull];

// If group is NULL, we exit here since it doesn't
// need to set variables and such again on the group.
if (!isNull _group) exitWith
{
    [_group, false] remoteExecCall ["GW_client_fnc_organizationsInitPlayerResponse", _unit];
};

_group = group _unit;

// Hotfix (experimental fix) for players joining random gangs
if (count units _group > 1) then
{
    private _newGroup = createGroup (side _group);
    _group = _newGroup;
};

// Set group in MNS
missionNamespace setVariable [_organizationVariableName, _group];

// Set object variables
_group setVariable ["organization_id", _ownerid, true];
_group setVariable ["organization_tag", _tag, true];
_group setVariable ["organizationName", _name, true];
_group setVariable ["organization_bank", _bank, true];
_group setVariable ["organization_points", _points, true];
_group setVariable ["organization_members", _members, true];

// Set group ID
_group setGroupIdGlobal [_tag];

// Send response to client
[_group, false] remoteExecCall ["GW_client_fnc_organizationsInitPlayerResponse", _unit];
