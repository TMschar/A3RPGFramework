#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: displayJail.sqf
*
* Parameter(s):
*    0: STRING - Event
*    1: ARRAY  - Arguments
*
* Description:
*    Master UI handler for send to jail display
*/
#define SELF GW_displayJail_script
#define TARGET_UNIT GW_jailOpenDisplay_targetUnit
#define CONFIG_JAIL (missionConfigFile >> "CfgJail" >> "Centers" >> worldName)
#define CONFIG_CLASSES_JAIL ("true" configClasses CONFIG_JAIL)
#define CONFIG_CRIMES (missionConfigFile >> "CfgWarrants" >> "Crimes")
#define ARRAY_CRIMES ("true" configClasses CONFIG_CRIMES)
#define ARREST_REASON "Arrested by Royal Military Police"

scriptName "GW_displayJail_script: main";
scopeName "main";

disableSerialization;
if (!params [["_event", "", [""]], ["_args", [], [[]]]]) exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
};

switch (_event) do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        [_display] spawn {
            disableSerialization;
            params [["_display", displayNull, [displayNull]]];

            // Define and declare controls
            private _ctrlComboJailList = _display displayCtrl IDC_DISPLAYJAIL_SELECTION;
            private _ctrlControlsGroupFooter = _display displayCtrl IDC_DISPLAYJAIL_FOOTERGROUP;
            private _ctrlInputTime = _display displayCtrl IDC_DISPLAYJAIL_INPUTTIME;
            private _ctrlButtonSendToJail = _ctrlControlsGroupFooter controlsGroupCtrl IDC_DISPLAYJAIL_FOOTERGROUP_BUTTONSENDTOJAIL;

            // Loop through warrants
            private _sentenceTimes = [0];
            private _warrants = [displayNull, false] call GW_client_fnc_arrestWarrantsRequest;
            private _arrestedUID = getPlayerUID TARGET_UNIT;
            private _defaultSentenceTime = 0;
            {
                _x params ["_id", "_uid", "_crimeID"];

                if (_uid isEqualTo _arrestedUID) then {
                    private _classes = ARRAY_CRIMES select {getNumber (_x >> "crimeID") isEqualTo _crimeID};
                    private _crimeClass = _classes param [0, configNull, [configNull]];

                    // Set sentence time
                    private _sentenceTime = getNumber (_crimeClass >> "prisonTime");
                    _sentenceTimes pushback _sentenceTime;
                };
            } forEach _warrants;

            // Set default time for prisoner
            _defaultSentenceTime = selectMax _sentenceTimes;
            _ctrlInputTime ctrlSetText str _defaultSentenceTime;

            // Add eventhandler for the jail list. Important that this is added
            // before the list is populated so there is correct things happening.
            _ctrlComboJailList ctrlAddEventHandler ["LBSelChanged", {
                params [["_ctrlList", controlNull, [controlNull]], ["_selIndex", 0, [0]]];

                private _display = ctrlParent _ctrlList;
                private _ctrlTextInformation = _display displayCtrl IDC_DISPLAYJAIL_INFORMATION;
                private _jailClassname = _ctrlList lbData _selIndex;

                // Loop through jail config
                {
                    if (configName _x == _jailClassname) exitWith {
                        _ctrlTextInformation ctrlSetText getText (_x >> "description");
                    };
                } forEach CONFIG_CLASSES_JAIL;
            }];

            // Loop through jail config
            {
                private _name = getText (_x >> "name");
                private _description = getText (_x >> "description");
                private _iconPath = getText (_x >> "icon");

                // Add and set data
                _ctrlComboJailList lbAdd _name;
                _ctrlComboJailList lbSetData [_forEachIndex, configName _x];

                // Set icon
                if (_iconPath != "") then {
                    _ctrlComboJailList lbSetPicture [_forEachIndex, _iconPath];
                };
            } forEach CONFIG_CLASSES_JAIL;

            // Select first option
            _ctrlComboJailList lbSetCurSel 0;

            // Add eventhandler for button of sending to jail
            _ctrlButtonSendToJail ctrlAddEventHandler ["ButtonClick", {
                params [["_ctrlButton", controlNull, [controlNull]]];

                private _display = ctrlParent _ctrlButton;
                private _ctrlComboJailList = _display displayCtrl IDC_DISPLAYJAIL_SELECTION;
                private _ctrlInputTime = _display displayCtrl IDC_DISPLAYJAIL_INPUTTIME;
                private _jailClassname = _ctrlComboJailList lbData (lbCurSel _ctrlComboJailList);
                private _sentenceTime = round ((parseNumber ctrlText _ctrlInputTime) * 60);

                // Make sure there are warrants to check
                if (_warrants isEqualTo []) exitWith {
                    [HINT_AMBER, "No Warrants", "There is no warrants for anyones arrest."] call GW_client_fnc_notificationsAdd;
                };

                // Send to jail
                try {
                    // Try sending to jail
                    [TARGET_UNIT, _jailClassname, _sentenceTime, ARREST_REASON] call GW_client_fnc_jailSendToJail;

                    // Close display
                    _display closeDisplay 2
                } catch {
                    [HINT_WARNING, "Error", _exception] call GW_client_fnc_notificationsAdd;
                    [LOG_WARNING, format ["Exception thrown: %1", _exception], _fnc_scriptName] call GW_server_fnc_log;
                };
            }];
        };
    };
    case "onUnload": {};
};