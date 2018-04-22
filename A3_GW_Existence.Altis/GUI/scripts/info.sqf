#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: info.sqf
*
*    Parameter(s):
*       0: STRING - Event
*       1: ARRAY - Arguments
*
*    Returns:
*        NOTHING
*
*    Description:
*        Handles in-game information text
*/
scriptName "GW_Info_Script: main";
scopeName "main";

disableSerialization;

if !(params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

switch _event do {
    case "onLoad": {
        GW_Info_EFHandle = addMissionEventHandler ["EachFrame", {
            private _display = ["GW_Info"] call GW_client_fnc_getDisplay;

            private _ctrlTextTitle = _display displayCtrl IDC_INFO_TITLE;
            private _ctrlTextSubtitle = _display displayCtrl IDC_INFO_SUBTITLE;

            _ctrlTextTitle ctrlSetText toUpper (missionNamespace getVariable ["GW_Info_Title", ""]);
            _ctrlTextSubtitle ctrlSetText (missionNamespace getVariable ["GW_Info_Subtitle", ""]);

            // Set colour of title
            _ctrlTextTitle ctrlSetTextColor ([
                GW_Info_TitleColour,
                [1, 1, 1, 1]
            ] select (isNil "GW_Info_TitleColour"));
        }]

    };
    case "onUnload": {
        removeMissionEventHandler ["EachFrame", GW_Info_EFHandle];

        GW_Info_Title = nil;
        GW_Info_Subtitle = nil;
        GW_Info_TitleColour = nil;
    }
}
