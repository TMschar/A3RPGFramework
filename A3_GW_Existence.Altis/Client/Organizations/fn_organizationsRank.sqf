#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_organizationsRank.sqf
*
*    Parameter(s):
*        0: NUMBER
*
*    Returns:
*        STRING
*
*    Description:
*        Converts a number to rank (string)
*/
scriptName "GW_client_fnc_organizationsRank: main";
scopeName "main";

if !(params [
    ["_rank", 0, [0]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log;
    ""
};

if (_rank isEqualTo -1) exitWith {
    ""
};

private _ranks = getArray (missionConfigFile >> "CfgOrganizations" >> "Member_Management" >> "Rank_Array");
private _rank = _ranks select _rank;
if (isNil "_rank") then {
    "" breakOut "main"
} else {
    _rank breakout "main"
}
