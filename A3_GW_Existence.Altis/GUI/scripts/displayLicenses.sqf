#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displayLicenses.sqf
 *
 * Parameter(s):
 *     0: STRING - Event
 *     1: ARRAY - Arguments
 *
 * Description:
 *     Master UI handler for licenses
 */
scriptName "GW_displayLicenses_Script: main";
scopeName "main";

#define SELF GW_displayLicenses_Script
#define VAR_LICENSETYPE GW_displayLicenses_licensesType

disableSerialization;

if !(
    params
    [
        ["_event", "", [""]],
        ["_args", [], [[]]]
    ]
) throw "Expected parameters";

switch (_event) do {
    case "onLoad": {
        _args params [ ["_display", displayNull, [displayNull]] ];

        private _ctrlButtonCancel = _display displayCtrl IDC_DISPLAYLICENSES_BUTTONCLOSE;
        private _ctrlButtonSearchReload = _display displayCtrl IDC_DISPLAYLICENSES_SEARCHREFRESH;
        private _ctrlTree = _display displayCtrl IDC_DISPLAYLICENSES_LICENSETREE;
        private _ctrlPurchaseLicense = _display displayCtrl IDC_DISPLAYLICENSES_BUTTONPURCHASE;

        _ctrlButtonSearchReload ctrlAddEventHandler
        [
            "ButtonClick",
            {
                params [["_ctrl", controlNull, [controlNull]]];
                private _display = ctrlParent _ctrl;
                private _ctrlInput = _display displayCtrl IDC_DISPLAYLICENSES_SEARCHINPUT;
                private _ctrlTree = _display displayCtrl IDC_DISPLAYLICENSES_LICENSETREE;

                // Set search input to none
                _ctrlInput ctrlSetText "";

                // Reload tree
                ["populateTree", [_display, _ctrlTree]] call SELF;
            }
        ];

        _ctrlTree ctrlAddEventHandler
        [
            "TreeSelChanged",
            {
                params
                [
                    ["_ctrl", controlNull, [controlNull]],
                    ["_path", [], [[]]]
                ];

                private _display = ctrlParent _ctrl;
                private _tvData = _ctrl tvData _path;
                private _licenseInformationArray = parseSimpleArray _tvData;
                private _ctrlDisplayName = _display displayCtrl IDC_DISPLAYLICENSES_SELECTEDLICENSENAMETEXT;
                private _ctrlPrice = _display displayCtrl IDC_DISPLAYLICENSES_SELECTEDLICENSETEXTPRICE;
                private _ctrlRequiredLevel = _display displayCtrl IDC_DISPLAYLICENSES_SELECTEDLICENSEREQUIREDLEVELTEXT;

                // No tree data
                if (_tvData isEqualTo "") exitWith {};

                _licenseInformationArray params
                [
                    ["_displayName", "", [""]],
                    ["_string", "", [""]],
                    ["_price", -1, [-1]],
                    ["_requiredCategoryLevel", 0, [0]],
                    ["_requiredLevel", 0, [0]]
                ];

                // Set display name of license
                _ctrlDisplayName ctrlSetText _displayName;

                // Set level to not applicable if no level
                // is needed.
                if (_requiredLevel isEqualTo -1) then { _ctrlRequiredLevel ctrlSetText "No Level Required"; };
                if (_price isEqualTo -1) then { _ctrlPrice ctrlSetText "N/A"; };

                private _requiredLevelCategory = [_requiredCategoryLevel] call GW_client_fnc_experienceGetCategoryName;
                private _price = [_price] call GW_client_fnc_currencyFormat;

                // Set price and required level text
                _ctrlPrice ctrlSetText _price;
                _ctrlRequiredLevel ctrlSetText format ["Level %1 in %2", _requiredLevel, _requiredLevelCategory];
            }
        ];

        // Add eventhandler to button for purchasing license
        _ctrlPurchaseLicense ctrlAddEventHandler
        [
            "ButtonClick",
            {
                params [ ["_ctrl", controlNull, [controlNull]] ];

                private _display = ctrlParent _ctrl;
                private _ctrlTree = _display displayCtrl IDC_DISPLAYLICENSES_LICENSETREE;
                private _tvData = _ctrlTree tvData (tvCurSel _ctrlTree);

                // Make sure there is any data
                if (_tvData isEqualTo "") exitWith { ["No TV data", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

                private _licenseInformationArray = parseSimpleArray _tvData;
                _licenseInformationArray params
                [
                    ["_displayName", "", [""]],
                    ["_licenseName", "", [""]],
                    ["_price", 0, [0]],
                    ["_requiredCategoryLevel", 0, [0]],
                    ["_requiredLevel", 0, [0]],
                    ["_condition", "", [""]]
                ];

                // Evaluate and make sure they have the permission
                // to purchase the license
                if !([_condition] call GW_client_fnc_doEvaluation) exitWith
                {
                    [HINT_WARNING, "License Notice", "You do not have the permission or experience to purchase this license"] call GW_client_fnc_notificationsAdd;
                };

                // Make sure they have a sufficient level to purchase the license
                if !([_requiredCategoryLevel] call GW_client_fnc_experienceGetCategoryLevel >= _requiredLevel) exitWith
                {
                    [HINT_WARNING, "License Notice", "You do not have the required level to purchase this license."] call GW_client_fnc_notificationsAdd;
                };

                // Make sure the money was able to be taken out of their account
                if ([0, _price, 1] call GW_client_fnc_playersHandleMoney) then
                {
                    // Notify
                    [
                        HINT_NORMAL,
                        "License Notice",
                        format
                        [
                            "You successfully purchased %1 for £%2. Good luck!",
                            _displayName,
                            _price
                        ]
                    ] call GW_client_fnc_notificationsAdd;

                    // Log purchase
                    [
                        LOG_INFO,
                        format
                        [
                            "Purchased license %1 for £%2",
                            _displayName,
                            _price
                        ],
                        _fnc_scriptName
                    ] remoteExecCall ["GW_server_fnc_log", 2];

                    // Add license to player
                    GW_player_licenses pushBack _licenseName;

                    // Give experience points
                    private _experienceSettings = [[LEVEL_TOOLSOFTHETRADE, 250], [LEVEL_REBELLIOUS, 1000]] select (VAR_LICENSETYPE == "Illegal");
                    [_experienceSettings select 0, _experienceSettings select 1, "Bought a license"] call GW_client_fnc_experienceCategoryAddExperience;

                    // Sync
                    [false] call GW_client_fnc_playerSyncRequest;
                }
                else
                {
                    // Notify
                    [
                        HINT_WARNING,
                        "Insufficient Funds",
                        "You have insufficient funds in your cash account. Fill up your pockets and try again."
                    ] call GW_client_fnc_notificationsAdd;
                };

                // Close the display
                _display closeDisplay 2;
            }
        ];

        // Populate tree with data
        ["populateTree", [_display, _ctrlTree]] call SELF;
    };
    case "populateTree":
    {
        _args params
        [
            ["_display", displayNull, [displayNull]],
            ["_ctrlTree", controlNull, [controlNull]]
        ];

        // Get all available licenses
        private _configLicenses = missionConfigFile >> "CfgLicenses" >> worldName >> "Licenses";
        private _licenses = "true" configClasses (_configLicenses >> VAR_LICENSETYPE);

        // Clear tree
        tvClear _ctrlTree;

        // Loop through available licenses
        {
            private _displayName = getText (_x >> "displayName");
            private _requiredCategoryLevel = getNumber (_x >> "requiredLevelCategory");
            private _requiredLevel = getNumber (_x >> "requiredLevel");
            private _price = getNumber (_x >> "price");
            private _condition = getText (_x >> "condition");
            private _licenseName = configName _x;

            // If they do not have the license, add it to the tree
            if !([_licenseName] call GW_client_fnc_licensingHasLicense) then
            {
                // Add tree entry
                private _index = _ctrlTree tvAdd [ [], _displayName ];

                // Set data for entry
                _ctrlTree tvSetData
                [
                    [_index],
                    format
                    [
                        "[""%1"",""%2"",%3,%4,%5,""%6""]",
                        _displayName,
                        _licenseName,
                        _price,
                        _requiredCategoryLevel,
                        _requiredLevel,
                        _condition
                    ]
                ];
            };

            true
        } count _licenses;

        // Expand tree and set first selection§
        tvExpandAll _ctrlTree;
        _ctrlTree tvSetCurSel [0];
    };
    case "onUnload":
    {
        VAR_LICENSETYPE = nil;
    };
};
