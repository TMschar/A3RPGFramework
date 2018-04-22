#include "script_component.hpp"
/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: displayInventory.sqf
*
* Parameter(s):
*    0: STRING - Event
*    1: ARRAY - Arguments
*
* Description:
*    Master UI handler for Inventory
*/
#define SELF GW_displayInventory_Script

scriptName "GW_displayInventory_Script: main";
scopeName "main";

disableSerialization;
if (!params [["_event", "", [""]], ["_args", [], [[]]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
switch (_event) do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlGroupFooter = _display displayCtrl IDC_DISPLAYINVENTORY_FOOTER;
        private _ctrlButtonGive = _ctrlGroupFooter controlsGroupCtrl 25;
        private _ctrlButtonUse = _ctrlGroupFooter controlsGroupCtrl 15;
        private _ctrlButtonDestroy = _ctrlGroupFooter controlsGroupCtrl 35;

        _ctrlButtonDestroy ctrlAddEventHandler ["ButtonClick", {
            ["onDestroyItem", [ctrlParent (_this select 0)]] call SELF;
        }];
        _ctrlButtonUse ctrlAddEventHandler ["ButtonClick", {
            ["onUseItem", [ctrlParent (_this select 0)]] call SELF;
        }];
        _ctrlButtonGive ctrlAddEventHandler ["ButtonClick", {
            ["onGiveItem", [ctrlParent (_this select 0)]] call SELF;
        }];

        // Initialize inventory section
        ["initInventorySection", [_display]] call SELF;
    };
    case "onUseItem": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlGroupInventory = _display displayCtrl IDC_DISPLAYINVENTORY_GROUPINVENTORY;
        private _ctrlList = _ctrlGroupInventory controlsGroupCtrl IDC_DISPLAYINVENTORY_GROUPINVENTORY_LIST;
        private _itemClassname = _ctrlList lnbData [lnbCurSelRow _ctrlList, 0];

        // Error check
        if (_itemClassname isEqualTo "") exitWith {};

        // Use item
        [_itemClassname, [_itemClassname]] call GW_client_fnc_virtualInventoryUseItem;

        // Reload inventory
        ["loadInventory", [_display]] call SELF;
    };
    case "onDestroyItem": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlGroupInventory = _display displayCtrl IDC_DISPLAYINVENTORY_GROUPINVENTORY;
        private _ctrlList = _ctrlGroupInventory controlsGroupCtrl IDC_DISPLAYINVENTORY_GROUPINVENTORY_LIST;
        private _itemClassname = _ctrlList lnbData [lnbCurSelRow _ctrlList, 0];

        // Error check
        if (_itemClassname isEqualTo "") exitWith {};

        // Remove items x amount of times
        if !([player, _itemClassname, 0] call GW_client_fnc_virtualInventoryChange) exitWith {};

        // Notify
        [HINT_SUCCESS, "Item Destroyed", "You successfully destroyed the item."] call GW_client_fnc_notificationsAdd;

        // Update inventory dialog
        ["loadInventory", [_display]] call SELF
    };
    case "onGiveItem": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlGroupInventory = _display displayCtrl IDC_DISPLAYINVENTORY_GROUPINVENTORY;
        private _ctrlList = _ctrlGroupInventory controlsGroupCtrl IDC_DISPLAYINVENTORY_GROUPINVENTORY_LIST;
        private _ctrlListPlayers = _ctrlGroupInventory controlsGroupCtrl IDC_DISPLAYINVENTORY_GROUPINVENTORY_NEARPLAYERSLIST;
        private _itemClassname = _ctrlList lnbData [lnbCurSelRow _ctrlList, 0];
        private _receiverUID = _ctrlListPlayers lbData (lbCurSel _ctrlListPlayers);

        // Error checks
        if (_itemClassname isEqualTo "") exitWith {};
        if (_receiverUID isEqualTo "") exitWith {};

        // Give item
        private _unitReceiver = [_receiverUID] call GW_client_fnc_getUnitByUID;
        [_unitReceiver, _itemClassname] call GW_client_fnc_virtualInventoryGiveItem;
    };
    case "initInventorySection": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlGroupInventory = _display displayCtrl IDC_DISPLAYINVENTORY_GROUPINVENTORY;
        private _ctrlFilter = _ctrlGroupInventory controlsGroupCtrl IDC_DISPLAYINVENTORY_GROUPINVENTORY_FILTER;
        private _ctrlList = _ctrlGroupInventory controlsGroupCtrl IDC_DISPLAYINVENTORY_GROUPINVENTORY_LIST;
        private _ctrlComboPlayers = _ctrlGroupInventory controlsGroupCtrl IDC_DISPLAYINVENTORY_GROUPINVENTORY_NEARPLAYERSLIST;

        // Setup combo listbox with players for the player
        // to be able to select a player to give an item to
        private _nearbyPlayers = ALLPLAYERSNOHC select {_x distance player < 5};
        {
            // Make sure the unit is not protected
            if !([_x] call GW_client_fnc_unitIsProtected) then {
                private _index = _ctrlComboPlayers lbAdd (name _x);
                _ctrlComboPlayers lbSetData [_index, getPlayerUID player]
            };
            true
        } count (_nearbyPlayers - [player]);

        // Init listnbox sorting
        [_ctrlFilter, _ctrlList] call BIS_fnc_initListNBoxSorting;

        // Load inventory
        ["loadInventory", [_display]] call SELF;
    };
    case "loadInventory": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlGroupInventory = _display displayCtrl IDC_DISPLAYINVENTORY_GROUPINVENTORY;
        private _ctrlList = _ctrlGroupInventory controlsGroupCtrl IDC_DISPLAYINVENTORY_GROUPINVENTORY_LIST;
        private _ctrlProgress = _ctrlGroupInventory controlsGroupCtrl IDC_DISPLAYINVENTORY_GROUPINVENTORY_PROGRESS;
        private _ctrlProgressText = _ctrlGroupInventory controlsGroupCtrl IDC_DISPLAYINVENTORY_GROUPINVENTORY_PROGRESSTEXT;
        private _space = player call GW_client_fnc_virtualInventorySpace;;
        private _usedSpace = player call GW_client_fnc_virtualInventoryCalculateTotalWeight;

        // Set text and update progress bar
        _ctrlProgressText ctrlSetText format ["%1 / %2", _usedSpace, _space];
        _ctrlProgress progressSetPosition (_usedSpace / _space);

        // Run this twice, in order to get both my, and the
        // vehicle inventory setup
        for "_i" from 0 to 1 do {
            private _added = [];
            private _items = player call GW_client_fnc_virtualInventoryReturn;

            // Clear list
            lnbClear _ctrlList;

            // Loop through data
            {
                if !(_x in _added) then {
                    _added pushBack _x;

                    private _itemInfo = _x call GW_client_fnc_virtualInventoryGetItemInfo;
                    private _displayName = _itemInfo param [0, "", [""]];
                    private _iconPath = _itemInfo param [1, "", [""]];
                    private _weight = _itemInfo param [2, 0, [0]];
                    private _function = _itemInfo param [4, "", [""]];
                    private _extInfo = _itemInfo param [6, [], [[]]];
                    private _type = _extInfo param [1, 0, [0]];
                    private _quantity = [_x, _items] call GW_ext_fnc_arraysInArrayCount;
                    private _totalWeight = _quantity * _weight;
                    private _usable = ["Yes", "No"] select (_function isEqualTo "");

                    // Add into list and set picture and data
                    private _index = _ctrlList lnbAddRow [_displayName, str _type, _usable, str _weight, str _totalWeight, str _quantity];
                    _ctrlList lnbSetPicture [[_index, 0], _iconPath];
                    _ctrlList lnbSetData [[_index, 0], _x]
                };
                true;
            } count _items;
        };
    };
    case "onUnload": {}
}