#include "script_component.hpp"
/*
 * Copyright (C) SimZor, SimZor Studios 2017
 * All Rights Reserved
 *
 * Filename: fn_stripDownUnit.sqf
 *
 * Throws:
 *     Exception when there is a param error
 *
 * Parameter(s):
 *     0: OBJECT - Unit to strip
 */
scriptName "GW_client_fnc_stripDownUnit: main";
scopeName "main";

// Get Parameters
if !(params [["_unit", objNull, [objNull]]]) throw "Param error";

// Remove Items
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;

// Remove Clothing
removeUniform _unit;
removeVest _unit;
removeGoggles _unit;
removeHeadgear _unit;
removeBackpack _unit;
