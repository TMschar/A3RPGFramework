#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_numbersIndex.sqf
*
*    Parameter(s):
*        0: ARRAY
*        1: ANY
*
*    Returns:
*        NUMBER
*
*    Description:
*        Get index for an item inside an array. Returns number of index, if error, returns false.
*/
scriptName "GW_client_fnc_numbersIndex: main";
scopeName "main";

params [
    ["_array", [], [[]]],
    "_element"
];
if (_array isEqualTo []) exitWith {false};
if !(_element in _array) exitWith {false};

private _index = -1;
{
    if (_x == _element) exitWith {
        _index = _forEachIndex
    }
} forEach _array;

_index
