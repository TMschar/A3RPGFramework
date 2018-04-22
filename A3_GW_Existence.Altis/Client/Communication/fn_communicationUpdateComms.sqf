#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_communicationUpdateComms.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit
 */
scriptName "GW_client_fnc_communicationUpdateComms: main";
scopeName "main";

if !(params [["_unit", objNull, [objNull]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Set false
if (
    "ItemGPS" in assignedItems _unit
    && {"ItemRadio" in assignedItems _unit}
    && {_unit getVariable ["communicationSeized", false]}
) then {
    _unit setVariable ["communicationSeized", false, true];
};