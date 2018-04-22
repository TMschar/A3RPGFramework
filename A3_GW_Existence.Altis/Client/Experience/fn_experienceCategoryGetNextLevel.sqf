#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_experienceCategoryGetNextLevel.sqf
*
*    Parameter(s):
*        0: INDEX
*
*    Returns:
*        ARRAY
*
*    Description:
*        Gets experience and level for the next level and returns that in an array
*/
scriptName "GW_client_fnc_experienceCategoryGetNextLevel: main";
scopeName "main";

if !(params [
    ["_index", 0, [0]]
]) exitWith {
    [LOG_WARNING, "NOT ENOUGH PARAMS PASSED", _fnc_scriptName] call GW_server_fnc_log
};

private _config = missionConfigFile >> "CfgExperience";
private _classes = "true" configClasses (_config >> "Categories");

// Loop through and get config classes for levels for the corresponding index
private _levelsConfigClasses = [];
{
    private _id = getNumber (_x >> "id");
    if (_id isEqualTo _index) exitWith {
        _levelsConfigClasses = "true" configClasses (_x >> "levels")
    };
    true
} count _classes;

// Loop through levels
private _experience = (GW_Player_Experience param [_index, [], [[]]]) param [0, 0, [0]];
private _nextLevel = 0;
private _nextLevelExperience = 0;
private _givePerkpoints = 0;
{
    private _experienceRequired = getNumber (_x >> "pointsRequired");
    if (_experience <= _experienceRequired) exitWith {
        _nextLevel = getNumber (_x >> "id");
        _nextLevelExperience = getNumber (_x >> "pointsRequired");
        private _givePerkpoints = getNumber (_x >> "perkPointsGive")
    };
    true
} count _levelsConfigClasses;

// Return next level
[_nextLevel, _nextLevelExperience, _givePerkpoints]
