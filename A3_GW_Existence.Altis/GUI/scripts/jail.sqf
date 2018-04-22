#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: jail.sqf
 *
 * Parameter(s):
 *     0: STRING - Event to execute
 *     1: ARRAY  - Array with arguments
 */
#define SELF GW_jail_script
#define OEF_HANDLE GW_jail_oefHandle
#define REASON GW_jailHUD_reason
#define DISPLAY_NAME GW_jailHUD_jailDisplayName
#define SENTENCE_TIME GW_jailHUD_sentenceTime
#define SENTENCE_START_TIME GW_jailHUD_startTime

disableSerialization;
if (!params [["_event", "", [""]], ["_args", [], [[]]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
};

switch (_event) do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        // Set static text
        private _ctrlTextTitle = _display displayCtrl IDC_JAIL_TITLE;
        private _ctrlTextReason = _display displayCtrl IDC_JAIL_REASON;
        _ctrlTextTitle ctrlSetText DISPLAY_NAME;
        _ctrlTextReason ctrlSetText REASON;

        // Update time left
        OEF_HANDLE = addMissionEventHandler ["EachFrame", {
            private _display = ["GW_Jail"] call GW_client_fnc_getDisplay;
            private _timeLeft = SENTENCE_TIME - SENTENCE_START_TIME - time;
            private _formatTime = [_timeLeft, "MM:SS", false] call BIS_fnc_secondsToString;
            private _ctrlTextTimeLeft = _display displayCtrl IDC_JAIL_TIMELEFT;

            // Update ctrl
            _ctrlTextTimeLeft ctrlSetText _formatTime;
        }];
    };
    case "onUnload": {
        removeMissionEventHandler ["EachFrame", OEF_HANDLE];
    };
};