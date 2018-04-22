#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_equipmentOpenShop.sqf
 *
 * Parameter(s):
 *     0: STRING - Classname of Shop
 *
 * Description:
 *     Sets options for display equipment and loads up that display
 */
scriptName "GW_client_fnc_equipmentOpenShop: main";
scopeName "main";

if !(params [["_equipmentShopClass", "", [""]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
};

private _equipmentConfig = missionConfigFile >> "CfgEquipment";
private _equipmentShopClass = _equipmentConfig >> "Shops" >> _equipmentShopClass;
if !(isClass _equipmentShopClass) exitWith {
    ["No class with that name", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

GW_displayEquipmentShop_displayName = getText (_equipmentShopClass >> "displayName");
GW_displayEquipmentShop_equipment = getArray (_equipmentShopClass >> "equipment");

// Make sure player is allowed to use shop
private _condition = getText (_equipmentShopClass >> "condition");
private _conditionCompiled = call compile _condition;
if (_conditionCompiled isEqualType true && {!_conditionCompiled}) exitWith {
    [HINT_WARNING, "Unauthorized", "You are not allowed to use this equipment shop."] call GW_client_fnc_notificationsAdd
};

// Create dialog and call onLoad
if dialog then {closeDialog 0};
createDialog "GW_displayEquipmentShop";
