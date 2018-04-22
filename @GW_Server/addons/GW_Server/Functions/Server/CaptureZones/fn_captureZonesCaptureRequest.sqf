#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_captureZonesCaptureRequest.sqf
 *
 * Parameter(s):
 *     0: STRING - Variable Name
 *     1: ARRAY  - Array with values from pvar
 */
scriptName "GW_server_fnc_captureZonesCaptureRequest: main";
scopeName "main";

if !(params [
    ["_variableName", "", [""]],
    ["_args", [], [[]]]
]) throw "Param error";

if !(_args params [
    ["_captureZoneObject", objNull, [objNull]],
    ["_unit", objNull, [objNull]]
]) throw "Param error";

["Capture zone request received", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;

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
private _zoneUpdated = [_captureZoneObject, _marker, true, _groupOwner];
GW_captureZones_zones set [_zoneIndex, _zoneUpdated];
publicVariable "GW_captureZones_zones";

// If the zone is not being captured
if (!_beingCaptured) then { [group _unit, _marker, _displayName] call GW_server_fnc_captureZonesCaptureStart; };

// Send back
private _return = [_captureZoneObject, objNull] select _beingCaptured;
[PVAR_CLIENT, _variableName, _return, owner _unit] call GW_ext_fnc_networkPublicVariable;