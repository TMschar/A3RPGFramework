#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_addNotification.sqf
 *
 * Parameter(s):
 *     0: STRING - Title of Notification
 *     1: STRING - Text of Notification
 */
scriptName "function: main";
scopeName "main";

if (!params [["_title", "", [""]], ["_text", "", [""]]]) exitWith {};

// playSound "3DEN_NotificationDefault";

// private _notifications = missionNamespace getVariable ["GW_HUD_Notifications_Notifications", []];
// _notifications pushback [_title, _text];

// Make notifications global
// GW_HUD_Notifications_Notifications = _notifications

[HINT_NORMAL, _title, _text] call GW_client_fnc_notificationsAdd;