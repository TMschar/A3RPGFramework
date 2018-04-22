#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_startProgress.sqf
 *
 * Parameter(s):
 *     0 (OPTIONAL): STRING  - Config class of action properties
 *     1 (OPTIONAL): ARRAY   - Array of overrides (if a class is not present, this can be used)
 *     2 (OPTIONAL): ARRAY   - Condition Arguments
 *     3 (OPTIONAL): CODE    - Condition code
 *     4 (OPTIONAL): BOOLEAN - Play animation
 *
 * Returns:
 *     BOOLEAN
 *
 * Description:
 *     Creates a progress bar and sends an action to complete, returns true when finished.
 *     Needs to be called in a scheduled environment, else it will fail.
 *     if ([20, "Picking apples"] call GW_client_fnc_startProgress) then {hint "true"} else {hint "false"};
 */
scriptName "GW_client_fnc_startProgress: main";
scopeName "main";

// Make sure its being ran in a scheduled environment
if (!canSuspend) exitWith { ["Must be ran in a scheduled environment", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

params [
    ["_config", "", [""]],
    ["_override", [], [[]]],
    ["_conditionArgs", [], [[]]],
    ["_conditionCode", {true}, [{}]],
    ["_playAnimation", true, [false]]
];

private _duration = 0;
private _text = "";
private _iconPath = "";
private _animation = "";

if (_override isEqualTo []) then {
    private _actionConfig = missionConfigFile >> "CfgActions" >> _config;

    // If a class is present
    if (isClass _actionConfig) then {
        _duration = getNumber (_actionConfig >> "duration");
        _animation = getText (_actionConfig >> "animation");
        _text = localize getText (_actionConfig >> "localizedText");
        _iconPath = localize getText (_actionConfig >> "iconPath")
    }
} else {
    _duration = _override param [0, 0, [0]];
    _text = _override param [1, "", [""]];
    _iconPath = _override param [2, "", [""]];
    _animation = _override param [3, "amovpknlmstpsnonwnondnon", [""]]
};

GW_progress_start = diag_tickTime;
GW_progress_duration = round _duration;
GW_progress_text = _text;
GW_progress_result = nil;
GW_progress_conditionCode = _conditionCode;
GW_progress_conditionArgs = _conditionArgs;
GW_progress_iconPath = _iconPath;

if (currentWeapon player != "") then {
    GW_player_holsteredWeapon = currentWeapon player;
    player action ["SwitchWeapon", player, player, 100];
    player switchCamera cameraView
};

// Default animation if its none
if (_animation isEqualTo "") then { _animation = "amovpknlmstpsnonwnondnon"; };

// Play animation if not already in that one
if (_playAnimation && {animationState player != _animation}) then { player playMoveNow _animation; };

// Create child display of game display so player can still move with keyboard
disableSerialization;
findDisplay 46 createDisplay "GW_displayProgress";

// Wait until progress bar is finished and then return result
waitUntil { !isNil "GW_progress_result"; };
GW_progress_result breakOut "main";