/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_vehicleSetupVehicleGarage.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Vehicle to setup
 *     1: STRING - Texture ID
 *     2: STRING - Vehicle ID
 */
#define BOOL_GOVERNMENTVEHICLE !(playerSide isEqualTo civilian)

scriptName "GW_client_fnc_vehicleSetupVehicleGarage: main";
scopeName "main";

params [["_vehicle", objNull, [objNull]], ["_textureID", "", [""]], ["_vehicleUID", "", [""]]];

[_vehicle, BOOL_GOVERNMENTVEHICLE, _textureID, false, true] call GW_client_fnc_vehicleSetupVehicle;
_vehicle setVariable ["db_insert", [getPlayerUID player, _vehicleUID], true];

// Set Vehicle ID (Not implemented on main branch yet)
// _vehicle setPlateNumber _vehicleUID;