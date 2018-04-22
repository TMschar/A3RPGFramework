#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_banksBuildings.sqf
 *
 * Returns:
 *     ARRAY
 */
scriptName "GW_client_fnc_banksBuildings: main";
scopeName "main";

private _buildings = [];
{
    private _classname = getText (_x >> "classname");
    _buildings pushback _classname;
} forEach ("true" configClasses (missionConfigFile >> "CfgBanks" >> worldName));

_buildings;