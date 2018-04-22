#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_vehicleImpound.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Vehicle to impound
 *
 * Description:
 *     Impounds a vehicle and sets it inactive in database, unless rented
 */
scriptName "GW_client_fnc_vehicleImpound: main";
scopeName "main";

if (!params [["_vehicle", objNull, [objNull]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Error checking
if (isNull _vehicle) exitWith { ["Vehicle is null", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (!canSuspend) exitWith { ["Cannot suspend", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

private _rental = _vehicle getVariable ["db_insert", []] isEqualTo [];
private _duration = 60;
private _displayname = [typeOf _vehicle] call GW_client_fnc_vehicleGetDisplayName;
private _iconPath = [typeOf _vehicle] call GW_client_fnc_vehicleGetIcon;
private _conditionArgs = [player, _vehicle];
private _conditionCode = {
    params [["_unit", objNull, [objNull]], ["_vehicle", objNull, [objNull]]];
    _unit distance _vehicle < 5
    && {alive _unit}
    && {!isNull _unit}
    && {!(_unit getVariable ["incapacitated", false])}
    && {!isNull _vehicle}
};

if (["ImpoundVehicle", [_duration, localize "STR_GW_ACTIONSPROGRESS_IMPOUNDVEHICLE"], _conditionArgs, _conditionCode] call GW_client_fnc_startProgress) then {
    // Only change in database if its a rental
    if (!_rental) then {
        // Notify
        [
            HINT_AMBER,
            "Please wait...",
            "The vehicle is being set to inactive in database. Please wait while the query is processing."
        ] call GW_client_fnc_notificationsAdd;

        // Set vehicle status to inactive in database and wait for return
        GW_vehicleActiveState_updated = nil;
        [[_vehicle, 0], "GW_server_fnc_vehicleUpdateStatus"] call GW_ext_fnc_networkCallServer;
        waitUntil { missionNamespace getVariable ["GW_vehicleActiveState_updated", nil]; };
    };

    // Delete from world
    deleteVehicle _vehicle;

    // Give experience
    [LEVEL_VEHICLES, 50, "Bob the impounder"] call GW_client_fnc_experienceCategoryAddExperience;
    [LEVEL_VIGILANCE, 20, "Cleaning the streets"] call GW_client_fnc_experienceCategoryAddExperience;

    // Notify
    [HINT_NORMAL, "Impound Successful", format [
        "You successfully impounded a %1 and you have been awarded for your action.",
        _displayname
    ], _iconPath] call GW_client_fnc_notificationsAdd;
};
