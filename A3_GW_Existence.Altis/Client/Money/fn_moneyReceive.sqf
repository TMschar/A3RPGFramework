#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_moneyReceive.sqf
 *
 * Parameter(s):
 *     0: NUMBER - Amount of money
 */
#define GRID_H (pixelH * pixelGrid * 0.50)
#define TEXT_SIZE_CONTENT (164.3 * GRID_H)
#define TEXT_COLOUR_CONTENT ([0.9, 0.9, 0.9, 1] call BIS_fnc_colorRGBAtoHTML)

scriptName "GW_client_fnc_moneyReceive: main";
scopeName "main";

if (!isRemoteExecuted) exitWith { ["Must be remotely executed", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (!params [["_amount", 0, [0]], ["_senderObject", objNull, [objNull]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

private _senderName = [_senderObject] call GW_client_fnc_playersGetName;
private _senderUID = getPlayerUID _senderObject;
private _formattedAmount = [_amount] call GW_client_fnc_currencyFormat;
private _formattedCurrentBank = [BANK] call GW_client_fnc_currencyFormat;

// Make sure not sending money to himself
if (_senderObject isEqualTo player) exitWith {};

// Notify
[HINT_AMBER, "Money Received", format [
    "<t font='RobotoCondensed' shadow='0' color='%5' size='%4'>You have received <t font='RobotoCondensedBold'>%1</t>"
    + " from <t font='RobotoCondensedBold'>%2</t> which has been added to your current bank account of <t font='Roboto"
    + "CondensedBold'>%3</t>.</t><br/><br/> <t font='RobotoCondensed' color='#FE5A2F' shadow='0' size='%4'>If you beli"
    + "eve this was sent to you by a hacker or if an unknown player sent this to you, you MUST report it to a member o"
    + "f staff (Moderators and above) immediately. If you do not report it and it turns out to be a hacker, you are at"
    + " risk of being permanently banned from the Ground Wars servers.</t>",
    _formattedAmount,
    _senderName,
    _formattedCurrentBank,
    TEXT_SIZE_CONTENT,
    TEXT_COLOUR_CONTENT
], "", true, true] call GW_client_fnc_notificationsAdd;

// Log
private _namePlayer = [player] call GW_client_fnc_playersGetName;
private _uidPlayer = getPlayerUID player;
[LOG_INFO, format [
    "%1:%2 received %5 from %3:%4.",
    _namePlayer,
    _uidPlayer,
    _senderName,
    _senderUID,
    _formattedAmount
]] remoteExecCall ["GW_server_fnc_log", 2];

// Flag a warning sign if amount is more than 1 million
if (_amount >= 1000000) then {
    [LOG_WARNING, format [
        "%1:%2 received %5 from %3:%4 (Only duplicate of previous log entry).",
        _namePlayer,
        _uidPlayer,
        _senderName,
        _senderUID,
        _formattedAmount
    ]] remoteExecCall ["GW_server_fnc_log", 2];
};

// Add to bank
BANK = BANK + _amount;