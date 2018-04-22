#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_experienceGetCategoryName.sqf
 *
 * Parameter(s):
 *     0: INDEX
 *
 * Returns:
 *     STRING
 *
 * Description:
 *     Checks supplied index towards category experience config
 */
scriptName "GW_client_fnc_experienceGetCategoryName: main";
scopeName "main";

if !params [["_index", 0, [0]]] exitWith {["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

private _config = missionConfigFile >> "CfgExperience";
private _classes = "true" configClasses (_config >> "Categories");
private _categoryName = "";
{
    private _id = getNumber (_x >> "id");
    if (_id isEqualTo _index) then {
        _categoryName = getText (_x >> "displayName")
    }
} count _classes;

// Return
_categoryName breakOut "main"
