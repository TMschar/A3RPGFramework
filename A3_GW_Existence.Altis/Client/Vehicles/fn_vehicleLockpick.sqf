#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_vehicleLockpick.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Vehicle to lockpick
 */
scriptName "GW_client_fnc_vehicleLockpick: main";
scopeName "main";

if (!params [["_vehicle", objNull, [objNull]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (!canSuspend) exitWith { ["Scheduled environment required", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// New thread to handle sound
GW_vehicleLockpick_soundHandle = [_vehicle] spawn {
    scriptName "GW_client_fnc_vehicleLockpick: sound loop";
    scopeName "main";

    params [["_vehicle", objNull, [objNull]]];

    for "_i" from 0 to 1 step 0 do {
        [_vehicle, "alarmCar"] remoteExecCall ["GW_client_fnc_say3D", -2];
        uiSleep 2.5;
    };
};

// Flash lights
GW_vehicleLockpick_flashHandle = [_vehicle] spawn {
    scriptName "GW_client_fnc_vehicleLockpick: flash loop";
    scopeName "main";

    params [["_vehicle", objNull, [objNull]]];

    for "_i" from 0 to 1 step 0 do {
        player action ["lightOn",  _vehicle];
        uiSleep 0.5;

        player action ["lightOff",  _vehicle];
        uiSleep 0.5;
    };
};

// Set conditions and arguments to continue
// progress bar
private _conditionArgs = [player, _vehicle];
private _conditionCode = {
    params [["_unit", objNull, [objNull]], ["_vehicle", objNull, [objNull]]];
    _unit distance _vehicle < 7
    && {alive _unit}
    && {!isNull _unit}
    && {!(_unit getVariable ["incapacitated", false])}
    && {!isNull _vehicle}
};

// Start progress bar
if (["Lockpick", [], _conditionArgs, _conditionCode] call GW_client_fnc_startProgress && {[50] call GW_client_fnc_numbersGetChance}) then {
    [HINT_AMBER, "You picked the lock", "You successfully picked the lock to this vehicle. It is now unlocked."] call GW_client_fnc_notificationsAdd;

    // Unlock vehicle
    [_vehicle, false] call GW_client_fnc_vehicleManipulateLock;

    // Prompt to ask player if they want a copy of the keys or not
    private _copyKeys = ["Do you want to copy a pair of keys?",
        "You successfully picked the lock of this vehicle. However, in order to gain a keypair to it, you will have to pay a fee in order to copy the keys and get a pair yourself. This will cost £3500 and will be taken out from your bank account. Would you like to do so?",
        "COPY KEYS",
        "EXIT",
        findDisplay 46
    ] call GW_client_fnc_guiPrompt;

    // Ask if they want keys, in that case they have to pay for a pair.
    if (_copyKeys && {[0, 3500, 0] call GW_client_fnc_playersHandleMoney}) then {
        [player, _vehicle] call GW_client_fnc_vehicleGiveKeys;
    } else {
        [HINT_AMBER, "Failed to copy a keypair", "You either decided not to copy the keys, or you do not have sufficient money in your bank account."] call GW_client_fnc_notificationsAdd;
    };

    // Remove lockpick if player has one
    if ([player, "Lockpick"] call GW_client_fnc_virtualInventoryHasItem) then { [player, "Lockpick", 0] call GW_client_fnc_virtualInventoryChange; };

    // Give experience points
    [LEVEL_TOOLSOFTHETRADE, 150, "", false] call GW_client_fnc_experienceCategoryAddExperience;
    [LEVEL_VEHICLES, 50, "", false] call GW_client_fnc_experienceCategoryAddExperience;
    if (currentWeapon player != "") then { [LEVEL_WEAPONS, 20, "", false] call GW_client_fnc_experienceCategoryAddExperience; };
} else {
    [HINT_AMBER, "Lockpicking Failed", "You failed to lockpick the vehicle"] call GW_client_fnc_notificationsAdd;
};

// Terminate threads
terminate GW_vehicleLockpick_soundHandle;
terminate GW_vehicleLockpick_flashHandle;
