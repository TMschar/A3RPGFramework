#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_retrieveMessage.sqf
 */
scriptName "GW_client_fnc_retrieveMessage: main";
scopeName "main";

if !(params [
    ["_to", "", [""]],
    ["_from", "", [""]],
    ["_message", "", [""]],
    ["_location", "", [""]],
    ["_realTime", [], [[]]],
    ["_position", [], [[]]],
    ["_unitSender", objNull, [objNull]]
]) exitWith {["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

private _messageKey = [DIK_END] call GW_client_fnc_playerKeyDictionary;
private _messagePreview = _message select [0, 15];
private _currentMessages = missionNamespace getVariable ["GW_Player_Messages", []];

// Show message
[HINT_NORMAL, "Message Received", format [
    "You have received a new message. Press %2 to see all your messages.<br/><br/>"
    + "<t font='RobotoCondensedBold'>From:</t> %1<br/>"
    + "<t font='RobotoCondensedBold'>Preview:</t> %3...",
    _from,
    _messageKey,
    _messagePreview
], "GUI\data\displays\displayChatMessage\send.paa"] call GW_client_fnc_notificationsAdd;

// Define default
if (_currentMessages isEqualTo []) then {GW_Player_Messages = []};

// Add message to local array
GW_Player_Messages pushback _this;
