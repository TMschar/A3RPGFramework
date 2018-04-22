#define NAMESCRIPT _fnc_scriptName
/*
    Copyright (C) SimZor, SimZor Studios 2017
    All Rights Reserved

    Filename: fn_createResource.sqf

    Parameter(s):
        0: STRING - Resource Name
        1: STRING - Resource Type
        2: INTEGER - Duration for resource to be displayed
        3: BOOL - Show on map

    Returns:
        NOTHING
*/
scriptName "GW_client_fnc_createResource: main";
scopeName "main";

params [
    ["_resourceName", "", [""]],
    ["_resourceType", "PLAIN", [""]],
    ["_resourceDuration", 0, [0]],
    ["_showOnMap", false, [false]]
];

// Disable Serialization
disableSerialization;

// If resource is already active, destroy it first
if (_resourceName call GW_client_fnc_guiDisplayActive) then { _resourceName call GW_client_fnc_destroyResource; };

// Create Resource
_resourceName cutRsc [_resourceName, _resourceType, _resourceDuration, _showOnMap]
