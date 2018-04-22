/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displayMyVehicles.hpp
 */
#define MYVEHICLES_WINDOW_H 75
#define MYVEHICLES_WINDOW_W 110
#define MYVEHICLES_POS_X (CENTER_X - (MYVEHICLES_WINDOW_W * 0.5) * GRID_W)
#define MYVEHICLES_POS_Y (0.415 - (MYVEHICLES_WINDOW_H * 0.5 - SIZE_M) * GRID_H)
#define MYVEHICLES_STARTPOS_Y (MYVEHICLES_POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define MYVEHICLES_STARTPOS_X (MYVEHICLES_POS_X + (1.5 * GRID_W))

class GW_displayMyVehicles: GW_displayStandard {
    idd         = IDC_DISPLAYMYVEHICLES_DISPLAY;
    scriptName  = "GW_displayMyVehicles";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displayMyVehicles'] call GW_client_fnc_initDisplay";
    class controlsBackground {
        class Tiles: GW_RscTiles {};
        class Header: GW_ctrlStaticHeader {
            text = "My Vehicles";
            x    = MYVEHICLES_POS_X;
            y    = MYVEHICLES_POS_Y;
            w    = MYVEHICLES_WINDOW_W * GRID_W;
            h    = SIZE_M * GRID_H;
        };
        class Background: GW_ctrlStaticBackground {
            x = MYVEHICLES_POS_X;
            y = MYVEHICLES_POS_Y + (SIZE_M * GRID_H);
            w = MYVEHICLES_WINDOW_W * GRID_W;
            h = ((MYVEHICLES_WINDOW_H * GRID_H) - (SIZE_M * GRID_H)) - ((SIZE_M + 2) * GRID_H);
        };
        class Filter: GW_ctrlStatic {
            x   = MYVEHICLES_STARTPOS_X;
            y   = MYVEHICLES_STARTPOS_Y;
            w   = (MYVEHICLES_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h   = SIZE_M * GRID_H;
            colorBackground[] = {0, 0, 0, 1};
        };
        class List: GW_ctrlStaticContent {
            x   = MYVEHICLES_STARTPOS_X;
            y   = MYVEHICLES_STARTPOS_Y + (SIZE_M * GRID_H);
            w   = (MYVEHICLES_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h   = (MYVEHICLES_WINDOW_H * 0.6) * GRID_H;
        };
    };
    class controls {
        class Filter: GW_ctrlListNBox {
            idc = IDC_DISPLAYMYVEHICLES_FILTER;
            x   = MYVEHICLES_STARTPOS_X;
            y   = MYVEHICLES_STARTPOS_Y;
            w   = (MYVEHICLES_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h   = SIZE_M * GRID_H;
            disableOverflow = 1;
            columns[]       = {0, 0.35, 0.55};
            class Items {
                class Vehicle {
                    text    = "Vehicle";
                    value   = 0;
                };
                class Colour: Vehicle {
                    text    = "Colour";
                };
                class Distance: Vehicle {
                    text    = "Distance";
                };
            };
        };
        class List: Filter {
            idc = IDC_DISPLAYMYVEHICLES_LIST;
            x   = MYVEHICLES_STARTPOS_X;
            y   = MYVEHICLES_STARTPOS_Y + (SIZE_M * GRID_H);
            w   = (MYVEHICLES_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h   = (MYVEHICLES_WINDOW_H * 0.6) * GRID_H;
            class Items {};
        };
        class ListPlayers: GW_ctrlCombo {
            idc = IDC_DISPLAYMYVEHICLES_LISTPLAYERS;
            x   = MYVEHICLES_STARTPOS_X;
            y   = MYVEHICLES_STARTPOS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H) + ((MYVEHICLES_WINDOW_H * 0.6) * GRID_H);
            w   = (MYVEHICLES_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h   = SIZE_M * GRID_H;
        };
        class Footer: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYVEHICLEINVENTORY_FOOTER;
            x   = MYVEHICLES_POS_X;
            y   = (MYVEHICLES_POS_Y + (MYVEHICLES_WINDOW_H * GRID_H)) - ((SIZE_M + 2) * GRID_H);
            w   = MYVEHICLES_WINDOW_W * GRID_W;
            h   = (SIZE_M + 2) * GRID_H;
            class controls {
                class Background: GW_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    w = "safezoneW";
                    h = "safezoneH";
                };
                class ButtonGive: GW_ctrlDefaultButton {
                    idc  = IDC_DISPLAYVEHICLEINVENTORY_FOOTER_BUTTONGIVE;
                    text = "GIVE KEY";
                    x    = GRID_W;
                    y    = GRID_H;
                    w    = (MYVEHICLES_WINDOW_W / 3) * GRID_W;
                    h    = SIZE_M * GRID_H;
                };
                class ButtonDrop: GW_ctrlDefaultButton {
                    idc  = IDC_DISPLAYVEHICLEINVENTORY_FOOTER_BUTTONDROP;
                    text = "DROP KEY";
                    x    = GRID_W + ((MYVEHICLES_WINDOW_W / 3) * GRID_W) + GRID_W;
                    y    = GRID_H;
                    w    = (MYVEHICLES_WINDOW_W / 3) * GRID_W;
                    h    = SIZE_M * GRID_H;
                };
            };
        };
    };
};