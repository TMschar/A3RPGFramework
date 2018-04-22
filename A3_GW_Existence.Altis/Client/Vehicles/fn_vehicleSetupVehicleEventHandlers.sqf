#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_setupVehicleEventHandlers.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Vehicle
 *
 * Description:
 *     Setup Vehicle Eventhandlers
 */
scriptName "GW_client_fnc_setupVehicleEventHandlers: main";
scopeName "main";

if (!params [ ["_vehicle", objNull, [objNull]] ]) throw "Param error";

// Vehicle destroyed
_vehicle removeAllEventHandlers "Killed";
_vehicle addEventHandler
[
    "Killed",
    {
        /**
         * Parameter(s):
         *     OBJECT - Vehicle which handler is attached to
         *     OBJECT - Unit who killed the vehicle
         */
        params [["_vehicle", objNull, [objNull]], ["_killer", objNull, [objNull]]];

        // If local, send a notification and log vehicle death
        if (local _vehicle) then {
            private _displayname = typeOf _vehicle call GW_client_fnc_vehicleGetDisplayName;
            private _icon = [typeOf _vehicle] call GW_client_fnc_vehicleGetIcon;
            private _nameKiller = ["unknown", _killer call GW_client_fnc_playersGetName] select (!isNull _killer);
            private _id = (_vehicle getVariable ["db_insert", []]) param [1, "", [""]];

            // Send notification to owner
            [HINT_WARNING, "Vehicle Destroyed", format [
                "Your %2 with ID %3 has been destroyed by %1. Post the upcoming restart, it will be available in your vehicle garage again.",
                _nameKiller,
                _displayname,
                _id
            ], _icon] call GW_client_fnc_notificationsAdd;

            // Log if killer is present
            if !(isNull _killer) then {
                [LOG_INFO, format [
                    "%1:%2's vehicle with id %3 has been destroyed by %4:%5",
                    name player,
                    getPlayerUID player,
                    _id,
                    name _killer,
                    getPlayerUID _killer
                ], _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];
            };
        };
    }
];

// Transfer ownership to server or headless client
_vehicle removeAllEventHandlers "Local";
_vehicle addEventHandler
[
    "Local",
    {
        /**
         * Parameter(s):
         *     OBJECT
         *     BOOLEAN
         */
        params [ ["_vehicle", objNull, [objNull]], ["_local", false, [false]] ];

        // If a user logs out, their vehicle (where local) will transfer to server,
        // if headless client is active, transfer object ownership to it to unload server
        if (isServer && {local _vehicle}) then
        {
            [_vehicle] call GW_client_fnc_transferObjectOwnership;
        };
    }
];

// Slingloading vehicles
_vehicle removeAllEventHandlers "RopeAttach";
_vehicle addEventHandler
[
    "RopeAttach",
    {
        /**
         * Parameter(s):
         *     OBJECT - Vehicle which attaches
         *     OBJECT - Rope which is to attach
         *     OBJECT - Object in which the rope wants to attach to
         */
        params
        [
            ["_vehicle", objNull, [objNull]],
            ["_rope", objNull, [objNull]],
            ["_objectToAttach", objNull, [objNull]]
        ];

        // Only run where the vehicle is local
        if (!local _vehicle) exitWith {};

        // Make sure they have the correct level in vehicles
        if !([LEVEL_VEHICLES, 5] call GW_client_fnc_experienceCategoryHasLevel) exitWith
        {
            // Delete rope
            deleteVehicle _rope;

            // Notify
            [
                HINT_AMBER,
                "Rope Attach Notice",
                "You do not have the required experience to slingload this vehicle. You need level 6 in vehicles."
            ] call GW_client_fnc_notificationsAdd;
        };

        // Make sure the vehicle to pick up is a cargo crate if it has virtual inventory items in them.
        // This is so they cannot double their runs capacity by picking up a vehicle with items in it.
        private _objectsInventory = _objectToAttach getVariable ["virtualinventory_items", []];
        if (typeOf _objectToAttach != "B_Slingload_01_Cargo_F" && {!(_objectsInventory isEqualTo [])}) exitWith
        {
            // Delete rope
            deleteVehicle _rope;

            // Notify
            [
                HINT_AMBER,
                "Rope Attach Notice",
                "You can only slingload vehicles without items in them unless it is a cargo crate"
            ] call GW_client_fnc_notificationsAdd;
        };
    }
];

