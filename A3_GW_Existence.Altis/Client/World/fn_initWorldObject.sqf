#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_initWorldObject.sqf
 *
 * Parameter(s):
 *     (8)
 *
 * Description:
 *     Sets up a mission object
 */
scriptName "GW_client_fnc_initWorldObject: main";
scopeName "main";

params [
    ["_object", objNull, [objNull]],
    ["_side", sideUnknown, [sideUnknown]],
    ["_structuredText", "", [""]],
    ["_variableString", "", [""]],
    ["_scriptArguments", [], [[]]],
    ["_title", "", [""]],
    ["_subtitle", "", [""]],
    ["_titleColour", [], [[]]]
];

try {
    if !(_structuredText isEqualTo "") then {
        if (_variableString isEqualTo "") throw "No variable string";
        if (isNull _object) throw "Vendor object null";
        if (_side isEqualTo sideUnknown) throw "Side is null";

        // Get Colour
        private _sideColour = [_side, false] call BIS_fnc_sideColor;
        private _hex = _sideColour call BIS_fnc_colorRGBAtoHTML;
        private _script = missionNamespace getVariable [_variableString, {}];

        // Add action to object
        private _faction = switch _side do {
            case west: {"MP"};
            case east: {"REBEL"};
            case civilian: {"CIV"};
            case independent: {"IHAS"}
        };

        _object addAction [
            format ["<t font='RobotoCondensedBold' color='%1'>[%2]</t> %3", _hex, _faction, _structuredText],
            format ["%1 call %2", _scriptArguments, _script],
            nil,
            1.5,
            true,
            true,
            "",
            "alive _this && {_this distance _target < 2.5}"
        ];
    };

    if (!(_title isEqualTo "") || {!(_subtitle isEqualTo "")}) then {
        _object setVariable ["nametags_title", _title, true];
        _object setVariable ["nametags_subtitle", _subtitle, true];

        if !(_titleColour isEqualTo []) then {
            _object setVariable ["nametags_title_colour", _titleColour, true]
        }
    }
} catch {
    [LOG_WARNING, format ["Threw exception %1", _exception], _fnc_scriptName] call GW_server_fnc_log
}
