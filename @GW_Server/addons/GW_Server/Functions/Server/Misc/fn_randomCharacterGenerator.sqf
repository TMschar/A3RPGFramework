#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_randomCharacterGenerator.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): NUMBER - Length of string
 *
 * Returns:
 *     STRING
 */
#define CHAR_ARRAY ["a", "-", "b", "_", "2", "c", "d", "e", "9", \
    "f", "g", "1", "h", "6", "i", "j", "4", "k", "l", "m", "n", \
    "8", "o", "p", "q", "r", "s", "5", "t", "3", "u", "v", "w", \
    "7", "x", "y", "z"]

scriptName "GW_server_fnc_randomCharacterGenerator: main";
scopeName "main";

if (!params [["_length", 1, [1]]]) exitWith {
    ["No params", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

private _randomKey = "";
for "_i" from 1 to _length do {
    _randomKey = _randomKey + selectRandom CHAR_ARRAY
};

// Return
_randomKey;