#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_communicationHasComms.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit
 *
 * Returns:
 *     BOOLEAN
 */
scriptName "GW_client_fnc_communicationHasComms: main";
scopeName "main";

if !(params [["_unit", objNull, [objNull]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

!(_unit getVariable ["communicationSeized", false])
&& {"ItemGPS" in assignedItems _unit}
&& {"ItemRadio" in assignedItems _unit}
