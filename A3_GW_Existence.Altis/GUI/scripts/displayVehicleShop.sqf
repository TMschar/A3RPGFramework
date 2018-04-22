#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displayVehicleShop.sqf
 *
 * Parameter(s):
 *    0: STRING - Event
 *    1: ARRAY - Arguments

 PLEASE SOMEONE (IF SIMZOR) FUCKING SIMZOR MAN FIX THIS MESS
 DISCLAIMER: I UPDATED THIS TWO DAYS BEFORE LUANCH WHICH REQUIRED
 NASTY METHODS AND THIS IS GOING TO BE CHANGED SOMETIME IN THE NEAR
 FUTURE.
 */
#define SELF GW_displayVehicleShop_Script
#define VAR_SHOPNAME GW_displayVehicleShop_displayName
#define VAR_VEHICLESARRAY GW_displayVehicleShop_vehicles
#define VAR_VEHICLESPAWNPOINTSARRAY GW_displayVehicleShop_spawnPoints

scriptName "GW_displayVehicleShop_script: main";
scopeName "main";

disableSerialization;
if (!params [ ["_event", "", [""]], ["_args", [], [[]]] ]) throw "Expected parameters";

switch (_event) do
{
    case "onLoad":
    {
        _args params [ ["_display", displayNull, [displayNull]] ];

        private _ctrlShopName = _display displayCtrl IDC_DISPLAYVEHICLESHOP_HEADER;
        _ctrlShopName ctrlSetText VAR_SHOPNAME;

        private _ctrlTree = _display displayCtrl IDC_DISPLAYVEHICLESHOP_TREEVEHICLES;
        private _configVehicles = missionConfigFile >> "CfgVehicles" >> "Vehicles";
        {
            _x params
            [
                ["_vehicleClassname", "", [""]],
                ["_condition", "", [""]],
                ["_levelCategoryIndex", 0, [0]],
                ["_levelRequiredLevel", 0, [0]]
            ];

            private _configClass = _configVehicles >> _vehicleClassname;
            if (isClass _configClass) then
            {
                private _vehicleConfig = configFile >> "CfgVehicles" >> _vehicleClassname;
                private _vehicleDisplayName = getText (_vehicleConfig >> "displayName");
                private _vehicleDisplayPicture = getText (_vehicleConfig >> "picture");

                // Add to tree
                private _index = _ctrlTree tvAdd [[], _vehicleDisplayName];
                _ctrlTree tvSetPicture [[_index], _vehicleDisplayPicture];

                // Set right picture if it's a dlc vehicle
                private _dlc = _vehicleConfig >> "dlc";
                if (isText _dlc) then
                {
                    private _logo = getText (configFile >> "CfgMods" >> getText _dlc >> "logo");
                    _ctrlTree tvSetPictureRight [[_index], _logo];
                    _ctrlTree tvSetTooltip [[_index], format ["This vehicle is part of the %1 DLC.", getText _dlc]]
                };

                // Get data from ArmA
                private _maxSpeed = getNumber (_vehicleConfig >> "maxSpeed");
                private _armor = getNumber (_vehicleConfig >> "armor");
                private _seats = getNumber (_vehicleConfig >> "transportSoldier");
                private _hp = getNumber (_vehicleConfig >> "enginePower");
                private _fuel = getNumber (_vehicleConfig >> "fuelCapacity");

                // Get data from Framework
                private _purchasePrice = getNumber (_configClass >> "purchasePrice");
                private _rentalPrice = getNumber (_configClass >> "rentalPriceOverride");
                private _trunkSpace = getNumber (_configClass >> "virtualInventorySpace");

                // Set data
                private _data = format
                [
                    "[""%1"",""%2"",%3,%4,%5,%6,%7,%8,%9,%10,""%11"","""",[],"""",""%12"",%13,%14]",
                    _vehicleDisplayName,
                    _vehicleDisplayPicture,
                    _maxSpeed,
                    _armor,
                    _seats,
                    _hp,
                    _fuel,
                    _purchasePrice,
                    _rentalPrice,
                    _trunkSpace,
                    _vehicleClassname,
                    _condition,
                    _levelCategoryIndex,
                    _levelRequiredLevel
                ];
                _ctrlTree tvSetData [[_index], _data];

                // Setup textures
                private _texturesArray = getArray (_configClass >> "textures");
                {
                    _x params
                    [
                        ["_textureName", "", [""]],
                        ["_identifier", "", [""]],
                        ["_textureCondition", "", [""]],
                        ["_texturePaths", [], [[]]]
                    ];

                    if ([_textureCondition] call GW_client_fnc_doEvaluation) then
                    {
                        private _textureEntryIndex = _ctrlTree tvAdd [[_index], _textureName];
                        private _data = format
                        [
                            "[""%1"",""%2"",%3,%4,%5,%6,%7,%8,%9,%10,""%11"",""%12"",%13,""%14"",""%15"",%16,%17]",
                            _vehicleDisplayName,
                            _vehicleDisplayPicture,
                            _maxSpeed,
                            _armor,
                            _seats,
                            _hp,
                            _fuel,
                            _purchasePrice,
                            _rentalPrice,
                            _trunkSpace,
                            _vehicleClassname,
                            _identifier,
                            _texturePaths,
                            _textureName,
                            _condition,
                            _levelCategoryIndex,
                            _levelRequiredLevel
                        ];
                        _ctrlTree tvSetData [[_index, _textureEntryIndex], _data];
                    };
                    true
                } count _texturesArray;
            };
            true;
        } count VAR_VEHICLESARRAY;

        _ctrlTree ctrlAddEventHandler
        [
            "TreeSelChanged",
            {
                params [ ["_ctrl", controlNull, [controlNull]], ["_selectionPath", [], [[]]] ];
                private _display = ctrlParent _ctrl;

                private _tvData = _ctrl tvData _selectionPath;
                if (_tvData isEqualTo "") exitWith {};

                private _vehicleData = parseSimpleArray _tvData;
                _vehicleData params
                [
                    ["_vehicleDisplayName", "", [""]],
                    ["_vehiclePreview", "", [""]],
                    ["_maxSpeed", 0, [0]],
                    ["_armor", 0, [0]],
                    ["_seats", 0, [0]],
                    ["_hp", 0, [0]],
                    ["_fuel", 0, [0]],
                    ["_purchasePrice", 0, [0]],
                    ["_rentalPrice", 0, [0]],
                    ["_trunkSpace", 0, [0]]
                ];

                private _ctrlTextName = _display displayCtrl IDC_DISPLAYVEHICLESHOP_TEXTNAME;
                private _ctrlTextNameSecond = _display displayCtrl IDC_DISPLAYVEHICLESHOP_SELECTEDVEHICLENAME;
                private _ctrlTextPrice = _display displayCtrl IDC_DISPLAYVEHICLESHOP_TEXTPRICE;
                private _ctrlTextMaxSpeed = _display displayCtrl IDC_DISPLAYVEHICLESHOP_TEXTMAXSPEED;
                private _ctrlTextHorsePower = _display displayCtrl IDC_DISPLAYVEHICLESHOP_TEXTHORSEPOWER;
                private _ctrlTextPassengerSeats = _display displayCtrl IDC_DISPLAYVEHICLESHOP_TEXTPASSENGERSEATS;
                private _ctrlTextTrunkSpace = _display displayCtrl IDC_DISPLAYVEHICLESHOP_TEXTTRUNKSPACE;
                private _ctrlTextFuel = _display displayCtrl IDC_DISPLAYVEHICLESHOP_TEXTFUEL;
                private _ctrlTextArmor = _display displayCtrl IDC_DISPLAYVEHICLESHOP_TEXTARMOR;
                private _ctrlStructuredTextPreview = _display displayCtrl IDC_DISPLAYVEHICLESHOP_SELVEHICLEICONPREVIEW;

                private _formattedPricePurchase = [_purchasePrice] call GW_client_fnc_currencyFormat;
                private _formattedPriceRental = [_rentalPrice] call GW_client_fnc_currencyFormat;

                _ctrlTextName ctrlSetText _vehicleDisplayName;
                _ctrlTextNameSecond ctrlSetText _vehicleDisplayName;
                _ctrlTextPrice ctrlSetText format ["Purchase for £%1 and rent for £%2", _formattedPricePurchase, _formattedPriceRental];
                _ctrlTextMaxSpeed ctrlSetText (str _maxSpeed + " km/h");
                _ctrlTextHorsePower ctrlSetText str _hp;
                _ctrlTextPassengerSeats ctrlSetText str _seats;
                _ctrlTextTrunkSpace ctrlSetText str _trunkSpace;
                _ctrlTextFuel ctrlSetText (str _fuel + " l");
                _ctrlTextArmor ctrlSetText str _armor;
                _ctrlStructuredTextPreview ctrlSetStructuredText parseText format ["<br/><img image='%1' size='%2' align='center' />", _vehiclePreview, 2.5 * safezoneH];

                private _levelCategoryIndex = _vehicleData param [15, -1, [-1]];
                private _levelRequiredLevel = _vehicleData param [16, -1, [-1]];
                private _ctrlTextRequiredVehicleLevel = _display displayCtrl IDC_DISPLAYVEHICLESHOP_TEXTREQUIREDVEHICLELEVEL;
                private _expCategory = [_levelCategoryIndex] call GW_client_fnc_experienceGetCategoryName;
                private _textLevel = [format ["Level %2 required in %1", _expCategory, _levelRequiredLevel], "No level required"] select (_levelRequiredLevel isEqualTo -1);
                _ctrlTextRequiredVehicleLevel ctrlSetText _textLevel;
            }
        ];
        _ctrlTree tvSetCurSel [0];
        tvExpandAll _ctrlTree;

        private _ctrlInsuranceCheckbox = _display displayCtrl IDC_DISPLAYVEHICLESHOP_CHECKBOXINSURANCE;
        _ctrlInsuranceCheckbox ctrlEnable false;

        private _ctrlButtonRentVehicle = _display displayCtrl IDC_DISPLAYVEHICLESHOP_BUTTONRENTVEHICLE;
        _ctrlButtonRentVehicle ctrlEnable false;
        // _ctrlButtonRentVehicle ctrlAddEventHandler
        // [
        //     "ButtonClick",
        //     {
        //         params [ ["_ctrl", controlNull, [controlNull]] ];

        //         private _display = ctrlParent _ctrl;
        //         private _ctrlTreeVehicles = _display displayCtrl IDC_DISPLAYVEHICLESHOP_TREEVEHICLES;
        //         private _tvData = _ctrlTreeVehicles tvData (tvCurSel _ctrlTreeVehicles);

        //         if (_tvData isEqualTo "") exitWith {};

        //         private _vehicleData = parseSimpleArray _tvData;
        //         private _vehicleDisplayName = _vehicleData param [0, "", [""]];
        //         private _rentalPrice = _vehicleData param [8, 0, [0]];
        //         private _vehicleClassname = _vehicleData param [10, "", [""]];
        //         private _textureIdentifier = _vehicleData param [11, "", [""]];
        //         private _texturePaths = _vehicleData param [12, [], [[]]];
        //         private _textureName = _vehicleData param [13, "", [""]];

        //         // Setup vehicle
        //         [
        //             "onPurchaseVehicleRequest",
        //             [
        //                 _display,
        //                 _vehicleDisplayName,
        //                 _rentalPrice,
        //                 VAR_VEHICLESPAWNPOINTSARRAY,
        //                 _vehicleClassName,
        //                 _textureIdentifier,
        //                 _texturePaths,
        //                 _textureName,
        //                 true
        //             ]
        //         ] call SELF;
        //     }
        // ];

        private _ctrlButtonPurchaseVehicle = _display displayCtrl IDC_DISPLAYVEHICLESHOP_BUTTONPURCHASEVEHICLE;
        _ctrlButtonPurchaseVehicle ctrlAddEventHandler
        [
            "ButtonClick",
            {
                params [ ["_ctrl", controlNull, [controlNull]] ];
                private _display = ctrlParent _ctrl;

                private _ctrlTreeVehicles = _display displayCtrl IDC_DISPLAYVEHICLESHOP_TREEVEHICLES;
                private _tvData = _ctrlTreeVehicles tvData (tvCurSel _ctrlTreeVehicles);

                if (_tvData isEqualTo "") exitWith {};

                private _vehicleData = parseSimpleArray _tvData;
                private _condition = _vehicleData param [14, "", [""]];
                private _levelCategoryIndex = _vehicleData param [15, -1, [-1]];
                private _levelRequiredLevel = _vehicleData param [16, -1, [-1]];
                private _vehicleDisplayName = _vehicleData param [0, "", [""]];
                private _purchasePrice = _vehicleData param [7, 0, [0]];
                private _vehicleClassname = _vehicleData param [10, "", [""]];
                private _textureIdentifier = _vehicleData param [11, "", [""]];
                private _texturePaths = _vehicleData param [12, [], [[]]];
                private _textureName = _vehicleData param [13, "", [""]];

                // Setup vehicle
                [
                    "onPurchaseVehicleRequest",
                    [
                        _display,
                        _vehicleDisplayName,
                        _purchasePrice,
                        VAR_VEHICLESPAWNPOINTSARRAY,
                        _vehicleClassName,
                        _textureIdentifier,
                        _texturePaths,
                        _textureName,
                        false,
                        _condition,
                        _levelCategoryIndex,
                        _levelRequiredLevel
                    ]
                ] call SELF;
            }
        ];
    };
    case "onPurchaseVehicleRequest":
    {
        _args spawn
        {
            scriptName "GW_displayVehicleShop_script: wait for vehicle purchase";
            scopeName "main";

            disableSerialization;
            params
            [
                ["_display", displayNull, [displayNull]],
                ["_displayName", "", [""]],
                ["_purchasePrice", 0, [0]],
                ["_spawnMarkers", [], [[]]],
                ["_vehicleClass", "", [""]],
                ["_textureIdentifier", "", [""]],
                ["_texturePaths", [], [[]]],
                ["_textureName", "", [""]],
                ["_rental", false, [false]],
                ["_condition", "", [""]],
                ["_levelCategoryIndex", -1, [1]],
                ["_levelRequiredLevel", -1, [1]]
            ];

            if (
                isNull _display
                || {_displayName isEqualTo ""}
                || {_purchasePrice isEqualTo 0}
                || {_spawnMarkers isEqualTo []}
                || {_vehicleClass isEqualTo ""}
            ) exitWith {};

            // A texture needs to be selected
            //if (_texturePaths isEqualTo []) exitWith {};

            if !([_condition] call GW_client_fnc_doEvaluation) exitWith {
                [
                    HINT_WARNING,
                    "Vehicle Purchase Failed",
                    "For some reason you are not permitted to purchase this vehicle. Most likely due to not owning the license."
                ] call GW_client_fnc_notificationsAdd;
            };

            if !([_levelCategoryIndex, _levelRequiredLevel] call GW_client_fnc_experienceCategoryHasLevel) exitWith {
                [
                    HINT_WARNING,
                    "Insufficient Level",
                    "You do not have the required level of experience to purchase this vehicle."
                ] call GW_client_fnc_notificationsAdd;
            };

            // Get any available spawn point
            private _spawnMarker = [_spawnMarkers] call GW_client_fnc_vehicleSortVehicleSpawnPoint;
            if (_spawnMarker isEqualTo "") exitWith
            {
                [
                    HINT_WARNING,
                    "All spawnpoints are currently blocked",
                    "The vehicle spawnpoints are currently blocked, please ask any owner of a vehicle to move their vehicle."
                ] call GW_client_fnc_notificationsAdd
            };

            // Prompt player for confirmation
            if !(["Are you sure?", format [
                "Are you sure that you want to buy %1 for %2?",
                _displayName,
                _purchasePrice
            ], "YES", "NO", _display] call GW_client_fnc_guiPrompt) exitWith {};

            // Civilians needs to pay for the vehicle
            if (playerSide isEqualTo civilian) then
            {
                if (CASH < _purchasePrice) then
                {
                    private _missingFunds = CASH - _purchasePrice;
                    [HINT_AMBER, "Not enough funds", format [
                        "You do not have enough funds on your person in order to purchase this vehicle."
                        + "If you have enough funds in your bank account, please refer to any ATM and pull out what you need."
                        + "You are missing £%1.",
                        _missingFunds
                    ]] call GW_client_fnc_notificationsAdd;
                    breakOut "main";
                }
                else
                {
                    CASH = CASH - _purchasePrice;
                    [false] call GW_client_fnc_playerSyncRequest
                };
            };

            // Handle hospital
            private _vehicle = objNull;
            if (_spawnMarker == "spawn_marker_airvehicles_kavala") then
            {
                private _hospitalHelipad = (nearestObjects [getMarkerPos _spawnMarker, ["Land_Hospital_side2_F"], 50]) select 0;
                private _position = _hospitalHelipad modelToWorld [-0.4, -4, 12.65];

                // Create vehicle and set correct direction
                _vehicle = _vehicleClass createVehicle [0, 0, 999];
                _vehicle setPosATL _position;
                _vehicle setDir (markerDir _spawnMarker);
            }
            else
            {
                _vehicle = _vehicleClass createVehicle (getMarkerPos _spawnMarker);
                _vehicle setDir (markerDir _spawnMarker);
            };

            // Setup Vehicle
            [
                _vehicle,
                !(playerSide isEqualTo civilian),
                _textureIdentifier,
                _rental
            ] call GW_client_fnc_vehicleSetupVehicle;

            // CLose display
            _display closeDisplay 2;

            // Set purchase text depending on what side the player
            // is on.
            private _purchasePriceFormatted = [_purchasePrice] call GW_client_fnc_currencyFormat;
            private _purchaseText =
            [
                // Normal spawn text
                format
                [
                    "You purchased a %3 %1 for %2. It has spawned on the nearest vehicle spawnpoint. Press U to unlock it.",
                    _displayName,
                    _purchasePriceFormatted,
                    _textureName
                ],

                // Government spawn text
                format
                [
                    "You ordered a %2 government %1. It has spawned on the nearest vehicle spawnpoint. Press U to unlock it.",
                    _displayName,
                    _textureName
                ]
            ] select !(playerSide isEqualTo civilian);

            // Give experience points if civilian
            if (playerSide isEqualTo civilian) then
            {
                [LEVEL_VEHICLES, 7 * (_purchasePrice / 1000), "Purchasing a Vehicle"] call GW_client_fnc_experienceCategoryAddExperience;
            };

            // Notify
            private _vehicleIcon = [_vehicleClass] call GW_client_fnc_vehicleGetIcon;
            [HINT_NORMAL, "Vehicle Purchase Notice", _purchaseText, _vehicleIcon] call GW_client_fnc_notificationsAdd;

            // Add log entry for purchase
            [
                LOG_INFO,
                format
                [
                    "Purchased a vehicle (%1 for %2)",
                    _displayName,
                    _purchasePrice
                ],
                "GW_displayVehicleShop_script"
            ] remoteExecCall ["GW_server_fnc_log", 2];
        };
    };
    case "onUnload": {};
};
