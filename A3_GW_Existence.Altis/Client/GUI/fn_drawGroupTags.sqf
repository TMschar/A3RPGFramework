#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_drawGroupTags.sqf
 *
 * Description:
 *     Draws group tags in 3D world. Should be called from a draw3D eventhandler.
 */
#define COLOUR_RED [ 1, 0, 0, 1 ]

scriptName "GW_client_fnc_drawGroupTags: main";
scopeName "main";

// If they are disabled by player
if (profileNamespace getVariable ["GW_disableHexagons", false]) exitWith {};

// Make sure player has a GPS in order to see the
// 3D icons
if !("ItemGPS" in assignedItems player) exitWith {};

// Array of members in group that the condition
// is true of
private _groupMembers = units group player;
private _unitsArray = _groupMembers select
{
    "ItemGPS" in assignedItems _x
    && {_x distance player > 13}
};

// Draw all players
{
    // Decide position of where to put marker depending on
    // if the unit is in a vehicle or not
    private _position3D = if (isNull objectParent _x) then
    {
        _x modelToWorldVisual (_x selectionPosition "Spine3")
    }
    else
    {
        _x modelToWorldVisual [0, 0, 0]
    };

    private _icon = if (_x getVariable ["incapacitated", false]) then
    {
        "a3\ui_f\data\igui\cfg\revive\overlayIconsGroup\u50_ca.paa";
    }
    else
    {
        if (damage _x >= 0.25) then
        {
            "a3\ui_f\data\igui\cfg\revive\overlayIconsGroup\r50_ca.paa";
        }
        else
        {
            "a3\ui_f\data\igui\cfg\cursors\select_ca.paa";
        };
    };

    // Draw the icon
    drawIcon3D
    [
        _icon,                      // Text
        GW_gui_defaultTextColour,   // Colour
        _position3D,                // Position
        1,                          // Width
        1,                          // Height
        0,                          // Angle
        "",                         // Text
        0,                          // Shadow
        0,                          // Text Size
        "RobotoCondensedBold",      // Font
        "center",                   // Alignment
        true                        // Draw Side Arros
    ];

    // Draw information under icon (Name, distance etc)
    if (!(profileNamespace getVariable ["GW_disableHexagonInfo", false]) && {freeLook}) then
    {
        drawIcon3D
        [
            "",                                                         // Text
            GW_gui_defaultTextColour,                                   // Colour
            _position3D,                                                // Position
            1,                                                          // Width
            0.65,                                                       // Height
            0,                                                          // Angle
            format                                                      // Text
            [
                "%1 - %2 km",
                name _x,
                floor ((vehicle player distance vehicle _x) / 1000)
            ],
            2,                                                          // Shadow
            0.029                                                       // Text Size
        ];
    };
    true;
} count _unitsArray;

// Draw HUD icons for medics on incapacitated players
if (playerSide isEqualTo independent) then {
    _unitsArray = ALLPLAYERSNOHC select
    {
        !(_x isEqualTo player)
        && {damage _x >= 0.25}
        || {_x getVariable ["incapacitated", false]}
    };

    // Loop through dead units
    {
        // Get position depending on if the unit is in a vehicle
        // or on foot
        private _position3D = if (isNull objectParent _x) then
        {
            _x modelToWorldVisual (_x selectionPosition "Spine3")
        } else {
            _x modelToWorldVisual [ 0, 0, 0 ]
        };

        // Select icon depending on if the unit is incapacitated
        // or just damaged.
        private _icon =
        [
            "a3\ui_f\data\igui\cfg\revive\overlayIcons\r50_ca.paa",
            "a3\ui_f\data\igui\cfg\revive\overlayIcons\u50_ca.paa"
        ] select (_x getVariable ["incapacitated", false]);

        // Draw the icon
        drawIcon3D [ _icon, COLOUR_RED, _position3D, 1, 1, 0 ];
        true;
    } count _unitsArray;
};
