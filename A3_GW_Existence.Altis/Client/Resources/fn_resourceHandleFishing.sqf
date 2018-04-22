#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_resourceHandleFishing.sqf
 *
 * Parameter(s):
 *     0: STRING - Resource the player is at
 *
 * Throws:
 *     Exception
 */
#define POINTSPERSUCCESS 5
#define TITLE "Resource Notice"

scriptName "GW_client_fnc_resourceHandleFishing: main";
scopeName "main";

// Get parameters and make sure they're passed, otherwise throw exception
if (!params [
    ["_resource", "", [""]]
]) throw "Did not get resource (param error)";

// Error checks
if (isNull objectParent player) exitWith { ["Not in a vehicle", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if !(objectParent player isKindOf "Ship") exitWith { ["Must be inside a ship", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if !(surfaceIsWater position player) exitWith { ["Not on water", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };
if (playerSide != civilian) exitWith { ["Only civilians can use this resource", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

// Get config class for resource
private _resourceConfigClass = missionConfigFile >> "CfgResources" >> "FishingSpots" >> worldName >> _resource;
if (!isClass _resourceConfigClass) throw "No config class for resource";

// Make sure the unit has a license in order to fish from this resource.
private _licenseRequired = getText (_resourceConfigClass >> "license");
if (_licenseRequired != "" && {!([_licenseRequired] call GW_client_fnc_licensingHasLicense)}) exitWith {
    _licenseName = [_licenseRequired] call GW_client_fnc_licensingGetName;
    [HINT_WARNING, TITLE, format [
        "You do not have the required license for this resource. You need %1.",
        _licenseName
    ]] call GW_client_fnc_notificationsAdd;
};

private _handle = missionNamespace getVariable ["GW_resourceHandleFishing_thread", scriptNull];
if (!isNull _handle) then { terminate _handle; };

GW_resourceHandleFishing_thread = [_resourceConfigClass, _fnc_scriptName] spawn {
    params [
        ["_resourceConfigClass", configNull, [configNull]],
        ["_fnc_scriptName", "", [""]]
    ];

    scriptName "GW_client_fnc_resourceHandleFishing: handle progress";
    scopeName "main";

    // Define conditions and code that needs to be met true in order
    // for the progress bar to continue.
    private _conditionsArgs = [player, getPos player];
    private _conditionsCode = {
        params [
            ["_unit", objNull, [objNull]],
            ["_pos", [], [[]], 3]
        ];

        !isNull _unit
        && {getPos _unit distance _pos < 5}
        && {!(isNull objectParent _unit)}
        && {speed objectParent _unit < 2}
    };

    // Get radius and amount of max fish to get per action from config
    private _radius = getNumber (_resourceConfigClass >> "radius");
    private _fishAmount = getNumber (_resourceConfigClass >> "fishAmount");
    if (_radius isEqualTo 0) throw "Error with radius";
    if (_fishAmount isEqualTo 0) throw "Error, no fish amount";

    // Start progress
    private _fishes = nearestObjects [getPos objectParent player, ["Fish_Base_F"], _radius];
    if (["", [15, "Catching Fish", "", ""], _conditionsArgs, _conditionsCode, false] call GW_client_fnc_startProgress && {!(_fishes isEqualTo [])}) then {
        private _successes = 0;
        {
            // Check if found any fish that is present in config
            private _fishTypesClass = _resourceConfigClass >> "FishTypes" >> typeOf _x;
            if (_x isKindOf "Fish_Base_F" && {isClass _fishTypesClass}) then {
                private _displayName = getText (_fishTypesClass >> "displayName");
                private _itemClassname = getText (_fishTypesClass >> "representsItem");

                // Add to inventory. If successfull, increment variable and then delete the fish
                if ([player, _itemClassname, 1, false] call GW_client_fnc_virtualInventoryChange) then {
                    deleteVehicle _x;
                    _successes = _successes + 1;
                } else {
                    [HINT_WARNING, TITLE, "Inventory full."] call GW_client_fnc_notificationsAdd;
                    breakOut "main";
                };
            };

            // Only allow catching certain fishes at once
            if (_forEachIndex >= _fishAmount) exitWith {};
        } forEach _fishes;

        // If the unit found more than 0 items
        if (_successes >= 1) then {
            // Give experience points
            [LEVEL_TOOLSOFTHETRADE, _successes * POINTSPERSUCCESS, "", false] call GW_client_fnc_experienceCategoryAddExperience;

            // Notify
            [HINT_NORMAL, TITLE, format [
                "You catched %1 fishes and received %2 experience points in Jack of all trades.",
                _successes,
                _successes * POINTSPERSUCCESS
            ]] call GW_client_fnc_notificationsAdd;
        };
    } else {
        [HINT_WARNING, TITLE, "You failed to catch any fish from this resource"] call GW_client_fnc_notificationsAdd;
    };
};