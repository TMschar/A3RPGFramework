#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_organizationsChangeRank.sqf
 *
 * Parameter(s):
 *     0: OBJECT: The gas station property
 */
scriptName "GW_client_fnc_petrolStationsRobAction: main";
scopeName "main";

// Error checks and parameters
if (!canSuspend) exitWith { ["Must be ran scheduled", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (!params [["_object", objNull, [objNull]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (isNull _object) exitWith {};
if (!alive player) exitWith {};

// Set off alarm
[_object, "PetrolStationAlarm"] remoteExecCall ["GW_client_fnc_say3D", -2];
[HINT_WARNING, "Petrol Station Alarm", format [
    "A petrol station is currently being robbed close to %1.",
    [_object] call GW_client_fnc_getNearestTown
]] remoteExecCall ["GW_client_fnc_notificationsAdd", west];

// Notify player
[HINT_NORMAL, "Petrol Station Notice", "Robbery has started. Stay within 5 metres of the cash desk. Police has been notified"] call GW_client_fnc_notificationsAdd;

// Add warrant
[player, "ArmedRobbery"] call GW_client_fnc_arrestWarrantsAdd;

// Get petrol station info
private _petrolStationInfo = _object getVariable ["petrolStation", []];
_petrolStationInfo params [["_lastRobbed", 0, [0]], ["_robberyInProgress", false, [true]], ["_basePayout", 0, [0]]];

// Set payout
private _payout = round (_basePayout + random (_basePayout / 2));

// Start progress bar
private _successful = [
    "PetrolStationRobbery",
    [],
    [_object, player],
    {
        params ["_object", "_unit"];
        _unit distance _object < 5
        && {alive _unit}
        && {!(_unit getVariable ["incapacitated", false])}
        && {!(_unit getVariable ["restrained", false])}
    }
] call GW_client_fnc_startProgress;

// Handle fail or success
if (_successful) then {
    _object setVariable ["petrolStation", [time, false, _basePayout], true];

    [
        HINT_NORMAL,
        "Petrol Station Notice",
        format
        [
            "You successfully robbed the Petrol Station and you have stolen £%1 from the counter. You earned "
            + "100 experience points in Jack of All Trades, 250 experience points in Rebellious and 250 experience points within weapons.",
            _payout
        ]
    ] call GW_client_fnc_notificationsAdd;

    // Give payout
    [1, _payout, 1] call GW_client_fnc_playersHandleMoney;
    [LEVEL_TOOLSOFTHETRADE, 100, "", false] call GW_client_fnc_experienceCategoryAddExperience;
    [LEVEL_WEAPONS, 250, "", false] call GW_client_fnc_experienceCategoryAddExperience;
    [LEVEL_REBELLIOUS, 250, "", false] call GW_client_fnc_experienceCategoryAddExperience;
} else {
    [HINT_WARNING, "Petrol Station Notice", "You failed to successfully rob the Petrol Station."] call GW_client_fnc_notificationsAdd;
};