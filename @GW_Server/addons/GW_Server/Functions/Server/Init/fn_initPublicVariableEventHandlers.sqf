#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_initPublicVariableEventHandlers.sqf
 */
scriptName "GW_server_fnc_initPublicVariableEventHandlers: main";
scopeName "main";

"GW_Log" addPublicVariableEventHandler {_this call GW_server_fnc_newLogEntry};
"GW_DATABASE_SYNCPLAYERDATA" addPublicVariableEventHandler {_this call GW_server_fnc_syncPlayerData};
"GW_PROPERTIES_PURCHASEREQUEST" addPublicVariableEventHandler {_this call GW_server_fnc_propertyPurchaseRequest};
"GW_ORGANIZATIONS_CREATEREQUEST" addPublicVariableEventHandler {_this call GW_server_fnc_organizationsCreateRequest};
"GW_ORGANIZATIONS_INITPLAYERREQUEST" addPublicVariableEventHandler {_this call GW_server_fnc_organizationsInitPlayerRequest};
"GW_organizations_memberAddRequest" addPublicVariableEventHandler {_this call GW_server_fnc_organizationsMemberAddRequest};
"GW_ORGANIZATIONS_CHANGERANKREQUEST" addPublicVariableEventHandler {_this call GW_server_fnc_organizationsChangeRankRequest};
"GW_ORGANIZATIONS_DISBANDREQUEST" addPublicVariableEventHandler {_this call GW_server_fnc_organizationsDisbandRequest};

"GW_VIRTUALINVENTORY_OPEN" addPublicVariableEventHandler {
    _this params [["_variableName", "", [""]], ["_args", [], [[]]]];
    _args params [["_unit", objNull, [objNull]], ["_container", objNull, [objNull]]];

    // Debug
    [format [
        "Received request to open virtual inventory from %1 of %2", name _unit, typeOf _container
    ]] call GW_ext_fnc_loggingDebugLog;

    // Error checks
    if (isNull _unit) exitWith {["Unit is null"] call GW_ext_fnc_loggingDebugLog};
    if (isNull _container) exitWith {["Container is null"] call GW_ext_fnc_loggingDebugLog};

    // Security check to make sure that the inventory is not in use
    // already. This is to avoid any possible duping of items.
    if (_container getVariable ["inventoryInUse", false]) then {
        [format [
            "%1:%2 tried to open a inventory that is already in use (%1).",
            name _unit,
            getPlayerUID _unit,
            typeOf _container
        ], _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;

        // Turn this to null so function wont open inventory
        _container = objNull;
    } else {
        // Update the vehicle with in use to true,
        // so other won't be able to access the inventory
        // while its in use.
        _container setVariable ["inventoryInUse", true, true];
    };

    // Send back to client
    [PVAR_CLIENT, _variableName, _container, owner _unit] call GW_ext_fnc_networkPublicVariable;
};

"GW_money_pickupRequest" addPublicVariableEventHandler {
    params [["_variableName", "", [""]], ["_array", [], [[]]]];
    _array params [["_unit", objNull, [objNull]], ["_moneyStack", objNull, [objNull]]];

    // Log
    ["Received request for money pickup", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;

    // Error checks
    if (isNull _unit) exitWith {};
    if (isNull _moneyStack) exitWith {};

    // Get amount
    private _amount = _moneyStack getVariable ["value", -1];
    if (_amount isEqualTo -1) exitWith {};

    // Delete money from ground
    deleteVehicle _moneyStack;

    // Exec on client
    [_amount] remoteExecCall ["GW_client_fnc_moneyPickupResponse", _unit];
};