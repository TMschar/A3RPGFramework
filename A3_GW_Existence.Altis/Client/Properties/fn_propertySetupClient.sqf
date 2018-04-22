#include "script_component.hpp"
/*
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_propertySetupClient.sqf
*
*    Parameter(s):
*        0: BOOLEAN - Pass in true if property should initialize, else just pass in false to let initialization of player continue
*        1: NUMBER  - Type of property
*                     0: HOUSE
*                     1: GARAGE
*                     2: SAFEHOUSE
*        2: STRING  - Owner of said property, house or garage should be Steam ID and safe houses should be organization name
*        3: ARRAY   - Array with location of property in format [x, y, z]
*
*    Description:
*        Sets up a property for a client
*/
scriptName "GW_client_fnc_propertySetupClient: main";
scopeName "main";

params [
    ["_isProperty", false, [false]],
    ["_propertyType", 0, [0]],
    ["_propertyOwner", "", [""]],
    ["_propertyLocation", [], [[]]]
];

// It is not a property, so set data as received
// and let client init pass through.
if (!_isProperty) exitWith {GW_InitPlayer_PropertyDataReceived = true};

// Get the nearest house to the location, this includes all of
// houses, garages and safe houses as they are all under the
// type "house".
private _propertyObject = _propertyLocation nearestObject "House";

// Set count variable depending on what type of property it is.
// This is important as we allow different amounts of properties,
// depending on what type it is.
private _countVariable = [
    "GW_Properties_Houses_Count",
    "GW_Properties_Garages_Count",
    "GW_Properties_SafeHouses_Count"
] select _propertyType;

// Set property marker properties depending on what type
// of property it is.
private _propertyMarker = [
    [
        "House",
        "textures\map_icons\house.paa"
    ],
    [
        "Garage",
        "textures\map_icons\garage.paa"
    ],
    [
        "Safehouse",
        "textures\map_icons\safehouse.paa"
    ]
] select _propertyType;
_propertyMarker params ["_propertyType", "_propertyIconPath"];

// Fail safe if property variables are not defined yet.
if (isNil "GW_MapDrawIcons_Properties") then {GW_MapDrawIcons_Properties = []};
if (isNil "GW_Properties_Objects") then {GW_Properties_Objects = []};

private _propertyCount = missionNamespace getVariable [_countVariable, 0];

// Increment property counter by one, because
// this is one more property that the client owns.
missionNamespace setVariable [
    _countVariable,
    _propertyCount + 1
];

// Append to this array so it will display an icon within
// the map icon draw system.
GW_MapDrawIcons_Properties pushback [
    _propertyType,                          // Name of Property Type
    GW_Mission_Root + _propertyIconPath,    // Icon Path
    [1, 1, 1, 1],                           // Color
    _propertyObject                         // Property object
];

// Add to property objects, this will act as a "keychain" for the
// property.
GW_properties_objects pushback [_propertyObject, _propertyType];

// Log
[
    LOG_INFO,
    format [
        localize "STR_GW_LOG_SYSTEM_PROPERTIES_CLIENTSETUPFINISHED",
        _propertyLocation,
        name player,
        getPlayerUID player
    ],
    _fnc_scriptName
] call GW_server_fnc_log;

// Property data has been received, let client
// initialization pass.
GW_InitPlayer_PropertyDataReceived = true