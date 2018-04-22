#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_ticketSystemRewards.sqf
 *
 * Parameter(s):
 *     0: NUMBER - Amount
 */
scriptName "GW_client_fnc_ticketSystemRewards: main";
scopeName "main";

if (!params [ ["_amount", -1, [0]] ]) throw "Param error";
if (_amount isEqualTo -1) throw "Invalid Amount";

// Give experience
private _experiencePointsGain = _amount * 0.03;
[LEVEL_VIGILANCE, _experiencePointsGain, "", false] call GW_client_fnc_experienceCategoryAddExperience;

// Give money reward
private _payout = _amount * 0.8;
private _payoutFormatted = [_payout] call GW_client_fnc_currencyFormat;
[0, _payout, 0] call GW_client_fnc_playersHandlemoney;

// Notify
[
    HINT_NORMAL,
    "Ticket Reward",
    format
    [
        "Since the ticket you issued was paid, you have been paid %1 and received %2 experience points in Vigilance category.",
        _payoutFormatted,
        _experiencePointsGain
    ]
] call GW_client_fnc_notificationsAdd;