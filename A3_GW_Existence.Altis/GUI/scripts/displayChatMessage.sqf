#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: undefined
*
* Parameter(s):
*     0: STRING - Event to execute
*     1: ARRAY  - Array with arguments
*
* Description:
*     Master UI Handler for chat message ui
*/
#define ONKEYDOWN_HANDLE GW_displayChatMessage_onKeyDownHandle

scriptName "GW_displayChatMessage_script: main";
scopeName "main";

disableSerialization;
if !params [["_event", "", [""]], ["_args", [], [[]]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        // Fade in
        {
            _x ctrlSetFade 1;
            _x ctrlCommit 0;
            _x ctrlSetFade 0;
            _x ctrlCommit 0.5
        } forEach allControls _display;

        // Add on key down handler to handle sending message
        ONKEYDOWN_HANDLE = _display displayAddEventHandler ["KeyDown", {
            params ["_display", "_dikCode"];

            private _ctrlMessageEdit = _display displayCtrl 23;
            private _message = ctrlText _ctrlMessageEdit;

            if (_dikCode isEqualTo DIK_RETURN) then {

                // Check for too many characters
                if (count _message > 150) exitWith {
                    [
                        HINT_WARNING,
                        "To many characters",
                        "The character limit for messages is 150 characters."
                    ] call GW_client_fnc_notificationsAdd
                };

                // Send message and close display
                _message call GW_client_fnc_communicationSendChat;
                _display closeDisplay 2
            }
        }]
    };
    case "onUnload": {
        _display displayRemoveEventHandler ["KeyDown", ONKEYDOWN_HANDLE];
        ONKEYDOWN_HANDLE = nil
    }
}