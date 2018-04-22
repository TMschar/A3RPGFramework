/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_dictSetValueByKey.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): ARRAY     - Dict array (can be empty array if its wanted to be found in namespace)
 *     0 (REQUIRED): NAMESPACE - The namespace that the dict is stored in
 *     1 (REQUIRED): STRING    - The name of the dict
 *     2 (REQUIRED): STRING    - Key that value should be set in
 *     3 (REQUIRED): ANYTHING  - Value that should be stored together with the key
 *     4 (OPTIONAL): BOOLEAN   - Broadcast variable
 *
 * Throws:
 *     Exception if passed value is nil
 *     Exception if passed key is empty
 *     Exception if passed dictname is empty
 *     Exception if dict is not found
 *     Exception if dict is not a type ARRAY
 *     Exception if dict elements are less than 1
 *     Exception if dicts first element is less than 2 elements
 *     Exception if keypair is not found
 *
 * Description:
 *     Set a value at a keys position. An element with given key must be
 *     in the dict already for this function let it pass. For new elements
 *     use GW_client_fnc_dictAddElement.
 */
scriptName "GW_client_fnc_dictSetValueByKey: main";
scopeName "main";

params [
    ["_dict", [], [[]]],
    ["_namespace", missionNamespace, [missionNamespace, objNull]],
    ["_dictName", "", [""]],
    ["_key", "", [""]],
    "_value",
    ["_broadcast", false, [true]]
];

if (isNil "_value") throw "No value passed";
if (_key isEqualTo "") throw "No key passed";
if (_dict isEqualTo [] && {_dictName isEqualTo ""}) throw "";

if (_dict isEqualTo []) then { _dict = _namespace getVariable _dictName; };
private _pairFound = false;
if (isNil "_dict") throw "No dict with given name exists";
if !(_dict isEqualType []) throw "Given variable is not of type array";
if (count _dict < 1) throw "Given variable does not have enough elements";
if (count (_dict param [0, [], [[]]]) < 2) throw "Given dicts first element has less than two elements";

// Loop through dict
{
    _x params ["_elementKey", "_elementValue"];

    // If found, set new value
    if (_elementKey == _key) exitWith {
        _pairFound = true;
        _dict set [_forEachIndex, [_elementKey, _value]];
    };
} forEach _dict;

// Throw an exception if pair is not found
if (!_pairFound) throw "No key pair found";

// Update dict in namespace
if (_dict isEqualTo []) then { _namespace setVariable [_dictName, _dict, _broadcast]; };