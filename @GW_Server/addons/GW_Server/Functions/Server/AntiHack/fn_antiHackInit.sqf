#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_antiHackInit.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit to initialize antihack for
 */
scriptName "GW_server_fnc_antiHackInit: main";
scopeName "main";

if !(params [["_unit", objNull, [objNull]]]) exitWith {};

private _flags = [];
private _reasons = "";
private _config = configFile >> "GW_CfgAntiHack";

disableSerialization;
waitUntil {!isNull (findDisplay 46) && {GW_StartAntihack}};

// Admin bypass antihack
if (call GW_Player_AdminRank > 0) exitWith {};

[LOG_INFO, "Antihack started", _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];

// Block endmission cheat
{
    _x displayAddEventHandler ["KeyDown", {
        _this call {
            _this params [
                ["_ctrl", controlNull, [controlNull]],
                ["_keyCode", 0, [0]],
                ["_shift", false, [false]]
            ];
            if (_keyCode isEqualTo 74 && {_shift}) exitWith {
                if !(userInputDisabled) then {
                    disableUserInput true;
                    disableUserInput false
                };
                true;
            };
        };
    }];
} forEach allDisplays;

private _delay = 0.1;
private _checkDelay = 5;
for "_i" from 0 to 1 step 0 do {
    scopeName "ah_watchloop";
    sleep (_checkDelay * 60);

    if (isNil CASH_STRING || {isNil BANK_STRING}) then {_flags pushback "NIL MONEY VARIABLE"};
    uiSleep _delay;

    if (local _unit && {!(isDamageAllowed _unit)}) then {_flags pushback "GOD MODE HACK"};
    uiSleep _delay;

    if (unitRecoilCoefficient _unit < 1) then {_flags pushback "RECOIL CHEAT"};
    uiSleep _delay;

    if !(getAnimSpeedCoef _unit isEqualTo 1) then {_flags pushback "SPEED CHEAT"};
    uiSleep _delay;

    if !(_flags isEqualTo []) then {
        if (count _flags > 1) then {
            {_reasons = _reasons + ", " + _x} forEach _flags;
        } else {
            _reasons = _flags param [0, "", [""]];
        };

        disableUserInput true;
        [LOG_BAN, format ["XgLVyEys7jp7xD9THhrG (%1)", _reasons], _fnc_scriptName] remoteExecCall ["GW_server_fnc_log", 2];

        breakOut "ah_watchloop";
    };
};
