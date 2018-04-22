#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_playersGetName.sqf
*
* Parameter(s):
*     0: OBJECT - Unit to get name for
*
* Returns:
*     STRING
*/
scriptName "GW_client_fnc_playersGetName: main";
scopeName "main";

if !params [["_unit", objNull, [objNull]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

if !(isPlayer _unit) exitWith {name _unit};

private _cfgPrefixes = missionConfigFile >> "CfgGroundWars" >> "PlayerSettings" >> "Factions" >> "Tags" >> "Prefixes";
private _group = group _unit;
private _prefix = switch side group _unit do {
    case west: {getText (_cfgPrefixes >> "blufor")};
    case independent: {getText (_cfgPrefixes >> "independent")};
    case civilian: {_group getVariable ["organization_tag", ""]};
    default {""}
};

if (_prefix isEqualTo "") exitWith {name _unit};

// Return
format ["%1 %2", _prefix, name _unit]
