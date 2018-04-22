#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_experienceCategoryHasLevel.sqf
*
*    Parameter(s):
*        0: NUMBER - Category to check
*	     1: NUMBER - Level to check
*
*    Returns:
*        BOOLEAN
*
*    Description:
*        Checks if a player has a certain level in a certain category and returns a boolean dependeing
*		 on if the player has that level or not.
*/
scriptName "GW_client_fnc_experienceCategoryHasLevel: main";
scopeName "main";

if !params [
    ["_category", 0, [0]],
    ["_level", 0, [0]]
] exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

// Block spawning a new thread of this function
if canSuspend exitWith {
    [format ['Spawning not allowed (%1)', _fnc_scriptName]] call GW_client_fnc_error
};

// Return boolean
private _currentLevel = _category call GW_client_fnc_experienceGetCategoryLevel;
_currentLevel >= _level