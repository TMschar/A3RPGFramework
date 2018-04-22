#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * @deprecated
 */
scriptName "GW_client_fnc_equipmentOpenMarket: main";
scopeName "main";

if !(params [["_class", "", [""]]]) throw "";
[_class] call GW_client_fnc_equipmentOpenItemsShop;
