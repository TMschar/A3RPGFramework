
#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: undefined
 *
 * Parameter(s):
 *     0 (REQUIRED): NUMBER - Type of message to send
 *     1 (REQUIRED): ARRAY  - Array of arguments
 *
 * Description:
 *     Use this function to broadcast a message over the network.
 *     Needs to be remoteExecuted.
 */
scriptName "GW_client_fnc_broadcast: main";
scopeName "main";

if !(params [["_type", 0, [0]], ["_args", [], [[]]]]) exitWith {["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};
switch _type do {
    case 0: {
        _args params [["_message", "", [""]]];

        // SystemChat
        systemChat _message;
    };
};
