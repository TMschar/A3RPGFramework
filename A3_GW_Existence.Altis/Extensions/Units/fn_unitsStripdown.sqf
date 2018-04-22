#include "script_component.hpp"
/*
 * Copyright (C) SimZor, SimZor Studios 2017
 * All Rights Reserved
 *
 * Filename: fn_unitsStripdown.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Unit to strip
 */
scriptName "GW_ext_fnc_unitsStripdown: main";
scopeName "main";

// Get parameters
if (!params [ ["_unit", objNull, [objNull]] ]) throw "Did not pass unit as a parameter";

// Remove items
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;

// Remove clothing
removeUniform _unit;
removeVest _unit;
removeGoggles _unit;
removeHeadgear _unit;
removeBackpack _unit;
