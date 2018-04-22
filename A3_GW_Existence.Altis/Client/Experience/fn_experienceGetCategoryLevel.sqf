#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_experienceGetCategoryLevel.sqf
*
*    Parameter(s):
*        0: NUMBER - Index of category
*
*    Returns:
*        NUMBER
*
*    Description:
*        Checks what level you are in leveling system,
*        returns a number which represents at what level you are in that category.
*/
scriptName "GW_client_fnc_experienceGetCategoryLevel: main";
scopeName "main";

#define CONFIG (missionConfigFile >> "CfgExperience")
#define CLASSES ("true" configClasses (CONFIG >> "Categories"))

if !(params [
    ["_index", 0, [0]]
]) exitWith {
    diag_log "Not enough params passed"
};

// Loop through and get config classes for levels for the corresponding index
private _levelsConfigClasses = [];
{
    private _id = getNumber (_x >> "id");
    if (_id isEqualTo _index) exitWith {
        _levelsConfigClasses = "true" configClasses (_x >> "levels")
    };
    true
} count CLASSES;

// Loop through levels
private _experience = (GW_Player_Experience param [_index, [], [[]]]) param [0, 0, [0]];
private _currentLevel = 0;
{
    private _experienceRequired = getNumber (_x >> "pointsRequired");
    if (_experience > _experienceRequired) then {
        _currentLevel = getNumber (_x >> "id")
    };
    true
} count _levelsConfigClasses;

// Return level
_currentLevel
