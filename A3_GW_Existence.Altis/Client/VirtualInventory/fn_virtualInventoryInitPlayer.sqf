#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_virtualInventoryInitPlayer.sqf
 *
 * Description:
 *     Sets up the virtual inventory system locally for a player
 */
scriptName "GW_client_fnc_virtualInventoryInitPlayer: main";
scopeName "main";

// Add publicvariable eventhandler which will handle opening of the
// inventory of a vehicle or container. This will be triggered from
// server and should not be triggered from anywhere else.
"GW_VIRTUALINVENTORY_OPEN" addPublicVariableEventHandler {
    if (isServer) exitWith {
        ["Eventhandler was called on server (this should only happen if testing locally)", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
    };

    params [["_variableName", "", [""]], ["_container", objNull, [objNull]]];

    // If the container is not null, it means that it is OK
    if (!isNull _container) then {
        // Create dialog and store the vehicle to access
        GW_displayVehicleInventory_vehicle = _container;
        createDialog "GW_displayVehicleInventory";

        // Log this action
        [LOG_INFO, format [
            "Opened virtual inventory of %1",
            typeOf _container
        ], _fnc_scriptName] call GW_server_fnc_log

    // Container is null, which means that it is already in use
    } else {
        [HINT_AMBER, "Inventory in use", "The inventory you are trying to access is already in use."] call GW_client_fnc_notificationsAdd
    };
};