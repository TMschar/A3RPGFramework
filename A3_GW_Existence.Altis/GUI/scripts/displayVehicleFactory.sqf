#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayVehicleFactory.sqf
*
*    Parameter(s):
*        0: STRING - Event to execute
*        1: ARRAY  - Array with display parameters
*
*    Returns:
*        NOTHING
*
*    Description:
*        Master UI Handler for Vehicle Factory Display
*/
scriptName "GW_displayVehicleFactory_script: main";
scopeName "main";

#define SELF GW_displayVehicleFactory_script

#define CONFIG_FACTORY_VEHICLES (missionConfigFile >> "CfgFactories" >> "Vehicles")
#define CONFIG_CLASSES_VEHICLES ("true" configClasses CONFIG_FACTORY_VEHICLES)

#define EVENT_TOOLBOXSELCHANGED "ToolBoxSelChanged"
#define EVENT_LBSELCHANGED_MYVEHICLEFACTORY "myVehicleFactoryLBSelChanged"
#define EVENT_LBSELCHANGED_VEHICLES "vehiclesLBSelChanged"
#define EVENT_ONBUTTONCLICK_BUTTONSTART "buttonClickButtonStart"

#define LOAD_MYMANUFACTORY "loadMyManufactory"
#define LOAD_VEHICLES "loadVehicles"

#define STR_DISPLAY "GW_displayVehicleFactory"

if !params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
] exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

