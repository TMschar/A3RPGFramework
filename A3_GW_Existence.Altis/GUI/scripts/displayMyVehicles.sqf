#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_displayMyVehicles.sqf
 *
 * Parameter(s):
 *     0: STRING - Event to execute
 *     1: ARRAY  - Array with arguments
 */
#define SELF GW_displayMyVehicles_script

scriptName "GW_displayMyVehicles_script: main";
scopeName "main";

disableSerialization;
params [["_event", "", [""]], ["_args", [], [[]]]];
switch (_event) do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlFilter = _display displayCtrl IDC_DISPLAYMYVEHICLES_FILTER;
        private _ctrlList = _display displayCtrl IDC_DISPLAYMYVEHICLES_LIST;
        private _ctrlListPlayers = _display displayCtrl IDC_DISPLAYMYVEHICLES_LISTPLAYERS;
        private _ctrlGroupFooter = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_FOOTER;
        private _ctrlButtonGive = _ctrlGroupFooter controlsGroupCtrl IDC_DISPLAYVEHICLEINVENTORY_FOOTER_BUTTONGIVE;
        private _ctrlButtonDrop = _ctrlGroupFooter controlsGroupCtrl IDC_DISPLAYVEHICLEINVENTORY_FOOTER_BUTTONDROP;

        _ctrlButtonDrop ctrlEnable false;

        _ctrlButtonGive ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _display = ctrlParent _ctrl;
            private _ctrlList = _display displayCtrl IDC_DISPLAYMYVEHICLES_LIST;
            private _ctrlListPlayers = _display displayCtrl IDC_DISPLAYMYVEHICLES_LISTPLAYERS;
            private _selPlayerUID = _ctrlListPlayers lbData (lbCurSel _ctrlListPlayers);
            private _vehicleIndex = _ctrlList lnbValue [lnbCurSelRow _ctrlList, 0];
            private _myKeys = player getVariable ["keys", []];

            if (_myKeys isEqualTo []) exitWith {};
            if (_selPlayerUID isEqualTo "") exitWith {};

            private _unit = [_selPlayerUID] call GW_client_fnc_getUnitByUID;
            private _vehicle = _myKeys param [_vehicleIndex, objNull, [objNull]];

            // Check if the unit already has keys to the vehicle
            if ([_unit, _vehicle] call GW_client_fnc_vehicleHasKeys) exitWith {
                [HINT_AMBER, "Key Transfer Failed", "The player already has keys to the vehicle"] call GW_client_fnc_notificationsAdd;
            };

            // Add keys to player
            if !([_unit, _vehicle] call GW_client_fnc_vehicleGiveKeys) exitWith {
                [HINT_WARNING, "Key Transfer Failed", "There was an error while giving the other player the keys"] call GW_client_fnc_notificationsAdd;
            };

            // Notify self
            [HINT_NORMAL, "Gave keys", "You successfully gave keys to another player"] call GW_client_fnc_notificationsAdd;

            // Notify receiver
            [HINT_NORMAL, "Keys Received", format [
                "You have received keys to a vehicle from %1",
                [player] call GW_client_fnc_playersGetName
            ]] remoteExecCall ["GW_client_fnc_notificationsAdd", _unit];
        }];

        // Init Listbox
        [_ctrlFilter, _ctrlList] call BIS_fnc_initListNBoxSorting;

        // Store an array of nearby players within 5 metres
        // and that is not in a vehicle in variable _nearbyPlayers.
        private _nearbyPlayers = ALLPLAYERSNOHC select {
            _x distance player < 5 && {vehicle _x isEqualTo _x}
        };

        // Loop through nearby players
        {
            // Make sure the unit is not protected
            if !([_x] call GW_client_fnc_unitIsProtected) then {
                private _name = [_x] call GW_client_fnc_playersGetName;
                private _index = _ctrlListPlayers lbAdd _name;
                _ctrlListPlayers lbSetData [_index, getPlayerUID _x];
            };
            true;
        } count (_nearbyPlayers - [player]);

        // Set default selection
        _ctrlListPlayers lbSetCurSel 0;

        // Reload vehicles
        ["reloadVehicles", [_display]] call SELF;
    };
    case "reloadVehicles": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlList = _display displayCtrl IDC_DISPLAYMYVEHICLES_LIST;
        private _myKeys = player getVariable ["keys", []];

        // Loop through player's keys
        {
            if (!isNull _x) then {
                private _vehicleClassname = typeOf _x;
                private _vehicleName = [_vehicleClassname] call GW_client_fnc_vehicleGetDisplayName;
                private _vehicleIcon = [_vehicleClassname] call GW_client_fnc_vehicleGetIcon;
                private _vehicleDistance = (((player distance _x) / 1000) toFixed 1) + "km";
                private _vehicleColour = _x getVariable ["texture", ""];

                private _index = _ctrlList lnbAddRow [_vehicleName, _vehicleColour, _vehicleDistance];
                _ctrlList lnbSetPicture [[_index, 0], _vehicleIcon];
                _ctrlList lnbSetValue [[_index, 0], _forEachIndex];
                _ctrlList lnbSetData [[_index, 0], ""];
            };
        } forEach _myKeys;

        // Set default selection
        _ctrlList lbSetCurSel 0;
    };
    case "onUnload": {};
};