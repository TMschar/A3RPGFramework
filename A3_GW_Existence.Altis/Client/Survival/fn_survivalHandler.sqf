#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_survivalHandler.sqf
*
* Parameter(s):
*     0: BOOLEAN - Start or stop
*
* Description:
*     Handler for Survival
*/
#define OEF_HANDLE GW_survivalHandler_oefHandle

scriptName "gw_client_fnc_survivalHandlerHandler: main";
scopeName "main";

params [["_start", false, [false]]];

// Set variable for running
private _isRunning = !isNil "GW_survivalHandler_oefHandle";

// Stop survival handler
if (_isRunning && {!_start}) exitWith {
    removeMissionEventHandler ["EachFrame", GW_survivalHandler_oefHandle];
    OEF_HANDLE = nil;

    // Log
    [LOG_INFO, "Stopped survival handling", _fnc_scriptName] call GW_server_fnc_log
};

// Check if handler is already running
if (_isRunning) exitWith {
    ["Survival handler already running", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Start handler
OEF_HANDLE = addMissionEventHandler ["EachFrame", {
    if (diag_frameno % 30 == 0) then {
        // Do updates
        call GW_client_fnc_survivalUpdateBackpack;
        call GW_client_fnc_survivalUpdateThirst;
        call GW_client_fnc_survivalUpdateHunger;

        // Validate inventory to make sure the player is not overweight
        private _overweight = missionNamespace getVariable ["GW_survivalHandler_overweight", false];
        if (!_overweight && {[player] call GW_client_fnc_virtualInventoryIsOverweight}) then {
            [true] call GW_client_fnc_survivalHandleOverweight;
            missionNamespace setVariable ["GW_survivalHandler_overweight", true];
        } else {
            if (_overweight && {!([player] call GW_client_fnc_virtualInventoryIsOverweight)}) then {
                [false] call GW_client_fnc_survivalHandleOverweight;
                missionNamespace setVariable ["GW_survivalHandler_overweight", false];
            };
        };

        // Check if starving or dehydrated
        private _hunger = [[], missionNamespace, "GW_player_bodyStats", "hunger"] call GW_client_fnc_dictGetValueByKey;
        private _thirst = [[], missionNamespace, "GW_player_bodyStats", "thirst"] call GW_client_fnc_dictGetValueByKey;
        private _handicapped = missionNamespace getVariable ["GW_survivalHandler_handicapped", false];
        if (diag_frameno % 50 == 0) then {
            if (_thirst >= 1 || {_hunger >= 1}) then {
                if (!_handicapped) then {
                    [false] call GW_client_fnc_survivalHandleHandicaps;
                    missionNamespace setVariable ["GW_survivalHandler_handicapped", true];
                };
            } else {
                if (_handicapped) then {
                    [true] call GW_client_fnc_survivalHandleHandicaps;
                    missionNamespace setVariable ["GW_survivalHandler_handicapped", false];
                };
            };
        };
    };
}];

// Log to debug log
["Started survival handler", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
