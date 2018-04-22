#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_jailSendToJail.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit to send to jail
 *     1: STRING - Jail Config Class
 *     2: NUMBER - Time for the sentence
 *
 * Throws:
 *     Exception when time is above maximum or below minimum
 */
#define CONFIG_JAIL_SETTINGS (missionConfigFile >> "CfgJail" >> "Settings")
#define MAX_TIME (getNumber (CONFIG_JAIL_SETTINGS >> "maxTime"))
#define MIN_TIME (getNumber (CONFIG_JAIL_SETTINGS >> "minTime"))

scriptName "GW_client_fnc_jailSendToJail: main";
scopeName "main";

if (!params [
    ["_unit", objNull, [objNull]],
    ["_jailClass", "", [""]],
    ["_sentenceTime", 0, [0]],
    ["_reason", "", [""]]
]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
};

if (!isPlayer _unit) exitWith {};
if (isNull _unit) exitWith {};

// Check for max and min time
if (_sentenceTime < MIN_TIME) throw format ["Min time is %1 minutes.", MIN_TIME / 60];
if (_sentenceTime > MAX_TIME) throw format ["Max time is %1 minutes.", MAX_TIME / 60];

// Send imprisonment request
[PVAR_SERVER_HC, "GW_jail_addInMate", [_unit, _sentenceTime, _reason, _jailClass]] call GW_ext_fnc_networkPublicVariable;

// Give experience points
private _arrestsAmount = missionNamespace getVariable ["GW_jailSendToJail_arrestsAmount", 1];
[LEVEL_VIGILANCE, 100 * _arrestsAmount, "Vigilance"] call GW_client_fnc_experienceCategoryAddExperience;

// Increase amount of arrests
GW_jailSendToJail_arrestsAmount = _arrestsAmount + 1;

// Add log entry
[LOG_INFO, format [
    "Requested to send %1:%2 to jail",
    name _unit,
    getPlayerUID _unit
], _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];