#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_captureZonesCanCapture.sqf
 *
 * Parameter(s):
 *     0: OBJECT - The object to capture
 *
 * Returns:
 *     BOOLEAN
 */
scriptName "GW_client_fnc_captureZonesCanCapture: main";
scopeName "main";

if (!params [["_captureZoneObject", objNull, [objNull]]]) throw "Param error";
if (isNull _captureZoneObject) exitWith { ["Capture Object NULL", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

private _groupOwner = grpNull;
private _isCaptureZoneObject = ({_x param [0, objNull, [objNull]] isEqualTo _captureZoneObject} count GW_captureZones_zones) > 0;
private _isNeutral = ({_groupOwner = _x param [3, grpNull, [grpNull]]; isNull _groupOwner} count GW_captureZones_zones) > 0;
private _unitsInGroup = units group player;
private _organizationsOnline = {_x getVariable ["organizationName", ""] != ""} count allGroups;

// Evaluate and return
_isCaptureZoneObject
&& _groupOwner != group player
&& {playerSide != west || _isNeutral}
&& {alive player}
&& {playerSide != independent}
&& {count _unitsInGroup >= 2}
&& {count _organizationsOnline > 2}