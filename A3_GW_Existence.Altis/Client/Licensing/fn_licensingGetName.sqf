#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_licensingGetName.sqf
 *
 * Parameter(s):
 *     0: STRING - License Identification
 *
 * Returns:
 *     STRING
 */
#define DUMMY_RETURN "dummyReturn"
#define CONFIG_LICENSES (missionConfigFile >> "CfgLicenses" >> worldName >> "Licenses")
#define CONFIG_CLASSES_LICENSES ("true" configClasses (CONFIG_LICENSES >> "Legal")) \
                                + ("true" configClasses (CONFIG_LICENSES >> "Illegal")) \
                                + ("true" configClasses (CONFIG_LICENSES >> "DVLA"))

scriptName "GW_client_fnc_licensingGetName: main";
scopeName "main";

private _categoryConfigClasses = [];
private _displayName = "";
private _variable = "";

if (!params [ ["_licenseString", "", [""]] ]) throw "Param error";

// Loop through all license classes
{
    if (configName _x == _licenseString) exitWith
    {
        (getText (_x >> "displayName")) breakOut "main";
    };
    true;
} count CONFIG_CLASSES_LICENSES;

// Return dummy data if above loop didn't return anything
DUMMY_RETURN
