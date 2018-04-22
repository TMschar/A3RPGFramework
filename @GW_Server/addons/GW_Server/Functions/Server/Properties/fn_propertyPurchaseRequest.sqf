#include "script_component.hpp"
/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: fn_propertyPurchaseRequest.sqf

    Parameter(s):
        1:


    Returns:
        NOTHING
*/
scriptName "GW_server_fnc_propertyPurchaseRequest: main";
scopeName "main";

param [1, [], [[]]] params [
    ["_property",         objNull, [objNull]],
    ["_unit",             objNull, [objNull]],
    ["_propertyTypeName", "",      [""]]
];

private _propertyClassName = typeOf _property;
private _propertyConfig = missionConfigFile >> "CfgProperties" >> worldName >> _propertyClassName;
private _propertyPrice = getNumber (_propertyConfig >> "purchasePrice");
private _unitUID = getPlayerUID _unit;
private _propertyPosition = getPos _property;
private _queryCurrentProperties = ["PROPERTIES_RECEIVE_LOCATION", 2, [_propertyPosition, worldName]] call GW_db_fnc_queryDB;

if (isNil "_unitUID" || {_unitUID isEqualTo ""} || {isNull _unit}) exitWith {
    [LOG_WARNING, "CLIENT IS NULL", _fnc_scriptName] call GW_server_fnc_log
};

// Make sure there are no properties at that location
if !(_queryCurrentProperties isEqualTo []) exitWith {
    ["PROPERTYOWNED", [_propertyPrice]] remoteExecCall ["GW_client_fnc_propertyRequestRespond", _unit];
    [LOG_WARNING, format ["%1:%2 ATTEMPTED TO PURCHASE PROPERTY OWNED BY %1", name _unit, getPlayerUID _unit, _queryCurrentProperties select 0], _fnc_scriptName] call GW_server_fnc_log;
};

private _propertyType = switch _propertyTypeName do {
    case "house": {0};
    case "garage": {1};
    case "safehouse": {2}
};

// Change owner of property depending what kind it is
private _ownerOfProperty = if (_propertyTypeName in ["house", "garage"]) then {
    _unitUID
} else {
    group _unit getVariable ["organizationName", ""]
};

// Insert property into database
private _containerCount = getNumber (_propertyConfig >> "containers");
private _containerInventory = [];
for "_i" from 1 to _containerCount do {
    _containerInventory pushback []
};
private _propertyID = [10] call GW_server_fnc_randomCharacterGenerator;
["PROPERTIES_INSERT", 1, [_propertyType, _ownerOfProperty, _propertyPosition, _containerCount, _containerInventory, [], _propertyClassName, _propertyPrice, _propertyID, worldName]] call GW_db_fnc_queryDB;

// Setup property on server
[_propertyType, _ownerOfProperty, _propertyPosition, _containerCount, [], [], _propertyPrice, _propertyID] call GW_server_fnc_propertySetup;

// Setup property on client
[true, _propertyType, _ownerOfProperty, _propertyPosition] remoteExecCall ["GW_client_fnc_propertySetupClient", _unit];

[LOG_INFO, format ["%1:%2 BOUGHT A PROPERTY (%3) for %4", name _unit, _unitUID, _propertyTypeName, _propertyPrice], _fnc_scriptName] call GW_server_fnc_log;

// Notify player
[
    "PROPERTYPURCHASED",
    [
        format [
            "<t font='PuristaLight' size='0.8'>You successfully bought a</t> <t font='PuristaMedium' size='0.8'>%1</t> for <t font='PuristaMedium' color='#007c10' size='0.8'>£%2</t>. You can unlock your property by pressing U.",
            _propertyTypeName,
            _propertyPrice toFixed 0
        ]
    ]
] remoteExecCall ["GW_client_fnc_propertyRequestRespond", _unit]
