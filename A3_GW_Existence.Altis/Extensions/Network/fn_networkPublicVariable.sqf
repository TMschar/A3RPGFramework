#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_networkPublicVariable.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): NUMBER - Mode
 *     1 (REQUIRED): STRING - Variable name
 *     2 (REQUIRED): VALUE - ANYTHING
 *     3 (OPTIONAL): NUMBER - Owner ID for target unit (Only applicable for publicVariableClient)
 *
 * Description:
 *     0: Public Variable Client
 *     1: Public Variable Server (Headless client if active)
 *     2: Public Variable (Global)
 */
scriptName "GW_ext_fnc_networkPublicVariable: main";
scopeName "main";

params
[
    ["_mode", -1, [0]],
    ["_variable", "", [""]],
    "_value",
    ["_unitOwnerID", -1, [0]]
];

if (_mode isEqualTo -1) throw "No mode was selected";
if (_variable isEqualTo "") throw "No variable specified";
if (isNil "_value") throw "Value is nil";

// Set variable in mission namespace
missionNamespace setVariable [_variable, _value];

// Do different things depending on what mode is chosen
switch (_mode) do {
    case 0:
    {
        // Make sure an owner ID is passed
        if (_unitOwnerID isEqualTo -1) throw "No owner id passed";

        // Set public variable
        _unitOwnerID publicVariableClient _variable;
    };
    case 1:
    {
        // If headless client is active, always send variable to that
        if (missionNamespace getVariable ["GW_HC_isActive", false]) then
        {
            private _hc = missionNamespace getVariable [STR_HC, objNull];
            private _owner = owner _hc;

            // Set public variable on headless client
            _owner publicVariableClient _variable;
        }
        else
        {
            // Set public variable on server
            publicVariableServer _variable;
        };
    };
    case 2:
    {
        // Broadcast to all clients
        publicVariable _variable;
    };
};