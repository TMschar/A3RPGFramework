#include "script_component.hpp"
/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: fn_propertyRequestPurchase.sqf

    Parameter(s):
        0: OBJECT - Object of the property one wants to buy

    Returns:
        NOTHING
*/
scriptName "GW_client_fnc_propertyRequestPurchase: main";
scopeName "main";

if !(params [
    ["_property", objNull, [objNull]]
]) exitWith {
    [LOG_INFO, localize "STR_GW_LOG_SYSTEM_GLOBAL_PARAMERROR", _fnc_scriptName] call GW_server_fnc_log
};

// Only allow civilians to purchase properties
if !(playerSide isEqualTo civilian) exitWith {};

private _propertyConfig = missionConfigFile >> "CfgProperties" >> worldName;
private _propertyClassName = typeOf _property;
private _purchasePrice = getNumber (_propertyConfig >> _propertyClassName >> "purchasePrice");
private _blockedLocations = getArray (_propertyConfig >> "blockedLocations");

// Check if property is blocked
if (getPos _property in _blockedLocations) exitWith {[1, localize "STR_GW_GUI_SYSTEMS_PROPERTY_PROPERTYBLOCKEDTITLE", localize "STR_GW_GUI_SYSTEMS_PROPERTY_PROPERTYBLOCKED"] call GW_client_fnc_notificationsAdd};
if ([_property] call GW_client_fnc_propertyOwned) exitWith {[1, localize "STR_GW_GUI_SYSTEMS_PROPERTY_PROPERTYUNAVAILABLETITLE", localize "STR_GW_GUI_SYSTEMS_PROPERTY_PROPERTYUNAVAILABLE"] call GW_client_fnc_notificationsAdd};

// Check property limits
private _propertyTypeName = [_propertyClassName] call GW_client_fnc_propertyTypeName;
if (_propertyTypeName == "house" && {GW_Properties_Houses_Count > (getNumber (_propertyConfig >> "houseLimit"))}) exitWith {[1, localize "STR_GW_GUI_SYSTEMS_PROPERTY_PROPERTYLIMITMETTITLE", localize "STR_GW_GUI_SYSTEMS_PROPERTY_PROPERTYLIMIT"] call GW_client_fnc_notificationsAdd};
if (_propertyTypeName == "garage" && {GW_Properties_Garages_Count > (getNumber (_propertyConfig >> "garageLimit"))}) exitWith {[1, localize "STR_GW_GUI_SYSTEMS_PROPERTY_PROPERTYLIMITMETTITLE", localize "STR_GW_GUI_SYSTEMS_PROPERTY_PROPERTYLIMIT"] call GW_client_fnc_notificationsAdd};
if (_propertyTypeName == "safehouse" && {GW_Properties_SafeHouses_Count > (getNumber (_propertyConfig >> "safehouseLimit"))}) exitWith {[1, localize "STR_GW_GUI_SYSTEMS_PROPERTY_PROPERTYLIMITMETTITLE", localize "STR_GW_GUI_SYSTEMS_PROPERTY_PROPERTYLIMIT"] call GW_client_fnc_notificationsAdd};

// Make sure player is in organization if he/she wants to buy a safehouse
if !(_propertyTypeName in ["house", "garage", "safehouse"]) exitWith {};
if (_propertyTypeName == "safehouse" && {group player getVariable ["organizationName", ""] isEqualTo ""}) exitWith {
    [HINT_WARNING, "Purchase Failed", "You are not part of any organization."] call GW_client_fnc_notificationsAdd
};

// Take money out of account
if (_propertyTypeName in ["house", "garage"]) then {
    if (_purchasePrice > missionNamespace getVariable [BANK_STRING, 0]) then {
        [1, localize "STR_GW_GUI_SYSTEMS_PROPERTY_INSUFFICIENTFUNDS", localize "STR_GW_GUI_SYSTEMS_PROPERTY_PLAYERFUNDS"] call GW_client_fnc_notificationsAdd;
        breakOut "main"
    };

    // Update account
    BANK = BANK - _purchasePrice
} else {
    if (_purchasePrice > ORG_FUNDS) then {
        [1, localize "STR_GW_GUI_SYSTEMS_PROPERTY_INSUFFICIENTFUNDS", localize "STR_GW_GUI_SYSTEMS_PROPERTY_ORGANIZATIONFUNDS"] call GW_client_fnc_notificationsAdd
        breakOut "main"
    };

    // Update organization funds
    group player setVariable ["organization_bank", (ORG_FUNDS - _purchasePrice), true]
};

// Proceed to purchase property
[0, localize "STR_GW_GUI_SYSTEMS_PROPERTY_PROCESSPURCHASETITLE", localize "STR_GW_GUI_SYSTEMS_PROPERTY_PROCESSPURCHASE"] call GW_client_fnc_notificationsAdd;
[1, "GW_PROPERTIES_PURCHASEREQUEST", [_property, player, _propertyTypeName]] call GW_ext_fnc_networkPublicVariable
