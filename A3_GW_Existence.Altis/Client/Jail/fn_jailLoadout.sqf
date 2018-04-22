#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_jailLoadout.sqf
 */
#define CONFIG_JAIL_CLOTHING (missionConfigFile >> "CfgJail" >> "Settings" >> "Loadout")

scriptName "GW_client_fnc_jailLoadout: main";
scopeName "main";

// Strip down Unit
[player] call GW_client_fnc_stripDownUnit;

// Get values from jail config
private _uniform = getText (CONFIG_JAIL_CLOTHING >> "uniform");
private _backpack = getText (CONFIG_JAIL_CLOTHING >> "backpack");
private _headgear = getText (CONFIG_JAIL_CLOTHING >> "headgear");
private _goggles = getText (CONFIG_JAIL_CLOTHING >> "goggles");

// Add clothing
if (_uniform != "") then {player forceAddUniform _uniform};
if (_backpack != "") then {player addBackpack _backpack};
if (_headgear != "") then {player addHeadgear _backpack};
if (_goggles != "") then {player addHeadgear _goggles};