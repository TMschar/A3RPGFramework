#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_captureZonesZoneCaptured.sqf
 *
 * Parameter(s):
 *     0: STRING - Name of public variable
 *     1: ARRAY  - Array with arguments from public variable
 */
scriptName "GW_server_fnc_captureZonesZoneCaptured: main";
scopeName "main";

if !(params [
    ["_variableName", "", [""]],
    ["_args", [], [[]]]
]) throw "Param error";

if !(_args params [
    ["_captureZoneObject", objNull, [objNull]],
    ["_unit", objNull, [objNull]]
]) throw "Arguments error";

private _group = group _unit;
private _groupID = groupID _group;

// Get the specific zone
private _zone = [];
private _zoneIndex = -1;
{
    if (_x param [0, objNull, [objNull]] isEqualTo _captureZoneObject) then {
        _zone = _x;
        _zoneIndex = _forEachIndex;
    };
} forEach GW_captureZones_zones;

if !(_zone params [
    ["_captureZoneObject", objNull, [objNull]],
    ["_marker", "", [""]],
    ["_beingCaptured", false, [true]],
    ["_groupOwner", grpNull, [grpNull]],
    ["_displayName", "", [""]]
]) throw "Array error";

// Update zones
private _zoneUpdated = [_captureZoneObject, _marker, false, _group];
GW_captureZones_zones set [_zoneIndex, _zoneUpdated];
publicVariable "GW_captureZones_zones";

// Notify everyone about new owner of zone
[HINT_AMBER, "Capture Zones Notice", format [
    "The %1 has been captured by %2.",
    _displayName,
    _groupID
]] remoteExecCall ["GW_client_fnc_notificationsAdd", -2];

// Update marker
_marker setMarkerText format ["%1 (%2)", _displayName, _groupID];

// Do special things if its a flag pole
if (typeOf _captureZoneObject == "FlagPole_F") then {
    // Set flag texture
    switch (side _groupOwner) do {
        case civilian: { _captureZoneObject setFlagTexture "\A3\Data_F\Flags\Flag_CSAT_Co.paa"; };
        case west:     { _captureZoneObject setFlagTexture "\A3\Data_F\Flags\Flag_NATO_Co.paa"; };
    };

    // Raise flag
    if (flagAnimationPhase _captureZoneObject != 1) then { _captureZoneObject setFlagAnimationPhase 1; };
};

// Log the new group owner
[LOG_INFO, format ["%1 captured the %2", _groupID, _displayName], _fnc_scriptName] call GW_server_fnc_log;
