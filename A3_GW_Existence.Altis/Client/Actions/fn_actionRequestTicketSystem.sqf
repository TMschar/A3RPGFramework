#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_actionRequestTicketSystem.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): OBJECT - Target to give ticket too
 */
scriptName "GW_client_fnc_actionRequestTicket: main";
scopeName "main";

if !(params [["_unitTarget", objNull, [objNull]]]) exitWith {["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};
if (!alive _unitTarget) exitWith {["Not alive", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};
if (_unitTarget isEqualTo player) exitWith {["Tried ticketing self", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};
if (side _unitTarget isEqualTo west) exitWith {};

// Set variable so we can access it within ticket system
GW_actionRequestTicketSystem_unitTarget = _unitTarget;

// Create dialog
createDialog "GW_displayTicket";

// Log
private _targetUnitName = [_unitTarget] call GW_client_fnc_playersGetName;
private _targetUnitUID = getPlayerUID _unitTarget;
[LOG_INFO, format [
    "Opened ticket system (for player %1:%2)",
    _targetUnitName,
    _targetUnitUID
], _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];