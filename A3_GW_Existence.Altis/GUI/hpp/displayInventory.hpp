/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: displayInventory.hpp
*/
#define INVENTORY_WINDOW_H 100
#define INVENTORY_WINDOW_W 160
#define INVENTORY_POS_X (CENTER_X - (INVENTORY_WINDOW_W * 0.5) * GRID_W)
#define INVENTORY_POS_Y (0.415 - (INVENTORY_WINDOW_H * 0.5 - SIZE_M) * GRID_H)
#define INVENTORY_STARTPOS_Y (INVENTORY_POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define INVENTORY_STARTPOS_X (INVENTORY_POS_X + (1.5 * GRID_W))

class GW_displayInventory: GW_displayStandard {
    idd         = IDC_DISPLAYINVENTORY_DISPLAY;
    scriptName  = "GW_displayInventory";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displayInventory'] call GW_client_fnc_initDisplay";
    class controlsBackground {
        class Tiles: GW_RscTiles {};
        class Header: GW_ctrlStaticHeader {
            text = "My Inventory";
            x    = INVENTORY_POS_X;
            y    = INVENTORY_POS_Y;
            w    = INVENTORY_WINDOW_W * GRID_W;
            h    = SIZE_M * GRID_H;
        };
        class Background: GW_ctrlStaticBackground {
            x = INVENTORY_POS_X;
            y = INVENTORY_POS_Y + (SIZE_M * GRID_H);
            w = INVENTORY_WINDOW_W * GRID_W;
            h = (INVENTORY_WINDOW_H * GRID_H) - (SIZE_M * GRID_H);
        };
        class TabsBackground: GW_ctrlStatic {
            x                 = INVENTORY_STARTPOS_X;
            y                 = INVENTORY_STARTPOS_Y + (GAP_H / 2) + (SIZE_M * GRID_H);
            w                 = (INVENTORY_WINDOW_W * GRID_W) - (GAP_W * 2);
            h                 = (SIZE_M + TAB_H) * GRID_H;
            colorBackground[] = {0.1, 0.1, 0.1, 1};
        };
    };
    class controls {
        class Search: GW_ctrlEdit {
            idc = IDC_DISPLAYINVENTORY_SEARCH;
            x   = INVENTORY_STARTPOS_X;
            y   = INVENTORY_STARTPOS_Y;
            w   = (INVENTORY_WINDOW_H / 2.5) * GRID_W;
            h   = SIZE_M * GRID_H;
        };
        class ButtonSearch: GW_ctrlButtonSearch {
            idc = IDC_DISPLAYINVENTORY_BUTTONSEARCH;
            x   = INVENTORY_STARTPOS_X + ((INVENTORY_WINDOW_H / 2.5) * GRID_W) + (0.85 * GRID_W);
            y   = INVENTORY_STARTPOS_Y;
        };
        class Tabs: GW_ctrlToolbox {
            idc                 = IDC_DISPLAYINVENTORY_TABS;
            x                   = INVENTORY_STARTPOS_X;
            y                   = INVENTORY_STARTPOS_Y + (GAP_H / 2) + (SIZE_M * GRID_H) + ((TAB_H / 2) * GRID_H);
            w                   = (INVENTORY_WINDOW_W * GRID_W) - (GAP_W * 2);
            h                   = SIZE_M * GRID_H;
            font                = FONT_ALT_LIGHT;
            columns             = 2;
            strings[]           = {"My Inventory", "My Character"};
            onToolBoxSelChanged = "['tabLeft', _this select 1] call bis_fnc_3DENInterface;";
        };
        class Inventory: GW_ctrlControlsGroupNoScrollbars {
            idc                 = IDC_DISPLAYINVENTORY_GROUPINVENTORY;
            x                   = INVENTORY_STARTPOS_X;
            y                   = INVENTORY_STARTPOS_Y + (GAP_H / 2) + (SIZE_M * GRID_H) + ((TAB_H / 2) * GRID_H) + (SIZE_M * GRID_H) + GAP_H;
            w                   = (INVENTORY_WINDOW_W * GRID_W) - (GAP_W * 2);
            h                   = (INVENTORY_WINDOW_H / 1.265) * GRID_H;
            class controls {
                class ProgressBackground: GW_ctrlStatic {
                    idc               = -1;
                    x                 = 0;
                    y                 = 0;
                    w                 = ((INVENTORY_WINDOW_W * GRID_W) - (GAP_W * 2)) / 2;
                    h                 = SIZE_M * GRID_H;
                    colorBackground[] = {0, 0, 0, 0.2};
                };
                class Progress: GW_ctrlProgress {
                    idc               = IDC_DISPLAYINVENTORY_GROUPINVENTORY_PROGRESS;
                    x                 = 0;
                    y                 = 0;
                    w                 = ((INVENTORY_WINDOW_W * GRID_W) - (GAP_W * 2)) / 2;
                    h                 = SIZE_M * GRID_H;
                    colorBar[]        = {0.3, 0.3, 0.3, 1};
                    colorFrame[]      = {0, 0, 0, 0};
                };
                class ProgressText: GW_ctrlStatic {
                    idc               = IDC_DISPLAYINVENTORY_GROUPINVENTORY_PROGRESSTEXT;
                    text              = "24/55";
                    x                 = 0;
                    y                 = 0;
                    w                 = ((INVENTORY_WINDOW_W * GRID_W) - (GAP_W * 2)) / 2;
                    h                 = SIZE_M * GRID_H;
                    colorBar[]        = {0.3, 0.3, 0.3, 1};
                    colorFrame[]      = {0, 0, 0, 0};
                    style             = ST_CENTER;
                };
                class NearPlayersList: GW_ctrlCombo {
                    idc               = IDC_DISPLAYINVENTORY_GROUPINVENTORY_NEARPLAYERSLIST;
                    x                 = (((INVENTORY_WINDOW_W * GRID_W) - (GAP_W * 2)) / 2) + GAP_W;
                    y                 = 0;
                    w                 = (((INVENTORY_WINDOW_W * GRID_W) - (GAP_W * 2)) / 2) - GAP_W;
                    h                 = SIZE_M * GRID_H;
                };
                class FilterBackground: GW_ctrlStatic {
                    idc               = -1;
                    x                 = 0;
                    y                 = (SIZE_M * GRID_H) + GAP_H;
                    w                 = "safezoneW";
                    h                 = SIZE_M * GRID_H;
                    colorBackground[] = {0, 0, 0, 1};
                };
                class ListBackground: GW_ctrlStaticContent {
                    idc = -1;
                    x   = 0;
                    y   = ((SIZE_M * GRID_H) + GAP_H) + (SIZE_M * GRID_H);
                    w   = "safezoneW";
                    h   = (INVENTORY_WINDOW_H * 0.8) * GRID_H;
                };
                class Filter: GW_ctrlListNBox {
                    idc             = IDC_DISPLAYINVENTORY_GROUPINVENTORY_FILTER;
                    x               = 0;
                    y               = (SIZE_M * GRID_H) + GAP_H;
                    w               = "safezoneW";
                    h               = SIZE_M * GRID_H;
                    disableOverflow = 1;
                    columns[]       = {0, 0.05, 0.1, 0.15, 0.2, 0.25};
                    class Items {
                        class Item {
                            text  = "Item";
                            value = 0;
                        };
                        class Type: Item {
                            text = "Type";
                        };
                        class Usable: Item {
                            text = "Usable";
                        };
                        class Weight: Item {
                            text = "Weight";
                        };
                        class TotalWeight: Item {
                            text = "Ttl Weight";
                        };
                        class Quantity: Item {
                            text = "Qty";
                        };
                    };
                };
                class List: Filter {
                    idc             = IDC_DISPLAYINVENTORY_GROUPINVENTORY_LIST;
                    x               = 0;
                    y               = ((SIZE_M * GRID_H) + GAP_H) + (SIZE_M * GRID_H);
                    w               = "safezoneW";
                    h               = (INVENTORY_WINDOW_H * 0.8) * GRID_H;
                    class Items {};
                };
            };
        };
        // class MyCharacter: GW_ctrlControlsGroupNoScrollbars {
        //     idc                 = IDC_DISPLAYINVENTORY_GROUPMYCHARACTER;
        //     x                   = INVENTORY_STARTPOS_X;
        //     y                   = INVENTORY_STARTPOS_Y + (GAP_H / 2) + (SIZE_M * GRID_H) + ((TAB_H / 2) * GRID_H) + (SIZE_M * GRID_H) + GAP_H;
        //     w                   = (INVENTORY_WINDOW_W * GRID_W) - (GAP_W * 2);
        //     h                   = (INVENTORY_WINDOW_H / 1.265) * GRID_H;
        //     class controls {};
        // };
        class Footer: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYINVENTORY_FOOTER;
            x   = INVENTORY_POS_X;
            y   = INVENTORY_POS_Y + ((INVENTORY_WINDOW_H * GRID_H) - (SIZE_M * GRID_H)) + (SIZE_M * GRID_H);
            w   = INVENTORY_WINDOW_W * GRID_W;
            h   = (SIZE_M + FOOTER_EXTRA) * GRID_H;
            class controls {
                class Background: GW_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    w = "safezoneW";
                    h = "safezoneH";
                };
                class ButtonUse: GW_ctrlDefaultButton {
                    idc  = 15;
                    text = "USE";
                    x    = GRID_W;
                    y    = GRID_H;
                    w    = (INVENTORY_WINDOW_W / 6.8) * GRID_W;
                    h    = SIZE_M * GRID_H;
                };
                class ButtonGive: GW_ctrlDefaultButton {
                    idc  = 25;
                    text = "GIVE";
                    x    = (GRID_W * 2) + (INVENTORY_WINDOW_W / 6.8) * GRID_W;
                    y    = GRID_H;
                    w    = (INVENTORY_WINDOW_W / 6.8) * GRID_W;
                    h    = SIZE_M * GRID_H;
                };
                class ButtonDestroy: GW_ctrlDefaultButton {
                    idc  = 35;
                    text = "DESTROY";
                    x    = (GRID_W * 3) + (((INVENTORY_WINDOW_W / 6.8) * GRID_W) * 2);
                    y    = GRID_H;
                    w    = (INVENTORY_WINDOW_W / 6.8) * GRID_W;
                    h    = SIZE_M * GRID_H;
                };
            };
        };
        class ButtonClose: GW_ctrlButtonClose {
            x = INVENTORY_POS_X + (INVENTORY_WINDOW_W * GRID_W) - (SIZE_M * GRID_W);
            y = INVENTORY_POS_Y;
            w = SIZE_M * GRID_W;
            h = SIZE_M * GRID_H;
        };
    };
};
