#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_banksCanDrill.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Building to drill vault or box of
 *
 * Returns:
 *     BOOLEAN
 *
 * Description:
 *     Checks if player can drill vault or box
 */
scriptName "GW_client_fnc_banksCanDrill: main";
scopeName "main";

params [["_building", objNull, [objNull]]];

if (isNull _building) exitWith {false};

private _bankClass = _building getVariable ["bankClass", ""];
private _bankConfigClass = missionConfigFile >> "CfgBanks" >> worldName >> _bankClass;
if (!isClass _bankConfigClass) exitWith {false};

private _requiredWest = getNumber (_bankConfigClass >> "requiredWest");
private _requiredLevel = getNumber (_bankConfigClass >> "requiredLevel");
private _requiredLevelCategory = getNumber (_bankConfigClass >> "requiredLevelCategory");
private _nearestDoor = [_building] call GW_client_fnc_worldNearestDoor;

if !([_requiredLevelCategory, _requiredLevel] call GW_client_fnc_experienceCategoryHasLevel) exitWith {false};
if ({side _x isEqualTo west} count playableUnits < _requiredWest) exitWith {false};
if !([player, "Drill"] call GW_client_fnc_virtualInventoryHasItem) exitWith {false};
if !([_building, _nearestDoor] call GW_client_fnc_worldDoorIsLocked) exitWith {false};
if !(playerSide isEqualTo civilian) exitWith {false};

true;