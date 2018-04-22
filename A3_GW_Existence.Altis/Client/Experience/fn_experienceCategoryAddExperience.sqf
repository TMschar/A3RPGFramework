#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_experienceCategoryAddExperience.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): NUMBER  - Category Index
 *     1 (REQUIRED): NUMBER  - Amount of experience to add
 *     2 (REQUIRED): STRING  - Reason
 *     3 (OPTIONAL): BOOLEAN - Show message
 *
 * Description:
 *     Add experience points within a certain category
 */
scriptName "GW_client_fnc_experienceCategoryAddExperience: main";
scopeName "main";

params [["_categoryIndex", -1, [0]], ["_experienceAddition", -1, [0]], ["_reason", "", [""]], ["_showMessage", true, [true]]];

// Error checks
if (_categoryIndex isEqualTo -1) exitWith { ["No category index", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (_experienceAddition isEqualTo -1) exitWith { ["No experience addition", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (_showMessage && {_reason isEqualTo ""}) exitWith { ["No message", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

_experienceAddition = round _experienceAddition;

// End mission if variable is nil
if (isNil "GW_player_experience") exitWith {
    [LOG_WARNING, "Experience var is nil", _fnc_scriptName] call GW_server_fnc_log;
    endMission "GW_DataError";
};

private _nextLevelInfo = [_categoryIndex] call GW_client_fnc_experienceCategoryGetNextLevel;
private _configClasses = "true" configClasses (missionConfigFile >> "CfgExperience" >> "Categories");
private _displayName = "";

// Get next level information
_nextLevelInfo params [["_nextLevel", 0, [0]], ["_nextLevelExperience", 0, [0]], ["_nextLevelPerkpoints", 0, [0]]];

// Check that its not top level (hotfix does it work????)
if (_nextLevel isEqualTo 0) exitWith { ["Top Level", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Get display name
{
    private _idX = getNumber (_x >> "id");
    if (_categoryIndex isEqualTo _idX) exitWith {
        _displayName = getText (_x >> "displayName");
    };
    true
} count _configClasses;

// Update experience variable
private _currentExperience = (GW_Player_Experience param [_categoryIndex, [0], [[]]]) param [0, 0, [0]];
private _newExperience = _currentExperience + _experienceAddition;
GW_player_experience set [_categoryIndex, [_newExperience]];

// Experience addition hint
if (_showMessage) then {
    [HINT_NORMAL, "You Gained Experienced", format [
        "You gained <t font='RobotoCondensedBold'>%1 XP</t> in <t font='RobotoCondensedBold'>%3 (%2)</t>",
        _experienceAddition,
        _reason,
        _displayName
    ]] call GW_client_fnc_notificationsAdd;
};

// Check if leveled up
if (_newExperience > _nextLevelExperience) then {
    // Notify player
    [HINT_NORMAL, "Leveled Up", format [
        "You are now <t font='RobotoCondensedBold'>Level %1</t> in <t font='RobotoCondensedBold'>%2</t>",
        _nextLevel,
        _displayName
    ]] call GW_client_fnc_notificationsAdd;

    // Add log entry
    [LOG_INFO, format [
        "Leveled up to Level %1 within %2",
        _nextLevel,
        _displayName
    ], _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];

    // Play soundtrack
    playMusic "EventTrack01a_F_EPA";
    2 fadeMusic 0.5;

    // Sync
    [false] call GW_client_fnc_playerSyncRequest;
};

// Log experience addition
[LOG_INFO, format [
    "%1 experience points added in category '%2'",
    _experienceAddition,
    _displayName
], _fnc_scriptName] call GW_server_fnc_log;
