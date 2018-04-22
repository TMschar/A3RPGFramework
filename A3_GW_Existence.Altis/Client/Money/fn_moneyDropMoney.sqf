#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_moneyDropMoney.sqf
 *
 * Parameter(s):
 *     0 (REQUIRED): NUMBER - Amount of money
 *     1 (REQUIRED): ARRAY  - Position ATL (Above Terrain Level)
 *
 * Description:
 *     Drops money on ground at given location
 */
#define CLASSNAME_MONEYSTACK "Land_Money_F"

scriptName "GW_client_fnc_moneyDropMoney: main";
scopeName "main";

if (!params [["_amount", -1, [-1]], ["_posATL", [], [[]]]]) throw "Expected two parameters";

// Error checks
if (count _posATL != 3) exitWith {};
if (_amount isEqualTo -1) exitWith {};
if (_amount < 1) exitWith {};

private _moneyStack = CLASSNAME_MONEYSTACK createVehicle _posATL;
_moneyStack setPosATL _posATL;
_moneyStack setVariable ["value", _amount, true];