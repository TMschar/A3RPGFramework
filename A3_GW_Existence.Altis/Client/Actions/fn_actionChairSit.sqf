#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_actionChairSit.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Chair
 *
 * Description:
 *     Sit down in a chair
 */
scriptName "GW_client_fnc_actionChairSit: main";
scopeName "main";

if !params [["_chair", objNull, [objNull]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

if !(velocity player isEqualTo [0, 0, 0]) exitWith {
    [
        HINT_AMBER,
        "Stand Still",
        "In order to sit down, you need to stand still first."
    ] call GW_client_fnc_notificationsAdd
};

// Make sure the chair is not occupied
if (_chair getVariable ["chairOccupied", false]) exitWith {};

// Make sure not already sitting
if (missionNamespace getVariable ["GW_actionChairSit_isSitting", false]) exitWith {};
GW_actionChairSit_isSitting = true;

// Do animation
[player, "HubSittingChairA_idle1"] remoteExecCall ["GW_client_fnc_syncAnimation", -2];

// Sit player down
player attachTo [_chair, [0, 0, 0]];
player setDir (getDir _chair);
detach player;

// Chair is now occupied
GW_Player_LastSitObject = _chair;
_chair setVariable ["chairOccupied", true, true];

// Stand up action
player addAction ["Stand Up", {
    // Chair no longer occupied
    GW_Player_LastSitObject setVariable ["chairOccupied", false, true];

    // No longer sitting
    GW_actionChairSit_isSitting = false;

    // Stand up
    [player, ""] remoteExecCall ["GW_client_fnc_syncAnimation", 0];

    // Remove action
    player removeAction param [2, 0, [0]]
}]
