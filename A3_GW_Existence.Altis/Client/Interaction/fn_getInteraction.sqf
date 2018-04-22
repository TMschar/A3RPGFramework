#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_getInteraction.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Target to interact with
 *
 * Description:
 *     Sets up interaction menu with correct items available
 */
#define ACTIONS GW_displayInteractionMenu_actions
#define TITLE GW_displayInteractionMenu_title
#define TARGET GW_displayInteractionMenu_target
#define ATM_TYPES (getArray (missionConfigFile >> "CfgGroundWars" >> "World" >> "atms"))
#define VEHICLE_CATEGORIES [ "Car", "Air", "Boat", "Submarine", "Tank", "Support" ]
#define CLASSNAME_PETROLSTATION (getText (missionConfigFile >> "CfgPetrolStations" >> worldName >> "Settings" >> "robbableObject"))

scriptName "GW_client_fnc_getInteraction: main";
scopeName "main";

if (!params [ ["_target", objNull, [objNull]] ]) throw "Expected target parameter";
if (isNull _target) exitWith {};
if (dialog) exitWith {};
if (speed _target > 1) exitWith {};

private _targetClassname = typeOf _target;
private _displayName = [_targetClassname] call GW_client_fnc_vehicleGetDisplayName;
private _vehicleCategory = [_targetClassname] call GW_client_fnc_vehicleGetCategory;
private _bankBuildings = [] call GW_client_fnc_banksBuildings;

ACTIONS = [];
TARGET = _target;
TITLE = format ["Interact with %1", _displayName];

switch (true) do
{
    case (_targetClassname in ATM_TYPES && {_target distance player < 5}):
    {
        TITLE = "Interact with the ATM";
        [_target] call GW_client_fnc_atmInteractions;
    };
    case ([_target] call GW_client_fnc_propertyIsContainer && {player distance _target < 3}):
    {
        TITLE = "Interact with the container";
        [_target] call GW_client_fnc_containerInteractions;
    };
    case (_targetClassname == "Box_T_East_Wps_F"):
    {
        TITLE = "Interact with the container";
        [_target] call GW_client_fnc_containerInteractions;
    };
    case (_target isKindOf "House" && {[_target] call GW_client_fnc_propertyIsAllowed} && {player distance _target < 10}):
    {
        [_target] call GW_client_fnc_propertyInteractions;
    };
    case (_target distance player < 10 && {_vehicleCategory in VEHICLE_CATEGORIES}):
    {
        [_target] call GW_client_fnc_vehicleInteractions;
    };
    case (isPlayer _target && {_target isKindOf "Man"} && {_target distance player < 3}):
    {
        TITLE = format ["Interact with %1", name _target];
        [_target] call GW_client_fnc_playerInteractions;
    };
    case (typeOf _target == "Land_Money_F"):
    {
        [_target] call GW_client_fnc_moneyPickupRequest;
    };
    case (typeOf _target in _bankBuildings && {[_target] call GW_client_fnc_banksCanDrill}):
    {
        ACTIONS pushBack ["Drill Vault", "", "[_this] call GW_client_fnc_banksDrillRequest", ""];
    };
    case (_target getVariable ["moneyBags", 0] > 0):
    {
        ACTIONS pushBack ["Steal Moneybags", "", "[_this] call GW_client_fnc_banksCollectMoneybagRequest", ""];
    };
    case (_targetClassname == CLASSNAME_PETROLSTATION && {[] call GW_client_Fnc_petrolStationsCanRob}):
    {
        ACTIONS pushBack ["Rob Petrol Station", "", "[_this] call GW_client_fnc_petrolStationsRobRequest", ""];
    };
    case ([_target] call GW_client_fnc_captureZonesCanCapture):
    {
        ACTIONS pushback ["Capture Zone", "", "[_this] call GW_client_fnc_captureZonesCaptureRequest", ""];
    };
};

// Only create if there is any actions available
if !(ACTIONS isEqualTo []) then { createDialog "GW_displayInteractionMenu" };