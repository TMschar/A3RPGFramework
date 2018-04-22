#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayVehicleRegistration.sqf
*
*    Parameter(s):
*        0: STRING - Event to execute
*        1: ARRAY - Array with arguments from UI control/display
*/
#define VAR_VEHICLE GW_displayVehicleRegistration_Vehicle
#define SELF GW_displayVehicleRegistration_Script

scriptName "GW_client_fnc_displayVehicleRegistration: main";
scopeName "main";

if !params [["_event", "", [""]], ["_args", [], [[]]]] exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displaynull]]];

        // Controls
        private _ctrlButtonCancel = _display displayCtrl IDC_DISPLAYVEHICLEREGISTRATION_BUTTONCLOSE;
        private _ctrlButtonContact = _display displayCtrl IDC_DISPLAYVEHICLEREGISTRATION_BUTTONCONTACT;
        private _ctrlButtonWarrant = _display displayCtrl IDC_DISPLAYVEHICLEREGISTRATION_BUTTONWARRANT;
        private _ctrlListNBox = _display displayCtrl IDC_DISPLAYVEHICLEREGISTRATION_PLAYERSWITHACCESS;
        private _ctrlListNBoxFilter = _display displayCtrl IDC_DISPLAYVEHICLEREGISTRATION_LISTFILTER;
        private _ctrlTextVehicleName = _display displayCtrl IDC_DISPLAYVEHICLEREGISTRATION_VEHICLEINFO;
        private _ctrlPictureVehicle = _display displayCtrl IDC_DISPLAYVEHICLEREGISTRATION_VEHICLEPICTURE;

        // Vehicle information
        private _vehicleClassname = typeOf VAR_VEHICLE;
        private _vehicleTexture = VAR_VEHICLE getVariable ["texture", ""];
        private _vehicleDisplayname = _vehicleClassname call GW_client_fnc_vehicleGetDisplayName;
        private _vehicleIcon = _vehicleClassname call GW_client_fnc_vehicleGetIcon;

        // Disable buttons by default
        _ctrlButtonContact ctrlEnable false;
        _ctrlButtonWarrant ctrlEnable false;

        _ctrlTextVehicleName ctrlSetText format ["Vehicle Registration for a %1 %2", _vehicleTexture, _vehicleDisplayName];
        _ctrlPictureVehicle ctrlSetText _vehicleIcon;
        _ctrlButtonCancel ctrlSetEventHandler ["ButtonClick", "(ctrlParent (_this select 0)) closeDisplay 2"];

        // Init listbox and filters
        ["reloadVehicleRegistration", [_ctrlListNBox]] call SELF;
        [_ctrlListNBoxFilter, _ctrlListNBox] call BIS_fnc_initListNBoxSorting;

        _ctrlButtonContact ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _display = ctrlParent _ctrl;
            private _ctrlListNBox = _display displayCtrl IDC_DISPLAYKEYS_LISTBOXVEHICLES;
            private _selIndex = lnbCurSelRow _ctrlListNBox;
            private _vehicleIndex = _ctrlListNBox lnbValue [_selIndex, 0];
            private _vehicles = VAR_UNIT call GW_client_fnc_vehicleGetUnitVehicles;
            private _vehicle = _vehicles param [_vehicleIndex, objNull, [objNull]];

            if (isNull _vehicle) exitWith {};

            // Revoke keys
            [VAR_UNIT, _vehicle] call GW_client_fnc_vehicleRevokeKeys;

            // Update Keys
            ["reloadVehicles", [_ctrlListNBox, _vehicles]] call SELF
        }];

        _ctrlButtonWarrant ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _display = ctrlParent _ctrl;
            private _ctrlListNBox = _display displayCtrl IDC_DISPLAYKEYS_LISTBOXVEHICLES;
            private _selIndex = lnbCurSelRow _ctrlListNBox;
            private _vehicleIndex = _ctrlListNBox lnbValue [_selIndex, 0];
            private _vehicles = VAR_UNIT call GW_client_fnc_vehicleGetUnitVehicles;
            private _vehicle = _vehicles param [_vehicleIndex, objNull, [objNull]];

            if (isNull _vehicle) exitWith {};

            // Give keys to self
            [player, _vehicle] call GW_client_fnc_vehicleGiveKeys;

            // Update Keys
            ["reloadVehicles", [_ctrlListNBox, _vehicles]] call SELF
        }]
    };
    case "reloadVehicleRegistration": {
        _args params [["_ctrlListNBox", controlNull, [controlNull]]];

        private _players = VAR_VEHICLE getVariable ["vehicle_registration", []];
        lnbClear _ctrlListNBox;

        // Loop through players
        {
            _x params [["_unit", objNull, [objNull]], ["_role", 0, [0]]];

            private _roleName = ["Vehicle Owner", "Co-Driver"] select _role;
            private _name = _x call GW_client_fnc_playersGetName;
            private _index = _ctrlListNBox lnbAddRow [_name, _roleName];

            _ctrlListNBox lnbSetValue [[_index, 0], _index];
            true
        } count _players;

        // Start at row 0
        _ctrlListNBox lnbSetCurSelRow 0
    };
    case "onUnload": {}
}
