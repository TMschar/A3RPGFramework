#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleEmergencyLights.sqf
*
*    Parameter(s):
*        0: BOOLEAN - Start or stop
*        1: OBJECT  - Vehicle to attach lights to
*
*    Returns:
*        NOTHING
*
*    Description:
*        Emergency Lights for Police and Medical Vehicles
*/
scriptName "GW_client_fnc_vehicleEmergencyLights: main";
scopeName "main";

if !(params [
    ["_start", false, [false]],
    ["_vehicle", objNull, [objNull]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

private _fnc_turnOffLights = {
    params [["_vehicle", objNull, [objNull]]];

    {
        deleteVehicle _x;
        true
    } count (_vehicle getVariable ["emergencylights", []]);

    _vehicle setVariable ["emergencylights", [], true];
    terminate GW_vehicleEmergencyLights_thread
};

if _start then {
    private _lightBlue = [0.1, 0.1, 20];
    private _positions = switch (typeOf _vehicle) do {
    	case "C_SUV_01_F": {
            [
                [-0.39502, 2.23389, -0.600462],
                [0.379883, 2.22998, -0.600462],
                [-0.37, -1.2, 0.42],
                [0.37, -1.2, 0.42],
                [-0.795898,-2.78076, -0.209462],
                [0.794922, -2.76807, -0.209462]
            ]
    	};
        default {[]}
    };

    private _lightObjects = [];
    for "_i" from 1 to (count _positions) do {
        private _lightObject = "#lightpoint" createVehicle getPos _vehicle;
        _lightObjects pushBack _lightObject;
        _vehicle setVariable ["emergencyLights", _lightObjects, true]
    };

    private _brightness = [2, 10] select (sunOrMoon > 0.75);
    {
        _x lightAttachObject [_vehicle, _positions select _forEachIndex];
        _x setLightColor _lightBlue;
        _x setLightBrightness _brightness;
        _x setLightAmbient _lightBlue;
        _x setLightAttenuation [0.181, 0, 1000, 130];
        _x setLightIntensity 10;
        _x setLightFlareSize 0.3;
        _x setLightFlareMaxDistance 150;
        _x setLightUseFlare true;
        _x setLightDayLight true
    } forEach _lightObjects;

    // New thread to handle the lights on/off
    GW_vehicleEmergencyLights_thread = [_vehicle, _fnc_turnOffLights] spawn {
        scriptName "GW_client_fnc_vehicleEmergencyLights: on-off thread";
        scopeName "main";

        params [
            ["_vehicle", objNull, [objNull]],
            ["_fnc_turnOffLights", {}, [{}]]
        ];

        private _brightness = [2, 10] select (sunOrMoon > 0.75);
        for "_i" from 0 to 1 step 0 do {
            {
                _x setLightBrightness 0;
                uiSleep 0.14;
                _x setLightBrightness _brightness;

                true
            } count (_vehicle getVariable ["emergencylights", []]);

            if (isNull _vehicle) exitWith {
                _vehicle call _fnc_turnOffLights
            }
        }
    }
} else {
    _vehicle call _fnc_turnOffLights
}
