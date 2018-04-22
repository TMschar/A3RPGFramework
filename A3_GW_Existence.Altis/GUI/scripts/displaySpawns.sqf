#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displaySpawns.sqf
 *
 * Parameter(s):
 *     0: STRING - Event to execute
 *     1: ARRAY  - Array with arguments
 */
#define SELF GW_displaySpawns_script
#define VAR_CAMHANDLE GW_displayInit_camHandle

scriptName "GW_displaySpawns_script: main";
scopeName "main";

disableSerialization;
if !(params [ ["_event", "", [""]], ["_args", [], [[]]] ]) throw "Param error";

switch _event do
{
    case "onLoad":
    {
        _args params [ ["_display", displayNull, [displayNull]] ];

        private _ctrlButtonLobby = _display displayCtrl IDC_DISPLAYSPAWNS_BUTTONLOBBY;
        _ctrlButtonLobby ctrlSetEventHandler ["ButtonClick", "endMission 'GW_End'"];

        private _camTargets = if (worldName == "Altis") then
        {
            [
                [3759, 12907, 200],
                [3644.95, 13109, 0]
            ];
        }
        else
        {
            [
                [7406.92, 8042.55, 100],
                [7239.66, 7926.61, 0]
            ];
        };

        // Create a camera
        VAR_CAMHANDLE = "camera" camCreate (_camTargets select 0);
        showCinemaBorder false;
        camUseNVG !(call GW_client_fnc_worldIsDayTime);
        VAR_CAMHANDLE cameraEffect ["INTERNAL", "BACK"];
        VAR_CAMHANDLE camSetTarget (_camTargets select 1);
        VAR_CAMHANDLE camCommit 0;

        // Draw icons on map
        private _ctrlMap = _display displayCtrl IDC_DISPLAYSPAWNS_MAP;
        _ctrlMap ctrlAddEventHandler ["Draw", GW_client_fnc_drawMapIcons];

        // Get spawn class for side of world§
        private _spawnConfig = missionConfigFile >> "CfgSpawns" >> worldName >> str playerSide;
        if !(isClass _spawnConfig) throw "No config found for given side";

        // Setup tree
        private _ctrlTree = _display displayCtrl IDC_DISPLAYSPAWNS_TREE;
        private _treeEntrySpawns = _ctrlTree tvAdd [[], "Towns"];
        private _treeEntryProperties = _ctrlTree tvAdd [[], "Properties"];
        private _treeEntryUnlockedSpawns = _ctrlTree tvAdd [[], "Unlocked spawns"];
        _ctrlTree tvSetPicture [[_treeEntrySpawns], "a3\3den\Data\Cfg3DEN\Layer\icon_ca.paa"];
        _ctrlTree tvSetData [[_treeEntrySpawns], ""];
        _ctrlTree tvSetPicture [[_treeEntryProperties], "a3\3den\Data\Cfg3DEN\Layer\icon_ca.paa"];
        _ctrlTree tvSetPicture [[_treeEntryUnlockedSpawns], "a3\3den\Data\Cfg3DEN\Layer\iconDisabled_ca.paa"];

        _ctrlTree ctrlAddEventHandler ["TreeSelChanged", {
            params [["_ctrl", controlNull, [controlNull]], ["_path", [], [[]]]];

            private _display = ctrlParent _ctrl;
            private _ctrlButtonSpawn = _display displayCtrl IDC_DISPLAYSPAWNS_BUTTONSPAWN;
            private _ctrlSpawnDescription = _display displayCtrl IDC_DISPLAYSPAWNS_SPAWNDESCRIPTION;
            private _tvData = _ctrl tvData _path;

            if !(_tvData isEqualTo "") then
            {
                private _dataArray = parseSimpleArray _tvData;
                _dataArray params
                [
                    ["_spawnName", "", [""]],
                    ["_spawnDescription", "", [""]],
                    ["_position", [], [[]], 3]
                ];

                private _ctrlMap = _display displayCtrl IDC_DISPLAYSPAWNS_MAP;
                _ctrlMap ctrlMapAnimAdd [0.8, 0.1, _position];
                ctrlMapAnimCommit _ctrlMap;

                _ctrlButtonSpawn ctrlEnable true;
                _ctrlSpawnDescription ctrlSetText _spawnDescription;
            }
            else
            {
                _ctrlButtonSpawn ctrlEnable false;
                _ctrlSpawnDescription ctrlSetText "";
            };
        }];

        // Add towns to tree
        {
            private _spawnName = getText (_x >> "name");
            private _spawnDescription = getText (_x >> "description");
            private _spawnMarker = getText (_x >> "marker");

            private _index = _ctrlTree tvAdd [[_treeEntrySpawns], _spawnName];
            private _position = getMarkerPos _spawnMarker;

            // Handle specific spawning on USS freedom
            if (_spawnMarker == "police_spawn_marker_uss_freedom") then { _position set [2, 18.9]; };

            // Add town and icon
            _ctrlTree tvSetData [[_treeEntrySpawns, _index], format ["%1", [_spawnName, _spawnDescription, _position, markerDir _spawnMarker]]];
            _ctrlTree tvSetPicture [[_treeEntrySpawns, _index], "GUI\data\displays\displaySpawns\TreeIcons\spawn.paa"];

            true
        } count ("true" configClasses _spawnConfig);

        // Add properties to tree
        {
            _x params [ ["_object", objNull, [objNull]], ["_type", "", [""]] ];

            private _propertyInfo = switch (toUpper _type) do
            {
                case "HOUSE":
                {
                    [
                        [
                            "Villa",
                            "Spawn at your villa",
                            "GUI\data\displays\displaySpawns\TreeIcons\villa.paa"
                        ],
                        [
                            "Lighthouse",
                            "Spawn at your lighthouse",
                            "GUI\data\displays\displaySpawns\TreeIcons\lighthouse.paa"
                        ]
                    ] select (typeOf _object == "Land_LightHouse_F");
                };
                case "GARAGE":
                {
                    [
                        "Garage",
                        "Spawn at your garage",
                        "GUI\data\displays\displaySpawns\TreeIcons\garage.paa"
                    ]
                };
                case "SAFEHOUSE":
                {
                    [
                        "Safehouse",
                        "Spawn at your safehouse",
                        "GUI\data\displays\displaySpawns\TreeIcons\safehouse.paa"
                    ]
                };
                default { ["", "", ""] };
            };

            _propertyInfo params
            [
                ["_name", "", [""]],
                ["_description", "", [""]],
                ["_iconPath", "", [""]]
            ];

            private _index = _ctrlTree tvAdd [[_treeEntryProperties], _name];
            _ctrlTree tvSetData [[_treeEntryProperties, _index], format ["%1", [_name, _description, getPos _object, getDir _object]]];
            _ctrlTree tvSetPicture [[_treeEntryProperties, _index], _iconPath];

            true
        } count GW_Properties_Objects;

        private _ctrlButtonSpawn = _display displayCtrl IDC_DISPLAYSPAWNS_BUTTONSPAWN;
        _ctrlButtonSpawn ctrlAddEventHandler ["ButtonClick", {
            params [ ["_ctrl", controlNull, [controlNull]] ];

            private _display = ctrlParent _ctrl;
            private _ctrlTree = _display displayCtrl IDC_DISPLAYSPAWNS_TREE;
            private _tvSelection = tvCurSel _ctrlTree;
            private _tvData = _ctrlTree tvData _tvSelection;
            private _array = parseSimpleArray _tvData;

            _array params
            [
                ["_spawnName", "", [""]],
                ["_spawnDescription", "", [""]],
                ["_position", [], [[]], 3],
                ["_direction", 0, [0]]
            ];

            // Spawn in buildings for civilians
            if (playerSide isEqualTo civilian) then
            {
                try
                {
                    private _buildings = getArray (missionConfigFile >> "CfgSpawns" >> worldName >> "Settings" >> "spawnBuildingClassnames");
                    if (_buildings isEqualTo []) throw "No buildings found in spawn settings";

                    private _nearestObjects = nearestObjects [_position, _buildings, 300];
                    private _object = selectRandom _nearestObjects;

                    // Set new
                    _position = getPos _object;
                    _direction = getDir _object;
                }
                catch
                {
                    [LOG_WARNING, format ["Exception thrown: %1", _exception], _fnc_scriptName] call GW_server_fnc_log;
                };
            };

            // Set players position
            player allowDamage false;
            player setPos _position;
            player setDir _direction;
            player allowDamage true;

            // Load HUD
            [] call GW_client_fnc_guiLoadHUD;
            _display closeDisplay 2;

            // Log
            [LOG_INFO, format ["Spawned at location %1", _position], _fnc_scriptName] call GW_server_fnc_log
        }];

        // Expand tree and set default selection
        tvExpandAll _ctrlTree;
        _ctrlTree tvSetCurSel [0, 0];
    };
    case "onUnload":
    {
        // Destroy camera
        camUseNVG false;
        VAR_CAMHANDLE cameraEffect ["TERMINATE", "BACK"];
        camDestroy VAR_CAMHANDLE;

        // Switch player to 3rd person view
        player switchCamera "EXTERNAL";

        // Remove splash noise
        "SPLASHNOISE" cutText ["", "PLAIN"];

        [] call GW_client_fnc_initSetPlayerSettings;
    };
};
