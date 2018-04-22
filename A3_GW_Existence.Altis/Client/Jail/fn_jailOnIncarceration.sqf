#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_jailOnIncarceration.sqf
 *
 * Parameter(s):
 *     0: STRING - Displayname of Jail
 *     1: NUMBER - Time of sentence
 *     2: NUMBER - Start time of sentence
 *     3: STRING - Reason of sentence
 */
scriptName "GW_client_fnc_jailOnIncarceration: main";
scopeName "main";

params [["_jailDisplayName", "", [""]], ["_sentenceTime", 0, [0]], ["_startTime", 0, [0]], ["_reason", "", [""]]];

// Close all displays
[] call GW_client_fnc_guiCloseAllDisplays;

// Unrestrain if restrained
if (player getVariable ["restrained", false]) then {
    player setVariable ["restrained", false, true];
};

// Load player with the jail loadout
[] call GW_client_fnc_jailLoadout;

// Hold
[false] call GW_client_fnc_moneyPaycheckHandler;
[false] call GW_client_fnc_survivalHandler;

// Disable damage
player allowDamage false;

// Notify
[HINT_AMBER, "You have been arrested", "You have been arrested and you are now in jail."] call GW_client_fnc_notificationsAdd;

// Store in global variables so they can be
// accessed by the heads up display.
GW_jailHUD_jailDisplayName = _jailDisplayName;
GW_jailHUD_sentenceTime = _sentenceTime;
GW_jailHUD_reason = _reason;
GW_jailHUD_startTime = _startTime;
GW_jail_inJail = true;

// Create jail heads up display
["GW_Jail"] call GW_client_fnc_createResource;