switch _event do {
    case "onLoad": {
        /**
        * Parameter(s):
        *     0: DISPLAY - display which this handler is for
        */
        _args params [["_display", displayNull, [displayNull]]];

        // Define variables
        private _ctrlTabs = _display displayCtrl IDC_DISPLAYVEHICLEFACTORY_TABS;
        private _ctrlCtrlsGroupVehicles = _display displayCtrl IDC_DISPLAYVEHICLEFACTORY_MANUFACTRE;
        private _ctrlCtrlsGroupFooter = _display displayCtrl IDC_DISPLAYVEHICLEFACTORY_FOOTER;
        private _ctrlCtrlsGroupMyManufactory = _display displayCtrl IDC_DISPLAYVEHICLEFACTORY_MYMANUFACTORY;

        private _ctrlListNBoxFilter = _ctrlCtrlsGroupVehicles controlsGroupCtrl 21;
        private _ctrlListNBoxList = _ctrlCtrlsGroupVehicles controlsGroupCtrl 22;

        private _ctrlButtonStart = _ctrlCtrlsGroupFooter controlsGroupCtrl 1;
        private _ctrlButtonCancel = _ctrlCtrlsGroupFooter controlsGroupCtrl 2;
        private _ctrlButtonSpawn = _ctrlCtrlsGroupFooter controlsGroupCtrl 3;

        private _ctrlListNBoxFilterManufactory = _ctrlCtrlsGroupMyManufactory controlsGroupCtrl 21;
        private _ctrlListNBoxListManufactory = _ctrlCtrlsGroupMyManufactory controlsGroupCtrl 22;

        // Add Eventhandlers
        _ctrlButtonStart ctrlAddEventHandler ["ButtonClick", {[EVENT_ONBUTTONCLICK_BUTTONSTART, _this] call SELF}];
        _ctrlListNBoxListManufactory ctrlAddEventHandler ["LBSelChanged", {[EVENT_LBSELCHANGED_MYVEHICLEFACTORY, _this] call VARSCRIPT}];
        _ctrlListNBoxList ctrlAddEventHandler ["LBSelChanged", {[EVENT_LBSELCHANGED_VEHICLES, _this] call SELF}];
        _ctrlTabs ctrlAddEventHandler [EVENT_TOOLBOXSELCHANGED, {[EVENT_TOOLBOXSELCHANGED, _this] call SELF}];
        VAR_EACHFRAME_HANDLE = addMissionEventHandler ["EachFrame", {["onEachFrame", []] call SELF}];

        // Do not show my manufactory to start with
        _ctrlCtrlsGroupMyManufactory ctrlShow false;

        // Initially disable buttons
        _ctrlButtonStart ctrlEnable false;
        _ctrlButtonCancel ctrlEnable false;
        _ctrlButtonSpawn ctrlEnable false;

        // Initialize ListNBox sorting
        [_ctrlListNBoxFilter, _ctrlListNBoxList] call BIS_fnc_initListNBoxSorting;
        [_ctrlListNBoxFilterManufactory, _ctrlListNBoxListManufactory] call BIS_fnc_initListNBoxSorting;

        // Load vehicles and "my factory"
        [LOAD_VEHICLES, [_display, _ctrlListNBoxList]] call SELF;
        [LOAD_MYMANUFACTORY, [_display, _ctrlListNBoxListManufactory]] call SELF
    };
    case "onEachFrame": {
        private _display = STR_DISPLAY call GW_client_fnc_getDisplay;
        private _ctrlCtrlsGroupMyManufactory = _display displayCtrl IDC_DISPLAYVEHICLEFACTORY_MYMANUFACTORY;
        private _ctrlTextCurrentBuilds = _ctrlCtrlsGroupMyManufactory controlsGroupCtrl 2;
        private _ctrlTextLastSync = _ctrlCtrlsGroupMyManufactory controlsGroupCtrl 3;

        // Update texts
        _ctrlTextCurrentBuilds ctrlSetText format ["%1 vehicle(s) currently being manufactured", count GW_vehicleFactory_currentBuilds],
        _ctrlTextLastSync ctrlSetText format ["Synced %1 minutes ago", 3];
    };
    case EVENT_ONBUTTONCLICK_BUTTONSTART: {
        /**
        * Parameter(s):
        *     0: CONTROL - Button Control
        */
        _args params [["_ctrl", controlNull, [controlNull]]];

        private _display = ctrlParent _ctrl;
        private _ctrlCtrlsGroupVehicles = _display displayCtrl IDC_DISPLAYVEHICLEFACTORY_MANUFACTRE;
        private _ctrlListNBoxList = _ctrlCtrlsGroupVehicles controlsGroupCtrl 22;
        private _vehicleClassname = _ctrlListNBoxList lnbData [lnbCurSelRow _ctrlListNBoxList, 0];

        // Start build
        _vehicleClassname call GW_client_fnc_vehicleFactoryStartBuild
    };
    case EVENT_LBSELCHANGED_MYVEHICLEFACTORY: {

    };
    case EVENT_LBSELCHANGED_VEHICLES: {
        /**
        * Parameter(s):
        *     0: CONTROL - ListNBox Control
        *	  1: NUMBER  - Index of row selected
        */
        _args params [
            ["_ctrl", controlNull, [controlNull]],
            ["_index", 0, [0]]
        ];

        private _display = ctrlParent _ctrl;
        private _ctrlCtrlsGroupFooter = _display displayCtrl IDC_DISPLAYVEHICLEFACTORY_FOOTER;
        private _ctrlButtonStart = _ctrlCtrlsGroupFooter controlsGroupCtrl 1;
        private _vehicleClassname = _ctrl lnbData [_index, 0];

        // Enable disable start button
        _ctrlButtonStart ctrlEnable (
            !(isNil "_vehicleClassname")
            && {!(_vehicleClassname isEqualTo "")}
            && {_vehicleClassname call GW_client_fnc_vehicleFactoryVehicleCanBuild}
        )
    };
    case LOAD_VEHICLES: {
        /**
        * Parameter(s):
        *     0: DISPLAY - display which this handler is for
        *     1: CONTROL - List N Box control for vehicles
        */
        _args params [
            ["_display", displayNull, [displayNull]],
            ["_ctrlList", controlNull, [controlNull]]
        ];

        // Add all vehicles
        {
            // Get legality
            private _illegal = getNumber (_x >> "illegal");
            private _legality = ["Legal", "Illegal"] select _illegal;

            // Retrieve other info
            private _price = getNumber (_x >> "price");
            private _duration = getNumber (_x >> "duration");
            private _sellPrice = getNumber (_x >> "sellprice");

            // Get level required
            private _levelClass = "true" configClasses (_x >> "Level");
            private "_category";
            private "_level";
            {
                _category = getNumber (_x >> "category");
                _level = getNumber (_x >> "level");
                true
            } count _levelClass;

            // Get vehicles properties
            private _vehicleClassname = configName _x;
            private _vehicleName = _vehicleClassname call GW_client_fnc_vehicleGetDisplayName;
            private _vehicleIcon = _vehicleClassname call GW_client_fnc_vehicleGetIcon;
            private _vehicleType = _vehicleClassname call GW_client_fnc_vehicleGetCategory;

            // Add to list
            private _durationMinutes = (_duration / 60) toFixed 1;
            private _index = _ctrlList lnbAddRow [
                "",
                _vehicleName,
                _vehicleType,
                _legality,
                format ["£%1", _price],
                format ["%1 min(s)", _durationMinutes],
                "N/A",
                format ["£%1", _sellPrice]
            ];

            // Set vehicle picture on row
            _ctrlList lnbSetPicture [[_index, 0], _vehicleIcon];

            // Set data for row so we can retrieve it later
            _ctrlList lnbSetData [[_index, 0], _vehicleClassname];

            // Count element
            true
        } count CONFIG_CLASSES_VEHICLES;
    };
    case LOAD_MYMANUFACTORY: {
        /**
        * Parameter(s):
        *     0: DISPLAY - display which this handler is for
        *     1: CONTROL - List N Box control for vehicles
        */
        _args params [
            ["_display", displayNull, [displayNull]],
            ["_ctrlList", controlNull, [controlNull]]
        ];

        // Add all ongoing builds
        {
            _x params [
                ["_vehicleClassname", "", [""]],
                ["_illegal", true, [false]],
                ["_timeleft", 0, [0]],
                ["_sellprice", 0, [0]]
            ];

            // Get vehicles properties
            private _vehicleName = _vehicleClassname call GW_client_fnc_vehicleGetDisplayName;
            private _vehicleIcon = _vehicleClassname call GW_client_fnc_vehicleGetIcon;
            private _vehicleType = _vehicleClassname call GW_client_fnc_vehicleGetCategory;
            private _legality = ["Legal", "Illegal"] select _illegal;

            // Add to list
            private _durationMinutes = (_timeleft / 60) toFixed 1;
            private _index = _ctrlList lnbAddRow [
                "",
                _vehicleName,
                _vehicleType,
                _legality,
                format ["%1 min(s)", _durationMinutes],
                format ["£%1", _sellPrice]
            ];

            // Set vehicle picture on row
            _ctrlList lnbSetPicture [[_index, 0], _vehicleIcon];

            // Count element
            true
        } count GW_vehicleFactory_currentBuilds
    };
    case EVENT_TOOLBOXSELCHANGED: {
            /**
            * Parameter(s):
            *     0: CONTROL - Toolbox Control
            *     1: NUMBER  - Index of selection (0 - button 1, 1 - button 2 etc)
            */
            _args params [
                ["_ctrlToolbox", controlNull, [controlNull]],
                ["_index", 0, [0]]
            ];

            // Store controls and displays in variables
            private _display = ctrlParent _ctrlToolbox;
            private _ctrlCtrlsGroupVehicles = _display displayCtrl IDC_DISPLAYVEHICLEFACTORY_MANUFACTRE;
            private _ctrlGroupMyManufactory = _display displayCtrl IDC_DISPLAYVEHICLEFACTORY_MYMANUFACTORY;
            private _controls = [_ctrlCtrlsGroupVehicles, _ctrlGroupMyManufactory];

            // Reverse array depending on what box is checked, so we can use this in next step
            if (_index isEqualTo 1) then {
                reverse _controls
            };

            /**
            *    Show and hide.
            *    Always hide element 0 first since that is already opened (by default)
            *    when display opens.
            */
            _controls param [0, controlNull, [controlNull]] ctrlShow true;
            _controls param [1, controlNull, [controlNull]] ctrlShow false
    };
    case "onUnload": {

    }
}