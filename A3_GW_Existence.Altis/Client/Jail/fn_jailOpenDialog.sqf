#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_jailOpenDialog.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Target to send to jail
 */
scriptName "GW_client_fnc_jailOpenDialog: main";
scopeName "main";

// Set unit to send to jail
GW_jailOpenDisplay_targetUnit = param [0, objNull, [objNull]];

// Error checks
if (isNull GW_jailOpenDisplay_targetUnit) exitWith {};
if (!isPlayer GW_jailOpenDisplay_targetUnit) exitWith {};

// Create dialog
createDialog "GW_displayJail";