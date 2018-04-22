#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_dictCreateDict.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): NAMESPACE - Namespace to set variable in
 *     1 (REQUIRED): STRING    - Name of dict
 *     2 (REQUIRED): ARRAY     - Array with initial dict
 *     3 (OPTIONAL): BOOLEAN   - Broadcast dict
 *
 * Description:
 *     Creates a dict
 */
scriptName "GW_client_fnc_dictCreateDict: main";
scopeName "main";

params [
    ["_namespace", missionNamespace, [missionNamespace, objNull]],
    ["_dictName", "", [""]],
    ["_initialDict", [], [[]]],
    ["_broadcast", false, [true]]
];

// Error checks
if (_dictName isEqualTo "") throw "Dict name is empty string";
if (count _initialDict < 1) throw "Dict array needs to contain at least one element";
if (count (_initialDict param [0, [], [[]]]) != 2) throw "First element must contain two elements. (Key, Value)";

// Set variable in namespace where it should be
_namespace setVariable [_dictName, _initialDict, _broadcast];