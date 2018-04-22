#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_organizationsMemberAddRequest.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): STRING - PVAR eventhandler variable name
 *     1 (REQUIRED): ARRAY  - Array with arguments from PVAR call
 */
scriptName "GW_server_fnc_organizationsMemberAddRequest: main";
scopeName "main";

// PVAR called - debug log
["Member add request PVAR called", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;

// Get parameters as well as arguments and make sure they are passed to the function
if !(params [ ["_variableName", "", [""]], ["_array", [], [[]]] ]) throw "Expected parameters";
if !(_array params [ ["_group", grpNull, [grpNull]], ["_unit", objNull, [objNull]] ]) throw "Expected arguments";

// Null error checks
if (isNull _group) exitWith { ["Group is null", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (isNull _unit) exitWith { ["Unit is null", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

private _organizationID = _group getVariable ["organization_id", ""];
private _organizationMembers = _group getVariable ["organization_members", []];
private _organizationName = _group getVariable ["organizationName", ""];

// Error check
if (_organizationID isEqualTo "" || {_organizationMembers isEqualTo []} || {_organizationName isEqualTo ""}) throw "Some information about organization is bad";

private _unitName = name _unit;
private _unitUID = getPlayerUID _unit;

// Add unit to organization array and make sure that its not already there
private _elementIndex = _organizationMembers pushbackUnique [_unitName, _unitUID, 1];
if (_elementIndex isEqualTo -1) throw "Information already exists";

// Broadcast new array of members
_group setVariable ["organization_members", _organizationMembers, true];

// Update members in DB (run query)
["ORGANIZATIONS_UPDATE_MEMBERS", 1, [_organizationMembers, _organizationID]] call GW_db_fnc_queryDB;

// Log
[
    LOG_INFO,
    format
    [
        "%1:%2 has been added to an organization (%3:%4)",
        _unitName,
        _unitUID,
        _organizationID,
        _organizationName
    ],
    _fnc_scriptName
] call GW_server_fnc_log;
