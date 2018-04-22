#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_bleedoutReset.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): OBJECT  - Unit to reset
 *     1 (OPTIONAL): BOOLEAN - Was revived (true/false)
 *
 * Throws:
 *     Exception if unit is NULL
 *
 * Description:
 *     Reset player things when a player either gets revived or respawned
 */
scriptName "GW_client_fnc_bleedoutReset: main";
scopeName "main";

params [["_unit", objNull, [objNull]], ["_revived", false, [true]]];

if (isNull _unit) throw "Unit is NULL";

// Remove eachframe handler
removeMissionEventHandler ["EachFrame", GW_bleedoutKilled_eachFrameHandle];

// Reset variables
GW_bleedoutKilled_eachFrameHandle = nil;
GW_bleedoutKilled_logDeath = nil;
GW_bleedoutKilled_killed = nil;
GW_player_killedLoadout = nil;
GW_player_killedItems = nil;
GW_player_disableFire = nil;

// Reset variables
_unit setVariable ["surrendered", false, true];

// Start handlers again
[true] call GW_client_fnc_playersSyncHandler;
[true] call GW_client_fnc_survivalHandler;
[true] call GW_client_fnc_moneyPaycheckHandler;

// Destroy screen effects
GW_bleedoutRespawn_ppEffect1 ppEffectEnable false;
GW_bleedoutRespawn_ppEffect2 ppEffectEnable false;
ppEffectDestroy [GW_bleedoutRespawn_ppEffect1, GW_bleedoutRespawn_ppEffect2];

// Reload
[] call GW_client_fnc_initSetPlayerSettings;
[] call GW_client_fnc_addActions;

// Destroy and load HUD
["GW_Bleedout"] call GW_client_fnc_destroyResource;
["GW_HUD"] call GW_client_fnc_createResource;

if (_revived) then {
    // Smooth transition to default animation
    _unit playMove "AmovPercMstpSlowWrflDnon";
} else {
    // Reset animation
    [_unit, ""] remoteExecCall ["GW_client_fnc_syncAnimation", -2];

    // Reset restrained
    _unit setVariable ["restrained", false, true];

    // Reset gear
    [[], missionNamespace, "GW_player_gear", str playerSide, []] call GW_client_fnc_dictSetValueByKey;

    // Reset Hunger and Thirst
    [[], missionNamespace, "GW_Player_bodyStats", "thirst", 0] call GW_client_fnc_dictSetValueByKey;
    [[], missionNamespace, "GW_Player_bodyStats", "hunger", 0] call GW_client_fnc_dictSetValueByKey;
};
