/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_vehicleUnitInVehicle.sqf
*
* Parameter(s):
*     0: OBJECT - Object to check if it's in a vehicle
*     1: OBJECT - Object to check if unit is in
*
* Returns:
*     BOOLEAN
*
* Description:
*     Checks if a unit is in a vehicle, or if passed in, a specific vehicle.
*/
scriptName "GW_client_fnc_vehicleUnitInVehicle: main";
scopeName "main";

params [["_unit", player, [objNull]], ["_vehicle", objNull, [objNull]]];

private _objectParent = objectParent _unit;
private _return = [_objectParent isEqualTo _vehicle, !isNull _objectParent] select (isNull _vehicle);

// Return
_return;