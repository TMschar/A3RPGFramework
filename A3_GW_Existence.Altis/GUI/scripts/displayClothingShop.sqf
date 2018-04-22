#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayClothingShop.sqf
*
*    Parameter(s):
*       0: STRING - Event
*       1: ARRAY - Arguments
*
*    Returns:
*        NOTHING
*
*    Description:
*        Master UI handler for Clothing Shop
*/
scriptName "GW_displayClothingShop_Script: main";
scopeName "main";

disableSerialization;

#define SELF GW_displayClothingShop_Script
#define VAR_SHOPTITLE GW_displayClothingShop_Title
#define VAR_SHOPCLASS GW_displayClothingShop_Class
#define VAR_CAMHANDLE GW_displayClothingShop_camHandle
#define VAR_GEAR GW_displayClothingShop_Gear
#define VAR_PURCHASEDGEAR GW_displayClothingShop_purchasedGear

if !(params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlHeaderTitle = _display displayCtrl IDC_DISPLAYCLOTHINGSHOP_TITLE;
        _ctrlHeaderTitle ctrlSetText VAR_SHOPTITLE;

        // Create a camera
        VAR_CAMHANDLE = "camera" camCreate (player modelToWorld [0, 100, 10]);
        VAR_CAMHANDLE camSetTarget player;
        VAR_CAMHANDLE camSetRelPos [1, 2, 2];
        VAR_CAMHANDLE cameraEffect ["INTERNAL", "BACK"];
        VAR_CAMHANDLE camCommit 0;

        VAR_GEAR = getUnitLoadout player;
        VAR_PURCHASEDGEAR = [];

        // Disable syncing
        [false] call GW_client_fnc_playersSyncHandler;

        private _ctrlTree = _display displayCtrl IDC_DISPLAYCLOTHINGSHOP_TREE;
        _ctrlTree ctrlAddEventHandler ["TreeSelChanged", {
            params [
                ["_ctrlTree", controlNull, [controlNull]],
                ["_treeSelectionPath", [], [[]]]
            ];
            private _display = ctrlParent _ctrlTree;

            private _tvData = _ctrlTree tvData _treeSelectionPath;
            if (_tvData isEqualTo "") exitWith {
                diag_log "No tree data"
            };

            private _data = parseSimpleArray _tvData;
            _data params [
                ["_class", "", [""]],
                ["_condition", "", [""]],
                ["_displayName", "", [""]],
                ["_purchasePrice", 0, [0]],
                ["_sellPrice", 0, [0]],
                ["_levelCategoryIndex", 0, [0]],
                ["_levelRequired", 0, [0]]
            ];

            // Add clothing and texture
            [_class, true] call GW_client_fnc_external;
            [player] call GW_client_fnc_unitSetTextures;

            private _ctrlTextName = _display displayCtrl IDC_DISPLAYCLOTHINGSHOP_NAMEINPUT;
            _ctrlTextName ctrlSetText _displayName;

            private _ctrlTextPrice = _display displayCtrl IDC_DISPLAYCLOTHINGSHOP_PRICE;
            _ctrlTextPrice ctrlSetText str _purchasePrice;

            if (_levelCategoryIndex isEqualTo -1 || {_levelRequired isEqualTo -1}) exitWith {};

            private _ctrlTextLevelRequired = _display displayCtrl IDC_DISPLAYCLOTHINGSHOP_LEVELREQUIRED;
            _ctrlTextLevelRequired ctrlSetText format ["Level %1 in %2", _levelRequired, [_levelCategoryIndex] call GW_client_fnc_experienceGetCategoryName];
        }];
        ["loadTreeEntries", [_display, _ctrlTree]] call SELF;

        private _ctrlButtonPurchase = _display displayCtrl IDC_DISPLAYCLOTHINGSHOP_BUTTONPURCHASE;
        _ctrlButtonPurchase ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;

            private _ctrlTree = _display displayCtrl IDC_DISPLAYCLOTHINGSHOP_TREE;
            private _tvData = _ctrlTree tvData (tvCurSel _ctrlTree);
            if (_tvData isEqualTo "") exitWith {
                diag_log "No tree data"
            };

            private _data = parseSimpleArray _tvData;
            _data params [
                ["_class", "", [""]],
                ["_condition", "", [""]],
                ["_displayName", "", [""]],
                ["_purchasePrice", 0, [0]],
                ["_sellPrice", 0, [0]],
                ["_levelCategoryIndex", 0, [0]],
                ["_levelRequired", 0, [0]]
            ];

            if !([_levelCategoryIndex] call GW_client_fnc_experienceGetCategoryLevel >= _levelRequired) exitWith {
                [HINT_WARNING, "Insufficient Level", "You do not have the required level to purchase this clothing."] call GW_client_fnc_notificationsAdd
            };

            if ([0, _purchasePrice, 1] call GW_client_fnc_playersHandleMoney) then {
                [_class, true] call GW_client_fnc_external;
                VAR_PURCHASEDGEAR pushback _class;

                [player] call GW_client_fnc_unitSetTextures;

                [HINT_NORMAL, "Purchase Successful", format ["You successfully purchased %1 for £%2. Open your inventory to change or use it, default is [I].", _displayName, _purchasePrice]] call GW_client_fnc_notificationsAdd;
                [LOG_INFO, format ["Purchased clothing %1 for £%2 in Clothing Shop", _displayName, _purchasePrice], _fnc_scriptName] call GW_server_fnc_log;

                false call GW_client_fnc_playerSyncRequest
            } else {
                [HINT_WARNING, "Insufficient Funds", "You have insufficient funds in your cash account. Fill up your pockets and try again."] call GW_client_fnc_notificationsAdd
            }
        }];

        private _ctrlButtonRefresh = _display displayCtrl IDC_DISPLAYCLOTHINGSHOP_BUTTONSEARCHREFRESH;
        _ctrlButtonRefresh ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;

            private _ctrlSearchInput = IDC_DISPLAYCLOTHINGSHOP_SEARCHINPUT;
            _ctrlSearchInput ctrlSetText "";

            private _ctrlTree = _display displayCtrl IDC_DISPLAYCLOTHINGSHOP_TREE;
            ["loadTreeEntries", [_display, _ctrlTree]] call SELF
        }]
    };
    case "loadTreeEntries": {
        _args params [
            ["_display", displayNull, [displayNull]],
            ["_ctrlTree", controlNull, [controlNull]]
        ];

        private _clothing = getArray (VAR_SHOPCLASS >> "clothing");
        {
            _x params [
                ["_class", "", [""]],
                ["_purchasePrice", 0, [0]],
                ["_sellPrice", 0, [0]],
                ["_levelCategoryIndex", 0, [0]],
                ["_levelRequired", 0, [0]],
                ["_condition", "", [""]],
                ["_overrideDisplayName", "", [""]]
            ];

            if ([_condition] call GW_client_fnc_doEvaluation) then {
                private _defaultConfig = switch true do {
                    case (isClass (configFile >> "CfgVehicles" >> _class)): {
                        configFile >> "CfgVehicles" >> _class
                    };
                    case (isClass (configFile >> "CfgWeapons" >> _class)): {
                        configFile >> "CfgWeapons" >> _class
                    };
                    case (isClass (configFile >> "CfgGlasses" >> _class)): {
                        configFile >> "CfgGlasses" >> _class
                    };
                    default {
                        configNull
                    }
                };

                private _picture = getText (_defaultConfig >> "picture");
                private _displayName = [
                    getText (_defaultConfig >> "displayName"),
                    _overrideDisplayName
                ] select !(_overrideDisplayName isEqualTo "");

                private _index = _ctrlTree tvAdd [[], _displayName];
                _ctrlTree tvSetData [[_index], format ["[""%1"",""%2"",""%3"",%4,%5,%6,%7]", _class, _condition, _displayName, _purchasePrice, _sellPrice, _levelCategoryIndex, _levelRequired]];
                _ctrlTree tvSetPicture [[_index], _picture];

                private _dlc = _defaultConfig >> "dlc";
                if (isText _dlc) then {
                    private _logo = getText (configFile >> "CfgMods" >> getText _dlc >> "logo");
                    _ctrlTree tvSetPictureRight [[_index], _logo];
                    _ctrlTree tvSetTooltip [[_index], format ["This item is part of the %1 DLC.", getText _dlc]]
                }
            }
        } count _clothing;

        tvExpandAll _ctrlTree;
        _ctrlTree tvSetCurSel [0]
    };
    case "onUnload": {
        VAR_CAMHANDLE cameraEffect ["terminate","back"];
        camDestroy VAR_CAMHANDLE;

        player setUnitLoadout GW_displayClothingShop_Gear;
        {
            [_x, true] call GW_client_fnc_external;
            true
        } count VAR_PURCHASEDGEAR;

        [player] call GW_client_fnc_unitSetTextures;

        VAR_SHOPTITLE = nil;
        VAR_SHOPCLASS = nil;
        VAR_CAMHANDLE = nil;
        VAR_PURCHASEDGEAR = nil;
        VAR_GEAR = nil;

        // Start syncing again
        [true] call GW_client_fnc_playersSyncHandler
    }
}
