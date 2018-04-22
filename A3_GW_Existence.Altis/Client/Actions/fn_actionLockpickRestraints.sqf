#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_actionLockpickRestraints.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit to lockpick handcuffs of
 *
 * Description:
 *     Function to lockpick restraints
 */
scriptName "GW_client_fnc_actionLockpickRestraints: main";
scopeName "main";

if !(params [
    ["_unit", objNull, [objNull]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

// Start action with 50 percentage chance of success
if (["Lockpick"] call GW_client_fnc_startAction && {[50] call GW_client_fnc_numbersGetChance}) then {
    [HINT_NORMAL, "Picklocking Succeeded", "You successfully picked the lock on the handcuffs. The target will now be unrestrained."] call GW_client_fnc_notificationsAdd;
    [LOG_INFO, format ["Lockpicked %1:%2's handcuffs.", name _unit, getPlayerUID _unit], _fnc_scriptName] call GW_server_fnc_log;

    // Unrestrain
    [_unit] call GW_client_fnc_actionUnrestrain
} else {
    [HINT_AMBER, "Picklocking Failed", "You failed picking the lock on the handcuffs."] call GW_client_fnc_notificationsAdd
};
