#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_notificationsDisplay.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): STRING - The title of the notification
 *     1 (REQUIRED): STRING - The text of the notification
 *     2 (REQUIRED): ARRAY  - Array with colour
 */
#define GRID_H (pixelH * pixelGrid * 0.50)

scriptName "GW_client_fnc_notificationsDisplay: main";
scopeName "main";

disableSerialization;

if (
    !params
    [
        ["_title", "", [""]],
        ["_text", "", [""]],
        ["_colour", [], [[]], 4]
    ]
) throw "Expected parameters";

// Create the resource if not already created
if !(["GW_Hints"] call GW_client_fnc_guiDisplayActive) then
{
    ["GW_Hints"] call GW_client_fnc_createResource
};

// Create the hint
private _display = ["GW_Hints"] call GW_client_fnc_getDisplay;
private _ctrlHint = _display ctrlCreate ["GW_Hint", -1];

// Set texts and background colour
private _ctrlColour = _ctrlHint controlsGroupCtrl 0;
private _ctrlText = _ctrlHint controlsGroupCtrl 2;
private _ctrlTitle = _ctrlHint controlsGroupCtrl 1;
_ctrlColour ctrlSetBackgroundColor _colour;
_ctrlTitle ctrlSetStructuredText parseText _title;
_ctrlText ctrlSetStructuredText parseText _text;

// Update positions
private _ctrlTextPosition = ctrlPosition _ctrlText;
private _ctrlTextHeight = ctrlTextHeight _ctrlText;
_ctrlTextPosition set [3, _ctrlTextHeight];
_ctrlText ctrlSetPosition _ctrlTextPosition;
_ctrlText ctrlCommit 0;

if (isNil "GW_Hints") then { GW_Hints = []; };

// Append hint into array§
private _showTime = time + 15;
GW_Hints pushBack [_ctrlHint, _ctrlColour, _ctrlTitle, _ctrlText, _showTime];

private _padding = 1.5 * GRID_H;
private _topNotificationAmount = 4;
private _defaultPosYColour = 0.1062;
private _defaultPosYTitle = 0.1084;
private _defaultPosYText = 0.126;

if (count GW_Hints > 1) then
{
    private _previousIndex = count GW_Hints - 2;
    private _previousElement = GW_Hints select _previousIndex;
    _previousElement params
    [
        ["_previousCtrlHint", controlNull, [controlNull]],
        ["_previousCtrlColour", controlNull, [controlNull]],
        ["_previousCtrlTitle", controlNull, [controlNull]],
        ["_previousCtrlText", controlNull, [controlNull]]
    ];
    private _previousCtrlHeight = (((ctrlPosition _previousCtrlColour) select 3) + ((ctrlPosition _previousCtrlTitle) select 3) + (ctrlTextHeight _previousCtrlText));
    private _previousColourPosition = (ctrlPosition _previousCtrlColour) select 1;
    private _previousTitlePosition = (ctrlPosition _previousCtrlTitle) select 1;
    private _previousTextPosition = (ctrlPosition _previousCtrlText) select 1;
    private _previousPositions = [_previousColourPosition, _previousTitlePosition, _previousTextPosition];
    private _ctrlColourPosition = ctrlPosition _ctrlColour;
    private _ctrlTitlePosition = ctrlPosition _ctrlTitle;
    private _ctrlTextPosition = ctrlPosition _ctrlText;

    // Loop through positions
    {
        private _posY = _x select 1;
        _x set [1, (_previousCtrlHeight + _padding + (_previousPositions select _forEachIndex))];
    } forEach [_ctrlColourPosition, _ctrlTitlePosition, _ctrlTextPosition];

    // Update colours and texts
    _ctrlColour ctrlSetPosition _ctrlColourPosition;
    _ctrlColour ctrlCommit 0;

    _ctrlTitle ctrlSetPosition _ctrlTitlePosition;
    _ctrlTitle ctrlCommit 0;

    _ctrlText ctrlSetPosition _ctrlTextPosition;
    _ctrlText ctrlCommit 0
};

_ctrlHint ctrlSetFade 1;
_ctrlHint ctrlCommit 0;
_ctrlHint ctrlSetFade 0;
_ctrlHint ctrlCommit 0.5;

// If hints are more than 4
if (count GW_Hints > _topNotificationAmount) then
{
    private _previousIndex = GW_Hints select 0;
    _previousIndex params
    [
        ["_ctrlHint",   controlNull, [controlNull]],
        ["_ctrlColour", controlNull, [controlNull]],
        ["_ctrlTitle",  controlNull, [controlNull]],
        ["_ctrlText",   controlNull, [controlNull]]
    ];

    private _ctrlColourPosition = ctrlPosition _ctrlColour select 3;
    private _ctrlTitlePosition = ctrlPosition _ctrlTitle select 3;
    private _ctrlTextPosition = ctrlTextHeight _ctrlText;
    private _oldHintHeight = _ctrlColourPosition + _ctrlTitlePosition + _ctrlTextPosition;

    // Delete notification
    GW_Hints deleteAt 0;
    ctrlDelete _ctrlHint;

    // Loop through all hints
    {
        _x params
        [
            ["_ctrlHint",   controlNull, [controlNull]],
            ["_ctrlColour", controlNull, [controlNull]],
            ["_ctrlTitle",  controlNull, [controlNull]],
            ["_ctrlText",   controlNull, [controlNull]]
        ];

        private _colourPos = ctrlPosition _ctrlColour;
        private _titlePos = ctrlPosition _ctrlTitle;
        private _textPos = ctrlPosition _ctrlText;

        // Loop through positions
        {
            _xPosY = _x select 1;
            _x set [1, (_xPosY - _oldHintHeight - _padding)];
            true;
        } count [_colourPos, _titlePos, _textPos];

        // Update position
        _ctrlColour ctrlSetPosition _colourPos;
        _ctrlTitle ctrlSetPosition _titlePos;
        _ctrlText ctrlSetPosition _textPos;
        _ctrlColour ctrlCommit 0;
        _ctrlTitle ctrlCommit 0;
        _ctrlText ctrlCommit 0;

        true;
    } count GW_Hints
};

GW_Hints_Flag = false;

if (isNil "GW_Hints_ThreadHandle") then {
    // Handle for removing notifications
    GW_Hints_ThreadHandle = [] spawn {
        scriptName "GW_client_fnc_hintThread: main";
        scopeName "main";

        disableSerialization;

        // Default
        GW_hints_lastLoopTime = 0;

        // Loop indefinitiely
        for "_i" from 0 to 1 step 0 do
        {
            waitUntil { time > GW_Hints_LastLoopTime };

            // Loop through hints
            {
                _x params
                [
                    ["_ctrlHint", controlNull, [controlNull]],
                    ["_ctrlColour", controlNull, [controlNull]],
                    ["_ctrlTitle", controlNull, [controlNull]],
                    ["_ctrlText", controlNull, [controlNull]],
                    ["_timeHintShow", 0, [0]]
                ];

                // Hint has reached time to show
                if (time >= _timeHintShow) then
                {
                    // Delete from array
                    GW_Hints deleteAt 0;

                    // Fade out
                    _ctrlHint ctrlSetFade 1;
                    _ctrlHint ctrlCommit 1;

                    // Delete control
                    ctrlDelete _ctrlHint
                };
                true;
            } count GW_Hints;
            GW_Hints_LastLoopTime = time + 0.1
        };
    };
};
