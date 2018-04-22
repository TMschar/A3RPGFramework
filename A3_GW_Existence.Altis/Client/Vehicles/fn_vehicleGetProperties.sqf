#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleGetProperties.sqf
*
*    Parameter(s):
*        0: (REQUIRED) STRING - ClassName of vehicle
*
*    Returns:
*        ARRAY
*
*    Description:
*        Checks the vehicle properties for a vehicle and returns it in a format of an array
*/
scriptName "GW_client_fnc_vehicleGetProperties: main";
scopeName "main";

#define CONFIG_VEHICLES (missionConfigFile >> "CfgVehicles" >> "Vehicles")

if !params [["_vehicleClassName", "", [""]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
    []
};

private _vehicleClass = CONFIG_VEHICLES >> _vehicleClassName;
private _virtualInventorySpace = getNumber (_vehicleClass >> "virtualInventorySpace");
private _purchasePrice = getNumber (_vehicleClass >> "purchasePrice");
private _rentalPriceOverride = getNumber (_vehicleClass >> "rentalPriceOverride");
private _texturesArray = getArray (_vehicleClass >> "textures");

// Return
[
    _virtualInventorySpace,
    _purchasePrice,
    _rentalPriceOverride,
    _rentalPriceOverride,
    _texturesArray
]