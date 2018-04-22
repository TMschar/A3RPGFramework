#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_propertyHasAccess.sqf
*
*    Parameter(s):
*        0: OBJECT - Property
*
*    Returns:
*        BOOLEAN
*
*    Description:
*        Helper function for properties which checks if a client/player has access
*        to a certain property through a parameters passed in. LOCAL ONLY!
*/
scriptName "GW_client_fnc_propertyHasAccess: main";
scopeName "main";

if !params [["_property", objNull, [objNull]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

private _orgName = group player getVariable ["organizationName", ""];
private _propertyOwner = _property getVariable ["propertyOwner", ""];

// Return boolean. The property has to be in the property objects
// array or, alternatively the owner has to be the players UID or
// the org name which the player is in.
_property in GW_properties_objects
|| {_propertyOwner == getPlayerUID player}
|| {_propertyOwner == _orgName}