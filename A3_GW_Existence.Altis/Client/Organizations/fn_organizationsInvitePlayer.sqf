#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_organizationsInvitePlayer.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit to invite
 *     1: GROUP  - Group to invite the unit to
 */
scriptName "GW_client_fnc_organizationsInvitePlayer: main";
scopeName "main";

if (!params [["_unit", objNull, [objNull]], ["_group", grpNull, [grpNull]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
};

private _groupUnit = group _unit;
private _groupUnitID = _groupUnit getVariable ["organization_id", ""];

// Make sure player is not already in a group
if (_groupUnitID != "") exitWith {
    [
        HINT_WARNING,
        "Invitation Unsuccessful",
        "The player you tried inviting is already in another organization."
    ] call GW_client_fnc_notificationsAdd;
};

// Send invite to target
[_group] remoteExec ["GW_client_fnc_organizationsInviteReceived", _unit];

// Send confirmation of invite back to inviting player
[HINT_NORMAL, "Invite Sent", format [
    "You invited %1 to join your organization %2.",
    [_unit] call GW_client_fnc_playersGetName,
    _groupName
]] call GW_client_fnc_notificationsAdd
