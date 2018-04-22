#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displayEquipmentShop.sqf
 *
 * Parameter(s):
 *     0: STRING - Event
 *     1: ARRAY - Arguments
 *
 * Description:
 *     Master UI handler for Equipment Shops
 */
#define VAR_SHOPDISPLAYNAME GW_displayEquipmentShop_displayName
#define VAR_SHOPEQUIPMENTARRAY GW_displayEquipmentShop_equipment
#define SELF GW_displayEquipmentShop_Script

scriptName "GW_displayEquipmentShop_Script: main";
scopeName "main";

disableSerialization;
if (!params [["_event", "", [""]], ["_args", [], [[]]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

switch (_event) do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlButtonCancel = _display displayCtrl IDC_DISPLAYEQUIPMENTSHOP_BUTTONCLOSE;
        _ctrlButtonCancel ctrlAddEventHandler ["ButtonClick", {
            closeDialog 0
        }];

        private _ctrlTitle = _display displayCtrl IDC_DISPLAYEQUIPMENTSHOP_HEADER;
        _ctrlTitle ctrlSetText VAR_SHOPDISPLAYNAME;

        private _ctrlEquipmentTree = _display displayCtrl IDC_DISPLAYEQUIPMENTSHOP_TREEEQUIPMENT;
        _ctrlEquipmentTree ctrlAddEventHandler ["TreeSelChanged", {
            params [
                ["_ctrl", controlNull, [controlNull]],
                ["_selectionPath", [], [[]]]
            ];
            private _display = ctrlParent _ctrl;

            private _tvData = _ctrl tvData _selectionPath;
            if (_tvData isEqualTo "") exitWith {};

            private _dataArray = parseSimpleArray _tvData;
            _dataArray params [
                ["_itemClassname", "", [""]],
                ["_displayName", "", [""]],
                ["_picture", "", [""]],
                ["_purchasePrice", 0, [0]],
                ["_sellPrice", 0, [0]],
                ["_levelCategoryIndex", 0, [0]],
                ["_levelCategoryLevelRequired", 0, [0]]
            ];

            private _ctrlTextDisplayname = _display displayCtrl IDC_DISPLAYEQUIPMENTSHOP_WEAPONNAME;
            _ctrlTextDisplayname ctrlSetText _displayName;

            if !(_picture isEqualTo "") then {
                private _ctrlItemPicture = _display displayCtrl IDC_DISPLAYEQUIPMENTSHOP_WEAPONPREVIEW;
                _ctrlItemPicture ctrlSetStructuredText parseText format ["<br/><img align='center' size='%1' image='%2' />", 3.3 * safezoneH, _picture]
            };

            private _ctrlPurchasePrice = _display displayCtrl IDC_DISPLAYEQUIPMENTSHOP_WEAPONPRICE;
            _ctrlPurchasePrice ctrlSetText ("£" + str _purchasePrice);

            private _ctrlLevelRequiredText = _display displayCtrl IDC_DISPLAYEQUIPMENTSHOP_EXPERIENCEREQUIREDTEXT;
            if (_levelCategoryIndex isEqualTo -1 || {_levelCategoryLevelRequired isEqualTo -1}) exitWith {
                _ctrlLevelRequiredText ctrlSetText "N/A"
            };
            _ctrlLevelRequiredText ctrlSetText format ["Level %1 in %2", _levelCategoryLevelRequired, [_levelCategoryIndex] call GW_client_fnc_experienceGetCategoryName]
        }];
        ["loadIntoTree", [_display, _ctrlEquipmentTree]] call SELF;

        private _ctrlButtonRefreshSearch = _display displayCtrl IDC_DISPLAYEQUIPMENTSHOP_BUTTONSEARCHREFRESH;
        _ctrlButtonRefreshSearch ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;

            private _ctrlInput = _display displayCtrl IDC_DISPLAYEQUIPMENTSHOP_INPUTSEARCH;
            _ctrlInput ctrlSetText "";

            private _ctrlTree = _display displayCtrl IDC_DISPLAYEQUIPMENTSHOP_TREEEQUIPMENT;
            ["loadIntoTree", [_display, _ctrlTree]] call SELF
        }];

        private _ctrlButtonPurchase = _display displayCtrl IDC_DISPLAYEQUIPMENTSHOP_BUTTONPURCHASE;
        _ctrlButtonPurchase ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;

            private _ctrlTree = _display displayCtrl IDC_DISPLAYEQUIPMENTSHOP_TREEEQUIPMENT;
            private _tvData = _ctrlTree tvData (tvCurSel _ctrlTree);
            if (_tvData isEqualTo "") exitWith {};

            private _dataArray = parseSimpleArray _tvData;
            _dataArray params [
                ["_itemClassname", "", [""]],
                ["_displayName", "", [""]],
                ["_picture", "", [""]],
                ["_purchasePrice", 0, [0]],
                ["_sellPrice", 0, [0]],
                ["_levelCategoryIndex", 0, [0]],
                ["_levelCategoryLevelRequired", 0, [0]]
            ];

            if !([_levelCategoryIndex] call GW_client_fnc_experienceGetCategoryLevel >= _levelCategoryLevelRequired) exitWith {
                [HINT_WARNING, "Insufficient Level", "You do not have the required level to purchase this item."] call GW_client_fnc_notificationsAdd
            };

            if ([0, _purchasePrice, 1] call GW_client_fnc_playersHandleMoney) then {
                [_itemClassname, true] spawn GW_client_fnc_external;

                [HINT_NORMAL, "Purchase Successful", format ["You successfully purchased a %1 for £%2. Open your inventory to change or use it, default is [I].", _displayName, _purchasePrice]] call GW_client_fnc_notificationsAdd;
                [LOG_INFO, format ["Purchased item %1 for £%2 in Equipment Shop", _displayName, _purchasePrice], _fnc_scriptName] call GW_server_fnc_log;

                // Give experience points
                private _experienceGain = 10 * (_purchasePrice / 1000);
                [LEVEL_WEAPONS, _experienceGain, "Purchasing Gear"] call GW_client_fnc_experienceCategoryAddExperience;

                [false] call GW_client_fnc_playerSyncRequest;
                [player] call GW_client_fnc_communicationUpdateComms;
            } else {
                [HINT_WARNING, "Insufficient Funds", "You have insufficient funds in your cash account. Fill up your pockets and try again."] call GW_client_fnc_notificationsAdd
            };
        }];
    };
    case "loadIntoTree": {
        _args params [
            ["_display", displayNull, [displayNull]],
            ["_ctrlTree", controlNull, [controlNull]]
        ];

        tvClear _ctrlTree;
        {
            _x params [
                ["_classname", "", [""]],
                ["_purchaseprice", 0, [0]],
                ["_sellprice", 0, [0]],
                ["_levelCategoryIndex", 0, [0]],
                ["_levelCategoryLevelRequired", 0, [0]],
                ["_condition", "", [""]],
                ["_overrideDisplayname", "", [""]]
            ];

            if ([_condition] call GW_client_fnc_doEvaluation) then {
                private _itemClass = [
                    (configFile >> "CfgWeapons" >> _classname),
                    (configFile >> "CfgMagazines" >> _classname)
                ] select (isClass (configFile >> "CfgMagazines" >> _classname));

                private _displayName = getText (_itemClass >> "displayName");
                private _picture = getText (_itemClass >> "picture");

                private _tvEntryName = [
                    _displayName,
                    _overrideDisplayname
                ] select !(_overrideDisplayname isEqualTo "");

                private _index = _ctrlTree tvAdd [[], _tvEntryName];
                _ctrlTree tvSetPicture [[_index], _picture];

                private _data = format ["[""%1"",""%2"",""%3"",%4,%5,%6,%7,""%8""]", _classname, _displayName, _picture, _purchasePrice, _sellPrice, _levelCategoryIndex, _levelCategoryLevelRequired, _condition];
                _ctrlTree tvSetData [[_index], _data];

                private _dlc = _itemClass >> "dlc";
                if (isText _dlc) then {
                    private _logo = getText (configFile >> "CfgMods" >> getText _dlc >> "logo");
                    _ctrlTree tvSetPictureRight [[_index], _logo];
                    _ctrlTree tvSetTooltip [[_index], format ["This item is part of the %1 DLC.", getText _dlc]]
                }
            }
        } count VAR_SHOPEQUIPMENTARRAY;

        tvExpandAll _ctrlTree;
        _ctrlTree tvSetCurSel [0]
    };
    case "onUnload": {

    }
}
