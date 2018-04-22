#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_dictGetValueByKey.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): ARRAY     - Existing dict (can be passed in as [] if not want to pass one in)
 *     0 (REQUIRED): NAMESPACE - Namespace dict is stored in§
 *     1 (REQUIRED): STRING    - Name of dict
 *     2 (REQUIRED): STRING    - Key of value to get
 *
 * Returns:
 *     ANYTHING - Value of key (if nothing found - nil)
 *
 * Throws:
 *     Exception when the dictname is an empty string
 *     Exception when the key is empty string
 *     A dict with given name doesn't exist
 *
 * Description:
 *     Gets value of a dict key element
 */
scriptName "GW_client_fnc_dictGetValueByKey: main";
scopeName "main";

params [
    ["_dict", [], [[]]],
    ["_namespace", missionNamespace, [missionNamespace, objNull]],
    ["_dictName", "", [""]],
    ["_key", "", [""]]
];

// Error checks
if (_dict isEqualTo [] && {_dictName isEqualTo ""}) throw "Dictname is empty string";
if (_key isEqualTo "") throw "Key is empty string";

// Get dict array
if (_dict isEqualTo []) then {
    _dict = _namespace getVariable _dictName;
    if (isNil "_dict") throw "No dict with that name exists";
};

// Loop through the dict array
{
    _x params ["_elementKey", "_elementValue"];

    // If found, return
    if (_elementKey == _key) exitWith {
        _elementValue breakOut "main";
    };

    true
} count _dict;

// Return nothing
nil;