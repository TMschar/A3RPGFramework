#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_log.sqf
 *
 * Parameter(s):
 *     0: NUMBER - Category Number
 *     1: STRING - Text to log
 *     2: STRING - Name of script who called log
 *
 */
scriptName "GW_server_fnc_log: main";
scopeName "main";

params [["_category", 0, [0]], ["_logText", "", [""]], ["_scriptName", "", [""]]];

if (_logText isEqualTo "") exitWith {};
if (_scriptName isEqualTo "") then {_scriptName = "Unknown"};

// Handle Remote Execution
private _sourceUnitInformation = if (isRemoteExecuted) then {
    // Check if remote executor is server
    if (remoteExecutedOwner isEqualTo 2) then {
        ["Server", str remoteExecutedOwner];
    } else {
        private _unit = [remoteExecutedOwner] call GW_client_fnc_getUnitByOwnerID;
        private _hc = missionNamespace getVariable [STR_HC, objNull];
        if (!isNull _unit && {_unit isEqualTo _hc}) then {
            ["Headless Client", str owner _hc];
        } else {
            [name _unit, getPlayerUID _unit];
        };
    };
} else {
    if (isServer) then {
        ["SERVER", "2"];
    } else {
        private _hc = missionNamespace getVariable [STR_HC, objNull];
        if (IS_HC) then {
            ["Headless Client", str owner _hc];
        } else {
            [name player, getPlayerUID player];
        };
    };
};

// Log
_sourceUnitInformation params [["_stringName", "", [""]], ["_stringID", "", [""]]];
[1, "GW_Log", [_category, _logText, _scriptName, _stringName, _stringID]] call GW_ext_fnc_networkPublicVariable
