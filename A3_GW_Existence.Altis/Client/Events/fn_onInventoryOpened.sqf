#include "script_component.hpp"
/*
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_onInventoryOpened.sqf
 *
 * Parameter(s):
 *     0: OBJECT - Object the eventhandler is assigned to
 *     1: OBJECT - Connected container or weaponholder
 *     2: OBJECT - Secondary connected container or weaponholder, if none evaluates to objNull
 *
 * Returns:
 *     BOOLEAN
 */
scriptName "GW_client_fnc_onInventoryOpened: main";
scopeName "main";

params [["_objectAssigned", objNull, [objNull]], ["_container", objNull, [objNull]], ["_containerSecondary", objNull, [objNull]]];
private _containerType = typeOf _container;

// Disallow opening vehicle containers if locked
if (
    [_containerType] call GW_client_fnc_vehicleGetCategory in ["Car", "Air", "Tank", "Boat", "Ship"]
    && {[_container] call GW_client_fnc_vehicleLocked}
    && {!([player, _container] call GW_client_fnc_vehicleHasKeys)}
) exitWith {
    [HINT_AMBER, "No Access", "This vehicle's inventory is locked."] call GW_client_fnc_notificationsAdd;
    true;
};

// Disallow opening of other peoples backpacks
if (getNumber (configFile >> "CfgVehicles" >> _containerType >> "isBackpack") isEqualTo 1) exitWith {
    [
        HINT_AMBER,
        localize "STR_GW_GUI_SYSTEMS_INVENTORY_BACKPACKFAILTITLE",
        localize "STR_GW_GUI_SYSTEMS_INVENTORY_BACKPACKFAIL",
        "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa"
    ] call GW_client_fnc_notificationsAdd;
    true;
};

if !(isNil "GW_onInventoryOpened_ctrlsAdditionsThread") then { terminate GW_onInventoryOpened_ctrlsAdditionsThread; };
GW_onInventoryOpened_ctrlsAdditionsThread = [] spawn {
    scriptName "GW_client_fnc_onInventoryOpened: thread for ctrl additions";
    scopeName "main";

    disableSerialization;
    waitUntil { !isNull findDisplay 602; };
    private _display = findDisplay 602;

    // Add background
    private _buttonsBackground = _display ctrlCreate ["RscText", -1];
    _buttonsBackground ctrlSetPosition [0.414406 * safezoneW + safezoneX, 0.247 * safezoneH + safezoneY, 0.0175312 * safezoneW, 0.506 * safezoneH];
    _buttonsBackground ctrlCommit 0;
    _buttonsBackground ctrlSetBackgroundColor [0.05, 0.05, 0.05, 0.7];

    // Reload Unit Loadout
    private _reloadUnitLoadout = _display ctrlCreate [ "RscActivePicture", -1];
    _reloadUnitLoadout ctrlSetPosition [0.417209 * safezoneW + safezoneX, 0.252533 * safezoneH + safezoneY, 0.0123747 * safezoneW, 0.0242 * safezoneH];
    _reloadUnitLoadout ctrlSetToolTip "Reload Unit Loadout (Fixes appearance without clothes)";
    _reloadUnitLoadout ctrlSetTooltipColorBox [0, 0, 0, 0.7];
    _reloadUnitLoadout ctrlSetText "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
    _reloadUnitLoadout ctrlCommit 0;
    _reloadUnitLoadout ctrlAddEventHandler ["buttonClick", {
        // Set previous loadout
        private _previousLoadout = getUnitLoadout player;
        player setUnitLoadout _previousLoadout;

        // Update textures
        [player] call GW_client_fnc_unitSetTextures;

        // Hint
        [
            0,
            localize "STR_GW_GUI_SYSTEMS_INVENTORY_UNITLOADOUTRELOADTITLE",
            localize "STR_GW_GUI_SYSTEMS_INVENTORY_UNITLOADOUTRELOAD",
            "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa"
        ] call GW_client_fnc_notificationsAdd;
    }];

    // Hide Backpack Button
    private _hideBackpackButton = _display ctrlCreate ["RscActivePicture", -1];
    _hideBackpackButton ctrlSetPosition [0.417219 * safezoneW + safezoneX, 0.280896 * safezoneH + safezoneY, 0.0123747 * safezoneW, 0.0242 * safezoneH];
    _hideBackpackButton ctrlSetToolTip "Hide Backpack Locally";
    _hideBackpackButton ctrlSetTooltipColorBox [0, 0, 0, 0.7];
    _hideBackpackButton ctrlSetText "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
    _hideBackpackButton ctrlCommit 0;
    _hideBackpackButton ctrlAddEventHandler [ "buttonClick", {
        // Make backpack invisible
        backpackContainer player setObjectTexture [0, ""];

        // Hint
        [
            0,
            localize "STR_GW_GUI_SYSTEMS_INVENTORY_HIDDENBACKPACKTITLE",
            localize "STR_GW_GUI_SYSTEMS_INVENTORY_HIDDENBACKPACK",
            "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa"
        ] call GW_client_fnc_notificationsAdd;
    }];
};
