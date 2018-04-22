#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_drawMapIcons.sqf
 *
 * Parameter(s):
 *     0: CONTROL - Map Control
 */
scriptName "function: main";
scopeName "main";

params [ ["_mapCtrl", controlNull, [controlNull]] ];

// Draw cursortarget
_mapCtrl drawIcon
[
    "",
    [1, 1, 1, 1],
    screenToWorld [0.5, 0.5],
    24,
    24,
    getDir player,
    "Crosshair",
    1,
    0.06,
    "EtelkaNarrowMediumPro",
    "right"
];

// Draw units on map
{
    _x params [["_vehicle", objNull, [objNull]], ["_icon", "", [""]], ["_colour", [], [[]]]];
    _mapCtrl drawIcon
    [
        _icon,
        _colour,
        getPos vehicle _vehicle,
        24,
        24,
        getDir vehicle _vehicle,
        if (_vehicle isEqualTo player) then {
            ""
        } else {
            if (isPlayer _vehicle) then {
                toUpper (name vehicle _vehicle)
            } else {
                typeOf vehicle _vehicle
            }
        },
        1,
        0.06,
        "EtelkaNarrowMediumPro",
        "right"
    ];
    true
} count GW_MapDrawIcons_Units;

// No need to continue
if (isNil "GW_MapDrawIcons_Properties" || {GW_MapDrawIcons_Properties isEqualTo []} || {isStreamFriendlyUIEnabled}) exitWith {};

// Draw houses on map
{
    _x params [["_propertyTitle", "", [""]], ["_icon", "", [""]], ["_colour", [], [[]]], ["_object", objNull, [objNull]]];
    _mapCtrl drawIcon
    [
        _icon,
        _colour,
        getPos _object,
        24,
        24,
        0,
        _propertyTitle,
        1,
        0.06,
        "EtelkaNarrowMediumPro",
        "right"
    ];
    true
} count GW_MapDrawIcons_Properties;

// Draw icons for incapacitated players
if (playerSide isEqualTo independent) then
{
    private _deadPlayers = ALLPLAYERSNOHC select { _x getVariable ["incapacitated", false]; };
    {
        _mapCtrl drawIcon [
            "\a3\ui_f\data\igui\cfg\Actions\heal_ca.paa",
            [1, 0, 0, 1],
            getPos _x,
            24,
            24,
            0,
            name _x,
            1,
            0.06,
            "EtelkaNarrowMediumPro",
            "right"
        ];
        true
    } count _deadPlayers;
};