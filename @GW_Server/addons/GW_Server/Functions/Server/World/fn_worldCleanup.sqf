#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_worldCleanup.sqf
 *
 * Description:
 *     Cleanup of vehicles, animals and weapon holders
 */
#define SLEEP_SECONDS (getNumber (configFile >> "GW_CfgWorld" >> "Cleanup" >> "cleanupTimer"))

scriptName "GW_server_fnc_worldCleanup: main";
scopeName "main";

private _cleanupTimer = SLEEP_SECONDS * 60;

// Start an inifinite loop
// that will never end.
for "_i" from 0 to 1 step 0 do
{
    // Wait
    uiSleep _cleanupTimer;

    // Loop through vehicles
    {
        // Vehicle is destroyed
        if (!alive _x) then
        {
            // Delete vehicle
            deleteVehicle _x;

            // Set status to inactive if its a persistent vehicle
            // that has database information on it.
            if !(_x getVariable ["db_insert", []] isEqualTo []) then
            {
                [_x, 0] call GW_server_fnc_vehicleUpdateStatus;
            };
        };

        true
    } count (
        allMissionObjects "LandVehicle"
        + allMissionObjects "Air"
        + allMissionObjects "Tank"
        + allMissionObjects "Boat"
        + allMissionObjects "Submarine"
    );

    // Wait
    uiSleep _cleanupTimer;

    // Loop through all weapon holders
    {
        deleteVehicle _x;
        true;
    } count (allMissionObjects "GroundWeaponHolder");

    // Wait
    uiSleep _cleanupTimer / 2;

    // Remove ambient life
    {
        private _object = agent _x;
        if (_object isKindOf "Snake_random_F" || {_object isKindOf "Rabbit_F"}) then
        {
            // Remove Agent
            deleteVehicle _object;
        };
        true
    } count agents;

    // Wait
    uiSleep _cleanupTimer / 4;

    // Delete money and death boxes
    {
        if (typeOf _x in ["Land_Money_F", "Box_T_East_Wps_F"]) then
        {
            deleteVehicle _x;
        };
    } forEach (allMissionObjects "Thing");
};
