#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_jailOnRelease.sqf
 */
scriptName "GW_client_fnc_jailOnRelease: main";
scopeName "main";

// Start again
[true] call GW_client_fnc_moneyPaycheckHandler;
[true] call GW_client_fnc_survivalHandler;

// Enable damage again
player allowDamage true;

// Destroy jail heads up display
["GW_Jail"] call GW_client_fnc_destroyResource;

// Reset
GW_jailHUD_jailDisplayName = nil;
GW_jailHUD_sentenceTime = nil;
GW_jailHUD_reason = nil;
GW_jailHUD_startTime = nil;
GW_jail_inJail = false;

// Notify unit
[HINT_NORMAL, "You have been released", "You have been released and transported back. Behave now!"] call GW_client_fnc_notificationsAdd;