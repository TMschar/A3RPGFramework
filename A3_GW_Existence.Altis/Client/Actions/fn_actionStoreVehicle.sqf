#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_actionStoreVehicle.sqf
 */
scriptName "GW_client_fnc_actionStoreVehicle: main";
scopeName "main";

// Get all keys and store in variable
private _keys = player getVariable ["keys", []];

// Error checks
if (vehicle player != player) exitWith { [HINT_AMBER, "Hold up", "You must not be inside a vehicle while storing"] call GW_client_fnc_notificationsAdd; };
if (_keys isEqualTo []) exitWith { ["Has no vehicles in keychain", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (!alive player) exitWith { ["Not alive", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Get all vehicles within 30 metres
private _nearVehicles = nearestObjects [getPos player, ["Car", "Air", "Ship", "Tank"], 30];

// If near vehicles is not an empty array
if !(_nearVehicles isEqualTo []) then {
    // Loop through all vehicles that are near the player
    {
        // Check if vehicle is in keychain
        if (_x in _keys) exitWith {
            private _governmentVehicle = _x getVariable ["vehicle_government", false];

            // Store vehicle
            [_x, _governmentVehicle] spawn GW_client_fnc_vehicleStoreVehicle;
        };
    } forEach _nearVehicles;
};