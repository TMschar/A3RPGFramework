#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayCommunicationSendMessage.sqf
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
scriptName "GW_displayCommunicationSendMessage_Script: main";
scopeName "main";

disableSerialization;

if !(params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

#define VAR_TARGETMODE GW_displayCommunicationTargets_targetMode
#define VAR_TARGETID GW_displayCommunicationTargets_targetIdentifier

#define TARGETMODE_PLAYER 0
#define TARGETMODE_ORGANIZATION 1
#define TARGETMODE_POLICE 2
#define TARGETMODE_MEDIC 3
#define TARGETMODE_STAFF 4
#define TARGETMODE_PSA 5
#define TARGETMODE_SA 6

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlButtonCancel = _display displayCtrl IDC_DISPLAYCOMMUNICATIONSENDMESSAGE_BUTTONCLOSE;
        _ctrlButtonCancel ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;
            _display closeDisplay 2
        }];

        private _ctrlButtonGoBack = _display displayCtrl IDC_DISPLAYCOMMUNICATIONSENDMESSAGE_BUTTONGOBACK;
        _ctrlButtonGoBack ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;
            _display closeDisplay 2
        }];

        private _name = switch VAR_TARGETMODE do {
            case TARGETMODE_PLAYER: {
                private _unit = [VAR_TARGETID] call GW_client_fnc_getUnitByUID;
                name _unit
            };
            case TARGETMODE_ORGANIZATION: {
                VAR_TARGETID
            };
            case TARGETMODE_POLICE: {
                worldName + " Military Police"
            };
            case TARGETMODE_MEDIC: {
                format ["International Health and Assistance Service (%1)", worldName]
            };
            case TARGETMODE_STAFF: {
                "Ground Wars: Existence - Staff"
            };
            case TARGETMODE_PSA: {
                "Public Service Announcement"
            };
            case TARGETMODE_SA: {
                "Staff Announcement"
            }
        };

        private _ctrlTextTo = _display displayCtrl IDC_DISPLAYCOMMUNICATIONSENDMESSAGE_TEXTO;
        _ctrlTextTo ctrlSetText _name;

        private _ctrlTextLocation = _display displayCtrl IDC_DISPLAYCOMMUNICATIONSENDMESSAGE_TEXTLOCATION;
        private _nearestTown = [player] call GW_client_fnc_getNearestTown;
        private _locationText = _nearestTown + " - Grid: " + str (mapGridPosition player);
        _ctrlTextLocation ctrlSetText _locationText;

        private _ctrlButtonSend = _display displayCtrl IDC_DISPLAYCOMMUNICATIONSENDMESSAGE_BUTTONSENDMESSAGE;
        _ctrlButtonSend ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;

            [] call GW_client_fnc_guiCloseAllDisplays;

            [HINT_NORMAL, "Message Notice", "Your message has been sent.", "GUI\data\displays\displayChatMessage\send.paa"] call GW_client_fnc_notificationsAdd;

            private _ctrlInputMessage = _display displayCtrl IDC_DISPLAYCOMMUNICATIONSENDMESSAGE_INPUTMESSAGE;
            private _textMessage = ctrlText _ctrlInputMessage;

            private _ctrlCheckboxLocation = _display displayCtrl IDC_DISPLAYCOMMUNICATIONSENDMESSAGE_SENDLOCATIONCHECKBOX;
            private _sendLocation = cbChecked _ctrlCheckboxLocation;

            [[VAR_TARGETMODE, VAR_TARGETID, player, _textMessage, _sendLocation], "GW_server_fnc_messageSendRequest"] call GW_ext_fnc_networkCallServer
        }]
    };
    case "onUnload": {
        VAR_TARGETMODE = nil;
        VAR_TARGETID = nil;
    }
}
