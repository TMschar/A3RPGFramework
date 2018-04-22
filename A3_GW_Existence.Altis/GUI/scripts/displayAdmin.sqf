#include "script_component.hpp"
/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: displayAdmin.sqf

    Parameter(s):
        0: STRING - Event
        1: ARRAY - Arguments

    Returns:
        NOTHING
*/
scriptName "GW_displayAdmin: main";
scopeName "main";

disableSerialization;

if !(params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
]) exitWith {
    [LOG_WARNING, "Param error", _fnc_scriptName] call GW_server_fnc_log
};

#define SELF                          GW_DISPLAYAdmin_Script
#define VAR_SELECTED_UNIT                   GW_DISPLAYAdmin_SelectedUnit
#define VAR_SELECTED_VEHICLE                GW_DISPLAYAdmin_SelectedVehicle
#define VAR_SETUNITTOOLBARENABLED           GW_DISPLAYAdmin_setToolbarSelectedUnitCtrlSettings
#define VAR_ENABLE3DICONS                   GW_Player_3DPlayerIconsEnabled
#define COLOR_ENABLED                       [0, 0.48, 0.27, 1]
#define COLOR_DISABLED                      [1, 1, 1, 1]

if (call GW_Player_AdminRank < 1) exitWith {
    [LOG_CRITICAL, format ["UNAUTHORIZED ATTEMPT TO CALL ADMIN MENU (%1:%2)", name player, getPlayerUID player], _fnc_scriptName] call GW_server_fnc_log
};

