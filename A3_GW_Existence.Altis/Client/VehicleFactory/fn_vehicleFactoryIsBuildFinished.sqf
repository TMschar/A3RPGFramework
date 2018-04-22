#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleFactoryIsBuildFinished.sqf
*
*    Parameter(s):
*        0: NUMBER - Index of element in active vehicle builds array
*
*    Returns:
*        BOOLEAN - true if finished
*
*    Description:
*        Checks if a build is finished
*/
scriptName "GW_client_fnc_vehicleFactoryIsBuildFinished: main";
scopeName "main";

if !params [
	["_index", 0, [0]]
] exitWith {
	[LOG_WARNING, "No element index passed", _fnc_scriptName] call GW_server_fnc_log
};

private _build = GW_vehicleFactory_currentBuilds param [_index, [], [[]]];
_build params [
	"",
	"",
	["_startTime", 0, [0]],
	"",
	["_duration", 0, [0]]
];

// Check if build is finished
[_startTime, _duration] call GW_client_fnc_numbersIsFinished