#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: displayGarage.sqf
*
* Parameter(s):
*    0: STRING - Event
*    1: ARRAY - Arguments
*
* Description:
*     Master UI handler for garage display
*/
#define SELF GW_displayGarage_script
#define THREAD_LOADVEHICLES GW_displayGarage_loadVehiclesThread
#define BUTTON_SUMMON 1
#define BUTTON_CRUSH 2
#define VAR_GARAGETYPE GW_displayGarage_garageType
#define VAR_SPAWNMARKERS GW_displayGarage_spawnMarkers

scriptName "GW_displayGarage_script: main";
scopeName "main";

disableSerialization;
if !params [["_event", "", [""]], ["_args", [], [[]]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlEditSearch = _display displayCtrl IDC_DISPLAYGARAGE_SEARCH;
        private _ctrlButtonSearch = _display displayCtrl IDC_DISPLAYGARAGE_BUTTONSEARCH;
        private _ctrlFilter = _display displayCtrl IDC_DISPLAYGARAGE_FILTER;
        private _ctrlList = _display displayCtrl IDC_DISPLAYGARAGE_LIST;
        private _ctrlGroupFooter = _display displayCtrl IDC_DISPLAYGARAGE_FOOTER;
        private _ctrlButtonRetrieve = _ctrlGroupFooter controlsGroupCtrl 1;
        private _ctrlButtonCrush = _ctrlGroupFooter controlsGroupCtrl 2;

        _ctrlButtonCrush ctrlShow false;
        _ctrlButtonRetrieve ctrlAddEventHandler ["ButtonClick", {["retrieveVehicle", [param [0, controlNull, [controlNull]]]] call SELF}];
        _ctrlButtonCrush ctrlAddEventHandler ["ButtonClick", {["crushVehicle", [param [0, controlNull, [controlNull]]]] call SELF}];

        // Init ListNBox Sorting
        [_ctrlFilter, _ctrlList] call BIS_fnc_initListNBoxSorting;

        // Load vehicles
        THREAD_LOADVEHICLES = ["loadVehicles", [_ctrlList]] spawn SELF
    };
    case "retrieveVehicle": {
        _args params [["_ctrlButton", controlNull, [controlNull]]];
        private _display = ctrlParent _ctrlButton;
        private _ctrlList = _display displayCtrl IDC_DISPLAYGARAGE_LIST;
        private _selRow = lnbCurSelRow _ctrlList;

        private _data = _ctrlList lnbData [_selRow, 0];
        private _dataArray = parseSimpleArray _data;
        _dataArray params [["_vehicleID", "", [""]], ["_classname", "", [""]], ["_textureID", "", [""]]];

        // Try getting a spawnpoint
        private _spawnPoint = [VAR_SPAWNMARKERS] call GW_client_fnc_vehicleSortVehicleSpawnPoint;
        if (_spawnPoint isEqualTo "") exitWith {
            [
                HINT_AMBER,
                "Retrieval currently not possible",
                "The vehicle retrieval points are currently occupied. Please wait until the vehicle on the spawn points has been moved."
            ] call GW_client_fnc_notificationsAdd
        };

        // Create vehicle and set correct direction
        private _vehicle = _classname createVehicle (getMarkerPos _spawnPoint);
        _vehicle setDir (markerDir _spawnPoint);

        // Setup vehicle (using garage version of setupVehicle function)
        [_vehicle, _textureID, _vehicleID] call GW_client_fnc_vehicleSetupVehicleGarage;

        // Show notification
        private _displayName = _classname call GW_client_fnc_vehicleGetDisplayName;
        private _iconPath = _classname call GW_client_fnc_vehicleGetIcon;
        [HINT_NORMAL, format [
            "Your %1 is ready",
            _displayName
        ], format [
            "Your %1 is ready and has been spawned. It is currently located %2 metres from your location.",
            _displayName,
            round (player distance _vehicle)
        ], _icon] call GW_client_fnc_notificationsAdd;

        // Close display
        _display closeDisplay 2
    };
    case "crushVehicle": {
        _args params [["_ctrlButton", controlNull, [controlNull]]];
        private _display = ctrlParent _ctrlButton;
    };
    case "loadVehicles": {
        if !canSuspend exitWith {};

        scriptName "GW_displayGarage_script: loadVehiclesThread";
        _args params [["_ctrlList", controlNull, [controlNull]]];

        // Send request and loop through all vehicles
        private _vehicles = [player, VAR_GARAGETYPE] call GW_client_fnc_vehicleGetInactiveVehicles;
        {
            _x params ["", ["_classname", "", [""]], ["_textureID", "", [""]]];

            private _displayName = _classname call GW_client_fnc_vehicleGetDisplayName;
            private _picturePath = _classname call GW_client_fnc_vehicleGetIcon;
            private _vehicleCategory = _classname call GW_client_fnc_vehicleGetCategory;
            private _colour = [_classname, _textureID] call GW_client_fnc_vehicleTextureGetDisplayName;

            private _index = _ctrlList lnbAddRow ["", _displayName, _vehicleCategory, _colour, "N/A"];
            _ctrlList lnbSetPicture [[_index, 0], _picturePath];
            _ctrlList lnbSetData [[_index, 0], str _x];
            true
        } count _vehicles;

        // Set default selection
        _ctrlList lnbSetCurSelRow 0
    };
    case "onUnload": {terminate THREAD_LOADVEHICLES}
}
