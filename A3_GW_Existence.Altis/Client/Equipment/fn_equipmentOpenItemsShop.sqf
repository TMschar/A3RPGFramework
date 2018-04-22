#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_equipmentOpenItemsShop.sqf
 *
 * Parameter(s):
 *     0: STRING - Class
 *
 * Throws:
 *     Exception
 */
if !(params [
    ["_class", "", [""]]
]) throw "Param error";

// Get class
private _class = missionConfigFile >> "CfgVirtualItems" >> "Shops" >> worldName >> _class;
if !(isClass _class) throw "No class with said name found";

// Make sure access is there
private _condition = getText (_class >> "condition");
if !([_condition] call GW_client_fnc_doEvaluation) exitWith {
    [HINT_WARNING, "Shop Notice", "You are unauthorized and you cannot access this shop."] call GW_client_fnc_notificationsAdd;
};

// Store in global variables
GW_displayItemsShop_title = getText (_class >> "displayName");
GW_displayItemsShop_class = _class;

// Create dialog
createDialog "GW_displayItemsShop";