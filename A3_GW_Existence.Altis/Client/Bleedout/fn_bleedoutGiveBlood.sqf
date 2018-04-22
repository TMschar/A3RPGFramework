#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_bleedoutGiveBlood.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Target to give blood to
 */
scriptName "GW_client_fnc_bleedoutGiveBlood: main";
scopeName "main";

// Get parameters
if (!params [["_unitTarget", objNull, [objNull]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
};

// Error checks
if (!canSuspend) exitWith {["Cannot suspend"] call GW_ext_fnc_loggingDebugLog};
if (_unitTarget getVariable ["bleedoutGivenBlood", false]) exitWith {};
if (_unitTarget getVariable ["incapacitated", false]) exitWith {};
if !([player, "Bloodbag"] call GW_client_fnc_virtualInventoryHasItem) exitWith {};

// Start progress (only continue if progress finishes and item can be removed)
if (
    ["GiveBlood"] call GW_client_fnc_startProgress
    && {[_unitTarget, "Bloodbag", 0, false] call GW_client_fnc_virtualInventoryChange}
) then {
    // Set variable on target
    _unitTarget setVariable ["bleedoutGivenBlood", true, true];

    // Notify success
    [
        HINT_NORMAL,
        "Gave Blood",
        "You have given blood to the target patient. He will now survive for longer without bleeding out"
    ] call GW_client_fnc_notificationsAdd;
} else {
    // Notify fail
    [
        HINT_WARNING,
        "Blood Transfusion Failed",
        "The blood transfusion failed and the patient has not been given any blood"
    ] call GW_client_fnc_notificationsAdd;
};