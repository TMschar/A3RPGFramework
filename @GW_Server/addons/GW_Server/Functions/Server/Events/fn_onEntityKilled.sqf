#include "script_component.hpp"
/*
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_onEntityKilled.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Entity Killed
 *     1: OBJECT - Entity Killer
 *     2: OBJECT - Entity who pulled the trigger
 */
scriptName "GW_server_fnc_onEntityKilled: main";
scopeName "main";

// Get parameters from eventhandler
params
[
    ["_killed", objNull, [objNull]],
    ["_killer", objNull, [objNull]],
    ["_instigator", objNull, [objNull]]
];

// Set alive state in database
private _databaseInfo = _killed getVariable ["db_insert", []];
if (!(_databaseInfo isEqualTo []) && {_killed isKindOf "Car" || _killed isKindOf "Ship" || _killed isKindOf "Air"}) then
{
    // Query DB
    _databaseInfo params [ "", ["_vehicleUID", "", [""]] ];

    // Set alive state in database
    ["VEHICLES_UPDATEVEHICLEALIVESTATUS", 1, [0, _vehicleUID]] call GW_db_fnc_queryDB;
};

// Murder
if (isPlayer _killed && {!(_killed isEqualTo _killer)}) then
{
    private _information = [_unitKilled, currentWeapon  _unitKiller, round (_unitKiller distance _unitKilled)];

    // Send to client
    [0, "GW_Player_OnMurder", _information, owner _killer] call GW_ext_fnc_networkPublicVariable
};
