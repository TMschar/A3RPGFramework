#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_playerKeyDictionary.sqf
*
*    Parameter(s):
*        0: NUMBER - DIK Code
*/
scriptName "GW_client_fnc_playerKeyDictionary: main";
scopeName "main";

if !params [["_dikCode", 0, [0]]] exitWith {""};

private _customKey = switch _dikCode do {
    case DIK_END: {["User4", "[End Key]"]};
    case DIK_LWIN: {["User2", "[Left Windows Key]"]};
    default {["", ""]}
};

_customKey params [["_actionKey", "", [""]], ["_defaultKeyName", "", [""]]];

private _return = [
    format [
        "Custom Key %1",
        [_actionKey, 4] call BIS_fnc_trimString
    ],
    _defaultKeyName
] select (count (actionKeys _actionKey) < 1);

_return
