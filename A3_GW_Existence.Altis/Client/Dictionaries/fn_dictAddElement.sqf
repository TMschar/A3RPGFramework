#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_dictAddElement.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): NAMESPACE - Namespace dict is stored in
 *     1 (REQUIRED): STRING    - Name of dict
 *     2 (REQUIRED): STRING    - Key
 *     3 (REQUIRED): ANYTHING  - Value
 *     4 (OPTIONAL): BOOLEAN   - Broadcast
 *
 * Throws:
 *     Exception when dict name is an empty string
 *     Exeception when no key is passed
 *     Exception when no value is passed
 *     Exception when there is not a dict with that name
 *     Exception when key already exists in array
 *
 * Description:
 *     Add dict element (Key, Value) to dict
 */
scriptName "GW_client_fnc_dictAddElement: main";
scopeName "main";

params [
    ["_namespace", missionNamespace, [missionNamespace, objNull]],
    ["_dictName", "", [""]],
    ["_key", "", [""]],
    "_value",
    ["_broadcast", false, [true]]
];

// Error checks
if (_dictName isEqualTo "") throw "Dict name is empty string";
if (_key isEqualTo "") throw "No key passed";
if (isNil "_value") throw "No value passed";

// Get dict
private _dict = _namespace getVariable _dictName;
if (isNil "_dict") throw "No dict with that name exists";

// Throw error if key already exists in dict
if ({_x param [0, "", [""]] == _key} count _dict > 0) throw "This key already exists in dict";

// Append to dict array
private _element = [_key, _value];
_dict pushback _element;

// Update variable in namespace
_namespace setVariable [_dictName, _dict, _broadcast];