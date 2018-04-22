#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_actionSurrender.sqf
 *
 * Returns:
 *     BOOLEAN
 *
 * Description:
 *     Used by keyhandler - needs to return true or false.
 */
#define ANIMATION_SURRENDER "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon"

scriptName "GW_client_fnc_actionSurrender: main";
scopeName "main";

// If player is surrendered, unsurrender
private _isSurrendered = player getVariable ["surrendered", false];
if (_isSurrendered) exitWith {
    player setVariable ["surrendered", false, true];
    true;
};

// Terminate script that handles restraining.
private _scriptHandle = missionNamespace getVariable ["GW_actionSurrender_scriptHandleLoop", scriptNull];
if (!isNull _scriptHandle) exitWith {
    ["Script already running", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
    false;
};

// Set surrendered
player setVariable ["surrendered", true, true];

// Spawn new loop so suspension is allowed
GW_actionSurrender_scriptHandleLoop = [] spawn {
    // Loop as long as the player is surrendered
    while {player getVariable ["surrendered", false]} do {
        if (animationState player != ANIMATION_SURRENDER) then {
            player playMove ANIMATION_SURRENDER;
        };
    };

    // Reset animation
    player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";

    // Terminate thread
    terminate GW_actionSurrender_scriptHandleLoop;
};

// Return
true;