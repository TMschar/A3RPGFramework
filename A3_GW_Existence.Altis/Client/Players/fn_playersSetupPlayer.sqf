#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_playersSetupPlayer.sqf
 *
 * Parameter(s):
 *     0: BOOLEAN - Set Group ID
 *
 * Description:
 *     Sets up a player
 */
scriptName "GW_client_fnc_playersSetupPlayer: main";
scopeName "main";

// Check for whitelisting
if (!(playerSide isEqualTo civilian) && {call GW_player_sideRank < 1}) exitWith {
    // Sync
    [false] call GW_client_fnc_playerSyncRequest;

    // Kick
    [] spawn {
        uiSleep 2;
        endMission "GW_accessDenied";
    };
};

params [["_setGroupID", false, [false]]];

// Setup gear if not any gear is saved
private _gear = [[], missionNamespace, "GW_player_gear", str playerSide] call GW_client_fnc_dictGetValueByKey;
if (_gear isEqualTo [] || {playerSide in [west, independent]}) then {
    [] call GW_client_fnc_playersLoadGear;
} else {
    [player] call GW_client_fnc_stripDownUnit;
    player setUnitLoadout _gear;

    [LOG_INFO, "Gear successfully loaded from database", _fnc_scriptName] call GW_server_fnc_log;
};

// Reset inventory (always) for whitelisted factions
if (playerSide in [independent, west]) then { GW_player_inventory = []; };

// Create inventory
private _defaultInventorySpace = getNumber (missionConfigFile >> "CfgSurvival" >> "defaultVirtualInventory");
[player, _defaultInventorySpace, GW_player_inventory] call GW_client_fnc_setupVirtualInventoryContainer;

// Reset inventory so it wont be back to same next time
GW_player_inventory = nil;

// Start survival
[true] call GW_client_fnc_survivalHandler;

// Start paycheck handler
[true] call GW_client_fnc_moneyPaycheckHandler;

// Setup nametags
[_setGroupID] call GW_client_fnc_playersSetupNametags
