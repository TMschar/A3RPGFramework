#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_captureZonesCaptureRequest.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Object to capture in capture zone
 */
scriptName "GW_client_fnc_captureZonesCaptureRequest: main";
scopeName "main";

if (!params [["_captureZoneObject", objNull, [objNull]]]) throw "No object parameter passed";
if (isNull _captureZoneObject) throw "Object is NULL";

// Send to server
[PVAR_SERVER_HC, "GW_captureSectors_capture", [_captureZoneObject, player]] call GW_ext_fnc_networkPublicVariable;