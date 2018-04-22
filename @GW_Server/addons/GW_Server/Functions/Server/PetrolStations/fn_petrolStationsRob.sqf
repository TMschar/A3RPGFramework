#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_petrolStationsRob.sqf
 *
 * Parameter(s):
 *     0: STRING - Variable name
 *     1: ARRAY  - Array with arguments
 */
#define COOLDOWN_SECONDS (getNumber (missionConfigFile >> "CfgPetrolStations" >> worldName >> "Settings" >> "cooldown"))

scriptName "GW_server_fnc_petrolStationRobRequest: main";
scopeName "main";

if !(params [
    ["_variableName", "", [""]],
    ["_args", [], [[]]]
]) throw "Expected two parameters";

if !(_args params [
    ["_object", objNull, [objNull]],
    ["_unit", objNull, [objNull]]
]) throw "Expected two parameters (args)";

private _petrolStationVariable = _object getVariable ["petrolStation", []];
_petrolStationVariable params [["_lastRobberyTime", 0, [0]], ["_robberyInProgress", false, [true]], ["_basePayout", 0, [0]]];

private _return = ["", _object];
private _noCooldown = [_lastRobberyTime, COOLDOWN_SECONDS] call GW_client_fnc_numbersIsFinished;
if (_lastRobberyTime != -1 && {!_noCooldown}) then { _return = ["There is a cooldown timer on this Petrol Station.", objNull]; };
if (_robberyInProgress) then { _return = ["There is already a robbery in progress", objNull]; };

// Update state of petrol station
_object setVariable ["petrolStation", [_lastRobberyTime, true, _basePayout], true];

// Send back to client
[PVAR_CLIENT, _variableName, _return, owner _unit] call GW_ext_fnc_networkPublicVariable;