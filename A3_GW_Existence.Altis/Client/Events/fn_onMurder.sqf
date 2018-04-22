#include "script_component.hpp"
/*
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_onMurder.sqf
 *
 * Parameter(s):
 *     0: STRING
 *     1: ANYTHING
 *         0: OBJECT
 *         1: STRING
 *         2: NUMBER
 */
scriptName "GW_client_fnc_onMurder";
scopeName "main";

params [["_variableName", "", [""]], ["_variableValue", [], [[]]]];
_variablevalue params [["_unitKilled", objNull, [objNull]], ["_weaponUsed", "", [""]], ["_distance", 0, [0]]];

// Play Sound
playSound "addItemOK";

// Show notification
private _nameVictim = [_unitKilled] call GW_client_fnc_playersGetName;
private _weapon = getText (configFile >> "CfgWeapons" >> currentWeapon player >> "displayName");
private _killText = format ["Killed %1 WITH %2 FROM %3 METRES.", _nameVictim, _weapon, _distance];

// Show notification
[HINT_NORMAL, "Incapacitated Man", _killText] call GW_client_fnc_notificationsAdd;

// Give experience (only if not in a green zone)
private _safezoneMarkers = ["green_zone_kavala", "green_zone_pyrgos"];
if ({(getPos player) distance (getPos _x) > 350} count _safezoneMarkers > 0) then
{
    private _level = [LEVEL_WEAPONS] call GW_client_fnc_experienceGetCategoryLevel;
    private _experiencePayout = 50 * _level;
    [LEVEL_WEAPONS, _experiencePayout, "Sharpshooter"] call GW_client_fnc_experienceCategoryAddExperience;
};

// Log
[LOG_INFO, format ["Killed %1:%2", name _unitKilled, getPlayerUID _unitKilled], _fnc_scriptName] call GW_server_fnc_log;