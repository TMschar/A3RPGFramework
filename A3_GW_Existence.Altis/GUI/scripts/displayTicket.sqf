#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displaySpawns.sqf
 *
 * Parameter(s):
 *     0: STRING - Event to execute
 *     1: ARRAY - Array with parameters
 */
#define SELF GW_displayTicket_script
#define TARGET GW_actionRequestTicketSystem_unitTarget

scriptName "GW_displayTicket_script: main";
scopeName "main";

if (isNil "GW_actionRequestTicketSystem_unitTarget") exitWith {((_this select 1) select 1) closeDisplay 2};

disableSerialization;
params [["_event", "", [""]], ["_args", [], [[]]]];
switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlControlsGroupFooter = _display displayCtrl IDC_DISPLAYTICKET_FOOTERGROUP;
        private _ctrlInput = _display displayCtrl IDC_DISPLAYTICKET_INPUT;
        private _ctrlButtonIssue = _ctrlControlsGroupFooter controlsGroupCtrl IDC_DISPLAYTICKET_FOOTERGROUP_BUTTONISSUE;

        _ctrlButtonIssue ctrlRemoveAllEventHandlers "ButtonClick";
        _ctrlButtonIssue ctrlAddEventHandler ["ButtonClick", {["onIssueTicket", _this] call SELF}];
    };
    case "onIssueTicket": {
        _args params [["_ctrl", controlNull, [controlNull]]];

        private _display = ctrlParent _ctrl;
        private _ctrlInput = _display displayCtrl IDC_DISPLAYTICKET_INPUT;
        private _amount = parseNumber ctrlText _ctrlInput;

        // Error check
        if (_amount isEqualTo 0) exitWith {[HINT_AMBER, "Number Error", "You must input a number or a number larger than 0"] call GW_client_fnc_notificationsAdd};

        // Send ticket
        [_amount] remoteExec ["GW_client_fnc_ticketSystemIssueTicket", TARGET];

        // Send hint
        [HINT_NORMAL, "Ticket Issued", "Your ticket has been issued and has been sent to the person in question."] call GW_client_fnc_notificationsAdd;

        // Close display
        _display closeDisplay 2;
    };
    case "onUnload": {};
};