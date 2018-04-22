#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_petrolStationsInit.sqf
 */
#define CONFIG_PETROLSTATIONS (missionConfigFile >> "CfgPetrolStations" >> worldName)
#define CLASS_SETTINGS (CONFIG_PETROLSTATIONS >> "Settings")
#define ROBBABLE_OBJECT_CLASSNAME (getText (CONFIG_PETROLSTATIONS >> "Settings" >> "robbableObject"))
#define CLASSES_PETROLSTATIONS ("true" configClasses (CONFIG_PETROLSTATIONS >> "PetrolStations"))
#define COLOUR_OPFOR ([east] call BIS_fnc_sideColor)
#define KEY_WINDOWS ([DIK_LWIN] call GW_client_fnc_playerKeyDictionary)

scriptName "GW_server_fnc_petrolStationsInit: main";
scopeName "main";

if (!isClass CONFIG_PETROLSTATIONS) throw "No petrol station class for world";

// Notify about initialization
[LOG_INFO, "Initializing Petrol Stations", _fnc_scriptName] call GW_server_fnc_log;

// Add publicvariable eventhandler
"GW_petrolStations_petrolStationsRob" addPublicVariableEventHandler { _this call GW_server_fnc_petrolStationsRob; };

// Make sure there is a robbale object classname
if (ROBBABLE_OBJECT_CLASSNAME isEqualTo "") throw "No robbable object in config";

// Loop through gas stations
{
    private _position = getArray (_x >> "position");
    private _basePayout = getNumber (_x >> "basePayout");
    private _robbableObject = _position nearestObject ROBBABLE_OBJECT_CLASSNAME;

    // Make sure an object is found
    if (_position isEqualTo []) throw "No position or empty array in petrol stations config";
    if (count _position < 3) throw "3 elements must be provided";
    if (_basePayout < 1) throw "No base payout set for Petrol Station, or the base payout is less than 1";
    if (isNull _robbableObject) throw "No object found in petrol stations initialization";

    // Setup robbable object
    _robbableObject setVariable ["nametags_title", "Petrol Station Cashdesk", true];
    _robbableObject setVariable ["nametags_subtitle", KEY_WINDOWS, true];
    _robbableObject setVariable ["nametags_title_colour", COLOUR_OPFOR, true];
    _robbableObject setVariable ["petrolStation", [-1, false, _basePayout], true];

    // Setup marker
    private _marker = createMarker [configName _x, _position];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "loc_Fuelstation";
    _marker setMarkerColor "ColorRed";
    _marker setMarkerText "Petrol Station";
} forEach CLASSES_PETROLSTATIONS;

// Notify about finish
[LOG_INFO, "Initialization of Petrol Stations finished", _fnc_scriptName] call GW_server_fnc_log;