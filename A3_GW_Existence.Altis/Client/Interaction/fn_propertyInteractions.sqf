#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: fn_propertyInteractions.sqf
*
* Parameter(s):
*     0: OBJECT
*/
#define ACTIONS GW_displayInteractionMenu_Actions

scriptName "GW_client_fnc_propertyInteractions: main";
scopeName "main";

if !params [["_target", objNull, [objNull]]] exitWith {["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};
if isNull _target exitWith {};

private _propertyOwner = _target getVariable ["propertyOwner", ""];
private _orgName = group player getVariable ["organizationName", ""];
private _propertyAccess = _propertyOwner == getPlayerUID player || {_propertyOwner == _orgName};
private _propertyTypename = [typeOf _target] call GW_client_fnc_propertyTypeName;

switch playerSide do {
    case civilian: {
        switch true do {
            case !([_target] call GW_client_fnc_propertyOwned): {
                if (_propertyTypename == "safehouse" && {!(_orgName isEqualTo "")} || {_propertyTypename in ["house", "garage"]}) then {
                    ACTIONS pushback [
                        "Purchase Property",
                        "",
                        "[_this] call GW_client_fnc_propertyRequestPurchase",
                        "purchase"
                    ]
                }
            };
            case _propertyAccess: {
                if ([_target] call GW_client_fnc_propertyDoorsLocked) then {
                    ACTIONS pushback [
                        "Unlock all doors",
                        "",
                        "[0, _this] call GW_client_fnc_propertyManipulateLocks",
                        "key"
                    ]
                } else {
                    ACTIONS pushback [
                        "Lock all doors",
                        "",
                        "[1, _this] call GW_client_fnc_propertyManipulateLocks",
                        "key"
                    ]
                }
            };
            case (_propertyAccess && {_propertyTypename == "garage"}): {
                ACTIONS pushback [
                    "Ground Vehicles Garage",
                    "",
                    "",
                    "garage"
                ]
            }
        }
    };
    case independent;
    case west: {};
}
