#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_equipmentSafeChangeStatus.sqf
 *
 * Parameter(s):
 *     0: MODE
 *
 * Description:
 *     Change status of the RMP equipment safe
 */
#define MODE_LOCKED 0
#define MODE_UNLOCKED 1

scriptName "GW_client_fnc_equipmentSafeChangeStatus: main";
scopeName "main";

params [["_mode", 0, [0]]];

// Not server so check for errors
if (!isServer) then {
    if (playerSide != west) then {breakOut "main"};
    if (GW_player_sideRank < 7) then {breakOut "main"};
};

// Set variable and broadcast to all players
missionNamespace setVariable ["equipmentSafeStatus", _mode, true];