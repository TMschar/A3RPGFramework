#include "script_component.hpp"
/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: fn_organizationsChangeRank.sqf

    Parameter(s):
        NONE

    Returns:
        NOTHING

    Description:
        NO DESCRIPTION
*/
scriptName "GW_client_fnc_organizationsChangeRank: main";
scopeName "main";

if !(params [
    ["_unit", objNull, [objNull]],
    ["_newRank", 0, [0]]
]) exitWith {
    [LOG_WARNING, "NOT ENOUGH PARAMS PASSED", _fnc_scriptName] call GW_server_fnc_log
};

try {
    if ([player] call GW_client_fnc_organizationsGetRank < 3) throw "Attempted to promote a player without being owner";
    if (group _unit getVariable ["organizationName", ""] isEqualTo "") throw "Not in an organization";
    if (isNull _unit) throw "Unit is NULL";

    // Send to server
    [1, "GW_ORGANIZATIONS_CHANGERANKREQUEST", [_unit, _newRank]] call GW_ext_fnc_networkPublicVariable
} catch {
    [LOG_WARNING, _exception, _fnc_scriptName] call GW_server_fnc_log
}
