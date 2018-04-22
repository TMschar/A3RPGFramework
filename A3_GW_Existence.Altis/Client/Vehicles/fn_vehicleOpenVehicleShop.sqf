#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_vehicleOpenVehicleShop.sqf
*
*    Parameter(s):
*        0: STRING - Shop Class
*
*    Returns:
*        NOTHING
*
*    Description:
*       Creates a vehicle shop display and sends it a few variables to go by
*/
scriptName "GW_client_fnc_vehicleOpenVehicleShop: main";
scopeName "main";

if !(params [
    ["_shopClass", "", [""]],
    ["_spawnPoints", [], [[]]]
]) exitWith {
    [LOG_WARNING, "Not enough params passed", _fnc_scriptName] call GW_server_fnc_log
};

private _vehicleConfig = missionConfigFile >> "CfgVehicles";

if !(isClass (_vehicleConfig >> "Shops" >> _shopClass)) exitWith {
    [LOG_WARNING, "No class with that name", _fnc_scriptName] call GW_server_fnc_log
};
private _shopConfig = _vehicleConfig >> "Shops" >> _shopClass;

GW_displayVehicleShop_displayName = getText (_shopConfig >> "displayName");
GW_displayVehicleShop_vehicles = getArray (_shopConfig >> "vehicles");
GW_displayVehicleShop_spawnPoints = _spawnPoints;

// Make sure player is allowed to use shop
private _condition = getText (_shopConfig >> "condition");
private _conditionCompiled = call compile _condition;
if (_conditionCompiled isEqualType true && {!_conditionCompiled}) exitWith {
    [HINT_WARNING, "Unauthorized", "You are not allowed to use this vehicle shop."] call GW_client_fnc_notificationsAdd
};

// Create dialog and call onLoad
if dialog then {closeDialog 0};
createDialog "GW_displayVehicleShop";
