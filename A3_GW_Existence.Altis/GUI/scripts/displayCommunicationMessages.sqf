#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayCommunicationMessages.sqf
*
*    Parameter(s):
*       0: STRING - Event
*       1: ARRAY - Arguments
*
*    Returns:
*        NOTHING
*
*    Description:
*        NO DESCRIPTION
*/
scriptName "GW_displayCommunicationMessages_Script: main";
scopeName "main";

disableSerialization;

if !(params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

#define SELF GW_displayCommunicationMessages_Script
#define VAR_MESSAGES GW_Player_Messages
#define STRING_MESSAGES "GW_Player_Messages"

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        // Disable reply and delete buttons by default
        ["disableButtons", [_display]] call SELF;

        private _ctrlButtonDelete = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_BUTTONDELETE;
        _ctrlButtonDelete ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;

            // Get index of selected message
            private _ctrlLBMessages = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_LISTMESSAGES;
            private _messageIndex = lbCurSel _ctrlLBMessages;

            // Get current messages and delete
            private _currentMessages = missionNamespace getVariable [STRING_MESSAGES, []];
            _currentMessages deleteAt _messageIndex;

            // Update messages
            GW_Player_Messages = _currentMessages;

            // Reload messages after deletions and disable reply and delete buttons for no issues
            ["disableButtons", [_display]] call SELF;
            ["loadReceivedMessages", [_display]] call SELF
        }];

        private _ctrlButtonReply = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_BUTTONREPLY;
        _ctrlButtonReply ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;

            // Get index of selected message
            private _ctrlLBMessages = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_LISTMESSAGES;
            private _messageIndex = lbCurSel _ctrlLBMessages;

            // Get Message
            private _currentMessages = missionNamespace getVariable [STRING_MESSAGES, []];
            private _messageSelected = _currentMessages param [_messageIndex, [], [[]]];
            _messageSelected params ["", "", "", "", "", "", ["_target", objNull, [objNull]]];

            // Open send message menu to send new message
            GW_displayCommunicationTargets_targetMode = 0;                          // Direct message
            GW_displayCommunicationTargets_targetIdentifier = getPlayerUID _target; // Player UID

            // Create send
            _display createDisplay "GW_displayCommunicationSendMessage"
        }];

        private _ctrlButtonMapMark = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_ADDMARKONMAP;
        _ctrlButtonMapMark ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            call GW_client_fnc_guiCloseAllDisplays;

            // Get index of selected message
            private _ctrlLBMessages = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_LISTMESSAGES;
            private _messageIndex = lbCurSel _ctrlLBMessages;

            // Get Message
            private _currentMessages = missionNamespace getVariable [STRING_MESSAGES, []];
            private _messageSelected = _currentMessages param [_messageIndex, [], [[]]];
            _messageSelected params ["", "", "", "", "", ["_unitSenderLocation", [], [[]]], ""];
            GW_displayCommunicationMessages_senderLocation = _unitSenderLocation;

            // Open map and draw an icon
            [
                "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\map_off_ca.paa",
                [0.88, 0.05, 0, 1],
                GW_displayCommunicationMessages_senderLocation,
                format ["Position of Message", name GW_displayCommunicationMessages_unitSender]
            ] call GW_client_fnc_guiDrawMapIcon
        }];
        _ctrlButtonMapMark ctrlEnable false;

        private _ctrlButtonCancel = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_BUTTONCLOSE;
        _ctrlButtonCancel ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;
            _display closeDisplay 2
        }];

        private _ctrlButtonNewMessage = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_BUTTONNEWMESSAGE;
        _ctrlButtonNewMessage ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;
            _display createDisplay "GW_displayCommunicationTargets"
        }];

        private _ctrlButtonMarkMap = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_ADDMARKONMAP;
        _ctrlButtonMarkMap ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;

        }];

        private _ctrlLBMessages = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_LISTMESSAGES;
        _ctrlLBMessages ctrlAddEventHandler ["LBSelChanged", {
            params [
                ["_ctrl", controlNull, [controlNull]],
                ["_index", 0, [0]]
            ];
            private _display = ctrlParent _ctrl;

            private _messages = missionNamespace getVariable [STRING_MESSAGES, []];
            if (_messages isEqualTo []) exitWith {};

            private _message = _messages param [_index, [], [[]]];
            _message params [
                ["_to", "", [""]],
                ["_from", "", [""]],
                ["_message", "", [""]],
                ["_location", "", [""]],
                ["_realTime", [], [[]]],
                ["_unitSenderLocation", [], [[]]],
                ["_unitSender", objNull, [objNull]]
            ];

            private _dateArray = _realTime param [1, [], [[]]];
            _dateArray params [
                ["_year", 0, [0]],
                ["_month", 0, [0]],
                ["_day", 0, [0]],
                ["_hour", 0, [0]],
                ["_minute", 0, [0]],
                ["_second", 0, [0]]
            ];

            private _ctrlTextFrom = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_TEXTSENDER;
            _ctrlTextFrom ctrlSetText _from;

            private _ctrlTextTo = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_TEXTRECEIVER;
            _ctrlTextTo ctrlSetText _to;

            private _ctrlTextDate = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_TEXTDATESENT;
            _ctrlTextDate ctrlSetText format ["%1.%2.%3 - %4:%5", _year, _month, _day, _hour, _minute];

            private _ctrlTextLocation = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_TEXTLOCATION;
            _ctrlTextLocation ctrlSetText _location;

            private _ctrlTextMessage = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_MESSAGETEXT;
            _ctrlTextMessage ctrlSetText _message;

            private _ctrlButtonReply = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_BUTTONREPLY;
            _ctrlButtonReply ctrlEnable true;

            private _ctrlButtonDelete = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_BUTTONDELETE;
            _ctrlButtonDelete ctrlEnable true;

            private _ctrlButtonMapMark = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_ADDMARKONMAP;
            _ctrlButtonMapMark ctrlEnable !(_unitSenderLocation isEqualTo [])
        }];

        // Load messages
        ["loadReceivedMessages", [_display]] call SELF
    };
    case "loadReceivedMessages": {
        _args params [["_display", displayNull, [displayNull]]];

        private _currentMessages = missionNamespace getVariable ["GW_Player_Messages", []];
        private _ctrlLBMessages = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_LISTMESSAGES;

        // Clear Listbox and reverse array so latest message is always at top
        lbClear _ctrlLBMessages;
        reverse _currentMessages;
        {
            _x params [
                "",
                ["_messageFrom", "", [""]]
            ];

            _ctrlLBMessages lbAdd _messageFrom;
            true
        } count _currentMessages;

        // Select first message
        _ctrlLbMessages lbSetCurSel 0
    };
    case "disableButtons": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlButtonReply = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_BUTTONREPLY;
        _ctrlButtonReply ctrlEnable false;

        private _ctrlButtonDelete = _display displayCtrl IDC_DISPLAYCOMMUNICATIONMESSAGES_BUTTONDELETE;
        _ctrlButtonDelete ctrlEnable false
    };
    case "onUnload": {

    }
}
