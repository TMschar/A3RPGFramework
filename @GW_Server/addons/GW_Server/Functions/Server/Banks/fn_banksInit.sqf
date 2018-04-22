#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_banksInit.sqf
 *
 * Throws:
 *     Exception
 */
#define CONFIG_BANKS (missionConfigFile >> "CfgBanks" >> worldName)
#define BANKS_ARRAY ("true" configClasses CONFIG_BANKS)
#define WINDOWS_KEY ([DIK_LWIN] call GW_client_fnc_playerKeyDictionary)

scriptName "GW_server_fnc_banksInit: main";
scopeName "main";

// Log initialization
["Initiating Banks", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;

// Make sure there is a bank class for the world
if (!isClass CONFIG_BANKS) throw "No class with given name";

// Add eventhandler that will get called when a player attempts to steal a moneybag
"GW_banks_collectMoneybagRequest" addPublicVariableEventHandler { _this call GW_server_fnc_banksOnCollectMoneybagRequest; };
"GW_banks_drillRequest" addPublicVariableEventHandler { _this call GW_server_fnc_banksOnDrillRequest };

// Setup all banks in config
{
    private _displayName = getText (_x >> "displayName");
    private _positionATL = getArray (_x >> "positionATL");
    private _buildingClassname = getText (_x >> "classname");
    private _vaults = "true" configClasses (_x >> "Vaults");

    // Error checks
    if (_displayName isEqualTo "") throw "No displayname";
    if (_buildingClassname isEqualTo "") throw "No building classname";
    if (_positionATL isEqualTo []) throw "No position ATL";
    if (_vaults isEqualTo []) throw "No vaults";

    // Get and set bank building properties
    private _building = _positionATL nearestObject _buildingClassname;
    _building enableSimulation true;
    _building allowDamage false;

    // Set bank class relative to building
    _building setVariable ["bankClass", configName _x, true];

    // Create marker
    private _marker = createMarker [configName _x, _positionATL];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "loc_Tourism";
    _marker setMarkerColor "ColorRed";
    _marker setMarkerText _displayName;
    _building setVariable ["marker", _marker];

    // Loop through all vaults
    {
        // Get doors to lock
        private _lockDoors = getArray (_x >> "lockDoors");
        if (_lockDoors isEqualTo []) throw "No doors to lock";

        // Lock all vault doors within the building
        { [_building, _x, 1] call GW_client_fnc_worldDoorChangeLockstate } forEach _lockDoors;

        // Get box properties
        private _boxClass = _x >> "Box";
        private _boxClassname = getText (_boxClass >> "classname");
        private _randomPosATL = getArray (_boxClass >> "randomPosATL");
        private _moneybags = getNumber (_boxClass >> "moneybags");
        if (!isClass _boxClass) throw "No box class";
        if (_boxClassname isEqualTo "") throw "No box classname";
        if (_randomPosATL isEqualTo []) throw "No random box positions";

        // Create box
        private _vaultBoxPos = selectRandom _randomPosATL;
        private _vaultBox = _boxClassname createVehicle _vaultBoxPos;
        _vaultBox enableSimulation false;
        _vaultBox allowDamage false;

        // Set variables on vault
        _building setVariable ["bankVault", configName _x, true];
        _building setVariable ["bankVaultBox", _vaultBox, true];
        _vaultBox setVariable ["breached", false, true];
        _vaultBox setVariable ["moneybags", _moneybags, true];
        _vaultBox setVariable ["nametags_title", "Bank Vault", true];
        _vaultBox setVariable ["nametags_subtitle", WINDOWS_KEY, true];
        _vaultBox setVariable ["nametags_icon", "Textures\PlayerTags\vault.paa", true];
    } forEach _vaults;

    // Log initiation
    [format ["Initiated %1", _displayName], _fnc_scriptName] call GW_ext_fnc_loggingDebugLog;
} forEach BANKS_ARRAY;