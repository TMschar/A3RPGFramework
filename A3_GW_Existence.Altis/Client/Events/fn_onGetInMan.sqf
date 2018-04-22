#include "script_component.hpp"
/*
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: onGetInMan.sqf
 *
 * Parameter(s):
 *     0: OBJECT
 *     1: STRING
 *     2: OBJECT
 *     3: ARRAY
 */
scriptName "GW_client_fnc_onGetInMan: main";
scopeName "main";

params [
    ["_unit", objNull, [objNull]],
    ["_position", "", [""]],
    ["_vehicle", objNull, [objNull]],
    ["_turret", [], [[]]]
];

// Update View Distance
if (_vehicle isKindOf "Car" || {_vehicle isKindOf "Tank"}) then {
    if !(viewDistance isEqualTo (profileNamespace getVariable ["GW_viewDistance_inVehicle", 0])) then {
        setViewDistance (profileNamespace getVariable ["GW_viewDistance_inVehicle", 0]);
    };
} else {
    if (_vehicle isKindOf "Air") then {
        if !(viewDistance isEqualTo (profileNamespace getVariable ["GW_viewDistance_inAir", 0])) then {
            setViewDistance (profileNamespace getVariable ["GW_viewDistance_inAir", 0]);
        };
    };
};