switch _event do {
    case "onLoad": {
        _args params [
            ["_display", displayNull, [displayNull]]
        ];

        if (call GW_Player_AdminRank < 1) then {
            _display closeDisplay 2;
            if dialog then {
                closeDialog 0
            }
        };

        ["GW_HUD"] call GW_client_fnc_destroyResource;

        VAR_SELECTED_UNIT = objNull;
        VAR_SELECTED_VEHICLE = objNull;

        private _isCameraAllowed = call GW_Player_AdminRank >= 3;
        private _isDebugAllowed = call GW_Player_AdminRank >= 3;
        private _isArsenalAllowed = call GW_Player_AdminRank >= 3;
        private _isTeleportingAllowed = call GW_Player_AdminRank >= 3;
        private _isWeatherChangeAllowed = call GW_Player_AdminRank >= 3;
        private _isMapAllowed = call GW_Player_AdminRank >= 3;

        // [STAFF_LOG, format ["ADMIN MENU LOADED FOR %1:%2", name player, getPlayerUID player], _fnc_scriptName] call GW_server_fnc_log;

        _display displayAddEventHandler ["KeyDown", {
            params [
                ["_display", displayNull, [displayNull]],
                ["_dikCode", 0,           [0]],
                ["_shift",   false,       [false]]
            ];

            // M Key (Control Map)
            private _ctrlMap = _display displayCtrl IDC_DISPLAYADMIN_MAP;
            if (_dikCode isEqualTo 50) then {
                if (ctrlShown _ctrlMap) then {
                    _ctrlMap ctrlShow false
                } else {
                    _ctrlMap ctrlShow true
                }
            }
        }];

        private _ctrlButtonStaff = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONSTAFFDUTY;
        _ctrlButtonStaff ctrlAddEventHandler ["ButtonClick", {
            private _staffOnDuty = missionNamespace getVariable ["GW_staffOnDuty", []];
            if (_staffOnDuty isEqualTo []) then {
                    GW_staffOnDuty = [
                        player getVariable ["nametags_icon", ""],
                        player getVariable ["nametags_title_colour", []],
                        player getVariable ["nametags_subtitle", ""],
                        player getVariable ["nametags_subtitle_colour", ""]
                    ];

                    player setVariable ["nametags_icon", "GUI\data\displays\displayCommunicationTargets\g.paa", true];
                    player setVariable ["nametags_title_colour", [0.92, 0.02, 0, 1], true];
                    player setVariable ["nametags_subtitle", "Staff on Duty", true];
                    player setVariable ["nametags_subtitle_colour", [0.98, 0.54, 0.2, 1], true];

                    [HINT_NORMAL, "Staff on Duty", "You are now staff on duty"] call GW_client_fnc_notificationsAdd;
            } else {
                player setVariable ["nametags_icon", GW_staffOnDuty select 0, true];
                player setVariable ["nametags_title_colour", GW_staffOnDuty select 1, true];
                player setVariable ["nametags_subtitle", GW_staffOnDuty select 2, true];
                player setVariable ["nametags_subtitle_colour", GW_staffOnDuty select 3, true];

                [HINT_NORMAL, "Staff on Duty", "You are no longer staff on duty"] call GW_client_fnc_notificationsAdd;

                GW_staffOnDuty = [];
            };
        }];

        // Setup footer values
        private _ctrlTextVehicleCount = _display displayCtrl IDC_DISPLAYADMIN_FOOTERVEHICLESNUMBER;
        private _ctrlTextPlayerCount = _display displayCtrl IDC_DISPLAYADMIN_FOOTERPLAYERSNUMBER;
        _ctrlTextVehicleCount ctrlSetText (str count vehicles);
        _ctrlTextPlayerCount ctrlSetText format ["%1/%2", count (ALLPLAYERSNOHC), getNumber (missionConfigFile >> "Header" >> "MaxPlayers")];

        // Handle map
        private _ctrlMap = _display displayCtrl IDC_DISPLAYADMIN_MAP;

        // Hide all markers on map
        {
            _x setMarkerAlphaLocal 0;
            true
        } count allMapMarkers;

        if _isMapAllowed then {
            _ctrlMap ctrlAddEventHandler ["Draw", GW_client_fnc_drawMapIcons]
        };
        _ctrlMap ctrlShow false;

        // Map Toggle
        private _ctrlButtonToggleMap = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONMAP;
        _ctrlButtonToggleMap ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;
            private _ctrlMap = _display displayCtrl IDC_DISPLAYADMIN_MAP;

            if (ctrlShown _ctrlMap) then {
                _ctrlMap ctrlShow false
            } else {
                _ctrlMap ctrlShow true
            }
        }];
        _ctrlButtonToggleMap ctrlEnable _isMapAllowed;

        // Revive all
        private _ctrlButtonReviveAll = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONREVIVEALL;
        _ctrlButtonReviveAll ctrlAddEventHandler ["ButtonClick", {
            {
                if (_x getVariable ["incapacitated", false] && {animationState _x == "ainjppnemstpsnonwrfldnon_rolltoback"}) then {
                    _x setVariable ["incapacitated", false, true]
                };
                true
            } count ALLPLAYERSNOHC;

            [LOG_STAFF, "Mass revived all players", _fnc_scriptName] call GW_server_fnc_log
        }];

        // Toggle Map Markers
        private _ctrlButtonMapMarkers = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONMAPMARKERS;
        _ctrlButtonMapMarkers ctrlAddEventHandler ["ButtonClick", {
            {
                _x setMarkerAlphaLocal 1;
                true
            } count allMapMarkers
        }];
        _ctrlButtonMapMarkers ctrlEnable _isMapAllowed;

        if _isTeleportingAllowed then {
            _ctrlMap ctrlAddEventHandler ["MouseButtonDblClick", {
                params [
                    ["_ctrl",           controlNull, [controlNull]],
                    ["_buttonPressed",  0,           [0]],
                    ["_xCoords",        0,           [0]],
                    ["_yCoords",        0,           [0]],
                    ["_shiftIsPressed", false,       [false]],
                    ["_ctrlIsPressed",  false,       [false]],
                    ["_altIsPressed",   false,       [false]]
                ];

                private _position2D = _ctrl ctrlMapScreenToWorld [_xCoords, _yCoords];
                if !(isNull VAR_SELECTED_UNIT) then {
                    (vehicle VAR_SELECTED_UNIT) setPos _position2D;
                    [STAFF_LOG, format ["%1:%2 SET NEW POSITION FOR %2:%3 TO %4", name player, getPlayerUID player, name VAR_SELECTED_UNIT, getPlayerUID VAR_SELECTED_UNIT, _position2D], _fnc_scriptName] call GW_server_fnc_log
                }
            }]
        };
        _ctrlMap ctrlAddEventHandler ["MouseButtonClick", {
            params [
                ["_ctrl",           controlNull, [controlNull]],
                ["_buttonPressed",  0,           [0]],
                ["_xCoords",        0,           [0]],
                ["_yCoords",        0,           [0]],
                ["_shiftIsPressed", false,       [false]],
                ["_ctrlIsPressed",  false,       [false]],
                ["_altIsPressed",   false,       [false]]
            ];
            private _display = ctrlParent _ctrl;

            private _position2D = _ctrl ctrlMapScreenToWorld [_xCoords, _yCoords];
            private _object = vehicle (nearestObjects [_position2D, ["Car", "Tank", "Boat", "Man", "Air"], 5] select 0);

            if (isPlayer _object) then {
                ["updateUnitInformation", [_display, _object]] call SELF;

                if (_object isKindOf "Car" || {_object isKindOf "Tank"} || {_object isKindOf "Boat"} || {_object isKindOf "Air"}) then {
                    ["onVehicleSelected", [_display, _object]] call SELF
                }
            } else {
                ["onVehicleSelected", [_display, _object]] call SELF
            }
        }];
        _ctrlMap ctrlAddEventHandler ["MouseMoving", {
            params [
                ["_ctrl",      controlNull, [controlNull]],
                ["_xCoords",   0,           [0]],
                ["_yCoords",   0,           [0]],
                ["_mouseOver", false,       [true]]
            ];
            private _display = ctrlParent _ctrl;

            private _position2D = _ctrl ctrlMapScreenToWorld [_xCoords, _yCoords];
            _position2D params [
                ["_posX", 0, [0]],
                ["_posY", 0, [0]]
            ];

            private _ctrlTextX = _display displayCtrl IDC_DISPLAYADMIN_FOOTERMAPPOSX;
            _ctrlTextX ctrlSetText str _posX;
            private _ctrlTextY = _display displayCtrl IDC_DISPLAYADMIN_FOOTERMAPPOSY;
            _ctrlTextY ctrlSetText str _posY;
            private _ctrlTextZ = _display displayCtrl IDC_DISPLAYADMIN_FOOTERMAPPOSZ;
            _ctrlTextZ ctrlSetText "0";
            private _ctrlTextGridPos = _display displayCtrl IDC_DISPLAYADMIN_FOOTERMAPPOSGRID;
            _ctrlTextGridPos ctrlSetText mapGridPosition _position2D;
        }];

        // Refresh entities
        private _ctrlButtonRefreshEntities = _display displayCtrl IDC_DISPLAYADMIN_SEARCHTREELISTUNITSREFRESHBUTTON;
        _ctrlButtonRefreshEntities ctrlAddEventHandler ["ButtonClick", {
            ["updateUnitsList", [ctrlParent (_this select 0)]] call SELF;
        }];

        // Setup toolbar with its buttons
        private _toolbarGroup = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR;
        private _ctrlToolbarButtonExit = _toolbarGroup controlsGroupCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONEXIT;
        _ctrlToolbarButtonExit ctrlAddEventHandler ["ButtonClick", {
            params [
                ["_ctrl", controlNull, [controlNull]]
            ];
            private _display = ctrlParent _ctrl;
            _display closeDisplay 2;
            [STAFF_LOG, "CLOSED ADMIN MENU", _fnc_scriptName] call GW_server_fnc_log
        }];
        private _ctrlToolbarButtonWeather = _toolbarGroup controlsGroupCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONWEATHER;
        _ctrlToolbarButtonWeather ctrlAddEventHandler ["ButtonClick", {
            params [
                ["_ctrl", controlNull, [controlNull]]
            ];
            private _display = ctrlParent _ctrl;
            _display createDisplay "GW_DISPLAYAdminChildWeatherProperties";

            [LOG_STAFF, "OPENED WEATHER PROPERTIES MENU", _fnc_scriptName] call GW_server_fnc_log
        }];
        _ctrlToolbarButtonWeather ctrlEnable _isWeatherChangeAllowed;
        private _ctrlToolbarButtonDeveloper = _toolbarGroup controlsGroupCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONDEVELOPER;
        _ctrlToolbarButtonDeveloper ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _display = ctrlParent _ctrl;

            _display createDisplay "GW_displayDeveloperconsole"
        }];
        _ctrlToolbarButtonDeveloper ctrlEnable _isDebugAllowed;
        private _ctrlToolbarButtonCamera = _toolbarGroup controlsGroupCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONCAMERA;
        _ctrlToolbarButtonCamera ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _display = ctrlParent _ctrl;

            _display closeDisplay 2;

            [] call BIS_fnc_camera;

            [LOG_STAFF, "OPENED SPLENDID CAMERA", _fnc_scriptName] call GW_server_fnc_log
        }];
        _ctrlToolbarButtonCamera ctrlEnable _isCameraAllowed;
        private _ctrlToolbarButtonArsenal = _toolbarGroup controlsGroupCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONARSENAL;
        _ctrlToolbarButtonArsenal ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            private _display = ctrlParent _ctrl;

            _display closeDisplay 2;

            ["Open", true] spawn BIS_fnc_arsenal;
            [LOG_STAFF, "OPENED ARSENAL", _fnc_scriptName] call GW_server_fnc_log
        }];
        _ctrlToolbarButtonArsenal ctrlEnable _isArsenalAllowed;

        // Setup Selected Player Toolbar
        private _ctrlSelectedUnitToolbar = _display displayCtrl IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR;
        VAR_SETUNITTOOLBARENABLED = {
            params [
                ["_display",     displayNull, [displayNull]],
                ["_enableCtrls", false,       [false]]
            ];
            private _ctrlSelectedUnitToolbar = _display displayCtrl IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR;
            {
                _ctrl = _ctrlSelectedUnitToolbar controlsGroupCtrl _x;
                _ctrl ctrlEnable _enableCtrls;
                true
            } count [
                IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON1,
                IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON2,
                IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON3,
                IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON4,
                IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON5,
                IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON6
            ]
        };
        [_display, false] call VAR_SETUNITTOOLBARENABLED;
        private _ctrlSelectedUnitToolbarButtonSpectatePlayer = _ctrlSelectedUnitToolbar controlsGroupCtrl IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON1;
        _ctrlSelectedUnitToolbarButtonSpectatePlayer ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            private _display = ctrlParent _ctrl;

            if (cameraView == "INTERNAL") then {
                VAR_SELECTED_UNIT switchCamera "EXTERNAL"
            } else {
                VAR_SELECTED_UNIT switchCamera "INTERNAL"
            };

            private _ctrlMap = _display displayCtrl IDC_DISPLAYADMIN_MAP;
            if (ctrlShown _ctrlMap) then {
                _ctrlMap ctrlShow false
            };

            [LOG_STAFF, format ["%3:%4 IS NOW SPECTATING %1:%2", name VAR_SELECTED_UNIT, getPlayerUID VAR_SELECTED_UNIT, name player, getPlayerUID player], _fnc_scriptName] call GW_server_fnc_log
        }];
        private _ctrlSelectedUnitTooolbarButtonKillPlayer = _ctrlSelectedUnitToolbar controlsGroupCtrl IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON2;
        _ctrlSelectedUnitTooolbarButtonKillPlayer ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            if (VAR_SELECTED_UNIT isEqualTo player) exitWith {};
            VAR_SELECTED_UNIT setDamage 1;

            [LOG_STAFF, format ["KILLED %1:%2", name VAR_SELECTED_UNIT, getPlayerUID VAR_SELECTED_UNIT], _fnc_scriptName] call GW_server_fnc_log
        }];
        private _ctrlSelectedUnitToolbarButtonMoveIntoUnitsVehicle = _ctrlSelectedUnitToolbar controlsGroupCtrl IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON3;
        _ctrlSelectedUnitToolbarButtonMoveIntoUnitsVehicle ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];
            if (VAR_SELECTED_UNIT isEqualTo player || {isNull objectParent VAR_SELECTED_UNIT}) exitWith {};
            player moveInCargo (objectParent VAR_SELECTED_UNIT);

            [LOG_STAFF, format ["MOVED INTO %1:%2'S VEHICLE", name VAR_SELECTED_UNIT, getPlayerUID VAR_SELECTED_UNIT], _fnc_scriptName] call GW_server_fnc_log
        }];
        private _ctrlSelectedUnitToolbarButtonImmune = _ctrlSelectedUnitToolbar controlsGroupCtrl IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON4;
        _ctrlSelectedUnitToolbarButtonImmune ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            if (VAR_SELECTED_UNIT getVariable ["immune", false]) then {
                VAR_SELECTED_UNIT allowDamage true;
                VAR_SELECTED_UNIT setVariable ["immune", false, true];
                _ctrl ctrlSetTextColor COLOR_DISABLED;
                [LOG_STAFF, format ["IMMUNE MODE DISABLED FOR %1:%2", name VAR_SELECTED_UNIT, getPlayerUID VAR_SELECTED_UNIT], _fnc_scriptName] call GW_server_fnc_log
            } else {
                VAR_SELECTED_UNIT allowDamage false;
                VAR_SELECTED_UNIT setVariable ["immune", true, true];
                _ctrl ctrlSetTextColor COLOR_ENABLED;
                [LOG_STAFF, format ["IMMUNE MODE ENABLED FOR %1:%2", name VAR_SELECTED_UNIT, getPlayerUID VAR_SELECTED_UNIT], _fnc_scriptName] call GW_server_fnc_log
            }
        }];
        private _ctrlSelectedUnitToolbarButtonInvisible = _ctrlSelectedUnitToolbar controlsGroupCtrl IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON5;
        _ctrlSelectedUnitToolbarButtonInvisible ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            if (VAR_SELECTED_UNIT getVariable ["invisible", false]) then {
                _ctrl ctrlSetTextColor COLOR_DISABLED;

                [VAR_SELECTED_UNIT, false] remoteExecCall ["hideObject", ALLPLAYERSNOHC];
                VAR_SELECTED_UNIT setVariable ["invisible", false, true];

                [LOG_STAFF, format ["INIVISIBLE MODE DISABLED FOR %1:%2", name VAR_SELECTED_UNIT, getPlayerUID VAR_SELECTED_UNIT], _fnc_scriptName] call GW_server_fnc_log
            } else {
                _ctrl ctrlSetTextColor COLOR_ENABLED;

                [VAR_SELECTED_UNIT, true] remoteExecCall ["hideObject", ALLPLAYERSNOHC];
                VAR_SELECTED_UNIT setVariable ["invisible", true, true];

                [LOG_STAFF, format ["INIVISIBLE MODE ENABLED FOR %1:%2", name VAR_SELECTED_UNIT, getPlayerUID VAR_SELECTED_UNIT], _fnc_scriptName] call GW_server_fnc_log
            }
        }];
        private _ctrlSelectedUnitToolbarButtonHeal = _ctrlSelectedUnitToolbar controlsGroupCtrl IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON6;
        _ctrlSelectedUnitToolbarButtonHeal ctrlAddEventHandler ["ButtonClick", {
            params [["_ctrl", controlNull, [controlNull]]];

            VAR_SELECTED_UNIT setDamage 0;
            [LOG_STAFF, format ["HEALED %1:%2", name VAR_SELECTED_UNIT, getPlayerUID VAR_SELECTED_UNIT], _fnc_scriptName] call GW_server_fnc_log
        }];

        // Setup Units Tree
        ["updateUnitsList", [_display]] call SELF;
        private _ctrlTreeListUnits = _display displayCtrl IDC_DISPLAYADMIN_TREELISTUNITS;
        _ctrlTreeListUnits ctrlAddEventHandler ["TreeSelChanged", {
            params [
                ["_ctrl",          controlNull, [controlNull]],
                ["_treeEntryPath", [],          [[]]]
            ];

            private _display = ctrlParent _ctrl;

            private _unitUID = _ctrl tvData _treeEntryPath;
            if (_unitUID isEqualTo "") exitWith {};

            private _unit = [_unitUID] call GW_client_fnc_getUnitByUID;

            // Center on player
            private _ctrlMap = _display displayCtrl IDC_DISPLAYADMIN_MAP;
            _ctrlMap ctrlMapAnimAdd [0, 0.05, _unit];
            ctrlMapAnimCommit _ctrlMap;

            ["updateUnitInformation", [_display, _unit]] call SELF
        }];

        // Setup Vehicles
        private _ctrlTextSelectedVehicle = _display displayCtrl IDC_DISPLAYADMIN_SELECTEDVEHICLENAME;
        _ctrlTextSelectedVehicle ctrlSetText localize "STR_GW_GUI_DISPLAYS_DISPLAYADMIN_NOVEHICLESELECTED";
        private _ctrlListboxSelectedVehicleActions = _display displayCtrl IDC_DISPLAYADMIN_SELECTEDVEHICLEACTIONS;
        _ctrlListboxSelectedVehicleActions ctrlEnable false;

        {
            _x params [
                ["_name", "", [""]],
                ["_data", "", [""]]
            ];

            _ctrlListboxSelectedVehicleActions lbAdd _name;
            _ctrlListboxSelectedVehicleActions lbSetData [_forEachIndex, _data]
        } forEach [
            ["Move In Driver", "if (isNull GW_DISPLAYAdmin_SelectedUnit) exitWith {hint 'You must select a unit to move in'}; [GW_DISPLAYAdmin_SelectedUnit, GW_DISPLAYAdmin_SelectedVehicle, 0] remoteExecCall ['GW_client_fnc_moveUnitIntoVehicle', GW_DISPLAYAdmin_SelectedUnit]"],
            ["Move In Back", "if (isNull GW_DISPLAYAdmin_SelectedUnit) exitWith {hint 'You must select a unit to move in'}; [GW_DISPLAYAdmin_SelectedUnit, GW_DISPLAYAdmin_SelectedVehicle, 1] remoteExecCall ['GW_client_fnc_moveUnitIntoVehicle', GW_DISPLAYAdmin_SelectedUnit]"],
            ["Eject Vehicle Crew", "{unassignVehicle _x; _x action ['Eject', vehicle _x]; true} count (crew GW_DISPLAYAdmin_SelectedVehicle)"],
            ["Fuel", "GW_DISPLAYAdmin_SelectedVehicle setFuel 1"],
            ["Empty Fuel", "GW_DISPLAYAdmin_SelectedVehicle setFuel 0"],
            ["Destroy Engine", "GW_DISPLAYAdmin_SelectedVehicle setHitPointDamage ['hitEngine', 1.0]"],
            ["Repair", "GW_DISPLAYAdmin_SelectedVehicle setDamage 0"],
            ["Delete", "deleteVehicle GW_DISPLAYAdmin_SelectedVehicle"]
        ];

        _ctrlListboxSelectedVehicleActions ctrlAddEventHandler ["LBDblClick", {
            params [
                ["_ctrl", controlNull, [controlNull]],
                ["_index", -1, [-1]]
            ];

            private _lbData = _ctrl lbData _index;
            [] call compile _lbData;

            [LOG_STAFF, format ["EXECUTED [%1] on %2 (UNIT SELECTED: %3)", _lbData, VAR_SELECTED_VEHICLE, VAR_SELECTED_UNIT], _fnc_scriptName] call GW_server_fnc_log
        }]
    };

    case "onVehicleSelected": {
        _args params [
            ["_display",       displayNull, [displayNull]],
            ["_vehicleObject", objNull,     [objNull]]
        ];

        private _ctrlTextSelectedVehicle = _display displayCtrl IDC_DISPLAYADMIN_SELECTEDVEHICLENAME;
        _ctrlTextSelectedVehicle ctrlSetText (typeOf _vehicleObject);

        private _ctrlListboxSelectedVehicleActions = _display displayCtrl IDC_DISPLAYADMIN_SELECTEDVEHICLEACTIONS;
        _ctrlListboxSelectedVehicleActions ctrlEnable true;

        VAR_SELECTED_VEHICLE = _vehicleObject
    };

    case "updateUnitInformation": {
        _args params [
            ["_display", displayNull, [displayNull]],
            ["_unit",    objNull,     [objNull]]
        ];

        private _ctrlTextSelectedUnitName = _display displayCtrl IDC_DISPLAYADMIN_SELECTEDUNITNAME;
        private _ctrlStructuredTextUnitInformation = _display displayCtrl IDC_DISPLAYADMIN_SELECTEDPLAYERINFORMATION;

        // Update selected unit global
        VAR_SELECTED_UNIT = _unit;

        private "_unitInformation";
        if (isPlayer _unit) then {
            [_display, true] call VAR_SETUNITTOOLBARENABLED;

            _unit switchCamera cameraView;

            private _vehicleType = if (isNull objectParent _unit) then {
                "On Foot"
            } else {
                "In Vehicle"
            };

            // Return
            _unitInformation = [
                name _unit,
                [
                    "<t font='PuristaMedium' shadow='0' size='%15'>%8: </t> <t shadow='0' size='%15' font='%14' align='right'>%1</t><br/><t size='%15' shadow='0' font='PuristaMedium'>%7:</t><t size='%15' font='%14' shadow='0' align='right'> %2</t><br/><t size='%15' font='PuristaMedium' shadow='0'>%11:</t><t shadow='0' align='right' size='%15' font='%14'> %4</t><br/><t size='%15' font='PuristaMedium' shadow='0'>%10:</t><t shadow='0' align='right' size='%15' font='%14'> %5%6</t><br/><t shadow='0' size='%15' font='PuristaMedium'>%12:</t><t size='%15' font='%14' shadow='0' align='right'> %13</t>",
                    name _unit,
                    getPlayerUID _unit,
                    "",
                    _vehicleType,
                    round (damage vehicle _unit),
                    "%",
                    localize "STR_GW_GUI_DISPLAYS_DISPLAYADMIN_PLAYERUID",
                    localize "STR_GW_GUI_DISPLAYS_DISPLAYADMIN_NAME",
                    "",
                    localize "STR_GW_GUI_DISPLAYS_DISPLAYADMIN_VEHICLEDAMAGE",
                    localize "STR_GW_GUI_DISPLAYS_DISPLAYADMIN_VEHICLETYPE",
                    localize "STR_GW_GUI_DISPLAYS_DISPLAYADMIN_GRIDREF",
                    mapGridPosition _unit,
                    "RobotoCondensed",
                    "0.8 * safezoneH"
                ]
            ]
        } else {
            [_display, false] call VAR_SETUNITTOOLBARENABLED;

            // Return
            _unitInformation = [
                localize "STR_GW_GUI_DISPLAYS_DISPLAYADMIN_NOSELECTEDUNIT",
                [""]
            ]
        };

        _unitInformation params ["_unitName", "_unitInfo"];
        _ctrlStructuredTextUnitInformation ctrlSetStructuredtext parseText format _unitInfo;
        _ctrlTextSelectedUnitName ctrlSetText _unitName;

        // Change style of toolbar buttons
        private _ctrlSelectedUnitToolbar = _display displayCtrl IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR;
        private _ctrlSelectedUnitToolbarButtonSpectatePlayer = _ctrlSelectedUnitToolbar controlsGroupCtrl IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON1;
        private _ctrlSelectedUnitToolbarButtonMoveIntoUnitsVehicle = _ctrlSelectedUnitToolbar controlsGroupCtrl IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON3;
        private _ctrlSelectedUnitToolbarButtonImmune = _ctrlSelectedUnitToolbar controlsGroupCtrl IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON4;
        private _ctrlSelectedUnitToolbarButtonInvisible = _ctrlSelectedUnitToolbar controlsGroupCtrl IDC_DISPLAYADMIN_SELECTEDUNITTOOLBAR_BUTTON5;

        if (cameraOn isEqualTo _unit) then {
            _ctrlSelectedUnitToolbarButtonSpectatePlayer ctrlSetTextColor COLOR_ENABLED
        } else {
            _ctrlSelectedUnitToolbarButtonSpectatePlayer ctrlSetTextColor COLOR_DISABLED
        };

        if !(isNull objectParent _unit) then {
            _ctrlSelectedUnitToolbarButtonMoveIntoUnitsVehicle ctrlSetTextColor COLOR_ENABLED
        } else {
            _ctrlSelectedUnitToolbarButtonMoveIntoUnitsVehicle ctrlEnable false;
            _ctrlSelectedUnitToolbarButtonMoveIntoUnitsVehicle ctrlSetTextColor COLOR_DISABLED
        };

        if (_unit getVariable ["immune", false]) then {
            _ctrlSelectedUnitToolbarButtonImmune ctrlSetTextColor COLOR_ENABLED
        } else {
            _ctrlSelectedUnitToolbarButtonImmune ctrlSetTextColor COLOR_DISABLED
        };

        if (_unit getVariable ["invisible", false]) then {
            _ctrlSelectedUnitToolbarButtonInvisible ctrlSetTextColor COLOR_ENABLED
        } else {
            _ctrlSelectedUnitToolbarButtonInvisible ctrlSetTextColor COLOR_DISABLED
        }
    };

    case "updateUnitsList": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlTreeListUnits = _display displayCtrl IDC_DISPLAYADMIN_TREELISTUNITS;
        tvClear _ctrlTreeListUnits;
        {
            private _sideAddToTreeView = _ctrlTreeListUnits tvAdd [[], _x];
            private _sideAestetics = [
                ["a3\ui_f\Data\Map\Markers\nato\b_unknown.paa", WEST],
                ["a3\ui_f\Data\Map\Markers\nato\c_unknown.paa", CIVILIAN],
                ["a3\ui_f\Data\Map\Markers\nato\n_unknown.paa", INDEPENDENT],
                ["a3\ui_f\Data\Map\Markers\nato\o_unknown.paa", OPFOR]
            ] select _forEachIndex;

            _sideAestetics params [
                ["_picturePath", "", [""]],
                ["_side", sideUnknown, [sideUnknown]]
            ];

            _ctrlTreeListUnits tvSetData [[_sideAddToTreeView], ""];
            _ctrlTreeListUnits tvSetPicture [[_sideAddToTreeView], _picturePath];
            _ctrlTreeListUnits tvSetPictureColor [[_sideAddToTreeView], [_side] call BIS_fnc_sideColor]
        } forEach ["Blufor", "Civilian", "Independent", "Opfor"];

        {
            if (count units _x >= 1) then {
                private _treeViewAddedSideIndex = switch side _x do {
                    case west:        {0};
                    case civilian:    {1};
                    case independent: {2};
                    case east:        {3};
                };

                private _groupAddToTreeView = _ctrlTreeListUnits tvAdd [[_treeViewAddedSideIndex], groupID _x];
                _ctrlTreeListUnits tvSetData [[_treeViewAddedSideIndex, _groupAddToTreeView], ""];
                _ctrlTreeListUnits tvSetPicture [[_treeViewAddedSideIndex, _groupAddToTreeView], "a3\ui_f\data\igui\cfg\cursors\select_ca.paa"];
                _ctrlTreeListUnits tvSetPictureColor [[_treeViewAddedSideIndex, _groupAddToTreeView], [side _x] call BIS_fnc_sideColor];

                {
                    private _name = name _x;
                    private _uid = getPlayerUID _x;
                    private _side = side group _x;

                    private _unitAddToTreeView = _ctrlTreeListUnits tvAdd [[_treeViewAddedSideIndex, _groupAddToTreeView], _name];
                    _ctrlTreeListUnits tvSetData [[_treeViewAddedSideIndex, _groupAddToTreeView, _unitAddToTreeView], _uid];
                    _ctrlTreeListUnits tvSetPicture [[_treeViewAddedSideIndex, _groupAddToTreeView, _unitAddToTreeView], "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa"];
                    _ctrlTreeListUnits tvSetPictureColor [[_treeViewAddedSideIndex, _groupAddToTreeView, _unitAddToTreeView], [_side] call BIS_fnc_sideColor];

                    // New Players
                    if (_uid in (missionNamespace getVariable ["GW_Server_NewPlayers", []])) then {
                        _ctrlTreeListUnits tvSetPictureRight [[_treeViewAddedSideIndex, _groupAddToTreeView, _unitAddToTreeView], "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\help_tutorial_ca.paa"]
                    };

                    true
                } count units _x
            };
            true
        } count allGroups;
        tvExpandAll _ctrlTreeListUnits
    };

    case "onUnload": {
        VAR_SELECTED_UNIT = objNull;
        VAR_SELECTED_VEHICLE = objNull;
        VAR_SETUNITTOOLBARENABLED = nil;

        switchCamera player;
        call GW_client_fnc_guiLoadHUD;

        {
            _x setMarkerAlphaLocal 1;
            true
        } count allMapMarkers;

        // [STAFF_LOG, format ["Admin Menu Unloaded (%1:%2)", name player, getPlayerUID player], _fnc_scriptName] call GW_server_fnc_log
    }
};
