#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_numbersIsFinished.sqf
 *
 * Parameter(s):
 *     0: (REQUIRED) NUMBER - Time (in seconds) after mission start when timer started
 *     1: (REQUIRED) NUMBER - Duration (in seconds) of timer
 *
 * Returns:
 *     BOOLEAN
 *
 * Description:
 *     Checks if timer has completed using duration and start time
 */
scriptName "GW_client_fnc_numbersIsFinished: main";
scopeName "main";

if (!params [["_startTime", 0, [0]], ["_duration", 0, [0]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Check if timer is finished
(time - _startTime) - _duration >= 0