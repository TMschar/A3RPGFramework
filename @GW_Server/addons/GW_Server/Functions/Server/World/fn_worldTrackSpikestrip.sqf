#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_worldTrackSpikestrip.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): OBJECT - Spikestrip to track
 */
scriptName "GW_server_fnc_worldTrackSpikestrip: main";
scopeName "main";

if (!params [ ["_spikestrip", objNull, [objNull]] ]) throw "Expected parameters";
if (!canSuspend) throw "Cannot suspend in this environment";
if (isNull _spikestrip) throw "Spike strip is NULL";
if (!isRemoteExecuted) throw "This function is not remotely executed";

// Loop this so we can keep an eye on the spikestrip
for "_i" from 0 to 1 step 0 do
{
    // If spikestrip is removed
    if (isNull _spikestrip) exitWith { ["Spikestrip removed, exiting tracker.", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

    // If a vehicle is close, run this;
    private _nearestObjectsVehicles = nearestObjects [getPosATL _spikestrip, ["Car", "Tank"], 5];
    if !(_nearestObjectsVehicles isEqualTo []) exitWith
    {
        // Run the spikestrip effect on vehicle
        private _vehicle = _nearestObjectsVehicles param [0, objNull, [objNull]];
        [_vehicle] remoteExecCall ["GW_client_fnc_vehicleSpikestripEffect", _vehicle];

        // Delete spikestrip
        deleteVehicle _spikestrip;
    };

    // Small sleep so we dont overload the server
    uiSleep 0.00001;
};