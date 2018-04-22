#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleAnimateVehicle.sqf
*
*    Parameter(s):
*        0: OBJECT - Vehicle to animate
*
*    Description:
*       Animates a vehicle
*/
scriptName "GW_client_fnc_vehicleAnimateVehicle: main";
scopeName "main";

if !params [["_vehicle", objNull, [objNull]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};
private _vehicleType = typeOf _vehicle;

if isNull _vehicle exitWith {};
if !(_vehicleType in [
    "C_Boat_Civil_01_F",
    "O_T_LSV_02_armed_F",
    "B_Boat_Armed_01_minigun_F",
    "B_Heli_Light_01_F",
    "C_Offroad_01_F",
    "C_Van_02_medevac_F",
    "C_Van_02_service_F"
]) exitWith {};

private _animations = [];
_animations = switch _vehicleType do {
    case "C_Boat_Civil_01_F": {
        if (playerSide isEqualTo west) then {
            [
                ["Proxy", 0],
                ["hidePolice", 0],
                ["HideRescueSigns", 0]
            ]
        }
    };
    case "O_T_LSV_02_armed_F": {
        // Replace 6.5 with .50 cal
        _vehicle removeWeaponTurret ["LMG_Minigun_Transport",        [0]];
        _vehicle addWeaponTurret    ["HMG_127_LSV_01",               [0]];
        _vehicle addMagazineTurret  ["100Rnd_127x99_mag_Tracer_Red", [0]];
        _vehicle addMagazineTurret  ["100Rnd_127x99_mag_Tracer_Red", [0]];
        _vehicle addMagazineTurret  ["100Rnd_127x99_mag_Tracer_Red", [0]];
        []
    };
    case "B_Boat_Armed_01_minigun_F": {
        // Replace 6.5 with .50 cal
        _vehicle removeWeaponTurret ["GMG_40mm",                     [0]];
        _vehicle addWeaponTurret    ["HMG_127",                      [0]];
        _vehicle addMagazineTurret  ["500Rnd_127x99_mag_Tracer_Red", [0]];
        _vehicle addMagazineTurret  ["500Rnd_127x99_mag_Tracer_Red", [0]];
        []
    };
    case "B_Heli_Light_01_F": {
        [
            ["AddHoldingFrame", 1],
            ["AddCargoHook_COver", 0]
        ]
    };
    case "C_Offroad_01_F": {
        switch playerSide do {
            case west: {
                [
                    ["hidePolice", 0],
                    ["BeaconsStart", 0],
                    ["BeaconsServicesStart", 0],
                    ["HideDoor1", 1],
                    ["HideDoor2", 1],
                    ["HideDoor3", 1],
                    ["HideBackpacks", 0],
                    ["HideBumper2", 0],
                    ["HideConstruction", 0],
                    ["Proxy", 0],
                    ["Destruct", 0]
                ]
            };
            case independent: {
                [
                    ["hidePolice", 0],
                    ["BeaconsStart", 0],
                    ["BeaconsServicesStart", 0],
                    ["HideDoor1", 0],
                    ["HideDoor2", 0],
                    ["HideDoor3", 0],
                    ["HideBackpacks", 1],
                    ["HideBumper2", 1],
                    ["HideConstruction", 0],
                    ["Proxy", 0],
                    ["Destruct", 0]
                ]
            };
            case civilian: {
                [
                    ["hidePolice", 0],
                    ["BeaconsStart", 0],
                    ["BeaconsServicesStart", 0],
                    ["HideDoor1", 0],
                    ["HideDoor2", 0],
                    ["HideDoor3", 0],
                    ["HideBackpacks", 1],
                    ["HideBumper2", 1],
                    ["HideBumper2", 1],
                    ["HideConstruction", 0],
                    ["Proxy", 0],
                    ["Destruct", 0]
                ]
            }
        }
    };
    case "C_Van_02_medevac_F": {
        [
            ["reflective_tape_hide", 0],
            ["LED_lights_hide", 0],
            ["sidesteps_hide", 0],
            ["rearsteps_hide", 0],
            ["front_protective_frame_hide", 0],
            ["beacon_front_hide", 0],
            ["beacon_rear_hide", 0]
        ]
    };
    case "C_Van_02_service_F": {
        if (playerSide isEqualTo independent) then {
            [
                ["ladder_hide", 0],
                ["spare_tyre_holder_hide", 0],
                ["spare_tyre_hide", 0],
                ["reflective_tape_hide", 0],
                ["roof_rack_hide", 0],
                ["LED_lights_hide", 0],
                ["sidesteps_hide", 0],
                ["rearsteps_hide", 0],
                ["front_protective_frame_hide", 0],
                ["beacon_front_hide", 0],
                ["beacon_rear_hide", 0]
            ]
        }
    }
};

if (isNil "_animations" || {_animations isEqualTo []}) exitWith {};

// Animate all items in array
{
    _x params [["_id", "", [""]], ["_value", 0, [0]]];
    _vehicle animate [_id, _value];
    true
} count _animations
