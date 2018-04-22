#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: DISPLAYInteractionMenu.sqf
 *
 * Parameter(s):
 *     0: ARRAY - Passed parameters
 *     1: STRING - Case to execute
 */
#define SELF GW_displayInteractionMenu_script
#define VAR_ACTIONS GW_displayInteractionMenu_actions
#define STR_TARGET "GW_displayInteractionMenu_target"
#define STR_ACTIONS "GW_displayInteractionMenu_actions"
#define VAR_THREAD GW_displayInteractionMenu_thread
#define VAR_TITLE GW_displayInteractionMenu_title
#define TEXT_BUTTON "<t font='RobotoCondensed' align='left'>  </t><img align='left' image='%2'/> <t font='RobotoCondensedLight' align='left'> %1</t>"

scriptName "GW_displayInteractionMenu_script: main";
scopeName "main";

disableSerialization;
if !(params [["_event", "", [""]], ["_args", [], [[]]]]) exitWith {};
switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        // Error checks
        if (isNil STR_ACTIONS) exitWith {};
        if (!isNull VAR_THREAD) then {terminate VAR_THREAD};

        // Create a new thread for adding the actions
        VAR_THREAD = [VAR_ACTIONS, _display] spawn {
            scriptName "GW_displayInteractionMenu_script: controls thread";
            scopeName "main";

            disableSerialization;
            params [["_actions", [], [[]]], ["_display", displayNull, [displayNull]]];

            private _ctrlGroupButtons = _display displayCtrl IDC_DISPLAYINTERACTIONMENU_BUTTONSGROUP;

            // Hide all controls except for the controls group
            {
                if !(_x isEqualTo _ctrlGroupButtons) then {
                    _x ctrlSetFade 1;
                    _x ctrlCommit 0;
                };
            } forEach (allControls _display);

            // Fade in header and close button
            private _ctrlHeader = _ctrlGroupButtons controlsGroupCtrl 222;
            private _ctrlButtonClose = _ctrlGroupButtons controlsGroupCtrl 223;
            {
                _x ctrlSetFade 0;
                _x ctrlCommit 0.05;
                waitUntil {ctrlCommitted _x};
                true;
            } count [_ctrlHeader, _ctrlButtonClose];

            // Update Title
            _ctrlHeader ctrlSetText VAR_TITLE;

            // Loop through all button controls
            {
                scopeName "ctrlLoadLoop";

                _x params [
                    ["_title", "", [""]],
                    ["_description", "", [""]],
                    ["_code", "", [""]],
                    ["_icon", "", [""]],
                    ["_iconFullPath", false, [false]]
                ];

                private _index = _forEachIndex + 1;
                private _ctrlIDC = IDC_DISPLAYINTERACTIONMENU_BUTTON + _index;
                private _ctrl = _ctrlGroupButtons controlsGroupCtrl _ctrlIDC;

                // Icon path
                private _iconPath = [format [
                    "GUI\data\displays\displayInteractionMenu\%1.paa",
                    _icon
                ], _icon] select _iconFullPath;

                // Set button text
                _ctrl ctrlSetStructuredText parseText format [TEXT_BUTTON, _title, _iconPath];

                // Add buttonclick eventhandler
                _ctrl ctrlAddEventHandler ["ButtonClick", format [
                    "closeDialog 0; %1 call (compile %2);",
                    STR_TARGET,
                    str _code
                ]];

                // Hide ctrl
                _ctrl ctrlSetFade 1;
                _ctrl ctrlCommit 0;

                // Show ctrl
                _ctrl ctrlSetFade 0;
                _ctrl ctrlCommit 0.05;

                waitUntil {ctrlCommitted _ctrl};
            } forEach _actions;
        };
    };
    case "onUnload": {
        // Unload variables
        VAR_ACTIONS = nil;
        VAR_TITLE = nil;

        // Terminate thread
        terminate VAR_THREAD;
    };
};
