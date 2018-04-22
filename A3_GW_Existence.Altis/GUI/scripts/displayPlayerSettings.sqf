#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayPlayerSettings.sqf
*
*    Parameter(s):
*        0: STRING - Event to execute
*        1: ARRAY  - Array with arguments
*
*    Returns:
*        NOTHING
*
*    Description:
*        Master UI Handler for Player Settings Dialog
*/
scriptName "GW_displayPlayerSettings_Script: main";
scopeName "main";

disableSerialization;

#define SELF GW_displayPlayerSettings_Script
#define STR_BYPASSCININTRO "GW_bypassCinematicIntro"
#define STR_HIDENAMETAGS "GW_hideNametags"
#define STR_DISABLEHEXAGONS "GW_disableHexagons"
#define STR_DISABLEHEXAGONINFO "GW_disableHexagonInfo"
#define STR_VIEWDISTANCE "GW_viewDistance"
#define STR_OBJECTRENDERDISTANCE "GW_objectRenderDistance"

if !(params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlButtonExit = _display displayCtrl IDC_DISPLAYPLAYERSETTINGS_BUTTONEXIT;
        private _ctrlCheckboxSync = _display displayCtrl IDC_DISPLAYPLAYERSETTINGS_SYNCOBJWVIEWCHECKBOX;
        private _ctrlSliderViewDistance = _display displayCtrl IDC_DISPLAYPLAYERSETTINGS_SLIDERVIEWDISTANCE;
        private _ctrlSliderObjectDistance = _display displayCtrl IDC_DISPLAYPLAYERSETTINGS_SLIDEROBJECTDISTANCE;
        private _ctrlCheckboxCinematicIntro = _display displayCtrl IDC_DISPLAYPLAYERSETTINGS_CINEMATICINTROCHECKBOX;
        private _ctrlCheckboxPlayerTags = _display displayCtrl IDC_DISPLAYPLAYERSETTINGS_SHOWPLAYERTAGSCHECKBOX;
        private _ctrlCheckboxHexagons = _display displayCtrl IDC_DISPLAYPLAYERSETTINGS_ENABLEHEXESCHECKBOX;
        private _ctrlCheckboxHexagonInfo = _display displayCtrl IDC_DISPLAYPLAYERSETTINGS_ENABLEHEXINFOCHECKBOX;

        _ctrlSliderViewDistance ctrlAddEventHandler ["SliderPosChanged", {
            params [
                ["_ctrl", controlNull, [controlNull]],
                ["_change", 0, [0]]
            ];

            private _display = ctrlParent _ctrl;
            private _ctrlViewDistanceOutput = _display displayCtrl IDC_DISPLAYPLAYERSETTINGS_VIEWDISTANCEOUTPUT;

            profileNamespace setVariable [STR_VIEWDISTANCE, _change];
            setViewDistance _change;

            ["updateViewDistance", [_display]] call SELF
        }];

        ["updateViewDistance", [_display]] call SELF;

        _ctrlSliderObjectDistance ctrlAddEventHandler ["SliderPosChanged", {
            params [
                ["_ctrl", controlNull, [controlNull]],
                ["_change", 0, [0]]
            ];

            private _display = ctrlParent _ctrl;

            profileNamespace setVariable [STR_OBJECTRENDERDISTANCE, _change];
            setObjectViewDistance _change;

            ["updateObjectDistance", [_display]] call SELF
        }];

        ["updateObjectDistance", [_display]] call SELF;

        /*
        IDC_DISPLAYPLAYERSETTINGS_SHOWSTATUSICONSCHECKBOX
        IDC_DISPLAYPLAYERSETTINGS_SHOWDAMAGECHECKBOX
        IDC_DISPLAYPLAYERSETTINGS_SHOWCASHCHECKBOX
        IDC_DISPLAYPLAYERSETTINGS_STREAMUICHECKBOX
        */

        _ctrlCheckboxCinematicIntro cbSetChecked !(profileNamespace getVariable [STR_BYPASSCININTRO, false]);
        _ctrlCheckboxCinematicIntro ctrlAddEventHandler ["CheckedChanged", {
            params [
                ["_ctrl", controlNull, [controlNull]],
                ["_state", 0, [0]]
            ];

            profileNamespace setVariable [STR_BYPASSCININTRO, _state isEqualTo 0];
        }];

        _ctrlCheckboxPlayerTags cbSetChecked !(profileNamespace getVariable [STR_HIDENAMETAGS, false]);
        _ctrlCheckboxPlayerTags ctrlAddEventHandler ["CheckedChanged", {
            params [
                ["_ctrl", controlNull, [controlNull]],
                ["_state", 0, [0]]
            ];

            profileNamespace setVariable [STR_HIDENAMETAGS, _state isEqualTo 0]
        }];

        _ctrlCheckboxHexagons cbSetChecked !(profileNamespace getVariable [STR_DISABLEHEXAGONS, false]);
        _ctrlCheckboxHexagons ctrlAddEventHandler ["CheckedChanged", {
            params [
                ["_ctrl", controlNull, [controlNull]],
                ["_state", 0, [0]]
            ];

            profileNamespace setVariable [STR_DISABLEHEXAGONS, _state isEqualTo 0]
        }];

        _ctrlCheckboxHexagonInfo cbSetChecked !(profileNamespace getVariable [STR_DISABLEHEXAGONINFO, false]);
        _ctrlCheckboxHexagonInfo ctrlAddEventHandler ["CheckedChanged", {
            params [
                ["_ctrl", controlNull, [controlNull]],
                ["_state", 0, [0]]
            ];

            profileNamespace setVariable [STR_DISABLEHEXAGONINFO, _state isEqualTo 0]
        }];
    };
    case "updateViewDistance": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlSlider = _display displayCtrl IDC_DISPLAYPLAYERSETTINGS_SLIDERVIEWDISTANCE;
        private _ctrlOutput = _display displayCtrl IDC_DISPLAYPLAYERSETTINGS_VIEWDISTANCEOUTPUT;
        private _viewDistance = profileNamespace getVariable [STR_VIEWDISTANCE, viewDistance];

        _ctrlSlider sliderSetRange [500, 10000];
        _ctrlSlider sliderSetSpeed [1000, 2];
        _ctrlSlider sliderSetPosition _viewDistance;
        _ctrlOutput ctrlSetText format ["%1 km", (_viewDistance / 1000) toFixed 2];
    };
    case "updateObjectDistance": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlSlider = _display displayCtrl IDC_DISPLAYPLAYERSETTINGS_SLIDEROBJECTDISTANCE;
        private _ctrlOutput = _display displayCtrl IDC_DISPLAYPLAYERSETTINGS_OBJDISTANCEOUTPUT;
        private _objectDistance = profileNamespace getVariable [
            STR_OBJECTRENDERDISTANCE,
            getObjectViewDistance param [0, 0, []]
        ];

        _ctrlSlider sliderSetRange [500, 10000];
        _ctrlSlider sliderSetSpeed [1000, 2];
        _ctrlSlider sliderSetPosition _objectDistance;
        _ctrlOutput ctrlSetText format ["%1 km", (_objectDistance / 1000) toFixed 2];
    };
    case "onUnload": {
        saveProfilenamespace
    }
}
