#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_notificationsAdd.sqf
 *
 * Parameter(s):
 *     0: NUMBER  - Category
 *     1: STRING  - Title
 *     2: STRING  - Text
 *     3: STRING  - Picture Path
 *     4: BOOLEAN - Override default text
 *     5: BOOLEAN - Play sound
 */
#define GRID_H (pixelH * pixelGrid * 0.50)
#define TEXT_SIZE_TITLE (165 * GRID_H)
#define TEXT_SIZE_CONTENT (164.3 * GRID_H)
#define TEXT_COLOUR_CONTENT ([0.9, 0.9, 0.9, 1] call BIS_fnc_colorRGBAtoHTML)

scriptName "GW_client_fnc_notificationsAdd: main";
scopeName "main";

params
[
    ["_category", 0, [0]],
    ["_title", "", [""]],
    ["_message", "", [""]],
    ["_picture", "", [""]],
    ["_override", false, [false]],
    ["_playSound", true, [false]]
];

if (_title isEqualTo "") throw "No title";
if (_message isEqualTo "") throw "No message";

// Play sound depending on what hint type it is
if (_playSound) then
{
    playSound "HintCollapse";
};

// Select colour depending on category
private _colour =
[
    [0.06, 0.68, 0, 1],
    [0.67, 0.32, 0, 1],
    [0.63, 0.04, 0, 1]
] select _category;

// Update title
_title =
[
    format ["<img image='%2' size='%4'/><t font='RobotoCondensed' shadow='0' size='%3'> %1</t>", _title, _picture, TEXT_SIZE_TITLE, TEXT_SIZE_TITLE * 0.8],
    format ["<t font='RobotoCondensed' shadow='0' size='%2'>%1</t>", _title, TEXT_SIZE_TITLE]
] select (_picture isEqualTo "");

// Update message
_message =
[
    format
    [
        "<t size='%2' shadow='0' color='%3' font='RobotoCondensed'>%1</t>",
        _message,
        TEXT_SIZE_CONTENT,
        TEXT_COLOUR_CONTENT
    ],
    _message
] select _override;

// Pushback into queue
GW_notificationsHandler_queue pushBack [_title, _message, _colour];