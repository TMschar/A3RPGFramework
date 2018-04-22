#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_organizationCreateRequest.sqf
*
*    Parameter(s):
*        0: STRING - Name of variable
*        1: ARRAY  - Array with elements passed
*
*    Returns:
*        NOTHING
*
*    Description:
*        Function called from PVAR EVH, used to create an organization, if applicable, sends back to client and creates organization
*/
scriptName "GW_server_fnc_organizationCreateRequest: main";
scopeName "main";

if !(params [
    ["_variableName", "", [""]],
    ["_variableValue", [], [[]]]
]) exitWith {
    [LOG_WARNING, localize "STR_GW_SERVER_LOG_PARAMERROR", _fnc_scriptName] call GW_server_fnc_log
};

/**
 *  Parameters:
 *      0: STRING - Desired name for Organization
 *      1: STRING - Desired tag for Organization
 *      2: OBJECT - Creator of Organzation
 */
if !(_variableValue params [
    ["_name", "", [""]],
    ["_tag", "", [""]],
    ["_unit", objNull, [objNull]]
]) exitWith {
    [LOG_WARNING, localize "STR_GW_SERVER_LOG_PARAMERROR", _fnc_scriptName] call GW_server_fnc_log
};

private _unitUID = getPlayerUID _unit;
private _unitName = name _unit;
private _unitOwner = owner _unit;

private _groupID = group _unit getVariable ["organization_id", ""];
if !(_groupID isEqualTo "") exitWith {};

// Make sure no duplicate organizations are made (I.e. with same name or tag)
private _queryIdentifiers = [format ["%2%1%2", _name, "%"], format ["%2%1%2", _tag, "%"], format ["%2%1%2", _unitUID, "%"]];
private _queryOrganizations = ["ORGANIZATIONS_RECEIVE_BYIDENTIFIERALT", 2, _queryIdentifiers] call GW_db_fnc_queryDB;
if !(_queryOrganizations isEqualTo []) exitWith {
    [LOG_WARNING, localize "STR_GW_SERVER_LOG_ORGANIZATIONS_EXISTINGNAME", _fnc_scriptName] call GW_server_fnc_log;
    [0, "GW_Organizations_creationResponse", false, _unitOwner] call GW_ext_fnc_networkPublicVariable
};

// Insert organization to database
private _initialMembers = [[_unitName, _unitUID, 3]];
["ORGANIZATIONS_INSERT", 1, [_unitUID, _tag, _name, _initialMembers]] call GW_db_fnc_queryDB;

// Setup organization for player
["NONE", [_unit, [_name, _tag, _initialMembers]]] call GW_server_fnc_organizationsInitPlayerRequest;

// Send back response to client creation display
[0, "GW_Organizations_creationResponse", true, _unitOwner] call GW_ext_fnc_networkPublicVariable;

[LOG_INFO, format [localize "STR_GW_SERVER_LOG_ORGANIZATIONS_CREATED", _unitName, _unitUID, _name, _tag], _fnc_scriptName] call GW_server_fnc_log
