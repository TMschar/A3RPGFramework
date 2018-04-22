#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: chat.sqf
*
* Parameter(s):
*     0: STRING - Event to execute
*     1: ARRAY  - Array with arguments
*
* Description:
*     Master UI Handler for chat message ui
*/
#define SELF GW_chat_script
#define DRAW3D_HANDLE GW_chat_draw3DHandle
#define COMMIT_TIME 0.8
#define IDC_CTRLSGROUP 24
#define IDC_CHATBACKGROUND 11
#define IDC_CHATSTRUCTUREDTEXT 21
#define VAR_MESSAGES GW_globalChat_messages

scriptName "GW_chat_script: main";
scopeName "main";

disableSerialization;
if !(params [["_event", "", [""]], ["_args", [], [[]]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        // Hide by default
        private _ctrlControlsGroup = _display displayCtrl IDC_CTRLSGROUP;
        _ctrlControlsGroup ctrlShow false;

        // Start OEF draw 3D handle
        DRAW3D_HANDLE = addMissionEventHandler ["Draw3D", {["onDraw3D", []] call SELF}]
    };
    case "onDraw3D": {
        private _display = ["GW_chat"] call GW_client_fnc_getDisplay;
        private _ctrlControlsGroup = _display displayCtrl IDC_CTRLSGROUP;
        private _ctrlChatStructuredText = _ctrlControlsGroup controlsGroupCtrl IDC_CHATSTRUCTUREDTEXT;

        if !(VAR_MESSAGES isEqualTo []) then {
            if !(ctrlShown _ctrlControlsGroup) then {_ctrlControlsGroup ctrlShow true};

            // Set default text
            private _structuredText = "";

            // Loop through messages
            {
                _x params [["_side", sideUnknown, [sideUnknown]], ["_playerName", "", [""]], ["_message", "", [""]]];

                private _sideColour = _side call BIS_fnc_sideColor;
                private _colour = _sideColour call BIS_fnc_colorRGBAtoHTML;
                private _colourText = [0.95, 0.95, 0.95, 1] call BIS_fnc_colorRGBAtoHTML;
                private _thisText = format [
                    "<t font='RobotoCondensedBold' size='%4' color='%3' shadow='1.5'>%1</t><t size='%4' color='%5' shadow='3.5' font='RobotoCondensed' shadow='1'> - %2</t><br/>",
                    _playerName,
                    _message,
                    _colour,
                    170 * GRID_H,
                    _colourText
                ];

                // Add this text to the whole string
                _structuredText = _structuredText + _thisText;
                true
            } count VAR_MESSAGES;

            // Update text
            _ctrlChatStructuredText ctrlSetStructuredText parseText _structuredText;
        } else {
            // Hide
            if (ctrlShown _ctrlControlsGroup) then {
                _ctrlControlsGroup ctrlShow false;
            };
        };
    };
    case "onUnload": {
        // Remove OEF handler
        removeMissionEventHandler ["Draw3D", DRAW3D_HANDLE];
        DRAW3D_HANDLE = nil;

        // Unload variables
        uiNamespace setVariable ["chatBackgroundCtrl", nil];
        uiNamespace setVariable ["chatStructuredTextCtrl", nil];
    };
};