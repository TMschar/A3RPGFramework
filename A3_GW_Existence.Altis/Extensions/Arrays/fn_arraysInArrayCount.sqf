#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_arraysInArrayCount.sqf
 *
 * Parameter(s):
 *     0: ANY   - Item to find inside an array
 *     1: ARRAY - Array to check in
 *
 * Returns:
 *     NUMBER - Amount of elements that matched
 *
 * Description:
 *     Loops through an array and checks how many times something is found inside the array
 */
if (
    !params
    [
        "_toFind",
        ["_array", [], [[]]]
    ]
) throw "Param error";

// Loop through array
private _appearanceCount = 0;
{
    if (_x == _toFind) then
    {
        _appearanceCount = _appearanceCount + 1;
    };

    true
} count _array;

// Return
_appearanceCount;