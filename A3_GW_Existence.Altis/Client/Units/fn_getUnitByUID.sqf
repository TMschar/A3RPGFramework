#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_getUnitByUID.sqf
*
*    Parameter(s):
*        0: STRING - UID of object passed
*
*    Returns:
*        OBJECT
*
*    Description:
*        Iterates through all players on server (without Headless Client) and looks for any UID of player x equal to player passed
*/
scriptName "GW_client_fnc_getUnitByUID: main";
scopeName "main";

if !(params [
    ["_unitUID", "", [""]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

private _unit = objNull;
{
    scopeName "allPlayersLoop";
    if (getPlayerUID _x isEqualTo _unitUID) then {
        _unit = _x;
        breakOut "allPlayersLoop";
    };
    true
} count ALLPLAYERSNOHC;

_unit
