#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_organizationsDisbandRequest.sqf
*
*    Parameter(s):
*        0: STRING - Name of variable set, passed from PVAR EventHandler
*        1: ARRAY  - Array with arguments passed from PVAR EventHandler
*
*    Returns:
*        NOTHING
*
*    Description:
*        Disbands organization and deletes database entry
*/
scriptName "function: main";
scopeName "main";

if !(params [
    ["_variableName", "", [""]],
    ["_variableValue", [], [[]]]
]) exitWith {
    [LOG_WARNING, localize "STR_GW_SERVER_LOG_PARAMERROR", _fnc_scriptName] call GW_server_fnc_log
};

/**
 *  Parameters:
 *      0: GROUP  - Group to disband organization for
 *      1: OBJECT - Unit that requested disbandment
 */
if !(_variableValue params [
    ["_group", grpNull, [grpNull]],
    ["_unit", objNull, [objNull]]
]) exitWith {
    [LOG_WARNING, localize "STR_GW_SERVER_LOG_PARAMERROR", _fnc_scriptName] call GW_server_fnc_log
};

// Send deletion query to database
private _ownerID = _group getVariable ["organization_id", ""];
["ORGANIZATIONS_DELETE_ORGANIZATION", 1, [_ownerID]] call GW_db_fnc_queryDB;

private _id = _group getVariable ["organization_id", ""];
private _tag = _group getVariable ["organization_tag", ""];
private _name = _group getVariable ["organizationName", ""];
private _bank = _group getVariable ["organization_bank", 0];
private _points = _group getVariable ["organization_points", 0];
private _members = _group getVariable ["organization_members", []];

// Delete group when it goes empty
_group deleteGroupWhenEmpty true;

// Send back to client that organization has been disbanded and log
[PVAR_CLIENT, "GW_Player_OrganizationDisbanded", true, owner _unit] call GW_ext_fnc_networkPublicVariable;
[LOG_INFO, format ["Organization has been deleted per request of owner (%1:%2:%3:%4:%5:%6)", _id, _tag, _name, _bank, _points, _members], _fnc_scriptName] call GW_server_fnc_log
