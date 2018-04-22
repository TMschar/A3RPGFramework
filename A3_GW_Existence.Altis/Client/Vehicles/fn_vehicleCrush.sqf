#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_vehicleCrush.sqf
 *
 * Parameter(s):
 *     0: OBJECT
 *
 * Description:
 *     Action for removing a vehicle from database and crushing it in world
 */
scriptName "GW_client_fnc_vehicleCrush: main";
scopeName "main";

if (!canSuspend) exitWith { ["Must run scheduled", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (!params [ ["_vehicle", objNull, [objNull]] ]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (isNull _vehicle) exitWith { ["Vehicle is NULL", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Make sure it has database information
private _dbInfo = _vehicle getVariable ["db_insert", []];
if (_dbInfo isEqualTo []) then
{
    [HINT_WARNING, "Vehicle Crush Failed", "This is a rented vehicle. Due to this you can not crush it, however, you can impound it."] call GW_client_fnc_notificationsAdd;
    breakOut "main";
};

// Get owner information
_dbInfo params [["_ownerUID", "", [""]]];
private _unitOwner = [_ownerUID] call GW_client_fnc_getUnitByUID;
private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
private _distance = _vehicle distance player;

// Send notification to owner
[LOG_WARNING, "Vehicle Notification", format [
    "Your %1 is currently being crushed by the Police. This vehicle is being crushed %1 km from your location.",
    _vehicleName,
    _distance * 1000
]] remoteExecCall ["GW_client_fnc_notificationsAdd", _unitOwner];

// Set conditions for progress bar
private _conditionArgs = [player, _vehicle];
private _conditionCode =
{
    params [["_unit", objNull, [objNull]], ["_vehicle", objNull, [objNull]]];
    _unit distance _vehicle < 2
    && {alive _unit}
    && {alive _vehicle}
    && {!isNull _unit}
    && {!isNull _vehicle}
    && {!(_unit getVariable ["incapacitated", false])}
};

// Start action
if (["CrushVehicle", [], _conditionArgs, _conditionCode] call GW_client_fnc_startProgress) then {
    [HINT_NORMAL, "Processing Crush", "Please be patient while we delete the vehicle from the database"] call GW_server_fnc_hintAdd;

    // Delete vehicle in database
    [[_vehicle], "GW_server_fnc_vehicleDelete"] call GW_ext_fnc_networkCallServer;
    waitUntil { missionNamespace getVariable ["GW_Player_VehicleCrush_Deleted", false]; };

    // Delete vehicle from world
    deleteVehicle _vehicle;

    // Add experience
    [LEVEL_VIGILANCE, 500, "", false] call GW_client_fnc_experienceCategoryAddExperience;
    [LEVEL_VEHICLES,  200, "", false] call GW_client_fnc_experienceCategoryAddExperience;

    // Notify
    [HINT_NORMAL, "Crushing Notice", "You have successfully crushed the vehicle. You received 500 points in vigilance and 200 points in vehicles."] call GW_client_fnc_notificationsAdd;
}
else
{
    // Notify
    [HINT_AMBER, "Crushing Notice", "Your attempt to crush the vehicle failed"] call GW_client_fnc_notificationsAdd;
};