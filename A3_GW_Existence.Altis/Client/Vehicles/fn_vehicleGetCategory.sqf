#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_vehicleGetCategory.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Vehicle to check
 *
 * Returns:
 *     STRING - Vehicle Category
 *
 * Description:
 *     Gets a certain category for a vehicle. I.e. Air, Car, Submarine etc
 */
scriptName "GW_client_fnc_vehicleGetCategory: main";
scopeName "main";

if (!params [["_classname", "", [""]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Return
getText (configFile >> "CfgVehicles" >> _classname >> "vehicleClass");