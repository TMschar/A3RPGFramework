#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_arrestWarrantsRequest.sqf
 *
 * Description:
 *     Requests arrest warrants from server
 */
scriptName "GW_client_fnc_arrestWarrantsRequest: main";
scopeName "main";

disableSerialization;

// Make sure we can suspend
if (!canSuspend) exitWith {["Must be ran in scheduled environment", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

// Get parameters
params [["_parentDisplay", displayNull, [displayNull]], ["_openDisplay", true, [true]]];

// Query warrants
GW_arrestWarrants_warrants = nil;
[[], "GW_server_fnc_warrantsQueryWarrants"] call GW_ext_fnc_networkCallServer;

// Wait until warrants are received
private _warrants = [];
waitUntil {
    _warrants = missionNamespace getVariable ["GW_arrestWarrants_warrants", nil];
    !isNil "_warrants"
};

// Create display
if (_openDisplay) then {
    if (isNull _parentDisplay) then {
        if (dialog) then {closeDialog 0};
        createDialog "GW_displayWarrants";
    } else {
        _parentDisplay createDisplay "GW_displayWarrants";
    };
} else {
    _warrants breakOut "main";
};
