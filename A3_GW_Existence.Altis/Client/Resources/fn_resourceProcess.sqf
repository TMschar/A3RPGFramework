#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor & BoGuu, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_resourceProcess.sqf
 *
 * Parameter(s):
 *     0: STRING - Processor Class
 *
 * Description:
 *     Function for processing items into another item
 */
#define REMOVE 0
#define ADD 1
#define TITLE_MISSINGITEMS "Processing Notice"
#define TITLE_LICENSEREQUIRED "License Required"
#define TITLE_SUCCESS "Processing Notice"
#define TITLE_CANCELLED "Processing Notice"
#define MESSAGE_SUCCESS "You successfully processed %2 %1. They have been stored in your characters inventory."
#define MESSAGE_MISSINGITEMS "You are missing items to process."
#define MESSAGE_LICENSEREQUIRED "You do not have the required license in order to process these goods. You need %1."
#define MESSAGE_CANCELLED "You either canceled the processing or the processing failed. Try again!"
#define EXP_MESSAGE "Processing Items"

scriptName "GW_client_fnc_resourceProcess: main";
scopeName "main";

if !(params [["_processorClass", "", [""]]]) exitWith {["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

private _processorConfig = missionConfigFile >> "CfgResources" >> "Processing" >> worldName >> _processorClass;
private _licenseRequired = getText (_processorConfig >> "license");
private _itemsRequired = getArray (_processorConfig >> "items");
private _itemsRequiredAmount = count _itemsRequired;
private _itemsToGive = getArray (_processorConfig >> "itemsGive");
private _inventory = player call Gw_client_fnc_virtualInventoryReturn;
private _itemsToProcess = [];
private _time = 0;
private _displayName = getText (_processorConfig >> "displayName");
private _missingOccurences = 0;
private _totalProcesses = 1e10;

// Make sure processor class exists
if !(isClass _processorConfig) exitWith {["No class with given name", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog};

// Make sure that the license that is required is owned
// by the player.
if (_licenseRequired != "" && {!(_licenseRequired call GW_client_fnc_licensingHasLicense)}) exitWith {
    _licenseRequiredName = _licenseRequired call GW_client_fnc_licensingGetName;
    [HINT_AMBER, TITLE_LICENSEREQUIRED, format [MESSAGE_LICENSEREQUIRED, _licenseRequiredName]] call GW_client_fnc_notificationsAdd
};

// Add items that is in inventory to an array from required items
// and check to make sure all the items are there
{
    _x params [["_itemClassname", "", [""]], ["_itemAmountRequired", 0, [0]]];

    private _inventoryItems = _inventory select {_itemClassname == _x};
    private _inventoryItemsAmount = count _inventoryItems;

    private _maxProcesses = floor (_inventoryItemsAmount / _itemAmountRequired);
    if (_maxProcesses < _totalProcesses) then {_totalProcesses = _maxProcesses};

    // Check if required items are superior to the players items amount.
    // If this happens, player should not be able to process anything.
    if (_itemAmountRequired > _inventoryItemsAmount) then {
        [HINT_AMBER, TITLE_MISSINGITEMS, MESSAGE_MISSINGITEMS] call GW_client_fnc_notificationsAdd;
        false breakOut "main";
    };

    // Set time to process
    private _itemInfo = _x call GW_client_fnc_virtualInventoryGetItemInfo;
    private _itemWeight = _itemInfo param [2, 0, [0]];
    _time = _time + (_itemWeight * 0.5);
} forEach _itemsRequired;

// Set time based on _totalProcesses
_time = _time * _totalProcesses;

// If player has missing items, exit function.
if (_totalProcesses isEqualTo 0) exitWith {[HINT_AMBER, TITLE_MISSINGITEMS, MESSAGE_MISSINGITEMS] call GW_client_fnc_notificationsAdd};

// Error check
if !(isNil "GW_resourceProcess_progressHandle") then {
    terminate GW_resourceProcess_progressHandle;
    GW_resourceProcess_progressHandle = nil;

    diag_log "Processing handle was nay nil"
};

GW_resourceProcess_progressHandle = [_time, _totalProcesses, _itemsRequired, _itemsToGive, _displayName] spawn {
    scriptName "GW_client_fnc_resourceProcess: progressHandle";
    scopeName "main";

    params [
        ["_time", 0, [0]],
        ["_totalProcesses", 0, [0]],
        ["_itemsRequired", [], [[]]],
        ["_itemsToGive", [], [[]]],
        ["_displayName", "", [""]]
    ];

    // Start progress action
    if (["", [_time, _displayName]] call GW_client_fnc_startProgress) then {
        for "_totalProcessesIndex" from 1 to _totalProcesses do {
            // Remove old items
            {
                _x params [["_itemClassname", "", [""]], ["_itemAmountRequired", 0, [0]]];

                // Remove the amount of items the player should have
                for "_i" from 1 to _itemAmountRequired do {
                    [player, _itemClassname, REMOVE, false] call GW_client_fnc_virtualInventoryChange;
                };
            } forEach _itemsRequired;

            // Loop through all items to give
            {
                _x params [["_itemClassname", "", [""]], ["_giveAmount", 0, [0]]];

                // Give the amount of items the player should get
                for "_i" from 1 to _giveAmount do {
                    [player, _itemClassname, ADD, false] call GW_client_fnc_virtualInventoryChange;
                };
            } forEach _itemsToGive
        };

        // Notify
        [HINT_NORMAL, TITLE_SUCCESS, format [
            MESSAGE_SUCCESS,
            _displayName,
            _totalProcesses
        ]] call GW_client_fnc_notificationsAdd;

        // Give experience points
        [LEVEL_TOOLSOFTHETRADE, 25, EXP_MESSAGE] call GW_client_fnc_experienceCategoryAddExperience;
    } else {[HINT_WARNING, TITLE_CANCELLED, MESSAGE_CANCELLED] call GW_client_fnc_notificationsAdd};

    // Terminate
    terminate GW_resourceProcess_progressHandle;
    GW_resourceProcess_progressHandle = nil
};