#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_guiPrompt.sqf
 *
 * Parameter(s):
 *     0: STRING  - Title of prompt
 *     1: STRING  - Text of prompt
 *     2: STRING  - Button text for OK
 *     3: STRING  - Button text for CANCEL
 *     4: DISPLAY - Parent display for prompt
 *     5: BOOLEAN - Use big or small prompt
 *
 * Returns:
 *     BOOLEAN (true for OK, false for CANCEL)
 *
 * Description:
 *     Prompts the player to give response, i.e. accept or decline.
 */
scriptName "GW_client_fnc_guiPrompt: main";
scopeName "main";

if !canSuspend exitWith {["Needs to be ran in scheduled environment", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};
params [
    ["_title", "", [""]],
    ["_text", "", [""]],
    ["_textOK", "", [""]],
    ["_textCancel", "", [""]],
    ["_display", findDisplay 46, [displayNull]],
    ["_useSmall", true, [true]]
];

// Error checks
if (_title isEqualTo "" || {_text isEqualTo ""} || {_textOK isEqualTo ""} || {_textCancel isEqualTo ""}) exitWith {false};

// Declare and define some default variables
GW_guiPrompt_return = nil;
private _emptyDisplay = _display createDisplay "RscDisplayEmpty";
private _ctrlName = ["GW_ctrlPrompt", "GW_ctrlPromptSmall"] select _useSmall;
private _ctrl = _emptyDisplay ctrlCreate [_ctrlName, -1];
private _ctrlTitle = _ctrl controlsGroupCtrl 3;
private _ctrlText = _ctrl controlsGroupCtrl 4;
private _ctrlButtonCancel = _ctrl controlsGroupCtrl 1;
private _ctrlButtonOK = _ctrl controlsGroupCtrl 2;

// Unload
_emptyDisplay displaySetEventHandler ["Unload",
    "GW_guiPrompt_return = [false, GW_guiPrompt_return] select (GW_guiPrompt_return isEqualTypeAny [false, true])"
];

// Button to deny
_ctrlButtonCancel ctrlRemoveAllEventHandlers "ButtonClick";
_ctrlButtonCancel ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlnull]]];
    private _display = ctrlParent _ctrl;

    GW_guiPrompt_return = false;
    _display closeDisplay 2
}];

// Button to accept
_ctrlButtonOK ctrlRemoveAllEventHandlers "ButtonClick";
_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
    private _display = ctrlParent _ctrl;

    GW_guiPrompt_return = true;
    _display closeDisplay 2
}];

// Set text
_ctrlButtonCancel ctrlSetText _textCancel;
_ctrlButtonOK ctrlSetText _textOK;
_ctrlTitle ctrlSetText _title;
_ctrlText ctrlSetText _text;

// Wait until an option is selected
waitUntil {!isNil "GW_guiPrompt_return"};
GW_guiPrompt_return
