#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_arrestWarrantsReceive.sqf
 *
 * Parameter(s):
 *     0: ARRAY - Array with all arrest warrants
 *
 * Description:
 *     Receives arrest warrants from server
 */
scriptName "GW_client_fnc_arrestWarrantsReceive: main";
scopeName "main";

if (!params [["_warrants", [], [[]]]]) exitWith {["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

// Set warrants in global variable
GW_arrestWarrants_warrants = _warrants;
