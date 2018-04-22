#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: displayProgress.sqf
*
* Parameter(s):
*     0: STRING - Event to execute in switch
*     1: ARRAY  - Array with arguments passed from display
*/
#define SELF GW_displayProgress_script
#define DISPLAY ("GW_displayProgress" call GW_client_fnc_getDisplay)
#define VAR_FADESCRIPTHANDLE GW_displayProgress_fadeScriptHandle
#define VAR_EFHANDLE GW_displayProgress_efHandle
#define VAR_DURATION GW_progress_duration
#define VAR_TIMESTART GW_progress_start
#define VAR_TEXT GW_progress_text
#define VAR_RESULT GW_progress_result
#define VAR_ICONPATH GW_progress_iconPath
#define VAR_CONDITIONCODE GW_progress_conditionCode
#define VAR_CONDITIONARGS GW_progress_conditionArgs
#define VAR_TEXT_UPPER VAR_TEXT
#define VAR_ICON_SIZE (100 * (pixelH * pixelGrid * 0.50))

scriptName "GW_displayProgress_script: main";
scopeName "main";

disableSerialization;
if !params [["_event", "", [""]], ["_args", [], [[]]]] exitWith {};

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        if (isNil "GW_progress_text") throw "Text is nil";
        if (!isNil "GW_progress_result") throw "result is not nil";
        if (isNil "GW_progress_start") throw "start is nil";
        if (isNil "GW_progress_duration") throw "duration is nil";
        if (isNil "GW_progress_conditionCode") throw "conditioncode is nil";
        if (isNil "GW_progress_conditionArgs") throw "condition args is nil";

        private _ctrlProgressText = _display displayCtrl IDC_DISPLAYPROGRESS_TEXT;
        _ctrlProgressText ctrlSetText VAR_TEXT;

        // Hide all controls
        {
            _x ctrlSetFade 1;
            _x ctrlCommit 0;
            true
        } count allControls _display;

        // Fade in controls
        GW_displayProgress_fadeScriptHandle = [] spawn {
            scriptName "GW_displayProgress_script: fadeCtrls";
            disableSerialization;

            uiSleep 0.3;
            {
                _x ctrlSetFade 0;
                _x ctrlCommit 1;
                true
            } count allControls DISPLAY
        };

        VAR_EFHANDLE = addMissionEventHandler ["EachFrame", {["onEachFrame", []] call SELF}];
        _display displayAddEventHandler ["KeyDown", {["onKeyDown", _this] call SELF}]
    };
    case "onKeyDown": {
        _args params [["_display", displayNull, [displayNull]], ["_dikCode", 0, [0]]];
        if (_dikCode isEqualTo DIK_ESCAPE) exitWith {
            GW_Progress_Result = false;
            _display closeDisplay 2
        }
    };
    case "onEachFrame": {
        private _ctrlControlsGroup = DISPLAY displayCtrl IDC_DISPLAYPROGRESS_CONTROLSGROUP;
        private _ctrlStrucutredText = _ctrlControlsGroup controlsGroupCtrl IDC_DISPLAYPROGRESS_TEXT;
        private _ctrlProgress = _ctrlControlsGroup controlsGroupCtrl IDC_DISPLAYPROGRESS_PROGRESS;
        private _progress = (diag_tickTime - VAR_TIMESTART) / VAR_DURATION;
        private _progressPosition = progressPosition _ctrlProgress;
        private _percentage = str round (_progressPosition * 100) + "%";

        // Update progressbar position
        _ctrlProgress progressSetPosition _progress;

        // Update text
        private _structuredText = [
            "<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>",
            "<t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>"
        ] select (VAR_ICONPATH isEqualTo "");
        _ctrlStrucutredText ctrlSetStructuredText parseText format [
            _structuredText,
            VAR_TEXT_UPPER,
            VAR_ICONPATH,
            _percentage,
            VAR_ICON_SIZE
        ];

        // Evaluate and/or check if it is finisshed
        private _evaluation = VAR_CONDITIONARGS call VAR_CONDITIONCODE;
        if (progressPosition _ctrlProgress >= 1 || {!_evaluation}) exitWith {
            VAR_RESULT = _evaluation;
            DISPLAY closeDisplay 2
        }
    };
    case "onUnload": {
        // Remove eachframe handler
        removeMissionEventHandler ["EachFrame", VAR_EFHANDLE];

        // Terminate thread
        terminate VAR_FADESCRIPTHANDLE;
        VAR_FADESCRIPTHANDLE = nil;

        // Reset variables
        VAR_TEXT = nil;
        VAR_TIMESTART = nil;
        VAR_DURATION = 0;
        VAR_CONDITIONCODE = [];
        VAR_CONDITIONARGS = {true};
    };
};
