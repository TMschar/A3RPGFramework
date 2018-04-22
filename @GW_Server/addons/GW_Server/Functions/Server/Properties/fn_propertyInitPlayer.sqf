#include "script_component.hpp"
/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: fn_propertyInitPlayer.sqf

    Parameter(s):
        0: OBJECT

    Returns:
        NOTHING
*/
scriptName "GW_server_fnc_propertyInitPlayer: main";
scopeName "main";

if !(params [
    ["_unit", objNull, [objNull]],
    ["_orgName", "", [""]]
]) exitWith {
    [LOG_WARNING, "NOT ENOUGH PARAMS PASSED", _fnc_scriptName] call GW_server_fnc_log
};

// Get personal properties
private _queryUnitProperties = ["PROPERTIES_RECEIVE_BYOWNERNAME", 2, [getPlayerUID _unit, worldName]] call GW_db_fnc_queryDB;
private _queryOrgProperties = ["PROPERTIES_RECEIVE_BYOWNERNAME", 2, [_orgName, worldName]] call GW_db_fnc_queryDB;

if ((_queryUnitProperties + _queryOrgProperties) isEqualTo []) exitWith {
    [false] remoteExecCall ["GW_client_fnc_propertySetupClient", _unit]
};

// Setup all properties
{
    _x params [
        ["_propertyType",     0,  [0] ],
        ["_propertyOwner",    "", [""]],
        ["_propertyLocation", [], [[]]]
    ];
    [true, _propertyType, _propertyOwner, _propertyLocation] remoteExecCall ["GW_client_fnc_propertySetupClient", _unit];
    true
} count (_queryUnitProperties + _queryOrgProperties);
