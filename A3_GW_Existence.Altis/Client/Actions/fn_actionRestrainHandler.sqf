#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_actionRestrainHandler.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): Animation to play
 *
 * Description:
 *     Handler for getting restrained
 */
scriptName "GW_client_fnc_actionRestrainHandler: main";
scopeName "main";

// Get parameters
if (!params [["_animation", "", [""]], ["_unitRestrainer", objNull, [objNull]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Make sure its remote executed
if (!isRemoteExecuted) exitWith { ["Needs to be remotely executed", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Set animation before exit if already restrained.
// This is above here so the animation can change mid-being
// restrained.
if (_animation isEqualTo "") exitWith { ["No animation", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
player setVariable ["restrainAnimation", _animation, true];

// Restrained already
private _scriptHandle = missionNamespace getVariable ["GW_actionRestrainHandler_threadHandle", scriptNull];
if (!isNull _scriptHandle || {player getVariable ["restrained", false]}) exitWith {
    ["Player is already restrained", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

// Play sound
[player, "HandcuffsApply"] remoteExecCall ["GW_client_fnc_say3D", -2];

// Store information in variables
private _nameRestrainer = name _unitRestrainer;
private _groupRestrainer = group _unitRestrainer;
private _groupID = groupID _groupRestrainer;

// Set restrain information
player setVariable ["restrained", true, true];
player setVariable ["surrendered", false, true];
player setVariable ["restrainer", _groupRestrainer, true];
player setVariable ["transportAllowed", false, true];

// Notify player
[HINT_AMBER, "Restrained", format [
    "You have been restrained by the organization %1.",
    _groupID
]] call GW_client_fnc_notificationsAdd;

// Create handle for restrained player
GW_actionRestrainHandler_threadHandle = [] spawn {
    // Loop this as long as player is restrained. When player is
    // no longer restrained, this loop will stop and continue execution
    // til end of scope.
    while {player getVariable ["restrained", false]} do {
        private _vehicle = objectParent player;

        // Make sure to stay in animation
        if (!(player getVariable ["incapacitated", false]) && {isNull _vehicle}) then {
            player playMove (player getVariable ["restrainAnimation", ""]);
        };

        // If unit is inside a vehicle
        if (!isNull _vehicle) then {
            private _turretPaths = [[-1]] + allTurrets _vehicle;

            // Loop through the turret and make sure to move player outside
            // of it if he is inside one of the turrets.
            {
                _x params [["_turretIndex", 0, [0]]];
                private _turrentUnit = _vehicle turretUnit [_turretIndex];
                if (_turrentUnit isEqualTo player) then {
                    player allowDamage false;
                    player action ["eject", objectParent player];
                    player moveInCargo _vehicle;
                    player allowDamage true;
                };
                true;
            } count _turretPaths;

            // If transport is not allowed, eject from vehicle
            if !(player getVariable ["transportAllowed", false]) then {
                player allowDamage false;
                player action ["eject", objectParent player];
                player allowDamage true;
            };
        };

        uiSleep 0.001;
    };

    // No longer restrained, so reset animation to default
    player playMoveNow "AmovPercMstpSlowWrflDnon";

    // Terminate and nil variables
    GW_actionRestrainHandler_animation = nil;
    terminate GW_actionRestrainHandler_threadHandle;
};
