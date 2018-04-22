#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_syncPlayerData.sqf
 *
 * Parameter(s):
 *     0: STRING   - Name of variable
 *     1: ANYTHING - Value of variable
 *         0: OBJECT
 *         1: ARRAY
 */
scriptName "GW_server_fnc_syncPlayerData: main";
scopeName "main";

if (!params [
    ["_variableName", "", [""]],
    ["_value", [], [[]]]
]) throw "Insufficient amount of parameters";

_value params [
    ["_unit", objNull, [objNull, ""]],
    ["_args", [], [[]]]
];

_args params [
    ["_playtimeDict", [], [[]], 4],
    ["_alive", 0, [0]],
    ["_moneyDict", [], [[]], 2],
    ["_bodyStatsDict", [], [[]], 3],
    ["_experience", [], [[]]],
    ["_licenses", [], [[]]],
    ["_gearDict", [], [[]], 4],
    ["_virtualInventory", [], [[]]]
];

// Get unit by uid, this is so it will use allPlayers and should be able to get
// the player even if he is dead
if (_unit isEqualType "") then { _unit = [_unit] call GW_client_fnc_getUnitByUID; };

// Make sure unit is not NULL
if (isNull _unit) throw "Unit is NULL";

private _uid = getPlayerUID _unit;
private _unitName = [name _unit, "Dead Player"] select (!alive _unit);

// Query
["PLAYERS_UPDATE", 1, [_playtimeDict, _alive, _moneyDict, _bodyStatsDict, _experience, _licenses, _gearDict, _virtualInventory, _uid]] call GW_db_fnc_queryDB;

// Log action
[LOG_INFO, format ["Synced data for %1:%2", _unitName, _uid], _fnc_scriptName] call GW_server_fnc_log;
