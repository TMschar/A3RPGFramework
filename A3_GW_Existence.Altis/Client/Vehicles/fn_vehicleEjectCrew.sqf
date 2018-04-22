#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleEjectCrew.sqf
*
*    Parameter(s):
*        0: OBJECT - Vehicle to eject crew from
*
*    Returns:
*        NOTHING
*
*    Description:
*        Ejects crew from a vehicle
*/
scriptName "GW_client_fnc_vehicleEjectCrew: main";
scopeName "main";

if !(params [
    ["_vehicle", objNull, [objNull]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

// Iterate through vehicle crew
{
    // Eject
    _x action ["Eject", objectParent _x];

    // Send notification
    [
        HINT_AMBER,
        "Pulled out",
        format
        [
            "You have been pulled out from your vehicle by %1.",
            profileName
        ]
    ] remoteExecCall ["GW_client_fnc_notificationsAdd", _x];
} count (crew _vehicle);

// Log
[LOG_INFO, "Pulled out crew from vehicle", _fnc_scriptName] call GW_server_fnc_log;
