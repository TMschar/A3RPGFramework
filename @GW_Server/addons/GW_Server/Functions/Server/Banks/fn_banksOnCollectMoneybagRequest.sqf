#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_banksOnCollectMoneybagRequest.sqf
 *
 * Parameter(s):
 *     0: STRING - Name of public variable
 *     1: ARRAY  - Array of arguments
 */
scriptName "GW_server_fnc_banksOnCollectMoneybagRequest: main";
scopeName "main";

// Get parameters
if !(params [["_variableName", "", [""]], ["_args", [], [[]]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if !(_args params [["_unit", objNull, [objNull]], ["_box", objNull, [objNull]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Make sure there are moneybags left
private _moneybags = _box getVariable ["moneybags", 0];
if (_moneyBags < 1) exitWith { ["No moneybags in box", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Update money bags amount and broadcast
_box setVariable ["moneybags", _moneyBags-1, true];

// Collect on client
[] remoteExec ["GW_client_fnc_banksCollectMoneybag", _unit];