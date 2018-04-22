#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayKeys.sqf
*
*    Parameter(s):
*        0: STRING - Event to execute
*        1: ARRAY - Array with arguments from UI control/display
*
*    Description:
*        Master UI script for keys display
*/
#define VAR_UNIT GW_displayKeys_Unit
#define SELF GW_displayKeys_Script

scriptName "GW_client_fnc_displayKeys: main";
scopeName "main";

if !params [["_event", "", [""]], ["_args", [], [[]]]] exitWith {};

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displaynull]]];

        private _ctrlButtonCancel = _display displayCtrl IDC_DISPLAYKEYS_BUTTONCLOSE;
        private _ctrlTextHeader = _display displayCtrl IDC_DISPLAYKEYS_HEADER;
        private _ctrlButtonCopy = _display displayCtrl IDC_DISPLAYKEYS_BUTTONCOPY;
        private _ctrlButtonRevoke = _display displayCtrl IDC_DISPLAYKEYS_BUTTONREVOKE;
        private _ctrlButtonMarkMap = _display displayCtrl IDC_DISPLAYKEYS_BUTTONMARKMAP;
        private _ctrlListNBox = _display displayCtrl IDC_DISPLAYKEYS_LISTBOXVEHICLES;
        private _ctrlListNBoxFilter = _display displayCtrl IDC_DISPLAYKEYS_LISTBOXFILTER;
        private _vehicles = VAR_UNIT call GW_client_fnc_vehicleGetUnitVehicles;

        _ctrlButtonCancel ctrlSetEventHandler ["ButtonClick", "(ctrlParent (_this select 0)) closeDisplay 2"];
        _ctrlTextHeader ctrlSetText (["My Vehicles", format ["%1's Vehicles", VAR_UNIT call GW_client_fnc_playersGetName]] select !(VAR_UNIT isEqualTo player));

        {
            _x ctrlEnable (!(VAR_UNIT isEqualTo player) && {!(_vehicles isEqualTo [])})
        } count [_ctrlButtonCopy, _ctrlButtonRevoke];

        // Init listbox and filters
        [_ctrlListNBoxFilter, _ctrlListNBox] call BIS_fnc_initListNBoxSorting;
        ["reloadVehicles", [_ctrlListNBox, _vehicles]] call SELF;

        _ctrlButtonMarkMap ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _display = ctrlParent _ctrl;
            private _ctrlListNBox = _display displayCtrl IDC_DISPLAYKEYS_LISTBOXVEHICLES;

            private _selIndex = lnbCurSelRow _ctrlListNBox;
            private _vehicleIndex = _ctrlListNBox lnbValue [_selIndex, 0];

            private _vehicles = VAR_UNIT call GW_client_fnc_vehicleGetUnitVehicles;
            private _vehicle = _vehicles param [_vehicleIndex, objNull, [objNull]];

            private _vehicleClassname = typeOf _vehicle;
            private _colour = [side group VAR_UNIT] call BIS_fnc_sideColor;
            private _vehicleIcon = _vehicleClassname call GW_client_fnc_vehicleGetIcon;
            private _vehicleDisplayName = _vehicleClassname call GW_client_fnc_vehicleGetDisplayName;

            call GW_client_fnc_guiCloseAllDisplays;
            [_vehicleIcon, _colour, getPos _vehicle, _vehicleDisplayName] call GW_client_fnc_guiDrawMapIcon
        }];

        _ctrlButtonRevoke ctrlAddEventHandler ["ButtonClick", {
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

        _ctrlButtonCopy ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _display = ctrlParent _ctrl;
            private _ctrlListNBox = _display displayCtrl IDC_DISPLAYKEYS_LISTBOXVEHICLES;

            private _selIndex = lnbCurSelRow _ctrlListNBox;
            private _vehicleIndex = _ctrlListNBox lnbValue [_selIndex, 0];

            private _vehicles = VAR_UNIT call GW_client_fnc_vehicleGetUnitVehicles;
            private _vehicle = _vehicles param [_vehicleIndex, objNull, [objNull]];

            if (isNull _vehicle) exitWith {};

            [player, _vehicle] call GW_client_fnc_vehicleGiveKeys;

            // Update Keys
            ["reloadVehicles", [_ctrlListNBox, _vehicles]] call SELF
        }]
    };
    case "reloadVehicles": {
        _args params [["_ctrlListNBox", controlNull, [controlNull]], ["_vehicles", [], [[]]]];

        lnbClear _ctrlListNBox;
        {
            private _vehicleClassname = typeOf _x;
            private _vehicleName = _vehicleClassname call GW_client_fnc_vehicleGetDisplayName;
            private _vehicleDistance = (((player distance _x) / 1000) toFixed 1) + "km";
            private _vehicleIcon = _vehicleClassname call GW_client_fnc_vehicleGetIcon;
            private _vehicleColour = _x getVariable ["texture", ""];

            if isNull _x then {
                _vehicleName = "Access Revoked";
                _vehicleDistance = "";
                _vehicleIcon = "";
                _vehicleColour = "Unknown";
            };

            private _index = _ctrlListNBox lnbAddRow ["", _vehicleName, _vehicleColour, _vehicleDistance];
            _ctrlListNBox lnbSetPicture [[_index, 0], _vehicleIcon];
            _ctrlListNBox lnbSetValue [[_index, 0], _index];
            _ctrlListNBox lnbSetData [[_index, 0], ""];

            true
        } count _vehicles;
        _ctrlListNBox lnbSetCurSelRow 0
    };
    case "onUnload": {}
}
