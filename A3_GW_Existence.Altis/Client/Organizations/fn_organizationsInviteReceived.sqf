#include "script_component.hpp"
/*
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_organizationInviteReceived.sqf
 *
 * Parameter(s):
 *     0: GROUP - Group of inviter
 *     1: STRING - Name of organization
 */
scriptName "GW_client_fnc_organizationsInviteReceived: main";
scopeName "main";

// Error checks
if (!isRemoteExecuted) exitWith { ["Must be called using remoteExec", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (!canSuspend) exitWith { ["Must be able to suspend", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Get parameters
if (!params [["_group", grpNull, [grpNull]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Make sure group is not null
if (isNull _group) exitWith { ["Group is null", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Get name of inviters organization
private _orgName = _group getVariable ["organizationName", ""];
if (_orgName isEqualTo "") exitWith { ["No org. name", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Get current organization
private _myOrgName = group player getVariable ["organizationName", ""];
if (_myOrgName != "") exitWith { ["Already in an organization", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

private _threadHandle = missionNamespace getVariable ["GW_organizationsInviteReceived_threadHandle", scriptNull];
if (!isNull _threadHandle) then {terminate _threadHandle};

// Thread to handle confirmation
GW_organizationsInviteReceived_threadHandle = [_orgName, _group, _fnc_scriptName] spawn {
    scriptName "GW_client_fnc_organizationsInviteReceived: wait for choice";
    scopeName "main";

    params [["_orgName", "", [""]], ["_group", grpNull, [grpNull]], ["_fnc_scriptName", "", [""]]];

    // Close all displays
    [] call GW_client_fnc_guiCloseAllDisplays;

    // Prompt user
    if !([format [
            "Invited to join %1",
            _orgName
        ], format [
            "You have been invited to join an organization called %1. Do you want to accept this invite?",
            _orgName
        ], "ACCEPT", "DECLINE"] call GW_client_fnc_guiPrompt
    ) exitWith { ["Declined invitation", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

    // Add member into organization
    [PVAR_SERVER_HC, "GW_organizations_memberAddRequest", [_group, player]] call GW_ext_fnc_networkPublicVariable;

    // Join group
    [player] joinSilent _group;

    // Notify members in group
    private _playerName = [player] call GW_client_fnc_playersGetName;
    [HINT_NORMAL, "New Organization Member", format [
        "%1 has joined your organization as a recruit.",
        _playersName,
        _orgName
    ]] remoteExecCall ["GW_client_fnc_notificationsAdd", _group];

    // New log entry
    [LOG_INFO, format ["Joined group %1", _orgName], _fnc_scriptName] call GW_server_fnc_log;
};
