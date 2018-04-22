#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_logPlayerDeath.sqf
 *
 * Parameter(s):
 *     (6)
 *
 * Description:
 *     Insert an entry with information about a certain death into database
 */
scriptName "GW_server_fnc_logPlayerDeath: main";
scopeName "main";

if (!isRemoteExecuted || {!isServer}) exitWith {["Needs to be executed on server", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

params [
    ["_physicalInventory", [], [[]]],
    ["_virtualinventory", [], [[]]],
    ["_killerUID", "", [""]],
    ["_killerWeapon", "", [""]],
    ["_distance", 0, [0]],
    ["_cash", 0, [0]]
];

private _remoteExecutedOwner = [remoteExecutedOwner] call GW_client_fnc_getUnitByOwnerID;
private _unitUID = getPlayerUID _remoteExecutedOwner;

// Run query
["LOG_DEATHS_INSERTDEATH", 1,[
    _unitUID,
    _physicalInventory,
    _virtualInventory,
    _cash,
    _killerUID,
    _killerWeapon,
    _distance
]] call GW_db_fnc_queryDB
