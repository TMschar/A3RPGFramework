#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_onFiredMan.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit that fired
 *     1: STRING - Weapon Class
 */
scriptName "GW_client_fnc_onFiredMan: main";
scopeName "main";

params [["_unit", objNull, [objNull]], ["_weapon", "", [""]]];

// Only allow one shot per second for pistol tasers.
if (playerSide isEqualTo west && {_weapon in ["hgun_Pistol_heavy_01_MRD_F", "hgun_Pistol_heavy_01_F", "hgun_Pistol_heavy_01_snds_F"]}) then {
    _unit setAmmo [_weapon, 0];
    uiSleep 1;
    _unit setAmmo [_weapon, 1];
};