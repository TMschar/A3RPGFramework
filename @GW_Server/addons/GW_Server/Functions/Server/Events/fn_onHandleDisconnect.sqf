#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_onHandleDisconnect.sqf
 *
 * Parameter(s):
 *     4
 */
scriptName "GW_server_fnc_onHandleDisconnect: main";
scopeName "main";

params [["_unit", objNull, [objNull]], ["_id", 0, [0]], ["_uid", "", [""]], ["_name", "", [""]]];

// Inactivate Headless Client
if (_unit isEqualTo HEADLESSCLIENT) exitWith {
    missionNamespace setVariable ["GW_HC_isActive", false, true];
    [LOG_INFO, "Headless Client Disconnected", _fnc_scriptName] call GW_server_fnc_log
};

// Disconnect message
[format ["%1 disconnected to lobby", _name], "GW Existence"] call GW_client_fnc_communicationSendChat;

// Delete body
deleteVehicle _unit
