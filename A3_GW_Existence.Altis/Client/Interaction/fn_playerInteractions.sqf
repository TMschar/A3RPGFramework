#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_playerInteractions.sqf
 *
 * Parameter(s):
 *     0: OBJECT
 */
#define ACTIONS GW_displayInteractionMenu_Actions
#define ANIM_DOWN "Acts_AidlPsitMstpSsurWnonDnon02"
#define ANIM_HEADDOWN "Acts_ExecutionVictim_Loop"
#define ANIM_NORMAL "AmovPercMstpSnonWnonDnon_Ease"

scriptName "GW_client_fnc_playerInteractions: main";
scopeName "main";

if (!params [["_target", objNull, [objNull]]]) exitWith {["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};
if (!isPlayer _target) exitWith {["Target is not a player", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};
if (isNull _target) exitWith {["Target is null", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

// Allow police to ticket player (not police to police)
if (playerSide isEqualTo west && {side _target != west}) then {
    ACTIONS pushBack ["Issue Ticket", "", "[_this] call GW_client_fnc_actionRequestTicketSystem"];
};

// Restraining & Unrestraining
private _restrained = _target getVariable ["restrained", false];
private _restrainer = _target getVariable ["restrainer", grpNull];
if (_restrained && {_restrainer == group player} && {!(_target getVariable ["incapacitated", false])}) then {
    private _animation = _target getVariable ["restrainAnimation", ""];
    private _isEscorting = _target getVariable ["escorting", false];

    // Set option for different animations
    switch (_animation) do {
        case ANIM_DOWN: {
            ACTIONS pushBack ["Put Head Down", "", format ["_this setVariable ['restrainAnimation', '%1', true]", ANIM_HEADDOWN], "keys"];
            ACTIONS pushBack ["Bring Up", "", format ["_this setVariable ['restrainAnimation', '%1', true]", ANIM_NORMAL], "keys"];
        };
        case ANIM_NORMAL: {
            ACTIONS pushBack ["Put Down", "", format ["_this setVariable ['restrainAnimation', '%1', true]", ANIM_DOWN], "keys"];
            ACTIONS pushBack ["Put Head Down", "", format ["_this setVariable ['restrainAnimation', '%1', true]", ANIM_HEADDOWN], "keys"];
        };
        case ANIM_HEADDOWN: {
            ACTIONS pushBack ["Put Down", "", format ["_this setVariable ['restrainAnimation', '%1', true]", ANIM_DOWN], "keys"];
            ACTIONS pushBack ["Bring Up", "", format ["_this setVariable ['restrainAnimation', '%1', true]", ANIM_NORMAL], "keys"];
        };
    };

    // Unrestrain player
    ACTIONS pushBack ["Unrestrain", "", "[_this] call GW_client_fnc_actionUnrestrain", "keys"];

    // Escort target
    if (!_isEscorting) then {
        ACTIONS pushBack ["Escort", "", "[_this] call GW_client_fnc_actionEscort", "keys"];
    } else {
        ACTIONS pushBack ["Stop Escorting", "", "[_this] call GW_client_fnc_actionEscortRelease", "keys"];
    };

    // Rob player
    if (playerSide isEqualTo civilian) then
    {
        ACTIONS pushBack ["Rob Money", "", "[_this] spawn GW_client_fnc_actionRobPlayer", "keys"];
    };

    // Get keys of _this
    ACTIONS pushBack ["Vehicle Access", "", "GW_displayKeys_Unit = _this; createDialog 'GW_displayKeys'", "keys"];

    // TODO: Create function and check for level
    ACTIONS pushBack ["Search Physical Inventory", "", "[_this] spawn GW_client_fnc_actionOpenPhysicalInventory", "keys"];

    // TODO: Add condition of checking if target comms are already seize
    if ([_target] call GW_client_fnc_communicationHasComms) then {
        ACTIONS pushBack ["Seize Communications", "", "[_this] call GW_client_fnc_actionSeizeCommunication", "keys"];
    };

    // Search Virtual Inventory
    ACTIONS pushBack ["Virtual Inventory", "", "[_this] call GW_client_fnc_virtualInventoryRequestInventory", "keys"];

    // Get nearest vehicles
    private _vehicles = nearestObjects [player, ["Car", "Air", "Boat", "Submarine", "Tank"], 10];
    _vehicles params [["_vehicle", objNull, [objNull]]];

    // Make sure that the interaction player has keys to vehicle or
    // the vehicle has to be unlocked.
    if (!isNull _vehicle) then {
        GW_displayInteractionMenu_putInVehicle_vehicleObj = _vehicle;
        ACTIONS pushBack ["Put In Vehicle", "", "[_this, GW_displayInteractionMenu_putInVehicle_vehicleObj] call GW_client_fnc_actionEmbarkUnit", "keys"];
    };

    // Add button to send to jail
    if ([_target] call GW_client_fnc_jailCanArrest) then {
        ACTIONS pushBack ["Send to Jail", "", "[_this] call GW_client_fnc_jailOpenDialog", "key"];
    };
} else {
    // Allow lockpicking of handcuffs if the target is restrained and
    // if the player has lockpicks
    if (_restrained && {[player, "Lockpick"] call GW_client_fnc_virtualInventoryHasItem}) then {
        ACTIONS pushBack ["Lockpick Handcuffs", "", "[_this] spawn GW_client_fnc_actionLockpickRestraints", "keys"];
    };
};

// Player has been incapacitated and is currently bleeding out
if (_target getVariable ["incapacitated", false]) then {
    private _givenBlood = _target getVariable ["bleedoutGivenBlood", false];
    private _hasBloodbag = [player, "Bloodbag"] call GW_client_fnc_virtualInventoryHasItem;

    // If player has a bloodbag and blood is not given yet
    if (_hasBloodbag && {!_givenblood}) then {
        ACTIONS pushBack ["Give Blood", "", "[_this] call GW_client_fnc_bleedoutGiveBlood", "keys"];
    };

    // Allow IHAS (Medics) to revive
    if (playerSide isEqualTo independent) then {
        ACTIONS pushBack ["Revive", "", "[_this] spawn GW_client_fnc_bleedoutReviveUnit", "keys"];
    };
};
