
#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_onKeyDown.sqf
 *
 * Parameter(s):
 *     0: DISPLAY
 *     1: NUMBER
 *     2: BOOLEAN
 *     3: BOOLEAN
 *     4: BOOLEAN
 *     5: BOOLEAN
 *
 * Returns:
 *     BOOLEAN
 *
 * Description:
 *     Main handler for onKeyDown event
 */
#define ACTIONKEY(key) actionKeys key param [0, 0, [0]]
#define DIKCODES_ALLOWED actionKeys "PushToTalk" \
    + actionKeys "VoiceOverNet" \
    + actionKeys "PushToTalkDirect" \
    + actionKeys "NextChannel" \
    + actionKeys "PrevChannel" \
    + actionKeys "Chat" \
    + [DIK_F3] \
    + actionKeys "showMap" \
    + actionKeys "hideMap" \
    + actionKeys "nightVision" \
    + actionKeys "MoveForward" \
    + actionKeys "MoveBack" \
    + actionKeys "TurnLeft" \
    + actionKeys "TurnRight" \
    + actionKeys "personView"
#define DIKCODES_ALLOWED_SECOND actionKeys "PushToTalk" \
                                + actionKeys "VoiceOverNet" \
                                + actionKeys "PushToTalkDirect" \
                                + actionKeys "NextChannel" \
                                + actionKeys "PrevChannel" \
                                + actionKeys "Chat" \
                                + [DIK_F3] \
                                + actionKeys "nightVision"

scriptName "GW_client_fnc_onKeyDown: main";
scopeName "main";

params [
    ["_display", displayNull, [displayNull]],
    ["_dikCode", 0, [0]],
    ["_shift", false, [false]],
    ["_ctrl", false, [false]],
    ["_alt", false, [false]],
    ["_handled", false, [false]]
];

// Endmission fix for game display
if (_dikCode isEqualTo 74 && {_shift}) exitWith {
    if (!userInputDisabled) then {
        disableUserInput true;
        disableUserInput false;
    };
    true;
};

// Handle incapacitation and respawning
if (
    player getVariable ["incapacitated", false]
    && {_dikCode isEqualTo DIK_ESCAPE}
    && {missionNamespace getVariable ["GW_Bleedout_AllowEscape", false]}
) exitWith {
    player setDamage 1;
    true
};

// Fix for people being able to get up when downed
if (player getVariable ["incapacitated", false] && {!(_dikCode in DIKCODES_ALLOWED_SECOND)}) exitWith { true; };

// Block keys in bleedout
if (!([] call GW_client_fnc_hasInputAccess) && {!(_dikCode in DIKCODES_ALLOWED)}) exitWith {true};

// Do not allow if dialog is open
if (dialog) exitWith {};

private _surrenderKey = [ACTIONKEY("User6"), DIK_T] select (count (actionKeys "User6") < 1);
private _inVehicle = [player] call GW_client_fnc_vehicleUnitInVehicle;

// Block from pressing keys if surrendered
if (player getVariable ["surrendered", false] && {_dikCode != _surrenderKey}) exitWith {true};

// Handle surrendering / unsurrendering
if (_dikCode isEqualTo _surrenderKey && {_shift} && {!_inVehicle} && {!(player getVariable ["incapacitated", false])}) then {
    private _handled = [] call GW_client_fnc_actionSurrender;
};

// Chat
private _chatKey = ACTIONKEY("chat");
if (_dikCode isEqualTo _chatKey) then {
    findDisplay 46 createDisplay "GW_displayChatMessage";
    _handled = true;
};

// Pause menu
private _pauseKey = ACTIONKEY("ingamePause");
if (_dikCode isEqualTo _pauseKey) then {
    _display createDisplay "GW_displayMenu";
    _handled = true;
};

// Meta
private _metaKey = [ACTIONKEY("User11"), DIK_J] select (count (actionKeys "User11") < 1);
if (_dikCode isEqualTo _metaKey && {!_shift} && {!(["GW_hudMeta"] call GW_client_fnc_guiDisplayActive)}) then {
    [true] call GW_client_fnc_guiHandleMeta;
    _handled = true;
};

// Return
_handled;