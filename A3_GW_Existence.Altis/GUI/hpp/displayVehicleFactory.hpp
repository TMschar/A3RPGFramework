/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayVehicleFactory.hpp
*/

#define VEHICLEFACTORY_WINDOW_H 100
#define VEHICLEFACTORY_WINDOW_W 160

#define VEHICLEFACTORY_POS_X (CENTER_X - (VEHICLEFACTORY_WINDOW_W * 0.5) * GRID_W)
#define VEHICLEFACTORY_POS_Y (0.415 - (VEHICLEFACTORY_WINDOW_H * 0.5 - SIZE_M) * GRID_H)

#define VEHICLEFACTORY_STARTPOS_Y (VEHICLEFACTORY_POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define VEHICLEFACTORY_STARTPOS_X (VEHICLEFACTORY_POS_X + (1.5 * GRID_W))

class GW_displayVehicleFactory: GW_displayStandard {
    idd         = IDC_DISPLAYVEHICLEFACTORY_DISPLAY;
    scriptName  = "GW_displayVehicleFactory";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displayVehicleFactory'] call GW_client_fnc_initDisplay";
    class controlsBackground {
        class Tiles: GW_RscTiles {};
        class Header: GW_ctrlStaticHeader {
            text = "Vehicle Factory";
            x    = VEHICLEFACTORY_POS_X;
            y    = VEHICLEFACTORY_POS_Y;
            w    = VEHICLEFACTORY_WINDOW_W * GRID_W;
            h    = SIZE_M * GRID_H;
        };
        class Background: GW_ctrlStaticBackground {
            x = VEHICLEFACTORY_POS_X;
            y = VEHICLEFACTORY_POS_Y + (SIZE_M * GRID_H);
            w = VEHICLEFACTORY_WINDOW_W * GRID_W;
            h = (VEHICLEFACTORY_WINDOW_H * GRID_H) - (SIZE_M * GRID_H);
        };
        class TabsBackground: GW_ctrlStatic {
            x                 = VEHICLEFACTORY_STARTPOS_X;
            y                 = VEHICLEFACTORY_STARTPOS_Y + (GAP_H / 2) + (SIZE_M * GRID_H);
            w                 = (VEHICLEFACTORY_WINDOW_W * GRID_W) - (GAP_W * 2);
            h                 = (SIZE_M + TAB_H) * GRID_H;
            colorBackground[] = {0.1, 0.1, 0.1, 1};
        };
    };
    class controls {
        class Search: GW_ctrlEdit {
            idc = IDC_DISPLAYVEHICLEFACTORY_SEARCH;
            x   = VEHICLEFACTORY_STARTPOS_X;
            y   = VEHICLEFACTORY_STARTPOS_Y;
            w   = (VEHICLEFACTORY_WINDOW_H / 2.5) * GRID_W;
            h   = SIZE_M * GRID_H;
        };
        class ButtonSearch: GW_ctrlButtonSearch {
            idc = IDC_DISPLAYVEHICLEFACTORY_BUTTONSEARCH;
            x   = VEHICLEFACTORY_STARTPOS_X + ((VEHICLEFACTORY_WINDOW_H / 2.5) * GRID_W) + (0.85 * GRID_W);
            y   = VEHICLEFACTORY_STARTPOS_Y;
        };
        class Tabs: GW_ctrlToolbox {
            idc                 = IDC_DISPLAYVEHICLEFACTORY_TABS;
            x                   = VEHICLEFACTORY_STARTPOS_X;
            y                   = VEHICLEFACTORY_STARTPOS_Y + (GAP_H / 2) + (SIZE_M * GRID_H) + ((TAB_H / 2) * GRID_H);
            w                   = (VEHICLEFACTORY_WINDOW_W * GRID_W) - (GAP_W * 2);
            h                   = SIZE_M * GRID_H;
            font                = FONT_ALT_LIGHT;
            columns             = 2;
            strings[]           = {"Manufacture", "My Vehicle Manufactory"};
            onToolBoxSelChanged = "['tabLeft', _this select 1] call bis_fnc_3DENInterface;";
        };
        class Manufactre: GW_ctrlControlsGroupNoScrollbars {
            idc                 = IDC_DISPLAYVEHICLEFACTORY_MANUFACTRE;
            x                   = VEHICLEFACTORY_STARTPOS_X;
            y                   = VEHICLEFACTORY_STARTPOS_Y + (GAP_H / 2) + (SIZE_M * GRID_H) + ((TAB_H / 2) * GRID_H) + (SIZE_M * GRID_H) + GAP_H;
            w                   = (VEHICLEFACTORY_WINDOW_W * GRID_W) - (GAP_W * 2);
            h                   = (VEHICLEFACTORY_WINDOW_H / 1.265) * GRID_H;
            class controls {
                class FilterBackground: GW_ctrlStatic {
                    idc               = 0;
                    x                 = 0;
                    y                 = 0;
                    w                 = "safezoneW";
                    h                 = SIZE_M * GRID_H;
                    colorBackground[] = {0, 0, 0, 1};
                };
                class ListBackground: GW_ctrlStaticContent {
                    idc = 0;
                    x   = 0;
                    y   = SIZE_M * GRID_H;
                    w   = "safezoneW";
                    h   = "safezoneH";
                };
                class Filter: GW_ctrlListNBox {
                    idc             = 21;
                    x               = 0;
                    y               = 0;
                    w               = "safezoneW";
                    h               = SIZE_M * GRID_H;
                    disableOverflow = 1;
                    columns[]       = {0, 0.018, 0.09, 0.13, 0.2, 0.25, 0.32, 0.4};
                    class Items {
                        class Icon {
                            text  = "";
                            value = 0;
                        };
                        class Vehicle: Icon {
                            text = "Vehicle";
                        };
                        class VehicleType: Icon {
                            text = "Type";
                        };
                        class Legality: Icon {
                            text = "Legality";
                        };
                        class ManufactrePrice: Icon {
                            text = "Price";
                        };
                        class ManufactreDuration: Icon {
                            text = "Duration";
                        };
                        class RequiredLevel: Icon {
                            text = "Required Level";
                        };
                        class SellPrice: Icon {
                            text = "Sell Price";
                        };
                    };
                };
                class List: Filter {
                    idc             = 22;
                    x               = 0;
                    y               = SIZE_M * GRID_H;
                    w               = "safezoneW";
                    h               = "safezoneH";
                    class Items {};
                };
            };
        };
        class MyManufactory: GW_ctrlControlsGroupNoScrollbars {
            idc                 = IDC_DISPLAYVEHICLEFACTORY_MYMANUFACTORY;
            x                   = VEHICLEFACTORY_STARTPOS_X;
            y                   = VEHICLEFACTORY_STARTPOS_Y + (GAP_H / 2) + (SIZE_M * GRID_H) + ((TAB_H / 2) * GRID_H) + (SIZE_M * GRID_H) + GAP_H;
            w                   = (VEHICLEFACTORY_WINDOW_W * GRID_W) - (GAP_W * 2);
            h                   = (VEHICLEFACTORY_WINDOW_H / 1.265) * GRID_H;
            class controls {
                class Title: GW_ctrlStatic {
                    text = "My Vehicle Manufactory";
                    x    = 0;
                    y    = 0;
                    w    = ((VEHICLEFACTORY_WINDOW_W * GRID_W) - (GAP_W * 2)) / 2;
                    h    = SIZE_M * GRID_H;
                };
                class License: Title {
                    idc  = 1;
                    text = "Licensed to manufacture vehicles";
                    y    = (SIZE_M * GRID_H) + (GRID_H * + 0.3);
                };
                class ManufactoryAmount: Title {
                    idc   = 2;
                    text  = "Currently manufacturing: 1 vehicle";
                    x     = ((VEHICLEFACTORY_WINDOW_W * GRID_W) - (GAP_W * 2)) / 2;
                    w     = ((VEHICLEFACTORY_WINDOW_W * GRID_W) - (GAP_W * 2)) / 2;
                    style = ST_RIGHT;
                };
                class LastSync: ManufactoryAmount {
                    idc  = 3;
                    y    = (SIZE_M * GRID_H) + (GRID_H * + 0.3);
                };
                class FilterBackground: GW_ctrlStatic {
                    idc               = 0;
                    x                 = 0;
                    y                 = ((SIZE_M * GRID_H) * 2) + (GRID_H * + 0.8);
                    w                 = "safezoneW";
                    h                 = SIZE_M * GRID_H;
                    colorBackground[] = {0, 0, 0, 1};
                };
                class ListBackground: GW_ctrlStaticContent {
                    idc = 0;
                    x   = 0;
                    y   = ((SIZE_M * GRID_H) * 3) + (GRID_H * + 0.8);
                    w   = "safezoneW";
                    h   = (VEHICLEFACTORY_WINDOW_H * 0.8) * GRID_H;
                };
                class Filter: GW_ctrlListNBox {
                    idc             = 21;
                    x               = 0;
                    y               = ((SIZE_M * GRID_H) * 2) + (GRID_H * + 0.8);
                    w               = "safezoneW";
                    h               = SIZE_M * GRID_H;
                    disableOverflow = 1;
                    columns[]       = {0, 0.018, 0.13, 0.2, 0.28, 0.36};
                    class Items {
                        class Icon {
                            text  = "";
                            value = 0;
                        };
                        class Vehicle: Icon {
                            text = "Vehicle";
                        };
                        class VehicleType: Icon {
                            text = "Type";
                        };
                        class Legality: Icon {
                            text = "Legality";
                        };
                        class ManufactreDuration: Icon {
                            text = "Time Left";
                        };
                        class SellPrice: Icon {
                            text = "Sell Price";
                        };
                    };
                };
                class List: Filter {
                    idc             = 22;
                    x               = 0;
                    y               = ((SIZE_M * GRID_H) * 3) + (GRID_H * + 0.8);
                    w               = "safezoneW";
                    h               = (VEHICLEFACTORY_WINDOW_H * 0.8) * GRID_H;
                    class Items {};
                };
            };
        };
        class Footer: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYVEHICLEFACTORY_FOOTER;
            x   = VEHICLEFACTORY_POS_X;
            y   = VEHICLEFACTORY_POS_Y + ((VEHICLEFACTORY_WINDOW_H * GRID_H) - (SIZE_M * GRID_H)) + (SIZE_M * GRID_H);
            w   = VEHICLEFACTORY_WINDOW_W * GRID_W;
            h   = (SIZE_M + FOOTER_EXTRA) * GRID_H;
            class controls {
                class Background: GW_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    w = "safezoneW";
                    h = "safezoneH";
                };
                class ButtonBuild: GW_ctrlDefaultButton {
                    idc  = 1;
                    text = "START";
                    x    = GRID_W;
                    y    = GRID_H;
                    w    = (VEHICLEFACTORY_WINDOW_W / 6.8) * GRID_W;
                    h    = SIZE_M * GRID_H;
                };
                class ButtonStop: GW_ctrlDefaultButton {
                    idc  = 2;
                    text = "CANCEL";
                    x    = (GRID_W * 2) + (VEHICLEFACTORY_WINDOW_W / 6.8) * GRID_W;
                    y    = GRID_H;
                    w    = (VEHICLEFACTORY_WINDOW_W / 6.8) * GRID_W;
                    h    = SIZE_M * GRID_H;
                };
                class ButtonSpawn: GW_ctrlDefaultButton {
                    idc  = 3;
                    text = "SPAWN";
                    x    = (GRID_W * 3) + (((VEHICLEFACTORY_WINDOW_W / 6.8) * GRID_W) * 2);
                    y    = GRID_H;
                    w    = (VEHICLEFACTORY_WINDOW_W / 6.8) * GRID_W;
                    h    = SIZE_M * GRID_H;
                };
            };
        };
    };
};
