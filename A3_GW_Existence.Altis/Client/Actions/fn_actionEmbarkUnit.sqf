#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_actionEscort.sqf
 *
 * Parameter(s):
 *    0: OBJECT - Unit to embark
 *    1: OBJECT - Vehicle to move in player into
 *
 * Description:
 *     Embark a player into a target vehicle
 */
scriptName "GW_client_fnc_actionEmbarkUnit: main";
scopeName "main";

if (!params [["_unit", objNull, [objNull]], ["_vehicle", objNull, [objNull]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
};

if (isNull _unit) exitWith {};
if (isNull _vehicle) exitWith {};

_unit setVariable ["transportAllowed", true, true];

// Send over network to unit (Due to locality of moveInCargo command)
[_unit, _vehicle, 1] remoteExecCall ["GW_client_fnc_moveUnitIntoVehicle", _unit];

// Log
[LOG_INFO, format ["Forcefully embarked %1:%2 into a vehicle", name _unit, getPlayerUID _unit], _fnc_scriptName] call GW_server_fnc_log;