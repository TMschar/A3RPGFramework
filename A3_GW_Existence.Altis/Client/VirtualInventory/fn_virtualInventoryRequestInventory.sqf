#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_virtualInventoryRequestInventory.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Container of which the inventory is attached to
 *
 * Description:
 *     Sends request to server to open a inventory
 */
scriptName "GW_client_fnc_virtualInventoryRequestInventory: main";
scopeName "main";

if (!params [["_container", objNull, [objNull]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

if (isNull _container) exitWith { ["Container is null", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (!alive _container) exitWith { ["Container is not alive", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Evaluate conditions depending on if it is a property or not
if (_container call GW_client_fnc_propertyIsContainer) then {
    if (_container getVariable ["parentProperty", objNull] call GW_client_fnc_propertyDoorsLocked) then {
        ["Parent property of container is locked", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
        breakOut "main"
    }
} else {
    if (!([player, _container] call GW_client_fnc_vehicleHasKeys) && {typeOf _container != "Box_T_East_Wps_F"}) then {
        ["Does not have keys to vehicle", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
        breakOut "main"
    };
    if (_container getVariable ["virtualinventory_space", 0] < 1) then {
        ["Vehicle does not have any inventory space", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
        breakOut "main"
    };
};

// Send request to server
[PVAR_SERVER_HC, "GW_VIRTUALINVENTORY_OPEN", [player, _container]] call GW_ext_fnc_networkPublicVariable