// Player gets out
_vehicle removeAllEventHandlers "GetOut";
_vehicle addEventHandler [
    "GetOut",
    {
        /**
        * Parameter(s):
        *     OBJECT - Vehicle the eventhandler is assigned to
        *     STRING - Position ("Driver", "Gunner", "Cargo")
        *     OBJECT - Unit that has disembarked
        *     ARRAY  - Turret path
        */
        params
        [
            ["_vehicle", objNull, [objNull]],
            ["_position", "", [""]],
            ["_unit", objNull, [objNull]],
            ["_turret", [], [[]]]
        ];

        // Turn off engine when no driver is in vehicle anymore
        if (local _vehicle && {isNull driver _vehicle} && {isEngineOn _vehicle}) then { _vehicle engineOn false; };

        // Remove seatbelt
        if (local _vehicle && {_unit getVariable ["seatbelt", false]}) then { _unit setVariable ["seatbelt", false] };

        // Remove transport allowed
        if (_unit getVariable ["transportAllowed", false]) then { _unit setVariable ["transportAllowed", false, true]; };
    }
];

// Player gets in
_vehicle removeAllEventHandlers "GetIn";
_vehicle addEventHandler [
    "GetIn",
    {
        /**
         * Parameter(s):
         *     OBJECT - Unit in which the eventhandler is attached to
         *     STRING - Position unit gets into ("Driver", "Gunner", "Cargo")
         *     OBJECT - Unit that embarked into vehicle
         *     ARRAY  - Turret path
         */
        params
        [
            ["_vehicle", objNull, [objNull]],
            ["_position", "", [""]],
            ["_unitEmbark", objNull, [objNull]],
            ["_turret", [], [[]]]
        ];

        // Seatbelt notification
        if (local _vehicle && {!(_unitEmbark getVariable ["seatbelt", false])} && {_position == "driver"} && {player isEqualTo _unitEmbark}) then {
            [HINT_AMBER, "Seatbelt Reminder", "Remember to put on your seatbelt by pressing [B]."] call GW_client_fnc_notificationsAdd;
        };
    }
];

// Switching seats in a vehicle
_vehicle removeAllEventHandlers "SeatSwitched";
_vehicle addEventHandler [
    "SeatSwitched",
    {
        /**
         * Parameter(s):
         *     OBJECT - Unit in which the eventhandler is attached to
         *     STRING - Position unit gets into ("Driver", "Gunner", "Cargo")
         *     OBJECT - Unit that embarked into vehicle
         *     ARRAY  - Turret path
         */
        params
        [
            ["_vehicle", objNull, [objNull]],
            ["_unit1", objNull, [objNull]],
            ["_unit2", objNull, [objNull]]
        ];

        // Hotfix for passenger seating, this will put them back into
        // passenger if they attempt to switch seats while in a moving
        // vehicle.
        if (
            local _vehicle
            && {driver _vehicle in [_unit1, _unit2]}
            && {!(typeOf _vehicle in [
                    "B_MRAP_01_F",
                    "B_MRAP_01_gmg_F",
                    "B_MRAP_01_hmg_F",
                    "O_MRAP_02_F",
                    "O_MRAP_02_hmg_F",
                    "O_MRAP_02_gmg_F",
                    "I_MRAP_03_F",
                    "I_MRAP_03_hmg_F",
                    "I_MRAP_03_gmg_F"
                ])}
            && {speed _vehicle > 1 || speed _vehicle < 0}
        ) then
        {
            _unit1 allowDamage false;
            _unit2 allowDamage false;

            private _vehicle = objectParent _unit1;
            moveOut _unit1;
            player moveInDriver _vehicle;

            _unit1 allowDamage true;
            _unit2 allowDamage true;
        };
    }
];
