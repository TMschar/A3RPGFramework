#include "script_component.hpp"
/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: fn_organizationsChangeRankRequest.sqf

    Parameter(s):
        NONE

    Returns:
        NOTHING

    Description:
        NO DESCRIPTION
*/
scriptName "GW_server_fnc_organizationsChangeRankRequest: main";
scopeName "main";

if !(param [1, [], [[]]] params [
    ["_unit", objNull, [objNull]],
    ["_newRank", 0, [0]]
]) exitWith {
    [LOG_WARNING, "NOT ENOUGH PARAMS PASSED", _fnc_scriptName] call GW_server_fnc_log
};
