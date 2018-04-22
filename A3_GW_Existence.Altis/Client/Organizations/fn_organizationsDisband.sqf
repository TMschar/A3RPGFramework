#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_organizationsDisband.sqf
*
*    Parameter(s):
*        0: GROUP - Group to disband
*
*    Returns:
*        NOTHING
*
*    Description:
*        Sends a request of disbandment to server and makes everyone leave from organization. Needs to be executed in scheduled environment, else it will error.
*/
scriptName "GW_client_fnc_organizationsDisband: main";
scopeName "main";

if !(params [
    ["_group", grpNull, [grpNull]]
]) exitWith {
    [LOG_WARNING, "NOT ENOUGH PARAMS PASSED", _fnc_scriptName] call GW_server_fnc_log
};

[LOG_INFO, "Requested disbandment of organization", _fnc_scriptName] call GW_server_fnc_log;
[HINT_AMBER, "Disbanding Organization", "Please wait while your organization disbands..."] call GW_client_fnc_notificationsAdd;

// Make sure there is a organization and that player requesting it is the owner
private _organizationID = _group getVariable ["organization_id", ""];
if (isNull _group || {_organizationID isEqualTo ""} || {!(_organizationID isEqualTo getPlayerUID player)}) exitWith {
    [LOG_WARNING, "Request of disbandment failed due to variable difficulties", _fnc_scriptName] call GW_server_fnc_log
};

// Delete all players from group
[] remoteExecCall ["GW_client_fnc_organizationsDisbandFromPlayer", _group];

// Send disband request to server
[PVAR_SERVER_HC, "GW_Organizations_DisbandRequest", [_group, player]] call GW_ext_fnc_networkPublicVariable;

// Notify success
[HINT_NORMAL, "Organization Disbanded", "Your organization has successfully been disbanded as well as deleted."] call GW_client_fnc_notificationsAdd;
