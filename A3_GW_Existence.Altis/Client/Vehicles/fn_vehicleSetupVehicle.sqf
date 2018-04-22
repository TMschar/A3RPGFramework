#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_vehicleSetupVehicle.sqf
 *
 * Parameter(s):
 *    0: OBJECT  - Vehicle to setup
 *    1: BOOLEAN - Government vehicle
 *    2: STRING  - Texture ID
 *    3: BOOLEAN - Rental
 *    4: BOOLEAN - From garage or not
 *
 * Description:
 *    Sets up a new vehicle and makes it useable
 */
scriptName "GW_client_fnc_vehicleSetupVehicle: main";
scopeName "main";

params [
    ["_vehicle", objNull, [objNull]],
    ["_governmentVehicle", false, [false]],
    ["_textureID", "", [""]],
    ["_rental", false, [false]],
    ["_fromGarage", false, [false]]
];

if (isNull _vehicle) throw "Vehicle is NULL";

private _vehicleClassname = typeOf _vehicle;
private _textureDisplayname = [_vehicleClassname, _textureID] call GW_client_Fnc_vehicleTextureGetDisplayName;
private _texturePaths = [_vehicleClassname, _textureID] call GW_client_fnc_vehicleGetTexturePaths;
if !(_texturePaths isEqualTo []) then { { _vehicle setObjectTextureGlobal [_forEachIndex, _x] } forEach _texturePaths };

// Setup vehicle eventhandlers as well as animate vehicle
_vehicle call GW_client_fnc_vehicleAnimateVehicle;
_vehicle call GW_client_fnc_vehicleSetupVehicleEventHandlers;
_vehicle remoteExecCall ["GW_client_fnc_vehicleSetupVehicleEventHandlers", -clientOwner];

// Give keys to vehicle
[player, _vehicle] call GW_client_fnc_vehicleGiveKeys;

// Vehicle variable information
_vehicle setVariable ["BIS_enableRandomization", false];
_vehicle setVariable ["vehicle_registration", [[player, 0]], true];
_vehicle setVariable ["texture", _textureDisplayname, true];
_vehicle lock true;

// Setup virtual inventory
private _inventorySpace = getNumber (missionConfigFile >> "CfgVehicles" >> "Vehicles" >> typeOf _vehicle >> "virtualInventorySpace");
[_vehicle, _inventorySpace, []] call GW_client_fnc_setupVirtualInventoryContainer;

// If here to not polute the server with broadcasted variables
if (_governmentVehicle) then { _vehicle setVariable ["vehicle_government", _governmentVehicle, true]; };

// Handle persistent vehicle saving
if (playerSide isEqualTo civilian) then
{
    // Insert Vehicle
    if (!_rental && {!_fromGarage}) then
    {
        [[player, _vehicle, _textureIdentifier], "GW_server_fnc_vehicleInsert"] call GW_ext_fnc_networkCallServer
    }
    else
    {
        // Update status to active
        if (_fromGarage && {!_rental}) then
        {
            [[_vehicle, 1], "GW_server_fnc_vehicleUpdateStatus"] call GW_ext_fnc_networkCallServer;
        };
    };
};

// Add AI crew to UAVs
if (getNumber (configFile >> "CfgVehicles" >> _vehicleClassname >> "isUAV") isEqualTo 1) then { createVehicleCrew _vehicle; };

// Clear any previous cargo
clearItemCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

// Add toolkit to vehicle
_vehicle addItemCargoGlobal ["Toolkit", 1];

// Add parachute if its an aircraft
if (_vehicle isKindOf "Air") then { _vehicle addBackpackCargoGlobal ["B_Parachute", 4]; };
