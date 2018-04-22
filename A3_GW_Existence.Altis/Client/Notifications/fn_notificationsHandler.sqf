#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_notificationsHandler.sqf
 */
scriptName "GW_client_fnc_notificationsHandler: main";
scopeName "main";

// Log initialization
[LOG_INFO, "Notification Handler Initialized", _fnc_scriptName] call GW_server_fnc_log;

// Default variable
GW_notificationsHandler_queue = [];

// Loop indefinitely
for "_i" from 0 to 1 step 0 do
{
    // Loop through queue
    {
        _x params
        [
            ["_title", "", [""]],
            ["_message", "", [""]],
            ["_colour", [], [[]]]
        ];

        // Display hint
        [_title, _message, _colour] call GW_client_fnc_notificationsDisplay;

        // Delete notification from queue
        GW_notificationsHandler_queue deleteAt _forEachIndex;

        // Wait
        uiSleep 0.05;
    } forEach GW_notificationsHandler_queue;

    // Wait a tiny bit to not overload
    uiSleep 0.1;
};