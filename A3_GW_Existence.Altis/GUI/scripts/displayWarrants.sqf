#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displayWarrants.sqf
 *
 * Parameter(s):
 *     0: STRING - Event to execute
 *     1: ARRAY  - Array with arguments
 *
 * Description:
 *     Mater handler for warrants display
 */
#define SELF GW_displayWarrants_script
#define CONFIG_CRIMES (missionConfigFile >> "CfgWarrants" >> "Crimes")
#define ARRAY_CRIMES ("true" configClasses CONFIG_CRIMES)
#define ICONPATH_MAN "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa"
#define ARRAY_WARRANTS GW_arrestWarrants_warrants

scriptName "GW_client_fnc_displayWarrants: main";
scopeName "main";

// Make sure warrants are loaded from server
if (isNil "GW_arrestWarrants_warrants") exitWith {((_this select 1) select 0) closeDisplay 2};

disableSerialization;
if !params [["_event", "", [""]], ["_args", [], [[]]]] exitWith {["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};
switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlSearch = _display displayCtrl IDC_DISPLAYWARRANTS_SEARCH;
        private _ctrlSearchButton = _display displayCtrl IDC_DISPLAYWARRANTS_BUTTONSEARCH;

        private _ctrlGroupAddWarrantBackground = _display displayCtrl IDC_DISPLAYWARRANTS_GROUPNEWWARRANTBACKGROUND;
        private _ctrlGroupAddWarrant = _display displayCtrl IDC_DISPLAYWARRANTS_GROUPNEWWARRANT;

        private _ctrlGroupFooter = _display displayCtrl IDC_DISPLAYWARRANTS_GROUPFOOTER;
        private _ctrlButtonIssueWarrant = _ctrlGroupFooter controlsGroupCtrl 25;
        private _ctrlButtonDestroyWarrant = _ctrlGroupFooter controlsGroupCtrl 26;

        _ctrlButtonDestroyWarrant ctrlRemoveAllEventHandlers "ButtonClick";
        _ctrlButtonDestroyWarrant ctrlAddEventHandler ["ButtonClick", {["onDestroyWarrant", [ctrlParent (param [0, controlNull, [controlNull]])]] call SELF}];

        // Only allow issuing and destroy warrants for
        // Police officers
        _ctrlButtonIssueWarrant ctrlEnable (playerSide isEqualTo west);
        _ctrlButtonDestroyWarrant ctrlEnable (playerSide isEqualTo west);

        private _ctrlList = _display displayCtrl IDC_DISPLAYWARRANTS_LIST;
        private _ctrlFilter = _display displayCtrl IDC_DISPLAYWARRANTS_FILTER;
        [_ctrlFilter, _ctrlList] call BIS_fnc_initListNBoxSorting;

        // Load warrants
        ["onLoadWarrants", [_display]] call SELF;

        // Hide new warrant group by default
        _ctrlGroupAddWarrantBackground ctrlShow false;
        _ctrlGroupAddWarrant ctrlShow false;

        // Handle searching
        _ctrlSearch ctrlRemoveAllEventHandlers "KeyUp";
        _ctrlSearch ctrlAddEventHandler ["KeyUp", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _display = ctrlParent _ctrl;
            private _ctrlButtonSearch = _display displayCtrl IDC_DISPLAYWARRANTS_BUTTONSEARCH;
            private _iconPath = [
                "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa",
                "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa"
            ] select !(ctrlText _ctrl isEqualTo "");

            _ctrlButtonSearch ctrlSetText _iconPath;
        }];

        // Handle search button
        _ctrlButtonSearch ctrlRemoveAllEventHandlers "ButtonClick";
        _ctrlButtonSearch ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _display = ctrlParent _ctrl;
            private _ctrlSearch = _display displayCtrl IDC_DISPLAYWARRANTS_SEARCH;

            if !(ctrlText _ctrlSearch isEqualTo "") then {
                _ctrl ctrlSetText "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
                _ctrlSearch ctrlSetText ""
            }
        }];

        // Handle add warrant button
        _ctrlButtonIssueWarrant ctrlRemoveAllEventHandlers "ButtonClick";
        _ctrlButtonIssueWarrant ctrlAddEventHandler ["ButtonClick", {["onIssueWarrant", [ctrlParent (param [0, [0]])]] call SELF}];
    };
    case "onDestroyWarrant": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlList = _display displayCtrl IDC_DISPLAYWARRANTS_LIST;
        private _lnbData = _ctrlList lnbData [lnbCurSelRow _ctrlList, 0];
        private _warrantsID = parseNumber _lnbData;

        // Delete in database and notify player
        [[_warrantsID], "GW_server_fnc_warrantsDeleteWarrant"] call GW_ext_fnc_networkCallServer;
        [HINT_AMBER, "Remove Warrant", "The warrant you selected to be destroyed has now been deleted."] call GW_client_fnc_notificationsAdd;

        // Update warrants
        //["onLoadWarrants", [_display]] call SELF;
        _display closeDisplay 2;
    };
    case "onLoadWarrants": {
        _args params [["_display", displayNull, [displayNull]]];
        private _ctrlList = _display displayCtrl IDC_DISPLAYWARRANTS_LIST;

        lbClear _ctrlList;
        {
            _x params ["_id", "_playerUID", "_crimeID", "_warrantIssueDate"];

            private _unit = [_playerUID] call GW_client_fnc_getUnitByUID;
            private _class = ARRAY_CRIMES select {getNumber (_x >> "crimeID") isEqualTo _crimeID};
            _class = _class param [0, configNull, [configNull]];

            // Add as long as player is present
            if (!isNull _unit) then {
                private _unitName = [_unit] call GW_client_fnc_playersGetName;
                private _dateTime = [_warrantIssueDate] call GW_client_fnc_numbersSortDate;
                private _crimeTitle = getText (_class >> "title");
                private _warrantsID = str _id;
                private _index = _ctrlList lnbAddRow [_warrantsID, _unitName, _crimeTitle, _dateTime];

                // Set data so we can use this entry to manipulate warrants
                // at a later time within the system.
                _ctrlList lnbSetData [[_index, 0], _warrantsID];
            };
        } forEach ARRAY_WARRANTS;
    };
    case "onIssueWarrant": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlGroupAddWarrantBackground = _display displayCtrl IDC_DISPLAYWARRANTS_GROUPNEWWARRANTBACKGROUND;
        private _ctrlGroupAddWarrant = _display displayCtrl IDC_DISPLAYWARRANTS_GROUPNEWWARRANT;
        private _ctrlButtonCancel = _ctrlGroupAddWarrant controlsGroupCtrl 20;
        private _ctrlButtonAddWarrant = _ctrlGroupAddWarrant controlsGroupCtrl 21;
        private _ctrlListCrimes = _ctrlGroupAddWarrant controlsGroupCtrl 1004;
        private _ctrlListPlayers = _ctrlGroupAddWarrant controlsGroupCtrl 1005;
        private _civilians = ALLPLAYERSNOHC select {(side group _x) isEqualTo civilian};

        _ctrlButtonCancel ctrlRemoveAllEventHandlers "ButtonClick";
        _ctrlButtonCancel ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _ctrlsGroup = ctrlParentControlsGroup _ctrl;
            private _display = ctrlParent _ctrlsGroup;
            private _ctrlGroupAddWarrantBackground = _display displayCtrl IDC_DISPLAYWARRANTS_GROUPNEWWARRANTBACKGROUND;
            private _ctrlGroupAddWarrant = _display displayCtrl IDC_DISPLAYWARRANTS_GROUPNEWWARRANT;

            _ctrlGroupAddWarrantBackground ctrlShow false;
            _ctrlGroupAddWarrant ctrlShow false;
        }];

        _ctrlButtonAddWarrant ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _ctrlsGroup = ctrlParentControlsGroup _ctrl;
            private _display = ctrlParent _ctrlsGroup;
            private _ctrlGroupAddWarrantBackground = _display displayCtrl IDC_DISPLAYWARRANTS_GROUPNEWWARRANTBACKGROUND;
            private _ctrlGroupAddWarrant = _display displayCtrl IDC_DISPLAYWARRANTS_GROUPNEWWARRANT;

            private _ctrlListPlayers = _ctrlGroupAddWarrant controlsGroupCtrl 1005;
            private _ctrlListCrimes = _ctrlGroupAddWarrant controlsGroupCtrl 1004;

            private _ctrlSelPlayerUID = _ctrlListPlayers lbData (lbCurSel _ctrlListPlayers);
            private _ctrlSelCrimeID = _ctrlListCrimes lbData (lbCurSel _ctrlListCrimes);

            if (_ctrlSelPlayerUID isEqualTo "") exitWith {};
            if (_ctrlSelCrimeID isEqualTo "") exitWith {};

            // Get classname
            private _classname = "";
            ARRAY_CRIMES select {
                private _id = parseNumber _ctrlSelCrimeID;
                if (getNumber (_x >> "crimeID") isEqualTo _id) then {
                    _classname = configName _x
                };
            };

            private _unit = _ctrlSelPlayerUID call GW_client_fnc_getUnitByUID;
            if (isNull _unit) exitWith {};

            // Add warrant
            [_unit, _classname] call GW_client_fnc_arrestWarrantsAdd;

            // Hide add warrant box
            _ctrlGroupAddWarrantBackground ctrlShow false;
            _ctrlGroupAddWarrant ctrlShow false;

            // Update warrants
            //["onLoadWarrants", [_display]] call SELF;
            _display closeDisplay 2;
        }];

        // Show
        _ctrlGroupAddWarrantBackground ctrlShow true;
        _ctrlGroupAddWarrant ctrlShow true;

        // Set up players list with players that is on
        // side civilian. This is so Police cannot add themselves
        // or even independent players like IHAS.
        lbClear _ctrlListPlayers;
        {
            private _name = _x call GW_client_fnc_playersGetName;
            private _uid = getPlayerUID _x;

            _ctrlListPlayers lbAdd _name;
            _ctrlListPlayers lbSetData [_forEachIndex, _uid];
            _ctrlListPlayers lbSetPicture [_forEachIndex, ICONPATH_MAN];
        } forEach (_civilians - [player]);
        _ctrlListPlayers lbSetCurSel 0;

        // Add available crimes
        lbClear _ctrlListCrimes;
        {
            private _title = getText (_x >> "title");
            private _crimeID = getNumber (_x >> "crimeID");

            _ctrlListCrimes lbAdd _title;
            _ctrlListCrimes lbSetData [_forEachIndex, str _crimeID]
        } forEach ARRAY_CRIMES;

        _ctrlListCrimes ctrlRemoveAllEventHandlers "LBSelChanged";
        _ctrlListCrimes ctrlAddEventHandler ["LBSelChanged", {
            params [["_ctrl", controlNull, [controlNull]], ["_index", 0, [0]]];

            private _ctrlsGroup = ctrlParentControlsGroup _ctrl;
            private _ctrlTextTitle = _ctrlsGroup controlsGroupCtrl 67;
            private _ctrlTextPenalty = _ctrlsGroup controlsGroupCtrl 68;
            private _ctrlTextTicketValue = _ctrlsGroup controlsGroupCtrl 69;
            private _ctrlTextPrisonTime = _ctrlsGroup controlsGroupCtrl 70;

            private _crimeID = parseNumber (_ctrl lbData _index);
            private _class = ARRAY_CRIMES select {getNumber (_x >> "crimeID") isEqualTo _crimeID};
            _class = _class param [0, configNull, [configNull]];

            _ctrlTextTitle ctrlSetText getText (_class >> "title");
            _ctrlTextPenalty ctrlSetText getText (_class >> "penalty");
            _ctrlTextTicketValue ctrlSetText str (getNumber (_class >> "ticketValue"));
            _ctrlTextPrisonTime ctrlSetText str (getNumber (_class >> "prisonTime"));
        }];
        _ctrlListCrimes lbSetCurSel 0;
    };
    case "onUnload": {};
}
