#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_vehicleStoreVehicle.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): OBJECT  - Vehicle to store
 *     1 (OPTIONAL): BOOLEAN - Government Vehicle
 *
 * Description:
 *     Stores a vehicle back into garage by deleting it and setting it to inactive
 */
#define STATUS_INACTIVE 0

scriptName "GW_client_fnc_vehicleStoreVehicle: main";
scopeName "main";

params [["_vehicle", objNull, [objNull]], ["_govVehicle", false, [true]]];

// Error checking
if (!canSuspend) exitWith { ["Must be able to suspend", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (isNull _vehicle) exitWith { ["Vehicle is null", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Make sure the player owns the vehicle
(_vehicle getVariable ["db_insert", []]) params [["_uid", "", [""]]];
if (!_govVehicle && {_uid != getPlayerUID player}) exitWith { [HINT_NORMAL, "Storing Failed", "This is not your vehicle"] call GW_client_fnc_notificationsAdd; };

// If the vehicle is a government vehicle then delete it straight
// away and do not update it in the db. If it is not a government
// vehicle, delete the vehicle and set it to inactive in database.
if (!_govVehicle) then {
    [HINT_NORMAL, "Storing Vehicle", "Please wait! Your vehicle is being stored."] call GW_client_fnc_notificationsAdd;

    // Send call to server and wait until it returns true
    GW_vehicleActiveState_updated = nil;
    [[_vehicle, STATUS_INACTIVE], "GW_server_fnc_vehicleUpdateStatus"] call GW_ext_fnc_networkCallServer;
    waitUntil {missionNamespace getVariable ["GW_vehicleActiveState_updated", nil]};
};

// Delete the vehicle from world
deleteVehicle _vehicle;

// Notify success
private _displayName = [typeOf _vehicle] call GW_client_fnc_vehicleGetDisplayName;
private _iconPath = [typeOf _vehicle] call GW_client_fnc_vehicleGetIcon;
[HINT_NORMAL, "Vehicle Stored", format [
    "Your %1 has been stored",
    _displayName
], _iconPath] call GW_client_fnc_notificationsAdd;