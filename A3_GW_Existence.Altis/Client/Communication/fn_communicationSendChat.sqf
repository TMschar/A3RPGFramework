#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_communicationSendChat.sqf
*
* Parameter(s):
*     0 (REQUIRED): STRING - Message to send
*     1 (OPTIONAL): STRING - Override Title
*
* Description:
*     Sends a chat message to everyone
*/
scriptName "GW_client_fnc_communicationSendChat: main";
scopeName "main";

params [["_message", "", [""]], ["_overrideTitle", "", [""]]];

// Error check
if (_message isEqualTo "") exitWith {["Need to pass a message", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

private _playerName = [player] call GW_client_fnc_playersGetName;
private _array = [[opfor, _overrideTitle, _message, time], [playerSide, _playerName, _message, time]] select (_overrideTitle isEqualTo "");

// Broadcast
GW_globalChat_messages pushBack _array;
publicVariable "GW_globalChat_messages"