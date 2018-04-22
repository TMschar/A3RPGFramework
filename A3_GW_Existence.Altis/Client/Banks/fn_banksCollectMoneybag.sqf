#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_banksCollectMoneybag.sqf
 */
scriptName "GW_client_fnc_banksCollectMoneybag: main";
scopeName "main";

// Error checks
if (!isRemoteExecuted) exitWith { ["This function must be remotely executed", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (remoteExecutedOwner != 2) exitWith { ["This function can only be remotely executed by server", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (!canSuspend) exitWith { ["Cannot suspend", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (playerSide in [west, independent, east]) exitWith { ["Only civilians can collect moneybags", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Conditions
private _conditionArgs = [player, getPosATL player];
private _conditionCode = {
    params [["_unit", objNull, [objNull]], ["_startPos", [], [[]]]];
    getPosATL _unit distance _startPos < 2
    && {alive _unit}
    && {!isNull _unit}
    && {!(_unit getVariable ["incapacitated", false])}
};

// Start progress bar and manage it failing or succeeding
if (["", [10, "Collecting a bag of money", "", ""], _conditionArgs, _conditionCode] call GW_client_fnc_startProgress) then {
    // Notify
    [HINT_NORMAL, "Collected a money bag", "You collected a moneybag"] call GW_client_fnc_notificationsAdd;

    // Add moneybag
    [player, "Moneybag", 1, false] call GW_client_fnc_virtualInventoryChange;
} else {
    // Notify
    [HINT_WARNING, "Failed to collect moneybag", "You broke the moneybag and it is now gone."] call GW_client_fnc_notificationsAdd;
};