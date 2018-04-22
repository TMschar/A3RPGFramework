#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleAvailableDoorAnims.sqf
*
*    Parameter(s):
*        0: OBJECT - Vehicle to check
*
*    Returns:
*        ARRAY
*
*    Description:
*        Returns available door animations for a specific vehicle
*/
scriptName "GW_client_fnc_vehicleAvailableDoorAnims: main";
scopeName "main";

if !params [["_vehicle", objNull, [objNull]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

if (isNull _vehicle) exitWith {};
private _array = switch typeOf _vehicle do {
    case "B_G_Van_02_transport_F";
    case "B_G_Van_02_vehicle_F";
    case "C_IDAP_Van_02_medevac_F";
    case "C_Van_02_service_F";
    case "C_Van_02_transport_F";
    case "C_Van_02_medevac_F": {
        [
            ["Left front", "Door_1_source"],
            ["Right front", "Door_2_source"],
            ["Right side", "Door_3_source"],
            ["Rear", "Door_4_source"]
        ]
    };
    default {[]}
};

// Return
_array
