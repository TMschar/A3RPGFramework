#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_drawNametags.sqf
*
* Parameter(s):
*     0: STRING
*     1: STRING
*     2: ARRAY
*     3: ARRAY
*     4: ARRAY
*     5: ARRAY
*     6: STRING
*     7: ARRAY
*     8: STRING
*
* Description:
*     Draws nametags from an array of elements.
*     Should be called from Draw3D or OEF eventhandler.
*/
scriptName "GW_client_fnc_drawNametags: main";
scopeName "main";

// Loop through all tags
{
    _x params [
        ["_object", objNull, [objNull]],
        ["_title", "", [""]],
        ["_titleColour", [], [[]]],
        ["_subtitle", "", [""]],
        ["_subtitleColour", [], [[]]],
        ["_iconPath", "", [""]],
        ["_iconColour", [], [[]]],
        ["_position", [], [[]]]
    ];

    // Name
    if !(_title isEqualTo "") then {
        drawIcon3D [
            "\a3\Data_f\clear_empty.paa",
            _titleColour,
            _position,
            0,
            1.3,
            0,
            _title,
            1.8,                  // Shadow
            0.0348,
            "RobotoCondensed",
            "center",
            false
        ]
    };

    // Occupation
    if !(_subtitle isEqualTo "") then {
        drawIcon3D [
            "\a3\Data_f\clear_empty.paa",
            _subtitleColour,
            _position,
            0,
            2.7,
            0,
            _subtitle,
            1.8,                  // Shadow
            0.031,
            "RobotoCondensed",
            "center",
            false
        ];
    };

    // Icon
    if !(_iconPath isEqualTo "") then {
        _iconPath = [
            _iconPath,
            GW_MISSION_ROOT + _iconPath
        ] select (_iconPath select [0, 1] != "\");

        // Draw Icon
        drawIcon3D [_iconPath, _iconColour, _position, 1, 1, 0, "", 1, 0.028];
    };
    true
} count GW_drawNameTags_tags
