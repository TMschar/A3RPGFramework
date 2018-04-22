#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayCommunicationTargets.sqf
*
*    Parameter(s):
*       0: STRING - Event
*       1: ARRAY - Arguments
*
*    Returns:
*        NOTHING
*
*    Description:
*        NO DESCRIPTION
*/
scriptName "GW_client_fnc_displayCommunicationTargets: main";
scopeName "main";

disableSerialization;

if !(params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

#define PAA_BASEPATH "GUI\data\displays\displayCommunicationTargets\"

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        GW_displayCommunicationTargets_targetMode = nil;
        GW_displayCommunicationTargets_targetIdentifier = nil;

        private _ctrlButtonCall = _display displayCtrl IDC_DISPLAYCOMMUNICATIONTARGETS_BUTTONCALL;
        _ctrlButtonCall ctrlEnable false;

        private _ctrlButtonMessage = _display displayCtrl IDC_DISPLAYCOMMUNICATIONTARGETS_BUTTONMESSAGE;
        _ctrlButtonMessage ctrlEnable false;
        _ctrlButtonMessage ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;

            private _ctrlTree = _display displayCtrl IDC_DISPLAYCOMMUNICATIONTARGETS_TARGETSTREE;
            private _tvData = _ctrlTree tvData (tvCurSel _ctrlTree);

            if (_tvData isEqualTo "") exitWith {};

            private _targetArguments = parseSimpleArray _tvData;
            _targetArguments params [
                ["_mode", 0, [0]],
                ["_identifier", "", [""]],
                ["_voiceAvailable", false, [false]]
            ];

            GW_displayCommunicationTargets_targetMode = _mode;
            GW_displayCommunicationTargets_targetIdentifier = _identifier;

            _display createDisplay "GW_displayCommunicationSendMessage"
        }];

        private _ctrlButtonRefresh = _display displayCtrl IDC_DISPLAYCOMMUNICATIONTARGETS_BUTTONREFRESH;
        _ctrlButtonRefresh ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;
            ["setupTreeEntries", [_display]] call GW_displayCommunicationTargets_Script
        }];

        private _ctrlTree = _display displayCtrl IDC_DISPLAYCOMMUNICATIONTARGETS_TARGETSTREE;
        _ctrlTree ctrlAddEventHandler ["TreeSelChanged", {
            params [
                ["_ctrl", controlNull, [controlNull]],
                ["_selectionPath", [], [[]]]
            ];
            private _display = ctrlParent _ctrl;

            private _tvData = _ctrl tvData _selectionPath;
            private _hasNoData = _tvData isEqualTo "";

            private _ctrlButtonCall = _display displayCtrl IDC_DISPLAYCOMMUNICATIONTARGETS_BUTTONCALL;
            private _ctrlButtonMessage = _display displayCtrl IDC_DISPLAYCOMMUNICATIONTARGETS_BUTTONMESSAGE;

            _ctrlButtonCall ctrlEnable !_hasNoData;
            if _hasNoData exitWith {
                _ctrlButtonMessage ctrlEnable false
            };

            private _targetArguments = parseSimpleArray _tvData;
            _targetArguments params [
                ["_mode", 0, [0]],
                ["_identifier", "", [""]],
                ["_voiceAvailable", false, [false]]
            ];

            _ctrlButtonCall ctrlEnable _voiceAvailable;
            _ctrlButtonMessage ctrlEnable true
        }];

        // Setup tree
        ["setupTreeEntries", [_display]] call GW_displayCommunicationTargets_Script;

        private _ctrlButtonCancel = _display displayCtrl IDC_DISPLAYCOMMUNICATIONTARGETS_BUTTONCLOSE;
        _ctrlButtonCancel ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;
            _display closeDisplay 2
        }];
    };
    case "setupTreeEntries": {
        _args params [["_display", displayNull, [displayNull]]];
        private _ctrlTree = _display displayCtrl IDC_DISPLAYCOMMUNICATIONTARGETS_TARGETSTREE;
        tvClear _ctrlTree;

        if (call GW_player_adminRank > 0) then {
            private _treeEntry = _ctrlTree tvAdd [[], "Announcements"];
            _ctrlTree tvSetPicture [[_treeEntry], PAA_BASEPATH + "announcement.paa"];
            {
                _x params [
                    ["_title", "", [""]],
                    ["_type", 0, [0]],
                    ["_icon", "", [""]]
                ];

                private _treeEntryLoop = _ctrlTree tvAdd [[_treeEntry], _title];
                _ctrlTree tvSetData [[_treeEntry, _treeEntryLoop], format ["[%1,""%2""]", _type, _title]];
                _ctrlTree tvSetPicture [[_treeEntry, _treeEntryLoop], PAA_BASEPATH + _icon];

                true
            } count [
                ["Public Announcement", 5, "psa.paa"],
                ["Admin Announcement", 6, "g.paa"]
            ];
        };

        _treeEntry = _ctrlTree tvAdd [[], "Assistance"];
        _ctrlTree tvSetPicture [[_treeEntry], PAA_BASEPATH + "assistance.paa"];
        {
            _x params [
                ["_title", "", [""]],
                ["_type", 0, [0]],
                ["_icon", "", [""]]
            ];

            private _treeEntryLoop = _ctrlTree tvAdd [[_treeEntry], _title];
            _ctrlTree tvSetData [[_treeEntry, _treeEntryLoop], format ["[%1,""%2""]", _type, _title]];
            _ctrlTree tvSetPicture [[_treeEntry, _treeEntryLoop], PAA_BASEPATH + _icon];

            true
        } count [
            ["Police Request", 2, "police.paa"],
            ["Medical Request", 3, "medical.paa"],
            ["Staff Request", 4, "g.paa"]
        ];

        _treeEntry = _ctrlTree tvAdd [[], "Organizations"];
        _ctrlTree tvSetPicture [[_treeEntry], PAA_BASEPATH + "organizations.paa"];
        //_ctrlTree tvSetPicture [[_treeEntry], "\a3\3DEN\Data\Cfg3DEN\Group\iconCustomComposition_ca.paa"];

        private _organizations = allGroups select {side _x isEqualTo civilian && {!(_x getVariable ["organizationName", ""] isEqualTo "")}};
        {

            private _organizationName = _x getVariable ["organizationName", ""];
            private _organizationTag = _x getVariable ["organization_tag", ""];
            private _treeEntryLoop = _ctrlTree tvAdd [[_treeEntry], format ["%1 %2", _organizationTag, _organizationName]];
            _ctrlTree tvSetData [[_treeEntryLoop, _treeEntryLoop], format ["[1,""%1""]", _organizationName]];
            true
        } count _organizations;

        _treeEntry = _ctrlTree tvAdd [[], "Players"];
        _ctrlTree tvSetPicture [[_treeEntry], PAA_BASEPATH + "players.paa"];

        private _bluforTreeEntry = _ctrlTree tvAdd [[_treeEntry], "Police"];
        _ctrlTree tvSetPicture [[_treeEntry, _bluforTreeEntry], "a3\ui_f\Data\Map\Markers\nato\b_unknown.paa"];
        _ctrlTree tvSetPictureColor [[_treeEntry, _bluforTreeEntry], [west] call BIS_fnc_sideColor];

        private _independentTreeEntry = _ctrlTree tvAdd [[_treeEntry], "Medics"];
        _ctrlTree tvSetPicture [[_treeEntry, _independentTreeEntry], "a3\ui_f\Data\Map\Markers\nato\n_unknown.paa"];
        _ctrlTree tvSetPictureColor [[_treeEntry, _independentTreeEntry], [independent] call BIS_fnc_sideColor];

        private _civilianTreeEntry = _ctrlTree tvAdd [[_treeEntry], "Civilians"];
        _ctrlTree tvSetPicture [[_treeEntry, _civilianTreeEntry], "a3\ui_f\Data\Map\Markers\nato\c_unknown.paa"];
        _ctrlTree tvSetPictureColor [[_treeEntry, _civilianTreeEntry], [civilian] call BIS_fnc_sideColor];

        private _opforTreeEntry = _ctrlTree tvAdd [[_treeEntry], "Opfor"];
        _ctrlTree tvSetPicture [[_treeEntry, _opforTreeEntry], "a3\ui_f\Data\Map\Markers\nato\o_unknown.paa"];
        _ctrlTree tvSetPictureColor [[_treeEntry, _opforTreeEntry], [east] call BIS_fnc_sideColor];

        {
            private _icon = [
                "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa",
                "\A3\ui_f\data\map\vehicleicons\iconManVirtual_ca.paa"
            ] select (_x isEqualTo player);

            private _sidePath = switch (side group _x) do {
                case west:          {_bluforTreeEntry};
                case east:          {_opforTreeEntry};
                case independent:   {_independentTreeEntry};
                case civilian:      {_civilianTreeEntry}
            };

            private _colour = [side group _x] call BIS_fnc_sideColor;
            private _entry = _ctrlTree tvAdd [[_treeEntry, _sidePath], name _x];

            _ctrlTree tvSetData [[_treeEntry, _sidePath, _entry], format ["[0,""%1"",false]", getPlayerUID _x]];
            _ctrlTree tvSetPicture [[_treeEntry, _sidePath, _entry], _icon];
            _ctrlTree tvSetPictureColor [[_treeEntry, _sidePath, _entry], _colour];

            true
        } count allPlayers;

        tvExpandAll _ctrlTree;
    };
    case "onUnload": {

    }
}
