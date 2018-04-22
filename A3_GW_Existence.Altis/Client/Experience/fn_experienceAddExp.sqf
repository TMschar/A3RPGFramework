#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_experienceAddExp.sqf
*
* Parameter(s):
*     0: STRING - Class of Experience Addition Properties
*
* Description:
*     Add experience that is configured via config file. If you want to add raw experience,
*     use GW_client_fnc_experienceCategoryAddExperience.
*/
#define CONFIG_EXPERIENCEEARNINGS (missionConfigFile >> "CfgExperience" >> "Earnings")

scriptName "GW_client_fnc_experienceAddExp: main";
scopeName "main";

if !params [["_configClass", "", [""]]] exitWith {};

private _expConfigClass = CONFIG_EXPERIENCEEARNINGS >> _configClass;
private _expCategoryArray = getArray (_expConfigClass >> "categories");

if !(isClass _expConfigClass) exitWith {["No class with that name", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

// Loop through array
{
    _x params [["_id", 0, [0]], ["_expAmount", 0, [0]], ["_reason", "", [""]]];

    // Add experience
    [_id, _expAmount, _reason, false] call GW_client_fnc_experienceCategoryAddExperience;

    // Notify
    [HINT_NORMAL, "Experience Points Earned", format [
        "You earned %1 experience points in category %2",
        _expAmount,
        _id call GW_client_fnc_experienceGetCategoryName
    ]] call GW_client_fnc_notificationsAdd
} forEach _expCategoryArray