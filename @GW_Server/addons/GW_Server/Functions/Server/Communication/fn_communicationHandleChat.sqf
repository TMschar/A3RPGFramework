#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_communicationHandleChat.sqf
 *
 * Description:
 *     Handles the chat
 */
scriptName "GW_server_fnc_communicationHandleChat: main";
scopeName "main";

// Loop infinitely
for "_i" from 0 to 1 step 0 do {
    // Go through all messages
    {
        _x params ["", "", "", "_time"];

        // See if 20 seconds has passed; if that is the case
        // delete the message and update the variable globally
        private _timeSinceSend = time - _time;
        if (_timeSinceSend > 20) then {
            // Delete
            GW_globalChat_messages deleteAt _forEachIndex;

            // Broadcast
            publicVariable "GW_globalChat_messages";
        };
    } forEach GW_globalChat_messages;

    // Delete top message if more than 4 elements
    if (count GW_globalChat_messages > 4) then {
        GW_globalChat_messages deleteAt 0
    };

    // Wait
    sleep 1;
};