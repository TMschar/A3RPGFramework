#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_equipmentOpenClothingShop.sqf
 *
 * Parameter(s):
 *     0: STRING - Class
 *
 * Description:
 *     Open clothing shop
 */
scriptName "GW_client_fnc_equipmentOpenClothingShop: main";
scopeName "main";

if (!params [["_class", "", [""]]]) exitWith {
    ["Not enough parameters passed", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
};

private _class = missionConfigFile >> "CfgClothing" >> "Shops" >> _class;
if !(isClass _class) exitWith {
    ["Class not found", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
};

// Make sure access is there
private _condition = getText (_class >> "condition");
if !([_condition] call GW_client_fnc_doEvaluation) exitWith {
    [HINT_WARNING, "Unauthorized", "You are unauthorized and you cannot access this shop."] call GW_client_fnc_notificationsAdd;
};

// Set global variables
GW_displayClothingShop_Class = _class;
GW_displayClothingShop_Title = getText (_class >> "displayName");

// Create dialog
createDialog "GW_displayClothingShop"
