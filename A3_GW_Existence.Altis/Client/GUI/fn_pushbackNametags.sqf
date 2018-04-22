#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_pushbackNametags.sqf
 *
 * Description:
 *     Puts nametags to draw in an array,
 *     so it can be picked up by the nametag drawing system.
 */
#define COLOUR_WHITE [1, 1, 1, 1]
#define COLOUR_GREEN [0, 1, 0, 1]
#define KEY_WINDOWS (DIK_LWIN call GW_client_fnc_playerKeyDictionary)
#define KEY_WINDOWS_TRIMMED KEY_WINDOWS
#define CONFIG_FIELDS (missionConfigFile >> "CfgResources" >> "Fields" >> worldName)
#define CONFIG_FISHING (missionConfigFile >> "CfgResources" >> "FishingSpots" >> worldName)
#define ARRAY_MASKS (getArray (missionConfigFile >> "CfgClothing" >> "masks"))
#define PROPERTY_CONTAINER (getText (missionConfigFile >> "CfgProperties" >> worldName >> "containerType"))
#define PETROLSTATION_OBJECTCLASSNAME (getText (missionConfigFile >> "CfgPetrolStations" >> worldName >> "Settings" >> "robbableObject"))

scriptName "GW_client_fnc_pushbackNametags: main";
scopeName "main";

// See if player has disabled nametags
if (profileNamespace getVariable ["GW_Player_HideNametags", false]) exitWith {};

private _objects = nearestObjects
[
    vehicle player,
    [
        "Car",
        "Air",
        "Boat",
        "Man",
        "Land_TripodScreen_01_dual_v2_F",
        "Land_InfoStand_V1_F",
        "Land_InfoStand_V2_F",
        "Land_Laptop_unfolded_F",
        "Land_Device_assembled_F",
        "Land_Device_disassembled_F",
        "Land_ATM_01_malden_F",
        "Land_Atm_02_F",
        "Land_Atm_01_F",
        "Land_PhoneBooth_01_F",
        PROPERTY_CONTAINER,
        "Box_T_East_Wps_F",
        "Land_Money_F",
        "Land_CargoBox_V1_F",
        PETROLSTATION_OBJECTCLASSNAME
    ],
    13
];

GW_drawNameTags_tags = [];
{
    if (
        !lineIntersects [
            AGLtoASL positionCameraToWorld [0, 0, 0],
            AGLtoASL (_x modelToWorld [0, 0, 0.5]),
            vehicle player,
            _x
        ]
        && {!lineIntersects [
            AGLtoASL positionCameraToWorld [0, 0, 0],
            AGLtoASL (_x modelToWorld (_x selectionPosition "head")),
            vehicle player,
            _x
        ]}
        && {!(_x getVariable ["invisible", false])}
    ) then
    {
        private _position = [];
        private _title = "";
        private _titleColour = COLOUR_GREEN;
        private _subtitle = "";
        private _subtitleColour = COLOUR_WHITE;
        private _icon = "";
        private _position = [];
        private _distance = player distance _x;

        if (isPlayer _x) then
        {
            _x selectionPosition "head" params ["_selPosX", "_selPosY", "_selPosZ"];
            _position = _x modelToWorldVisual [0, 0, (((_selPosZ + 1.6) + (_distance / 15)) / 1.5)];

            _title = driver _x getVariable ["nametags_title", ""];
            _titleColour = driver _x getVariable ["nametags_title_colour", []];
            _subtitle = driver _x getVariable ["nametags_subtitle", ""];
            _subtitleColour = driver _x getVariable ["nametags_subtitle_colour", []];
            _icon = driver _x getVariable ["nametags_icon", ""];

            if (goggles _x in ARRAY_MASKS || {headgear _x in ARRAY_MASKS}) then
            {
                _icon = "textures\playertags\mask.paa";
                _subtitle = "Unknown"
            };
            if (_x getVariable ["restrained", false]) then
            {
                _icon = "textures\playerTags\handcuffs.paa";
                _subtitle = format
                [
                    "Restrained by %1",
                    groupID (_x getVariable ["restrainer", grpNull])
                ]
            };
            if (_x getVariable ["surrendered", false]) then
            {
                _icon = "textures\playertags\flag.paa";
                _subtitle = "Shift + R"
            };
            if (_x getVariable ["speaking", false]) then
            {
                _subtitle = "Speaking";
                _icon = format
                [
                    "textures\playertags\speaking_%1.paa",
                    floor (diag_tickTime * 15) % 3
                ];
            };
        } else {
            _title = _x getVariable ["nametags_title", ""];
            _subtitle = _x getVariable ["nametags_subtitle", ""];
            _icon = _x getVariable ["nametags_icon", ""];

            _position = switch (typeOf _x) do {
                case "Land_Money_F": {
                    _icon = "textures\playerTags\moneyStack.paa";
                    _title = "Money Stack";
                    _subtitle = KEY_WINDOWS_TRIMMED;
                    _x modelToWorldVisual [0, 0, 0.5];
                };
                case "Land_CashDesk_F":
                {
                    _subtitle = KEY_WINDOWS_TRIMMED;
                    _x modelToWorldVisual [0, 0, 1.85];
                };
                case "Land_ATM_01_malden_F";
                case "Land_Atm_02_F";
                case "Land_Atm_01_F":
                {
                    _icon = "textures\playertags\atm.paa";
                    _title = "ATM";
                    _subtitle = KEY_WINDOWS_TRIMMED;
                    _x modelToWorldVisual [0, 0, 1.85];
                };
                case "Land_PhoneBooth_01_F":
                {
                    _title = "Phone Booth";
                    _subtitle = KEY_WINDOWS_TRIMMED;
                    _x modelToWorldVisual [0, 0, 1.5];
                };
                case "Box_T_East_Wps_F";
                case "Box_NATO_Equip_F":
                {
                    _icon = "textures\playerTags\container.paa";
                    _title = "Container";
                    _subtitle = format ["%1 / I Key", KEY_WINDOWS_TRIMMED];
                    _x modelToWorldVisual [0, 0, 1];
                };
                case "Land_TripodScreen_01_dual_v2_F":
                {
                    _x modelToWorldVisual [0, 0, 1.3];
                };
                default
                {
                    _x modelToWorldVisual [0, 0, 1.1];
                };
            };
        };

        // Pushback nametag
        GW_drawNameTags_tags pushBack [_x, _title, _titleColour, _subtitle, _subtitleColour, _icon, COLOUR_WHITE, _position];
    };
    true;
} count (_objects - [vehicle player]);

// Add fields
private _fieldsConfigClasses = ("true" configClasses CONFIG_FIELDS) + ("true" configClasses CONFIG_FISHING);
{
    private _configClass = _x;
    private _fields = getArray (_x >> "markers") select
    {
        getMarkerPos _x distance player <= 80
    };

    // Loop through fields
    {
        private _position = getMarkerPos _x;
        _position set [2, 2.7];

        private _title = getText (_configClass >> "title");
        private _iconPath = getText (_configClass >> "icon");
        private _subtitle = KEY_WINDOWS_TRIMMED;
        private _titleColour =
        [
            COLOUR_GREEN,
            east call BIS_fnc_sideColor
        ] select (getNumber (_configClass >> "illegal") isEqualTo 1);

        // Add to array
        GW_drawNameTags_tags pushBack
        [
            objNull,
            _title,
            _titleColour,
            _subtitle,
            COLOUR_WHITE,
            _iconPath,
            COLOUR_WHITE,
            _position
        ];
        true
    } count _fields;
    true
} count _fieldsConfigClasses;
