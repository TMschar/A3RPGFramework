#include "script_component.hpp"
/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: fn_propertyRequestRespond.sqf

    Parameter(s):
        0: STRING - Type of event

    Returns:
        NOTHING
*/
scriptName "GW_client_fnc_propertyRequestRespond: main";
scopeName "main";

params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
];

if (_event == "PROPERTYOWNED") then {
    _args params [["_purchasePrice", 0, [0]]];
    [2, localize "STR_GW_GUI_SYSTEMS_PROPERTY_PPROPERTYPURCHASEFAILEDTITLE", localize "STR_GW_GUI_SYSTEMS_PROPERTY_PPROPERTYPURCHASEFAILED"] call GW_client_fnc_notificationsAdd;
    BANK = BANK + _purchasePrice
} else {
    if (_event == "PROPERTYPURCHASED") then {
        _args params [["_text", "", [""]]];
        [0, localize "STR_GW_GUI_SYSTEMS_PROPERTY_PPROPERTYPURCHASECOMPLETE", _text] call GW_client_fnc_notificationsAdd
    }
}
