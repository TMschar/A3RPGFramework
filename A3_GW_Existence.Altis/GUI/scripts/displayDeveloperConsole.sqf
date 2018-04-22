#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayDeveloperConsole.sqf
*
*    Parameter(s):
*        0: STRING - Event to execute
*        1: ARRAY  - Array with arguments
*
*    Returns:
*        NOTHING
*
*    Description:
*        Master UI Handler for Developer Console
*/
scriptName "GW_displayDeveloperConsole_Script: main";
scopeName "main";

disableSerialization;

if !(params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

if (call GW_Player_AdminRank < 3) exitWith {
    param [0, displayNull, [displayNull]] closeDisplay 2;
    [LOG_WARNING, "Unauthorized attempt to access developer console", _fnc_scriptName] call GW_server_fnc_log
};

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        [LOG_STAFF, "Opened Developer Console", _fnc_scriptName] call GW_server_fnc_log;

        private _buttonCloseMenu = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_BUTTONCLOSE;
        _buttonCloseMenu ctrlAddEventHandler ["ButtonClick", {
            [LOG_STAFF, "%1:%2 closed developer console", _fnc_scriptName] call GW_server_fnc_log;
            closeDialog 0
        }];

        private _buttonLocalExecute = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_EXECBUTTONS_BUTTONLOCAL;
        private _buttonLocalExecutePerformance = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_EXECBUTTONS_BUTTONLOCALPERFORMANCE;
        private _buttonSelPlayerExecute = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_EXECBUTTONS_BUTTONSELPLAYER;
        private _buttonServerExecute = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_EXECBUTTONS_BUTTONSERVER;
        private _buttonGlobalExecute = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_EXECBUTTONS_BUTTONGLOBAL;

        {
            _x ctrlEnable false;
            true
        } count [
            _buttonSelPlayerExecute,
            _buttonServerExecute,
            _buttonGlobalExecute,
            _buttonLocalExecutePerformance
        ];

        _buttonLocalExecute ctrlSetEventHandler ["ButtonClick", "['executeCode', [_this select 0, 'LOCAL']] call GW_displayDeveloperConsole_Script"];
        _buttonLocalExecutePerformance ctrlSetEventHandler ["ButtonClick", "['executeCode', [_this select 0, 'PERFORMANCE']] call GW_displayDeveloperConsole_Script"];
        _buttonSelPlayerExecute ctrlSetEventHandler ["ButtonClick", "['executeCode', [_this select 0, 'SELECTEDPLAYER']] call GW_displayDeveloperConsole_Script"];
        _buttonServerExecute ctrlSetEventHandler ["ButtonClick", "['executeCode', [_this select 0, 'SERVER']] call GW_displayDeveloperConsole_Script"];
        _buttonGlobalExecute ctrlSetEventHandler ["ButtonClick", "['executeCode', [_this select 0, 'GLOBAL']] call GW_displayDeveloperConsole_Script"];

        private _ctrlButtonConfig = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_BUTTONTOOLSCONFIG;
        private _ctrlButtonAnims = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_BUTTONTOOLSANIMATIONS;
        private _ctrlButtonFncViewer = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_BUTTONTOOLSFNCVIEWER;
        private _ctrlButtonSplendid = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_TOOLSBUTTONSPLENDID;

        _ctrlButtonConfig ctrlSetEventHandler ["ButtonClick", "[] call BIS_fnc_configViewer"];
        _ctrlButtonAnims ctrlSetEventHandler ["ButtonClick", "[] call BIS_fnc_animViewer"];
        _ctrlButtonFncViewer ctrlSetEventHandler ["ButtonClick", "[] call BIS_fnc_help"];
        _ctrlButtonSplendid ctrlSetEventHandler ["ButtonClick", "[] call BIS_fnc_camera"];

        private _safetyCheckbox = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_EXECBUTTONS_CHECKBOX;
        _safetyCheckbox ctrlAddEventHandler ["CheckedChanged", {
            _this params [
                ["_ctrl", controlNull, [controlNull]],
                ["_checkedState", 0, [0]]
            ];

            private _display = ctrlParent _ctrl;
            private _buttonLocalExecute = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_EXECBUTTONS_BUTTONLOCAL;
            private _buttonLocalExecutePerformance = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_EXECBUTTONS_BUTTONLOCALPERFORMANCE;
            private _buttonSelPlayerExecute = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_EXECBUTTONS_BUTTONSELPLAYER;
            private _buttonServerExecute = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_EXECBUTTONS_BUTTONSERVER;
            private _buttonGlobalExecute = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_EXECBUTTONS_BUTTONGLOBAL;

            {
                _x ctrlEnable (_checkedState isEqualTo 1);
                true
            } count [
                _buttonLocalExecute,
                _buttonLocalExecutePerformance,
                _buttonSelPlayerExecute,
                _buttonServerExecute,
                _buttonGlobalExecute
            ]
        }];

        private _ctrlTreePlayers = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_PLAYERS_LISTBOX;
        tvClear _ctrlTreePlayers;
        {
            private "_index";
            {
                _index = _ctrlTreePlayers tvAdd [[], _x];
                private _sideAestetics = [
                    ["a3\ui_f\Data\Map\Markers\nato\b_unknown.paa", WEST],
                    ["a3\ui_f\Data\Map\Markers\nato\c_unknown.paa", CIVILIAN],
                    ["a3\ui_f\Data\Map\Markers\nato\n_unknown.paa", INDEPENDENT],
                    ["a3\ui_f\Data\Map\Markers\nato\o_unknown.paa", OPFOR]
                ] select _forEachIndex;

                _sideAestetics params [
                    ["_picturePath", "", [""]],
                    ["_side", sideUnknown, [sideUnknown]]
                ];

                _ctrlTreePlayers tvSetData [[_index], ""];
                _ctrlTreePlayers tvSetPicture [[_index], _picturePath];
                _ctrlTreePlayers tvSetPictureColor [[_index], [_side] call BIS_fnc_sideColor]
            } forEach ["Blufor", "Civilian", "Independent", "Opfor"];

            private _sideIndex = switch (side group _x) do {
                case west:        {0};
                case civilian:    {1};
                case independent: {2};
                case east:        {3};
            };

            private _index = _ctrlTreePlayers tvAdd [[_sideIndex], name _x];
            _ctrlTreePlayers tvSetPicture [[_sideIndex, _index], "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa"];
            _ctrlTreePlayers tvSetPictureColor [[_sideIndex, _index], [side _x] call BIS_fnc_sideColor];

            true
       } count ALLPLAYERSNOHC;
       tvExpandAll _ctrlTreePlayers;
       //_ctrlTreePlayers tvSetCurSel [0];

       //["loadSavedScripts", [_display]] call GW_displayDeveloperConsole_Script;

       GW_displayDeveloperConsole_EFHandle = addMissionEventHandler ["EachFrame", {
          private _display = ["GW_displayDeveloperConsole"] call GW_client_fnc_getDisplay;

          private _inputField1 = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_WATCHFIELDS_INPUTFIELD1;
          private _outputField1 = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_WATCHFIELDS_OUTPUTFIELD1;
          private _input1 = ctrlText _inputField1;
          if !(_input1 isEqualTo "") then {
              private _input1Return = call compile _input1;
              _outputField1 ctrlSetText format ["%1", _input1Return]
          } else {
              _outputField1 ctrlSetText ""
          };

          private _inputField2 = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_WATCHFIELDS_INPUTFIELD2;
          private _outputField2 = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_WATCHFIELDS_OUTPUTFIELD2;
          private _input2 = ctrlText _inputField2;
          if !(_input2 isEqualTo "") then {
              private _input2Return = call compile _input2;
              _outputField2 ctrlSetText format ["%1", _input2Return]
          } else {
              _outputField2 ctrlSetText ""
          };

          private _inputField3 = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_WATCHFIELDS_INPUTFIELD3;
          private _outputField3 = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_WATCHFIELDS_OUTPUTFIELD3;
          private _input3 = ctrlText _inputField3;
          if !(_input3 isEqualTo "") then {
              private _input3Return = call compile _input3;
              _outputField3 ctrlSetText format ["%1", _input3Return]
          } else {
              _outputField3 ctrlSetText ""
          }
       }];

       {
           disableSerialization;
           private _input = _display displayCtrl _x;
           private _value = profileNamespace getVariable ["GW_displayDeveloperConsole_expressionLast" + str _forEachIndex, ""];
           _input ctrlSetText _value
       } forEach [
            IDC_DISPLAYDEVELOPERCONSOLE_INPUT,
            IDC_DISPLAYDEVELOPERCONSOLE_WATCHFIELDS_INPUTFIELD1,
            IDC_DISPLAYDEVELOPERCONSOLE_WATCHFIELDS_INPUTFIELD2,
            IDC_DISPLAYDEVELOPERCONSOLE_WATCHFIELDS_INPUTFIELD3
       ]
    };
    case "loadSavedScripts": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlTree = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_TREESCRIPTS;
        _ctrlTree ctrlAddEventHandler ["TreeSelChanged", {
            params [
                ["_ctrlTree", controlNull, [controlNull]],
                ["_selPath", [], [[]]]
            ];


        }];

    };
    case "executeCode": {
        _args params [
            ["_control", controlNull, [controlNull]],
            ["_event", "", [""]]
        ];

        private _display = ctrlParent _control;

        private _ctrlEditInput = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_INPUT;
        private _input = ctrlText _ctrlEditInput;

        /**
         *  Remove double slash comments from string:
         *      Credits to Bohemia Interactive Studios for this code snippet, enhanced by SimZor for SimZor Studios.
         *      All rights are Bohemia Interactive Studios's.
         */
        private _strings = [];
        private _start = -1;

        while {
            _start = _input find "//";
            _start > -1
        } do {
            _input select [0, _start] call {
                private _badQuotes = _this call {
                    private _qtsGood = [];
                    private _qtsInfo = [];
                    private _arr = toArray _this;

                    {
                        _qtsGood pushBack (count _arr - count (_arr - [_x]) % 2 == 0);
                        _qtsInfo pushBack [_this find toString [_x], _x];

                        true
                    } count [34, 39];

                    if (_qtsGood isEqualTo [true, true]) exitWith {
                        0
                    };

                    _qtsInfo sort true;
                    _qtsInfo select 0 select 1
                };

                if (_badQuotes > 0) exitWith {
                    private _last = _input select [_start] find toString [_badQuotes];

                    if (_last < 0) exitWith {
                        _strings = [_input];
                        _input = "";
                    };

                    _last = _start + _last + 1;
                    _strings pushBack (_input select [0, _last]);

                    _input = _input select [_last]
                };

                _strings pushBack _this;

                _input = _input select [_start];

                private _end = _input find toString [10];

                if (_end < 0) exitWith {
                    _input = ""
                };

                _input = _input select [_end + 1]
            }
        };

        _input = (_strings joinString "") + _input;
        /**
        *   END CODE SNIPPET FROM BOHEMIA
        */

        private _ctrlTextReturn = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_INPUTRETURN;
        switch _event do {
            case "LOCAL": {
                private _return = call compile _input;

                _ctrlTextReturn ctrlSetText format ["%1", _return]
            };
            case "PERFORMANCE": {
                private _return = [_input, 0, 10000, _display] call BIS_fnc_codePerformance;

                _return params [
                    ["_duration", 0, [0]],
                    ["_cycles", 0, [0]]
                ];

                _ctrlTextReturn ctrlSetText format ["%1 ms / %2 cycles", _duration, _cycles]
            };
            case "PLAYER": {
                private _playersListbox = _display displayCtrl IDC_DISPLAYDEVELOPERCONSOLE_PLAYERS_LISTBOX;
                private _uid = lbData [IDC_DISPLAYDEVELOPERCONSOLE_PLAYERS_LISTBOX, lbCurSel (IDC_DISPLAYDEVELOPERCONSOLE_PLAYERS_LISTBOX)];

                if (_uid isEqualTo "") exitWith {hint "Select a player"};

                private _unit = [_uid] call GW_client_fnc_getUnitByUID;

                if !([
                    format [localize "STR_GW_GUI_DISPLAYS_DISPLAYDEVELOPERCONSOLE_EXECUTEON", name _unit],
                    localize "STR_GW_GUI_DISPLAYS_DISPLAYDEVELOPERCONSOLE_CONFIRMEXECUTION",
                    localize "STR_GW_GLOBAL_YES",
                    localize "STR_GW_GLOBAL_NO",
                    _display
                ] call GW_client_fnc_guiPrompt) exitWith {};

                [_input, "PLAYER", _unit] remoteExecCall ["GW_server_fnc_compileRequest", 2]
            };
            case "SERVER": {
                [_input, "SERVER"] remoteExecCall ["GW_server_fnc_compileRequest", 2]
            };
            case "GLOBAL": {
                [_input, "GLOBAL"] remoteExecCall ["GW_server_fnc_compileRequest", 2]
            }
        }
    };
    case "onUnload": {
        removeMissionEventHandler ["EachFrame", GW_displayDeveloperConsole_EFHandle];

        private _display = ["GW_displayDeveloperConsole"] call GW_client_fnc_getDisplay;
        {
            disableSerialization;
            private _ctrl = _display displayCtrl _x;
            private _input = ctrlText _ctrl;
            profileNamespace setVariable ["GW_displayDeveloperConsole_expressionLast" + str _forEachIndex, _input]
        } forEach [
            IDC_DISPLAYDEVELOPERCONSOLE_INPUT,
            IDC_DISPLAYDEVELOPERCONSOLE_WATCHFIELDS_INPUTFIELD1,
            IDC_DISPLAYDEVELOPERCONSOLE_WATCHFIELDS_INPUTFIELD2,
            IDC_DISPLAYDEVELOPERCONSOLE_WATCHFIELDS_INPUTFIELD3
        ];

        saveProfileNamespace
    }
};
