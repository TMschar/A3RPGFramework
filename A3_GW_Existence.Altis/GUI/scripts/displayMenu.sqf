#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: displayMenu.sqf
*
* Parameter(s):
*     0: STRING - Event
*     1: ARRAY  - Arguments
*
* Description:
*     Master UI handler for main menu
*/
#define SELF GW_displayMenu_Script
#define VAR_LOADBUTTONS_HANDLE GW_displayMenu_loadButtonsHandle

scriptName "GW_displayMenu_script: main";
scopeName "main";

disableSerialization;
if !params [["_event", "", [""]], ["_args", [], [[]]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        _display displayAddEventHandler ["KeyDown", {
            params [["_display", displayNull, [displayNull]], ["_dikCode", 0, [0]]];
            if (_dikCode isEqualTo ([actionKeys "User1" select 0, DIK_Y] select (count (actionKeys "User1") < 1))) exitWith {
                _display closeDisplay 2;
                true
            }
        }];

        // Remove HUD
        ["GW_HUD"] call GW_client_fnc_destroyResource;

        // Center cursor
        setMousePosition [0.5, 0.5];

        // Fade in buttons
        VAR_LOADBUTTONS_HANDLE = ["loadButtons", [_display]] spawn SELF;
        ["setupButtons", [_display]] call SELF;

        // Define and declare controls
        private _ctrlTextName = _display displayCtrl IDC_DISPLAYMENU_NAME;
        private _ctrlTextGroup = _display displayCtrl IDC_DISPLAYMENU_GROUP;
        private _ctrlTextPlaytime = _display displayCtrl IDC_DISPLAYMENU_PLAYTIME;
        private _ctrlTextBank = _display displayCtrl IDC_DISPLAYMENU_BANK;
        private _ctrlTextCash = _display displayCtrl IDC_DISPLAYMENU_CASH;
        private _ctrlTextSide = _display displayCtrl IDC_DISPLAYMENU_SIDE;

        // Get total playtime
        private _playtime = [
            call GW_client_fnc_playersGetPlaytime * 60,
            "HH:MM:SS",
            false
        ] call BIS_fnc_secondsToString;

        // Get group name
        private _groupName = switch playerSide do {
            case west: {"Military Police"};
            case independent: {"IHAS"};
            case civilian: {group player getVariable ["organizationName", localize "STR_GW_GUI_DISPLAYS_DISPLAYMENU_ORGANIZATIONDEFAULT"]};
            case east: {"Staff"}
        };

        // Update control texts
        _ctrlTextName ctrlSetText (player call GW_client_fnc_playersGetName);
        _ctrlTextGroup ctrlSetText _groupName;
        _ctrlTextPlaytime ctrlSetText format ["%1 h", _playtime];
        _ctrlTextBank ctrlSetText (BANK call GW_client_fnc_currencyFormat);
        _ctrlTextCash ctrlSetText (CASH call GW_client_fnc_currencyFormat);
        _ctrlTextSide ctrlSetText str playerSide;
    };
    case "setupButtons": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlButtonDisconnect = _display displayCtrl IDC_DISPLAYMENU_BUTTONDISCONNECT;
        private _ctrlButtonCommunication = _display displayCtrl IDC_DISPLAYMENU_BUTTON + 1;
        private _ctrlButtonOrganisations = _display displayCtrl IDC_DISPLAYMENU_BUTTON + 2;
        private _ctrlButtonExperience = _display displayCtrl IDC_DISPLAYMENU_BUTTON + 3;
        private _ctrlButtonKeychain = _display displayCtrl IDC_DISPLAYMENU_BUTTON + 4;
        private _ctrlButtonInventory = _display displayCtrl IDC_DISPLAYMENU_BUTTON + 5;
        private _ctrlButtonWanted = _display displayCtrl IDC_DISPLAYMENU_BUTTON + 6;
        private _ctrlButtonSettlements = _display displayCtrl IDC_DISPLAYMENU_BUTTON + 7;
        private _ctrlButtonJobs = _display displayCtrl IDC_DISPLAYMENU_BUTTON + 8;
        private _ctrlButtonGuide = _display displayCtrl IDC_DISPLAYMENU_BUTTON + 9;
        private _ctrlButtonPlayerSettings = _display displayCtrl IDC_DISPLAYMENU_BUTTON + 10;
        private _ctrlButtonGameSettings = _display displayCtrl IDC_DISPLAYMENU_BUTTON + 11;
        private _ctrlButtonExit = _display displayCtrl IDC_DISPLAYMENU_BUTTON + 12;

        _ctrlButtonJobs ctrlEnable false;
        _ctrlButtonSettlements ctrlEnable false;

        _ctrlButtonPlayerSettings ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;
            _display createDisplay "GW_displayPlayerSettings";
        }];

        _ctrlButtonGuide ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;
            _display createDisplay "GW_displayGuide";
        }];

        _ctrlButtonGameSettings ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            [_ctrl] spawn {
                disableSerialization;

                (ctrlParent (param [0, controlNull, [controlNull]])) closeDisplay 2;
                waitUntil {!(["GW_displayPause"] call GW_client_fnc_guiDisplayActive)};

                // Tinker default pause menu
                private _display = findDisplay 46 createDisplay "RscDisplayInterrupt";

                private _ctrlAbort = _display displayCtrl 104;
                _ctrlAbort ctrlEnable false;
                _ctrlAbort ctrlSetText "";
                _ctrlAbort ctrlSetToolTip "";

                private _ctrlFieldManual = _display displayCtrl 122;
                _ctrlFieldManual ctrlEnable false;
                _ctrlFieldManual ctrlSetText "";
                _ctrlFieldManual ctrlSetToolTip "";

                private _ctrlLoadButton = _display displayCtrl 103;
                _ctrlLoadButton ctrlEnable false;
                _ctrlLoadButton ctrlSetText "";
                _ctrlLoadButton ctrlSetToolTip "";

                private _ctrlSaveButton = _display displayCtrl 119;
                _ctrlSaveButton ctrlEnable false;
                _ctrlSaveButton ctrlSetText "";
                _ctrlSaveButton ctrlSetToolTip "";

                // Show options
                with uinamespace do {
                    private _ctrl = _display displayCtrl 101;
                    ["optionsButton", [_ctrl, ""]] spawn RscDisplayInterrupt_Script
                }
            }
        }];

        _ctrlButtonExit ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;
            _display closeDisplay 2;
        }];

        _ctrlButtonCommunication ctrlEnable ("ItemRadio" in assignedItems player);
        _ctrlButtonCommunication ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;
            _display createDisplay "GW_displayCommunicationMessages";
        }];

        _ctrlButtonOrganisations ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;
            _display createDisplay "GW_displayOrganizations";
        }];
        _ctrlButtonOrganisations ctrlEnable (playerSide isEqualTo civilian);

        _ctrlButtonExperience ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;
            _display createDisplay "GW_displayExperience";
        }];

        _ctrlButtonKeychain ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;

            GW_displayKeys_Unit = player;
            _display createDisplay "GW_displayMyVehicles";
        }];

        _ctrlButtonInventory ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;
            _display createDisplay "GW_displayInventory";
        }];

        _ctrlButtonWanted ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _display = ctrlParent _ctrl;

            // Open menu
            [_display] spawn GW_client_fnc_arrestWarrantsRequest;
        }];

        _ctrlButtonSettlements ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;
        }];

        _ctrlButtonDisconnect ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;

            [_display] spawn {
                scriptName "GW_displayMenu_script: wait for logout confirm";
                scopeName "main";

                disableSerialization;
                params [["_display", displayNull, [displayNull]]];

                if !([
                    "You want to leave us?",
                    "If you connect again within this same restart you will have to wait 5 minutes in the loading screen due to a log-in timer to prevent abuse. All your data will automatically save when you log out, unless you exit your game in any other way. Are you sure you want to log out to lobby?",
                    "LOG OUT",
                    "STAY",
                    findDisplay 46
                ] call GW_client_fnc_guiPrompt) exitWith {};

                _display closeDisplay 2;
                call GW_client_fnc_onLogout
            }
        }];
    };
    case "loadButtons": {
        scriptName "GW_displayMenu_script: loadButtons";
        scopeName "main";

        _args params [["_display", displayNull, [displayNull]]];

        for "_i" from 1 to 12 do {
            private _ctrlButton = _display displayCtrl IDC_DISPLAYMENU_BUTTON + _i;
            _ctrlButton ctrlSetFade 1;
            _ctrlButton ctrlCommit 0;
        };

        for "_i" from 1 to 12 do {
            private _ctrlButton = _display displayCtrl IDC_DISPLAYMENU_BUTTON + _i;
            _ctrlButton ctrlSetFade 0;
            _ctrlButton ctrlCommit 0.02;

            waitUntil {ctrlCommitted _ctrlButton}
        }
    };
    case "onUnload": {call GW_client_fnc_guiLoadHUD}
}
