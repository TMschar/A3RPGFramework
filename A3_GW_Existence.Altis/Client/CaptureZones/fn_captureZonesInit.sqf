#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_captureZonesInit.sqf
 */
scriptName "GW_client_fnc_captureZonesInit: main";
scopeName "main";

"GW_captureZones_capture" addPublicVariableEventHandler {
    if (isServer) exitWith { ["Server cannot execute this", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

    if (!params [
        ["_variableName", "", [""]],
        ["_captureZoneObject", [], [[]]]
    ]) throw "Param error";

    // Spawn a new thread to handle the capturing of the zone
    [_captureZoneObject] spawn GW_client_fnc_captureZonesCapture;
};