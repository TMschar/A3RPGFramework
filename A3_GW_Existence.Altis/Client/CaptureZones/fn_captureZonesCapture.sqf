#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_captureZonesCapture.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Capture Zone Object
 *
 * Throws:
 *     Exception
 */
scriptName "GW_client_fnc_captureZonesCapture: main";
scopeName "main";

if (!params [["_captureZoneObject", objNull, [objNull]]]) throw "Param error";

if (isNull _captureZoneObject) throw "Capture zone object is NULL";
if (_captureZoneIndex isEqualTo -1) throw "Number error";

private _conditionsArgs = [player, _captureZoneObject];
private _conditionsCode = {
    params [["_unit", objNull, [objNull]], ["_captureZoneObject", objNull, [objNull]]];
    _unit distance _captureZoneObject < 5
    && {alive _unit}
    && {!isNull _unit}
    && {!(_unit getVariable ["incapacitated", false])}
    && {!(_unit getVariable ["restrained", false])}
    && {isNull objectParent _unit}
};

if (["CaptureZone", [], _conditionsArgs, _conditionsCode] call GW_client_fnc_startProgress) then {
    // Notify
    [HINT_NORMAL, "Capture Zones Notice", "You successfully captured the zone."] call GW_client_fnc_notificationsAdd;

    // Send to server
    [PVAR_SERVER_HC, "GW_captureZones_zoneCaptured", [_captureZoneObject, player]] call GW_ext_fnc_networkPublicVariable;
} else {
    // Notify
    [HINT_WARNING, "Capture Zones Notice", "You failed to capture the zone"] call GW_client_fnc_notificationsAdd;
}