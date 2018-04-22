#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displayVehicleInventory.sqf
 *
 * Parameter(s):
 *     0: STRING - Event in switch to execute
 *     1: ARRAY  - Array with arguments from display
 */
#define SELF GW_displayVehicleInventory_script
#define VAR_CONTAINER GW_displayVehicleInventory_vehicle
#define VAR_LASTLIST GW_displayVehicleInventory_lastList
#define HINT_TITLE "Container Notice"
#define LIST_VEH 0
#define LIST_MY 1

scriptName "GW_client_fnc_displayVehicleInventory: main";
scopeName "main";

if (!params [["_event", "", [""]], ["_args", [], [[]]]]) exitWith { ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
switch (_event) do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        // Lists and filters
        private _ctrlListVehicleInventory = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_VEHICLEINVENTORYLIST;
        private _ctrlListFilterVehicleInventory = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_VEHICLEINVENTORYFILTER;
        private _ctrlListMyInventory = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_MYINVENTORYLIST;
        private _ctrlListFilterMyInventory = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_MYINVENTORYFILTER;

        // Footer
        private _ctrlControlsGroupFooter = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_FOOTER;
        private _ctrlButtonRemove = _ctrlControlsGroupFooter controlsGroupCtrl IDC_DISPLAYVEHICLEINVENTORY_FOOTER_BUTTONDESTROY;
        private _ctrlButtonTake = _ctrlControlsGroupFooter controlsGroupCtrl IDC_DISPLAYVEHICLEINVENTORY_FOOTER_BUTTONTAKE;
        private _ctrlButtonStore = _ctrlControlsGroupFooter controlsGroupCtrl IDC_DISPLAYVEHICLEINVENTORY_FOOTER_BUTTONSTORE;

        private _ctrlButtonPlusAmount = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_ITEMAMOUNTPLUS;
        private _ctrlButtonMinusAmount = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_ITEMAMOUNTMINUS;
        private _ctrlTextVehicleInventoryTitle = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_VEHICLEINVENTORYTITLE;

        // Set the title to have the displayname of object
        private _vehicleDisplayName = [typeOf VAR_CONTAINER] call GW_client_fnc_vehicleGetDisplayName;

        _ctrlTextVehicleInventoryTitle ctrlSetText format ["%1's Inventory", _vehicleDisplayName];

        // Add eventhandlers
        _ctrlButtonRemove ctrlAddEventHandler ["ButtonClick", {
            private _display = ctrlParent param [0, controlNull, [controlNull]];
            ["removeItems", [_display]] call SELF;
        }];
        _ctrlButtonStore ctrlAddEventHandler ["ButtonClick", {
            private _display = ctrlParent param [0, controlNull, [controlNull]];
            ["swapItems", [_display, true]] call SELF;
        }];
        _ctrlButtonTake ctrlAddEventHandler ["ButtonClick", {
            private _display = ctrlParent param [0, controlNull, [controlNull]];
            ["swapItems", [_display, false]] call SELF;
        }];
        _ctrlButtonPlusAmount ctrlAddEventHandler ["ButtonClick", {
            private _display = ctrlParent param [0, controlNull, [controlNull]];
            ["modifyAmountInput", [_display, true]] call SELF;
        }];
        _ctrlButtonMinusAmount ctrlAddEventhandler ["ButtonClick", {
            private _display = ctrlParent param [0, controlNull, [controlNull]];
            ["modifyAmountInput", [_display, false]] call SELF;
        }];
        _ctrlListVehicleInventory ctrlAddEventHandler ["LBSelChanged", { VAR_LASTLIST = "CONTAINER"; }];
        _ctrlListMyInventory ctrlAddEventHandler ["LBSelChanged", { VAR_LASTLIST = "SELF"; }];

        // Init listbox sorting with the filters for the lists. This will
        // add arrows and allow sorting the list to the filters.
        [_ctrlListFilterVehicleInventory, _ctrlListVehicleInventory] call BIS_fnc_initListNBoxSorting;
        [_ctrlListFilterMyInventory, _ctrlListMyInventory] call BIS_fnc_initListNBoxSorting;

        // Update inventory
        ["updateInventory", [_display]] call SELF;
    };
    case "swapItems": {
        _args params [["_display", displayNull, [displayNull]], ["_store", false, [true]]];

        private _ctrlListContainerInventory = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_VEHICLEINVENTORYLIST;
        private _ctrlListSelfInventory = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_MYINVENTORYLIST;
        private _itemsAmount = ["itemsAmount", []] call SELF;
        private _successes = 0;

        // Select depending on store or take
        private _object = [[VAR_CONTAINER, player], [player, VAR_CONTAINER]] select _store;
        private _word = ["took", "stored"] select _store;

        private _listSel = VAR_LASTLIST == "CONTAINER";
        private _ctrlList = [_ctrlListSelfInventory, _ctrlListContainerInventory] select _listSel;

        private _selRow = lnbCurSelRow _ctrlList;
        private _itemClassname = _ctrlList lnbData [_selRow, 0];

        // Error handling
        if (_itemsAmount < 1) then { _itemsAmount = 1; };
        if (_itemClassname == "") exitWith { [HINT_AMBER, HINT_TITLE, "You did not select an item."] call GW_client_fnc_notificationsAdd; };

        _object params ["_objectTransfer", "_objectReceive"];

        // Exit before loop if the container cannot hold the item
        if !([_objectReceive, _itemClassname] call GW_client_fnc_virtualInventoryCanAddItem) exitWith
        {
            [HINT_AMBER, HINT_TITLE, "Container inventory full."] call GW_client_fnc_notificationsAdd;
        };

        // Loop for as many items selected
        for "_i" from 1 to _itemsAmount do {
            if !([_objectTransfer, _itemClassname, 0, false] call GW_client_fnc_virtualInventoryChange) exitWith {};
            if !([_objectReceive, _itemClassname, 1, false] call GW_client_fnc_virtualInventoryChange) exitWith {};
            _successes = _successes + 1;
        };

        // Get item information
        private _itemInfo = [_itemClassname] call GW_client_fnc_virtualInventoryGetItemInfo;
        _itemInfo params ["_displayName", "_iconPath"];

        // Notify
        [HINT_NORMAL, HINT_TITLE, format [
            "You %3 %1x %2 from the container.",
            _successes,
            _displayName,
            _word
        ], _iconPath] call GW_client_fnc_notificationsAdd;

        // Update inventory
        ["updateInventory", [_display]] call SELF;
    };
    case "itemsAmount": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlEditAmount = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_ITEMAMOUNTINPUT;
        private _ctrlTextAmount = ctrlText _ctrlEditAmount;
        private _itemsAmount = parseNumber _ctrlTextAmount;

        // Return
        _itemsAmount;
    };
    case "removeItems": {
        _args params [["_display", displayNull, [displayNull]]];

        // Define ctrls
        private _ctrlListVehicleInventory = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_VEHICLEINVENTORYLIST;
        private _ctrlListMyInventory = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_MYINVENTORYLIST;

        // Get which list player wants to remove the item from
        private _listSel = VAR_LASTLIST == "CONTAINER";
        private _info = [[player, _ctrlListMyInventory], [VAR_CONTAINER, _ctrlListVehicleInventory]] select _listSel;

        // Get object and ctrl
        _info params ["_object", "_inventoryCtrl"];

        // Get item classname and error check it
        _itemClassname = _inventoryCtrl lnbData [lnbCurSelRow _inventoryCtrl, 0];
        if (_itemClassname isEqualTo "") exitWith {};

        // Remove items x amount of times
        private _amount = ["itemsAmount", [_display]] call SELF;
        private _successes = 0;
        for "_i" from 1 to _amount do {
            if !([_object, _itemClassname, 0] call GW_client_fnc_virtualInventoryChange) exitWith {};
            _successes = _successes + 1;
        };

        // Notify
        [HINT_SUCCESS, HINT_TITLE, format [
            "You successfully destroyed %1 items.",
            _successes
        ]] call GW_client_fnc_notificationsAdd;

        // Update inventory dialog
        ["updateInventory", [_display]] call SELF;
    };
    case "updateInventory": {
        _args params [["_display", displayNull, [displayNull]]];

        private _playersInventory = [player] call GW_client_fnc_virtualInventoryReturn;
        private _containersInventory = [VAR_CONTAINER] call GW_client_fnc_virtualInventoryReturn;

        ["updateInventoryStats", [_display]] call SELF;
        ["loadInventories", [
            _display,
            _playersInventory,
            _containersInventory
        ]] call SELF;
    };
    case "loadInventories": {
        _args params [["_display", displayNull, [displayNull]], ["_myInventory", [], [[]]], ["_vehicleInventory", [], [[]]]];

        private _ctrlListMyInventory = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_MYINVENTORYLIST;
        private _ctrlListVehicleInventory = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_VEHICLEINVENTORYLIST;

        // Run this twice, in order to get both my, and the
        // vehicle inventory setup
        for "_i" from 0 to 1 do {
            private _added = [];
            private _arr = [[_ctrlListMyInventory, _myInventory], [_ctrlListVehicleInventory, _vehicleInventory]] select _i;

            _arr params [["_ctrl", controlNull, [controlNull]], ["_data", [], [[]]]];
            lnbClear _ctrl;

            // Loop through data
            {
                if !(_x in _added) then {
                    _added pushBack _x;

                    private _itemInfo = _x call GW_client_fnc_virtualInventoryGetItemInfo;
                    _itemInfo params ["_displayName", "_iconPath", "_weight"];

                    // Get amount of items of this type in inventory and set total weight,
                    // which is the quantity multiplied by the weight.
                    private _quantity = [_x, _data] call GW_ext_fnc_arraysInArrayCount;
                    private _totalWeight = _quantity * _weight;

                    // Add into list and set picture and data
                    private _index = _ctrl lnbAddRow ["", _displayName, str _totalWeight, str _quantity];
                    _ctrl lnbSetPicture [[_index, 0], _iconPath];
                    _ctrl lnbSetData [[_index, 0], _x];
                };
                true;
            } count _data;
        };
    };
    case "modifyAmountInput": {
        _args params [["_display", displayNull, [displayNull]], ["_plus", false, [false]]];

        private _ctrlEditAmount = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_ITEMAMOUNTINPUT;
        private _ctrlText = ctrlText _ctrlEditAmount;
        private _currentAmount = parseNumber _ctrlText;
        private _newAmount = 0;

        // Get new amount
        _newAmount = [(_currentAmount - 1), (_currentAmount + 1)] select _plus;
        if (_newAmount < 1) then { _newAmount = 1; };

        // Update ctrl input
        _ctrlEditAmount ctrlSetText str _newAmount;
    };
    case "updateInventoryStats": {
        _args params [["_display", displayNull, [displayNull]]];

        // Controls
        private _ctrlProgressMyInventory = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_MYINVENTORYPROGRESSBAR;
        private _ctrlTextMyInventory = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_MYINVENTORYPROGRESSBARTEXT;
        private _ctrlProgressVehicleInventory = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_VEHICLEINVENTORYPROGRESSBAR;
        private _ctrlTextVehicleInventory = _display displayCtrl IDC_DISPLAYVEHICLEINVENTORY_VEHICLEINVENTORYPROGRESSBARTEXT;

        // Inventory information
        private _vehicleVirtualInventorySpace = [VAR_CONTAINER] call GW_client_fnc_virtualInventorySpace;
        private _vehicleInventoryUsedSpace = [VAR_CONTAINER] call GW_client_fnc_virtualInventoryCalculateTotalWeight;
        private _myVirtualInventoryUsedSpace = [player] call GW_client_fnc_virtualInventoryCalculateTotalWeight;
        private _myVirtualInventorySpace = [player] call GW_client_fnc_virtualInventorySpace;

        // Set text
        _ctrlTextVehicleInventory ctrlSetText format ["%1 / %2", _vehicleInventoryUsedSpace, _vehicleVirtualInventorySpace];
        _ctrlTextMyInventory ctrlSetText format ["%1 / %2", _myVirtualInventoryUsedSpace, _myVirtualInventorySpace];

        // Set progress positions
        _ctrlProgressMyInventory progressSetPosition (_myVirtualInventoryUsedSpace / _myVirtualInventorySpace);
        _ctrlProgressVehicleInventory progressSetPosition (_vehicleInventoryUsedSpace / _vehicleVirtualInventorySpace);
    };
    case "onUnload": {
        // Set the inventory to no longer in use so others can use it
        VAR_CONTAINER setVariable ["inventoryInUse", false, true];
    };
};