#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_banksOnBreach.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Building that got breached
 *
 * Description:
 *     Notifies all people in the world of the bank breach
 */
scriptName "GW_server_fnc_banksOnBreach: main";
scopeName "main";

params [["_building", objNull, [objNull]]];

// Play sound
[_building, "Drill"] remoteExecCall ["GW_client_fnc_say3D", -2];

// Get bank information
private _bankClass = _building getVariable ["bankClass", ""];
private _bank = missionConfigFile >> "CfgBanks" >> worldName >> _bankClass;
private _displayName = getText (_bank >> "displayName");

// Notify all players about the robbery
[HINT_WARNING, format [
    "%1's Silent Alarm",
    _displayName
], format [
    "The silent alarm of the %1 has been triggered by someone drilling into the vault.",
    _displayName
]] remoteExecCall ["GW_client_fnc_notificationsAdd", -2];