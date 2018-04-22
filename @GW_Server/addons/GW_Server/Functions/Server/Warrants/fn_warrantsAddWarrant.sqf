#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_warrantsAddWarrant.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit to add warrant for
 *     1: NUMBER - Crime ID (Config ID)
 */
scriptName "GW_client_fnc_warrantsAddWarrant: main";
scopeName "main";

if !params [["_unit", objNull, [objNull]], ["_crimeID", -1, [1]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

if (isNull _unit) exitWith {};
if (_crimeID < 0) exitWith {};

private _playerUID = getPlayerUID _unit;
["WARRANTS_ADDWARRANT", 1, [_playerUID, _crimeID]] call GW_db_fnc_queryDB;