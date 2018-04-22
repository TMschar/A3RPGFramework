#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_itemsSpikestrip.sqf
 *
 * Description:
 *     Places down a spikestrip on the road
 */
scriptName "GW_client_fnc_itemsSpikestrip: main";
scopeName "main";

// Close all displays
[] call GW_client_fnc_guiCloseAllDisplays;

// Make sure the player has a spikestrip
if !([player, "Spikestrip"] call GW_client_fnc_virtualInventoryHasItem) exitWith { ["Does not have a spikestrip", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Create the vheicle and attach it to the player
private _spikestrip = "Land_Razorwire_F" createVehicle [0, 0, 0];
_spikestrip attachTo [player, [0, 5.5, 0]];
_spikestrip setDir 90;

// Add an action to the player for putting down the spikestrip
GW_itemsSpikestrip_spikestrip = _spikestrip;
GW_itemsSpikestrip_actionDeploy = player addAction
[
    "Place Spikestrip",
    {
        // Detach from player
        if (!isNull GW_itemsSpikestrip_spikestrip) then
        {
            detach GW_itemsSpikestrip_spikestrip;
            GW_itemsSpikestrip_spikestripPlaced = true;
        };

        // Always remove action (even if its NULL like above)
        player removeAction GW_itemsSpikestrip_actionDeploy;
    },
    "",
    999,
    false,
    false,
    "",
    "!isNull GW_itemsSpikestrip_spikestrip"
];

private _threadHandle = missionNamespace getVariable ["GW_itemsSpikestrip_threadHandle", scriptNull];
if (!isNull _threadHandle) exitWith { ["Thread already running", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Create a new thread for in order to wait for placing
// the spikestrip
GW_itemsSpikestrip_threadHandle = [_spikestrip] spawn
{
    params [ ["_spikestrip", objNull, [objNull]] ];

    // Wait until the spikestrip is placed
    waitUntil { missionNamespace getVariable ["GW_itemsSpikestrip_spikestripPlaced", false]; };
    GW_itemsSpikestrip_spikestripPlaced = false;

    // Update position to be on ground (z-index: 0)
    private _spikestripPos = getPos _spikestrip;
    _spikestripPos params ["_spikestripPosX", "_spikestripPosY"];
    _spikestrip setPos [_spikestripPosX, _spikestripPosY, 0];

    // Set the damage of the
    // spikestrip so it will go in the ground
    _spikestrip setDamage 1;

    // Have server keep an eye on the spikestrip (TODO: handleServerCall new thread)
    [[_spikestrip], "GW_server_fnc_worldTrackSpikestrip", true] call GW_ext_fnc_networkCallServer;

    // Add action to pickup the spikestrip
    if (!isNil "GW_itemsSpikestrip_actionPickup") exitWith { ["Action already added", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
    GW_itemsSpikestrip_actionPickup = player addAction
    [
        "Packup Spikestrip",
        {
            private _spikestrips = nearestObjects [getPos player, ['Land_Razorwire_F'], 5];
            private _spikestrip = _spikestrips param [0, objNull, [objNull]];

            // Give back item
            [player, "Spikestrip", 1, true] call GW_client_fnc_virtualInventoryChange;

            // Delete spikestrip
            deleteVehicle _spikestrip;
        },
        "",
        999,
        false,
        false,
        "",
        "
            private _spikestrips = nearestObjects [getPos player, ['Land_Razorwire_F'], 5];
            private _spikestrip = _spikestrips param [0, objNull, [objNull]];
            !isNull _spikestrip
        "
    ];
};

// Return true here so items gets removed
true breakOut "main";