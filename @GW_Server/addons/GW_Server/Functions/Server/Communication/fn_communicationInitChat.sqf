#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_communicationInitChat.sqf
 *
 * Description:
 *     Initializes the global chat system
 */
scriptName "GW_server_fnc_communicationInitChat: main";
scopeName "main";

// Init variable and broadcast it
GW_globalChat_messages = [];
publicVariable "GW_globalChat_messages";

// Handle chat
[] spawn GW_server_fnc_communicationHandleChat