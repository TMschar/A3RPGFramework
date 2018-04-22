#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_ticketSystemIssueTicket.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): NUMBER - Amount
 */
#define TITLE_OUTSTANDING "Outstanding Ticket"
#define TITLE_FAILED "Ticket Payment Declined"
#define TITLE_PAYMENT "Ticket Payment"
#define TITLE_NOTENOUGH "Not enough assets"
#define MESSAGE_NOTENOUGH "You do not have enough assets to pay this ticket."
#define MESSAGE_OUTSTANDING "The person chose to decline his ticket payment."
#define MESSAGE_FAILED "You declined paying the ticket."
#define MESSAGE_PAYMENT "You payed your ticket by cash."
#define MESSAGE_PAYMENTBANK "You payed your ticket by money from your bank account."

scriptName "GW_client_fnc_actionIssueTicket: main";
scopeName "main";

disableSerialization;

if (!canSuspend) exitWith { ["Must be ran scheduled", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (!params [ ["_amount", 0, [0]] ]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

private _fnc_notEnoughMoney =
{
    [HINT_WARNING, TITLE_OUTSTANDING, MESSAGE_OUTSTANDING] remoteExecCall ["GW_client_fnc_notificationsAdd", remoteExecutedOwner];
    [HINT_WARNING, TITLE_NOTENOUGH, MESSAGE_NOTENOUGH] call GW_client_fnc_notificationsAdd;
    false breakOut "main";
};

// Format money text is a nice matter
private _amountFormatted = [_amount] call GW_client_fnc_currencyFormat;

// Prompt user to pay the ticket and store in a variable.
// This function returns true or false.
private _ticketAccepted =
[
    "Ticket Received",
    format
    [
        "You have received a ticket of %1. Do you accept paying this ticket?",
        _amountFormatted
    ],
    "PAY",
    "DECLINE",
    findDisplay 46,
    true
] call GW_client_fnc_guiPrompt;

if (_ticketAccepted) then
{
    // Ask player if he wants to pay from his bank account or
    // from pocket money.
    private _payFromBank = ["Payment Alternatives", format [
        "Choose payment option. Pressing escape will automatically select cash.",
        _amountFormatted
    ], "BANK ACCOUNT", "CASH", findDisplay 46, true] call GW_client_fnc_guiPrompt;

    if (_payFromBank) then
    {
        if (BANK < _amount) then {call _fnc_notEnoughMoney};
        BANK = BANK - _amount;

        [HINT_NORMAL, TITLE_PAYMENT, MESSAGE_PAYMENTBANK] call GW_client_fnc_notificationsAdd;
        [HINT_NORMAL, "Ticket Paid", "Person paid the ticket."] remoteExecCall ["GW_client_fnc_notificationsAdd", remoteExecutedOwner];
    }
    else
    {
        if (CASH < _amount) then { call _fnc_notEnoughMoney };
        CASH = CASH - _amount;

        [HINT_NORMAL, TITLE_PAYMENT, MESSAGE_PAYMENT] call GW_client_fnc_notificationsAdd;
        [HINT_NORMAL, "Ticket Paid", "Person paid the ticket."] remoteExecCall ["GW_client_fnc_notificationsAdd", remoteExecutedOwner];
    };

    // Reward officers
    [_amount] remoteExec ["GW_client_fnc_ticketSystemRewards", remoteExecutedOwner];
}
else
{
    // Notify player and ticket issuer of failed payment
    [HINT_WARNING, TITLE_FAILED, MESSAGE_FAILED] call GW_client_fnc_notificationsAdd;
    [HINT_WARNING, TITLE_OUTSTANDING, MESSAGE_OUTSTANDING] remoteExecCall ["GW_client_fnc_notificationsAdd", remoteExecutedOwner];
};