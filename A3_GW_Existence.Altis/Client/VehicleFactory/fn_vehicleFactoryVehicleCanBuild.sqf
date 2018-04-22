#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleFactoryVehicleCanBuild.sqf
*
*    Parameter(s):
*        0: STRING - Vehicle Class
*
*    Returns:
*        BOOLEAN - True: ok, False: not ok
*
*    Description:
*        Helper function which checks if player can build a certain vehicle
*/
scriptName "GW_client_fnc_vehicleFactoryVehicleCanBuild: main";
scopeName "main";

params [["_vehicleClassname", "", [""]]];

// Error checks
if (count GW_vehicleFactory_currentBuilds > 2
	|| {!(playerSide isEqualTo civilian)}) then {
	false breakOut "main"
};

private _configClass = missionConfigFile >> "CfgFactories" >> "Vehicles" >> _vehicleClassname;
private _levelClass = "true" configClasses (_configClass >> "Level");
private _category = 0;
private _level = 0;

// Make sure there is a class with that name
if !(isClass _configClass) exitWith {false};

// Loop through level class
{
	_category = getNumber (_x >> "category");
	_level = getNumber (_x >> "level");
	true
} count _levelClass;

// Return true if has correct level
[_category, _level] call GW_client_fnc_experienceCategoryHasLevel
