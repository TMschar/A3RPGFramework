/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayGarage.hpp
*/

#define GARAGE_WINDOW_H 100
#define GARAGE_WINDOW_W 160
#define GARAGE_POS_X (CENTER_X - (GARAGE_WINDOW_W * 0.5) * GRID_W)
#define GARAGE_POS_Y (0.415 - (GARAGE_WINDOW_H * 0.5 - SIZE_M) * GRID_H)
#define GARAGE_STARTPOS_Y (GARAGE_POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define GARAGE_STARTPOS_X (GARAGE_POS_X + (1.5 * GRID_W))

class GW_displayGarage: GW_displayStandard {
    idd         = IDC_DISPLAYGARAGE_DISPLAY;
    scriptName  = "GW_displayGarage";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displayGarage'] call GW_client_fnc_initDisplay";
    class controlsBackground {
        class Tiles: GW_RscTiles {};
        class Header: GW_ctrlStaticHeader {
            text = "My Garage";
            x    = GARAGE_POS_X;
            y    = GARAGE_POS_Y;
            w    = GARAGE_WINDOW_W * GRID_W;
            h    = SIZE_M * GRID_H;
        };
        class Background: GW_ctrlStaticBackground {
            x = GARAGE_POS_X;
            y = GARAGE_POS_Y + (SIZE_M * GRID_H);
            w = GARAGE_WINDOW_W * GRID_W;
            h = (GARAGE_WINDOW_H * GRID_H) - (SIZE_M * GRID_H);
        };
        class FilterBackground: GW_ctrlStatic {
            x                 = GARAGE_STARTPOS_X;
            y                 = GARAGE_STARTPOS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H);
            w                 = (GARAGE_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h                 = SIZE_M * GRID_H;
            colorBackground[] = {0, 0, 0, 1};
        };
        class ListBackground: GW_ctrlStaticContent {
            x   = GARAGE_STARTPOS_X;
            y   = GARAGE_STARTPOS_Y + ((SIZE_M * GRID_H) * 2) + (1.5 * GRID_H);
            w   = (GARAGE_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h   = (GARAGE_WINDOW_H * GRID_H) * 0.8;
        };
    };
    class controls {
        class Search: GW_ctrlEdit {
            idc = IDC_DISPLAYGARAGE_SEARCH;
            x   = GARAGE_STARTPOS_X;
            y   = GARAGE_STARTPOS_Y;
            w   = (GARAGE_WINDOW_W / 3) * GRID_W;
            h   = SIZE_M * GRID_H;
        };
        class ButtonSearch: GW_ctrlButtonSearch {
            idc = IDC_DISPLAYGARAGE_BUTTONSEARCH;
            x   = GARAGE_STARTPOS_X + ((GARAGE_WINDOW_W / 3) * GRID_W) + (0.85 * GRID_W);
            y   = GARAGE_STARTPOS_Y;
        };
        class Filter: GW_ctrlListNBox {
            idc             = IDC_DISPLAYGARAGE_FILTER;
            x               = GARAGE_STARTPOS_X;
            y               = GARAGE_STARTPOS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H);
            w               = (GARAGE_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h               = SIZE_M * GRID_H;
            disableOverflow = 1;
            columns[]       = {0, 0.018, 0.22, 0.32, 0.43};
            class Items {
                class Icon {
                    text  = "";
                    value = 0;
                };
                class VehicleModel: Icon {
                    text = "Vehicle Model";
                };
                class VehicleType: Icon {
                    text = "Type";
                };
                class Colour: Icon {
                    text = "Colour";
                };
                class PurchaseDate: Icon {
                    text = "Purchase Date";
                };
            };
        };
        class List: Filter {
            idc             = IDC_DISPLAYGARAGE_LIST;
            x               = GARAGE_STARTPOS_X;
            y               = GARAGE_STARTPOS_Y + ((SIZE_M * GRID_H) * 2) + (1.5 * GRID_H);
            w               = (GARAGE_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h               = (GARAGE_WINDOW_H * GRID_H) * 0.8;
            class Items {};
        };
        class Footer: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYGARAGE_FOOTER;
            x   = GARAGE_POS_X;
            y   = GARAGE_POS_Y + ((GARAGE_WINDOW_H * GRID_H) - (SIZE_M * GRID_H)) + (SIZE_M * GRID_H);
            w   = GARAGE_WINDOW_W * GRID_W;
            h   = (SIZE_M + FOOTER_EXTRA) * GRID_H;
            class controls {
                class Background: GW_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    w = "safezoneW";
                    h = "safezoneH";
                };
                class ButtonRetrieve: GW_ctrlDefaultButton {
                    idc  = 1;
                    text = "RETRIEVE";
                    x    = GRID_W;
                    y    = GRID_H;
                    w    = (GARAGE_WINDOW_W / 6.8) * GRID_W;
                    h    = SIZE_M * GRID_H;
                };
                class ButtonCrush: GW_ctrlDefaultButton {
                    idc  = 2;
                    text = "CRUSH";
                    x    = (GRID_W * 2) + (GARAGE_WINDOW_W / 6.8) * GRID_W;
                    y    = GRID_H;
                    w    = (GARAGE_WINDOW_W / 6.8) * GRID_W;
                    h    = SIZE_M * GRID_H;
                };
            };
        };
        class ButtonClose: GW_ctrlButtonClose {
            x = GARAGE_POS_X + ((GARAGE_WINDOW_W * GRID_W) - (SIZE_M * GRID_W));
            y = GARAGE_POS_Y;
            h = SIZE_M * GRID_H;
            w = SIZE_M * GRID_W;
        };
    };
};