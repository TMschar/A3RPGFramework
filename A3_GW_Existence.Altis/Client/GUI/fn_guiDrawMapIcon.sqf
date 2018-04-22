#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_guiDrawMapIcon.sqf
*
*    Parameter(s):
*       0: STRING - Icon to show
*       1: ARRAY  - Colour in ArmA RGBA Format
*       2: ARRAY  - Position to draw icon at
*       3: STRING - Text to write out after icon
*
*    Returns:
*        NOTHING
*
*    Description:
*        Opens map and draws an icon
*/
scriptName "GW_client_fnc_guiDrawMapIcon: main";
scopeName "main";

if !params [
    ["_vehicleIcon", "", [""]],
    ["_colour", [], [[]]],
    ["_position", [], [[]]],
    ["_text", "", [""]]
] exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

GW_guiDrawMapIcon_icon = _vehicleIcon;
GW_guiDrawMapIcon_colour = _colour;
GW_guiDrawMapIcon_position = _position;
GW_guiDrawMapIcon_text = _text;

if (_position isEqualTo []) exitWith {};
openMap true;

private _ctrlMap = (findDisplay 12 displayCtrl 51);
GW_guiDrawMapIcon_drawHandle = _ctrlMap ctrlAddEventHandler ["Draw", {
    params [["_ctrl", controlNull, [controlNull]]];
    _ctrl drawIcon [
        GW_guiDrawMapIcon_icon,
        GW_guiDrawMapIcon_colour,
        GW_guiDrawMapIcon_position,
        24,
        24,
        0,
        GW_guiDrawMapIcon_text,
        1,
        0.06,
        "EtelkaNarrowMediumPro",
        "right"
    ]
}];

_ctrlMap ctrlAddEventHandler ["Unload", {
    params [["_ctrl", controlNull, [controlNull]]];
    _ctrl ctrlRemoveEventhandler ["Draw", GW_guiDrawMapIcon_drawHandle];
    GW_guiDrawMapIcon_drawHandle = nil
}]
