#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displayItemsShop.sqf
 *
 * Parameter(s):
 *     0: STRING - Event
 *     1: ARRAY  - Arguments
 */
#define SELF GW_displayItemsShop_script
#define VAR_TITLE GW_displayItemsShop_title
#define VAR_CLASS GW_displayItemsShop_class
#define HINT_TITLE "Items Shop Notice"

scriptName "GW_displayItemsShop_script: main";
scopeName "main";

params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
];

switch (_event) do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlTitle = _display displayCtrl IDC_DISPLAYITEMSSHOP_TITLE;
        _ctrlTitle ctrlSetText VAR_TITLE;

        private _ctrlSearchEdit = _display displayCtrl IDC_DISPLAYITEMSSHOP_SEARCH;
        private _ctrlSearchButton = _display displayCtrl IDC_DISPLAYITEMSSHOP_BUTTONSEARCH;

        private _ctrlListItemsFilter = _display displayCtrl IDC_DISPLAYITEMSSHOP_ITEMSFILTER;
        private _ctrlListItems = _display displayCtrl IDC_DISPLAYITEMSSHOP_ITEMSLIST;

        // Init listbox sorting (adds arrows and allows sorting)
        [_ctrlListItemsFilter, _ctrlListItems] call BIS_fnc_initListNBoxSorting;

        private _ctrlAmountEditInput = _display displayCtrl IDC_DISPLAYITEMSSHOP_AMOUNTINPUT;
        private _ctrlAmountButtonPlus = _display displayCtrl IDC_DISPLAYITEMSSHOP_AMOUNTPLUS;
        private _ctrlAmountButtonMinus = _display displayCtrl IDC_DISPLAYITEMSSHOP_AMOUNTMINUS;

        _ctrlAmountButtonPlus ctrlAddEventHandler ["ButtonClick", { ["modifyAmountInput", [_this select 0, true]] call SELF; }];
        _ctrlAmountButtonMinus ctrlAddEventHandler ["ButtonClick", { ["modifyAmountInput", [_this select 0, false]] call SELF; }];

        private _ctrlInventoryProgressBar = _display displayCtrl IDC_DISPLAYITEMSSHOP_PROGRESSBAR;
        private _ctrlInventoryProgressText = _display displayCtrl IDC_DISPLAYITEMSSHOP_PROGRESSBARTEXT;

        private _ctrlFooter = _display displayCtrl IDC_DISPLAYITEMSSHOP_FOOTER;
        private _ctrlFooterButtonBuy = _ctrlFooter controlsGroupCtrl IDC_DISPLAYITEMSSHOP_FOOTER_BUTTONBUY;
        private _ctrlFooterButtonSell = _ctrlFooter controlsGroupCtrl IDC_DISPLAYITEMSSHOP_FOOTER_BUTTONSELL;

        _ctrlFooterButtonBuy ctrlAddEventHandler ["ButtonClick", { ["buyItem", [_this select 0]] call SELF; }];
        _ctrlFooterButtonSell ctrlAddEventHandler ["ButtonClick", { ["sellItem", [_this select 0]] call SELF; }];

        // Load shop items
        ["load", [_display]] call SELF;
    };
    case "modifyAmountInput": {
        _args params [
            ["_ctrl", controlNull, [controlNull]],
            ["_plus", false, [false]]
        ];

        private _display = ctrlParent _ctrl;

        private _ctrlEditAmount = _display displayCtrl IDC_DISPLAYITEMSSHOP_AMOUNTINPUT;
        private _ctrlText = ctrlText _ctrlEditAmount;
        private _currentAmount = parseNumber _ctrlText;
        private _newAmount = 0;

        // Get new amount
        _newAmount = [(_currentAmount - 1), (_currentAmount + 1)] select _plus;
        if (_newAmount < 1) then { _newAmount = 1; };

        // Update ctrl input
        _ctrlEditAmount ctrlSetText str _newAmount;
    };
    case "itemsAmount": {
        scopeName "case";

        _args params [ ["_display", displayNull, [displayNull]] ];

        private _ctrlEditAmount = _display displayCtrl IDC_DISPLAYITEMSSHOP_AMOUNTINPUT;
        private _ctrlTextAmount = ctrlText _ctrlEditAmount;
        private _itemsAmount = parseNumber _ctrlTextAmount;

        // Return
        _itemsAmount breakOut "case";
    };
    case "buyItem":
    {
        _args params [ ["_ctrl", controlNull, [controlNull]] ];

        private _display = ctrlParent _ctrl;
        private _ctrlListItems = _display displayCtrl IDC_DISPLAYITEMSSHOP_ITEMSLIST;
        private _itemData = _ctrlListItems lnbData [lnbCurSelRow _ctrlListItems, 0];

        if (_itemData isEqualTo "") exitWith { ["No data", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

        // Sort out data from the data of selected row.
        // This is an array inside a string so we need
        // to use parseSimpleArray command.
        _itemDataArray = parseSimpleArray _itemData;
        _itemDataArray params ["_itemClassname", "_buyPrice", "_sellPrice"];

        // Make sure they cannot buy if the price is nothing
        if (_buyPrice isEqualTo -1) exitWith
        {
            [HINT_AMBER, HINT_TITLE, "You cannot purchase this item."] call GW_client_fnc_notificationsAdd;
        };

        // Check if player have space for the item
        private _amount = ["itemsAmount", [_display]] call SELF;
        if (_amount >= 15) exitWith { [HINT_AMBER, HINT_TITLE, "You can only purchase 15 items at a time."] call GW_client_fnc_notificationsAdd; };

        private _successes = 0;
        for "_i" from 1 to _amount do
        {
            if ([0, _buyPrice, 1] call GW_client_fnc_playersHandleMoney && {[player, _itemClassname, 1, false] call GW_client_fnc_virtualInventoryChange}) then
            {
                _successes = _successes + 1;
            };
        };

        if (_successes >= 1) then
        {
            private _itemInfo = [_itemClassname] call GW_client_fnc_virtualInventoryGetItemInfo;
            private _displayName = _itemInfo select 0;
            private _illegal = _itemInfo select 7;
            private _totalPurchasePrice = _buyPrice * _successes;
            _totalPurchasePrice = [_totalPurchasePrice] call GW_client_fnc_currencyFormat;

            // Notify
            [
                HINT_NORMAL,
                HINT_TITLE,
                format
                [
                    "You bought %1x %3 for %2",
                    _successes,
                    _totalPurchasePrice,
                    _displayName
                ]
            ] call GW_client_fnc_notificationsAdd;

            // Give experience if its an illegal item
            if (_illegal) then
            {
                [LEVEL_REBELLIOUS, 20 * _successes, "Purchasing an illegal substance"] call GW_client_fnc_experienceCategoryAddExperience;
            };
        }
        else
        {
            [HINT_WARNING, HINT_TITLE, "You failed to purchase the item(s)"] call GW_client_fnc_notificationsAdd;
        };

        // Update
        ["load", [_display]] call SELF;
    };
    case "sellItem":
    {
        _args params [ ["_ctrl", controlNull, [controlNull]] ];

        private _display = ctrlParent _ctrl;
        private _ctrlListItems = _display displayCtrl IDC_DISPLAYITEMSSHOP_ITEMSLIST;
        private _itemData = _ctrlListItems lnbData [lnbCurSelRow _ctrlListItems, 0];

        if (_itemData isEqualTo "") exitWith { ["No data", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

        // Sort out data from the data of selected row.
        // This is an array inside a string so we need
        // to use parseSimpleArray command.
        _itemDataArray = parseSimpleArray _itemData;
        _itemDataArray params ["_itemClassname", "_buyPrice", "_sellPrice"];

        // Make sure they cannot buy if the price is nothing
        if (_sellPrice isEqualTo -1) exitWith
        {
            [HINT_AMBER, HINT_TITLE, "You cannot sell this item."] call GW_client_fnc_notificationsAdd;
        };

        private _amount = ["itemsAmount", [_display]] call SELF;
        if (_amount >= 15) exitWith { [HINT_AMBER, HINT_TITLE, "You can only sell 15 items at a time."] call GW_client_fnc_notificationsAdd; };

        private _successes = 0;
        for "_i" from 1 to _amount do
        {
            if ([player, _itemClassname, 0, false] call GW_client_fnc_virtualInventoryChange && {[1, _sellPrice, 1] call GW_client_fnc_playersHandleMoney}) then
            {
                _successes = _successes + 1;
            };
        };

        if (_successes >= 1) then
        {
            private _itemInfo = [_itemClassname] call GW_client_fnc_virtualInventoryGetItemInfo;
            private _displayName = _itemInfo select 0;
            private _illegal = _itemInfo select 7;
            private _totalSellPrice = _sellPrice * _successes;
            _totalSellPrice = [_totalSellprice] call GW_client_fnc_currencyFormat;

            // Notify
            [
                HINT_NORMAL,
                HINT_TITLE,
                format
                [
                    "You sold %1x %2 for %3",
                    _successes,
                    _displayName,
                    _totalSellPrice
                ]
            ] call GW_client_fnc_notificationsAdd;

            // Give experience if its an illegal item
            if (_illegal && {_buyPrice isEqualTo -1}) then
            {
                [LEVEL_REBELLIOUS, 5 * _successes, "Selling an illegal substance"] call GW_client_fnc_experienceCategoryAddExperience;
            };
        }
        else
        {
            [HINT_WARNING, HINT_TITLE, "You failed to sell the item(s)"] call GW_client_fnc_notificationsAdd;
        };

        // Update
        ["load", [_display]] call SELF;
    };
    case "load": {
        _args params [ ["_display", displayNull, [displayNull]] ];

        private _ctrlListItems = _display displayCtrl IDC_DISPLAYITEMSSHOP_ITEMSLIST;
        private _availableItems = getArray (VAR_CLASS >> "items");
        private _myInventory = player getVariable ["virtualinventory_items", []];

        // Clear items of listnbox
        lnbClear _ctrlListItems;

        // Loop through available items
        {
            _x params [
                ["_class", "", [""]],
                ["_overridePurchasePrice", -1, [-1]],
                ["_overrideSellPrice", -1, [-1]],
                ["_condition", "", [""]]
            ];

            private _configClass = missionConfigFile >> "CfgVirtualItems" >> "Items" >> _class;
            private _conditionSecond = getText (_configClass >> "condition");
            if ([_condition] call GW_client_fnc_doEvaluation && {[_conditionSecond] call GW_client_fnc_doEvaluation}) then {
                private _displayName = getText (_configClass >> "displayName");
                private _buyPrice = getNumber (_configClass >> "buy");
                private _sellPrice = getNumber (_configClass >> "sell");
                private _weight = getNumber (_configClass >> "weight");
                private _illegal = getNumber (_configClass >> "illegal");
                private _function = getText (_configClass >> "function");
                private _iconPath = getText (_configClass >> "icon");
                private _myQuantity = [_class, _myInventory] call GW_ext_fnc_arraysInArrayCount;
                private _illegalText = ["No", "Yes"] select _illegal;
                private _usableText = ["Yes", "No"] select (_function isEqualTo "");

                // Handle overriden prices
                if (_overridePurchasePrice != -1) then { _buyPrice = _overridePurchasePrice; };
                if (_overrideSellPrice != -1) then { _sellPrice = _overrideSellPrice; };

                // Add row
                _ctrlListItems lnbAddRow [
                    _displayName,
                    _buyPrice call GW_client_fnc_currencyFormat,
                    _sellPrice call GW_client_fnc_currencyFormat,
                    str _myQuantity,
                    str _weight,
                    _illegalText,
                    _usableText
                ];

                // Set data
                private _data = format ["[""%1"",%2,%3]", _class, _buyPrice, _sellPrice];
                _ctrlListItems lnbSetData [[_forEachIndex, 0], _data];

                // Set icon
                if (_iconPath != "") then { _ctrlListItems lnbSetPicture [[_forEachIndex, 0], _iconPath]; };
            };
        } forEach _availableItems;

        // Choose first item
        _ctrlListItems lnbSetCurSelRow 0;

        // Update inventory progress bar
        private _ctrlInventoryProgressBar = _display displayCtrl IDC_DISPLAYITEMSSHOP_PROGRESSBAR;
        private _ctrlInventoryProgressText = _display displayCtrl IDC_DISPLAYITEMSSHOP_PROGRESSBARTEXT;
        private _space = [player] call GW_client_fnc_virtualInventorySpace;
        private _usedSpace = [player] call GW_client_fnc_virtualInventoryCalculateTotalWeight;

        _ctrlInventoryProgressText ctrlSetText format ["%1 / %2", _usedSpace, _space];
        _ctrlInventoryProgressBar progressSetPosition (_usedSpace / _space);
    };
    case "onUnload": {

        // Sync
        [false] call GW_client_fnc_playerSyncRequest;

    };
};
