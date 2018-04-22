#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_onKeyUp.sqf
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
 */
#define ACTIONKEY(key) actionKeys key param [0, 0, [0]]
#define DIKCODES_ALLOWED actionKeys "PushToTalk" \
                         + actionKeys "VoiceOverNet" \
                         + actionKeys "PushToTalkDirect" \
                         + actionKeys "NextChannel" \
                         + actionKeys "PrevChannel" \
                         + actionKeys "Chat" \
                         + actionKeys "showMap" \
                         + actionKeys "hideMap" \
                         + actionKeys "nightVision" \
                         + actionKeys "MoveForward" \
                         + actionKeys "MoveBack" \
                         + actionKeys "TurnLeft" \
                         + actionKeys "TurnRight" \
                         + actionKeys "personView" \
                         + [DIK_F3]
#define DIKCODES_ALLOWED_SECOND actionKeys "PushToTalk" \
                                + actionKeys "VoiceOverNet" \
                                + actionKeys "PushToTalkDirect" \
                                + actionKeys "NextChannel" \
                                + actionKeys "PrevChannel" \
                                + actionKeys "Chat" \
                                + [DIK_F3] \
                                + actionKeys "nightVision"

scriptName "GW_client_fnc_onKeyUp: main";
scopeName "main";

params
[
    ["_display", displayNull, [displayNull]],
    ["_dikCode", 0, [0]],
    ["_shift", false, [false]],
    ["_ctrl", false, [false]],
    ["_alt", false, [false]],
    ["_handled", false, [false]]
];

// Setup keys
private _chatKey = ACTIONKEY("chat");
private _homeKey = [ACTIONKEY("User1"), DIK_Y] select (count (actionKeys "User1") < 1);
private _interactionKey = [ACTIONKEY("User2"), DIK_LWIN] select (count (actionKeys "User2") < 1);
private _holsterKey = [ACTIONKEY("User3"), DIK_H] select (count (actionKeys "User3") < 1);
private _fadeSoundKey = [ACTIONKEY("User4"), DIK_INSERT] select (count (actionKeys "User4") < 1);
private _msgKey = [ACTIONKEY("User5"), DIK_END] select (count (actionKeys "User5") < 1);
private _unlockKey = [ACTIONKEY("User10"), DIK_U] select (count (actionKeys "User10") < 1);
private _metaKey = [ACTIONKEY("User11"), DIK_J] select (count (actionKeys "User11") < 1);
private _trunkKey = [ACTIONKEY("User8"), DIK_T] select (count (actionKeys "User8") < 1);

// Fix for people being able to get up when downed
if (player getVariable ["incapacitated", false] && {!(_dikCode in DIKCODES_ALLOWED_SECOND)}) exitWith { true; };

// Block keys if has no access
if (!([] call GW_client_fnc_hasInputAccess) && {!(_dikCode in DIKCODES_ALLOWED)}) exitWith { true; };

// Do not allow if dialog is open
if (dialog) exitWith {};
switch (_dikCode) do
{
    case _trunkKey:
    {
        private _target = [vehicle player, cursorTarget] select (isNull objectParent player);
        [_target] call GW_client_fnc_virtualInventoryRequestInventory;
        _handled = true;
    };
    case DIK_P:
    {
        (findDisplay 46) createDisplay "GW_displayInventory";
        _handled = true;
    };
    case DIK_NUMPAD0:
    {
        player playAction "GestureHi";
        _handled = true;
    };
    case DIK_NUMPAD2:
    {
        player playAction "GestureNod";
        _handled = true;
    };
    case DIK_NUMPAD5:
    {
        player playAction "GestureHiB";
        _handled = true;
    };
    case _metaKey:
    {
        [false] call GW_client_fnc_guiHandleMeta;
        _handled = true;
    };
    case _unlockKey:
    {
        private _vehicle = [objectParent player, cursorTarget] select (isNull objectParent player);
        [_vehicle] call GW_client_fnc_vehicleUnlock;
    };
    case DIK_DELETE:
    {
        if (count GW_Hints > 0) then {
            ctrlDelete (GW_Hints param [0, [], [[]]] param [0, controlNull, [controlNull]]);
            GW_Hints deleteAt 0;
            true;
        };
    };
    case DIK_F3:
    {
        if (call GW_Player_AdminRank >= 1 && {!(["GW_displayAdmin"] call GW_client_fnc_guiDisplayActive)}) then { createDialog "GW_displayAdmin"; };
        _handled = true;
    };
    case _msgKey: { _display createDisplay "GW_displayCommunicationMessages" };
    case _holsterKey:
    {
        if (_shift) then
        {
            _handled = if (isNil "GW_Player_HolsteredWeapon" && {!(currentWeapon player isEqualTo "")}) then
            {
                GW_Player_HolsteredWeapon = currentWeapon player;
                player action ["SwitchWeapon", player, player, 700];
                true;
            }
            else
            {
                player selectWeapon GW_Player_HolsteredWeapon;
                GW_Player_HolsteredWeapon = nil;
                true;
            };
        };
    };
    case _homeKey:
    {
        _display createDisplay "GW_displayMenu";
        _handled = true
    };
    case _fadeSoundKey:
    {
        _handled = if (missionNamespace getVariable ["GW_fadeSound", false]) then
        {
            2 fadeSound 1;
            GW_fadeSound = false;
            true;
        }
        else
        {
            2 fadeSound 0.15;
            GW_fadeSound = true;
            true;
        };
    };
    case _interactionKey:
    {
        private _phoneBooths = getArray (missionConfigFile >> "CfgGroundWars" >> "World" >> "phoneBooths");
        if (typeOf cursorObject in _phoneBooths && {cursorObject distance player < 3}) exitWith
        {
            createDialog "GW_displayCommunicationMessages"
        };

        private _target = cursorTarget;
        if (!isNull _target) then
        {
            [_target] call GW_client_fnc_getInteraction;
        } else
        {
            if (playerSide isEqualTo civilian) then
            {
                private _resource = [getPos player] call GW_client_fnc_resourceWhich;
                if (_resource != "") then
                {
                    if (surfaceIsWater position player) then
                    {
                        [_resource] call GW_client_fnc_resourceHandleFishing;
                    }
                    else
                    {
                        [_resource] call GW_client_fnc_resourceHandle;
                    };
                };
            };
        };
        _handled = true;
    };
    case DIK_R:
    {
        _handled = if (_shift && {!isNull cursorTarget}) then
        {
            [cursorTarget] call GW_client_fnc_actionRestrain;
            true;
        };
    };
    case DIK_F:
    {
        // Either surrender or turn on sirens
        private _handled = [] call GW_client_fnc_vehicleHandleEmergencySirens;
    };
    case DIK_B:
    {
        private _objectParent = objectParent player;
        _handled = if (
            !isNull _objectParent
            && {_objectParent isKindOf "Car"}
            || {_objectParent isKindOf "Boat"}
            || {_objectParent isKindOf "Tank"}
        ) then
        {
            // Set variable so system knows seatbelt is on
            player setVariable ["seatbelt", !(player getVariable ["seatbelt", false]), true];
            true;
        };
    };
    case DIK_L:
    {
        private _vehicle = objectParent player;

        _handled = if (
            _shift
            && {!isNull _vehicle}
            && {_vehicle getVariable ["vehicle_government", false]}
        ) then
        {
            private _lightsOn = _vehicle getVariable ["emergencylights", []] isEqualTo [];
            [_lightsOn, _vehicle] call GW_client_fnc_vehicleEmergencyLights;
            true
        };
    };
};

_handled;