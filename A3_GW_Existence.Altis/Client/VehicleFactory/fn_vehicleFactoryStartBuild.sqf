#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleFactoryStartBuild.sqf
*
*    Parameter(s):
*        0: STRING - Vehicle Classname
*
*    Returns:
*        NOTHING
*
*    Description:
*        Starts a build for a vehicle
*/
scriptName "GW_client_fnc_vehicleFactoryStartBuild: main";
scopeName "main";

#define CONFIG (missionConfigFile >> "CfgFactories" >> "Vehicles")

if !params [
	["_vehicleClassname", "", [""]]
] exitWith {
	[LOG_WARNING, "No vehicle classname passed", _fnc_scriptName] call GW_server_fnc_log
};

if !(_vehicleClassname call GW_client_fnc_vehicleFactoryVehicleCanBuild) exitWith {};

// Pull information from config
private _vehicleClass = CONFIG >> _vehicleClassname;
private _illegal = getNumber (_vehicleClass >> "illegal") isEqualTo 1;
private _sellPrice = getNumber (_vehicleClass >> "sellprice");
private _duration = getNumber (_vehicleClass >> "duration");

// Make sure there is a class
if !(isClass _vehicleClass) exitWith {
	[LOG_WARNING, "No class with that name", _fnc_scriptName] call GW_server_fnc_log
};

// Add build to array
private _index = GW_vehicleFactory_currentBuilds pushBack [
	_vehicleClassname,
	_illegal,
	time,
	_sellPrice,
	_duration
];

// Create new thread to handle build
_index spawn {
	scriptName "GW_client_fnc_vehicleFactoryStartBuild: handleBuild";
	scopeName "main";

	params [["_index", 0, [0]]];

	private _build = GW_vehicleFactory_currentBuilds param [_index, [], [[]]];
	_build params [
		["_vehicleClassname", "", [""]],
		["_illegal", false, [true]],
		["_startTime", 0, [0]],
		["_sellPrice", 0, [0]],
		["_duration", 0, [0]]
	];

	for "_i" from 0 to 1 step 0 do {
		scopeName "loop";

		// Check if build has finished
		if (_index call GW_client_fnc_vehicleFactoryIsBuildFinished) exitWith {
			private _vehicleDisplayname = _vehicleClassname call GW_client_fnc_vehicleGetDisplayName;
			private _vehicleIconPath = _vehicleClassname call GW_client_fnc_vehicleGetIcon;

			// Notify
			[
				HINT_NORMAL,
				"Vehicle Factory - Build Finished",
				format [
					"Your %1 that was being built in your factory has been finished. You can pick it up by heading to one"
					+ "of the vehicle factories on map and clicking spawn.",
					_vehicleDisplayname
				],
				_vehicleIconPath
			] call GW_client_fnc_notificationsAdd;

			// Sync
			call {hint "remember sync func"};

			// Destroy thread
			breakOut "main"
		};

		uiSleep 1
	}
};

// Get vehicle info
private _vehicleName = _vehicleClassname call GW_client_fnc_vehicleGetDisplayName;
private _vehicleIcon = _vehicleClassname call GW_client_fnc_vehicleGetIcon;
private _vehicleType = _vehicleClassname call GW_client_fnc_vehicleGetCategory;

private _time = (_duration / 60) toFixed 1;
private _legality = ["legal", "illegal"] select _illegal;

// Notify
[
	HINT_NORMAL,
	"Vehicle Build Started",
	format [
		"You successfully started manufacturing a %1 %2. It will be finished in %3 minute(s). You can see the progress by going to 'My Vehicle Manufactory'"
		+ "at the vehicle factory. You will receive a notification when your build is ready.",
		_legality,
		_vehicleName,
		_time
	],
	_vehicleIcon
] call GW_client_fnc_notificationsAdd;

// Log
[
	LOG_INFO,
	format ["Started to manufactre a %1 %2.", _legality, _vehicleName],
	_fnc_scriptName
] call GW_server_fnc_log;