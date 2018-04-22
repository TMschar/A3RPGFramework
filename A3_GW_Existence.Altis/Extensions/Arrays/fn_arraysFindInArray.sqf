/**
 * Copyright (c) 2017 SimZor and Midnight, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_arraysFindInArray.sqf
 *
 * Parameter(s):
 *     0: STRING - String to find inside an array
 *     1: ARRAY  - Array to loop through and check for matches
 *
 * Returns:
 *    ARRAY
 *
 * Description:
 *     Helper function for searching through an array for
 *     any matches with a specific string
 */
params
[
    ["_toFind", "", [""]],
    ["_array", [], [[]]]
];

private _elements = [];

// Loop through all elements
{
    if !(_x find _toFind isEqualTo -1) then
    {
        _elements pushback _x
    };
    true
} count _array;

// Return
_elements
