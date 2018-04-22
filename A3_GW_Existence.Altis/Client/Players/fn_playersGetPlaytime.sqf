#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_playersGetPlaytime.sqf
 *
 * Returns:
 *     NUMBER - Total Playtime
 *
 * Description:
 *     Returns total playtime on all factions
 */
scriptName "GW_client_fnc_playersGetPlaytime: main";
scopeName "main";

private _playtime = 0;
{
    _x params ["", "_sidePlaytime"];
    _playtime = _playtime + _sidePlaytime;
    true;
} count GW_player_playtime;

// Return total playtime
_playtime;
