/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displayItemsShop.hpp
 */

#define ITEMSSHOP_WINDOW_H 100
#define ITEMSSHOP_WINDOW_W 160
#define ITEMSSHOP_POS_X (CENTER_X - (ITEMSSHOP_WINDOW_W * 0.5) * GRID_W)
#define ITEMSSHOP_POS_Y (0.415 - (ITEMSSHOP_WINDOW_H * 0.5 - SIZE_M) * GRID_H)
#define ITEMSSHOP_STARTPOS_Y (ITEMSSHOP_POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define ITEMSSHOP_STARTPOS_X (ITEMSSHOP_POS_X + (1.5 * GRID_W))
#define ITEMSSHOP_ENDPOS_Y 1
#define ITEMSSHOP_ENDPOS_X (ITEMSSHOP_POS_X + (ITEMSSHOP_WINDOW_W * GRID_W) - (1.5 * GRID_W))
#define PORTION 2.18
#define MYITEMS_STARTPOS_X (ITEMSSHOP_ENDPOS_X - ((ITEMSSHOP_WINDOW_W / PORTION) * GRID_W))
#define SPACE_H (SIZE_XXS * GRID_H)
#define ITEMSSHOP_W ((ITEMSSHOP_WINDOW_W / PORTION) * GRID_W)
#define LIST_HEIGHT 1.35
#define DUMMY_NUMBER 232321

class GW_displayItemsShop: GW_displayStandard {
    idd         = IDC_DISPLAYITEMSSHOP_DISPLAY;
    scriptName  = "GW_displayItemsShop";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displayItemsShop'] call GW_client_fnc_initDisplay";
    class controlsBackground {
        class Tiles: GW_RscTiles {};
        class Title: GW_ctrlStaticHeader {
            idc  = IDC_DISPLAYITEMSSHOP_TITLE;
            text = "Items Shop";
            x    = ITEMSSHOP_POS_X;
            y    = ITEMSSHOP_POS_Y;
            w    = ITEMSSHOP_WINDOW_W * GRID_W;
            h    = SIZE_M * GRID_H;
        };
        class Background: GW_ctrlStaticBackground {
            x = ITEMSSHOP_POS_X;
            y = ITEMSSHOP_POS_Y + (SIZE_M * GRID_H);
            w = ITEMSSHOP_WINDOW_W * GRID_W;
            h = (ITEMSSHOP_WINDOW_H * GRID_H) - (SIZE_M * GRID_H);
        };
    };
    class controls {
        /**
         * Shop Items
         */
        class Search: GW_ctrlEdit {
            idc = IDC_DISPLAYITEMSSHOP_SEARCH;
            x   = ITEMSSHOP_STARTPOS_X;
            y   = ITEMSSHOP_STARTPOS_Y;
            w   = (ITEMSSHOP_WINDOW_W / 2.5) * GRID_W;
            h   = SIZE_M * GRID_H;
        };
        class ButtonSearch: GW_ctrlButtonSearch {
            idc = IDC_DISPLAYITEMSSHOP_BUTTONSEARCH;
            x   = ITEMSSHOP_STARTPOS_X + ((ITEMSSHOP_WINDOW_W / 2.5) * GRID_W) + (0.85 * GRID_W);
            y   = ITEMSSHOP_STARTPOS_Y;
        };

        class ItemsFilterBackground: GW_ctrlStatic {
            idc             = DUMMY_NUMBER + 105;
            x               = ITEMSSHOP_STARTPOS_X;
            y               = ITEMSSHOP_STARTPOS_Y + ((SIZE_M * GRID_H) * 1) + SPACE_H;
            w               = (ITEMSSHOP_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h               = SIZE_M * GRID_H;
            colorBackground[] = {0, 0, 0, 1};
        };
        class ItemsFilter: GW_ctrlListNBox {
            idc             = IDC_DISPLAYITEMSSHOP_ITEMSFILTER;
            x               = ITEMSSHOP_STARTPOS_X;
            y               = ITEMSSHOP_STARTPOS_Y + ((SIZE_M * GRID_H) * 1) + SPACE_H;
            w               = (ITEMSSHOP_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h               = SIZE_M * GRID_H;
            disableOverflow = 1;
            columns[]       = {0, 0.2, 0.3, 0.41, 0.51, 0.61, 0.71};
            class Items {
                class Item {
                    text    = "Item";
                    value   = 0;
                };
                class Buy: Item { text = "Buy"; };
                class Sell: Item { text = "Sell"; };
                class MyQty: Item { text = "My Qty"; };
                class Weight: Item { text = "Weight"; };
                class Illegal: Item { text = "Illegal"; };
                class Usable: Item { text = "Usable"; };
            };
        };
        class ItemsListBackground: GW_ctrlStaticContent {
            idc = DUMMY_NUMBER + 108;
            x   = ITEMSSHOP_STARTPOS_X;
            y   = ITEMSSHOP_STARTPOS_Y + ((SIZE_M * GRID_H) * 2) + SPACE_H;
            w   = (ITEMSSHOP_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h   = (ITEMSSHOP_WINDOW_H / 1.4) * GRID_H;
        };
        class ItemsList: ItemsFilter {
            idc = IDC_DISPLAYITEMSSHOP_ITEMSLIST;
            x   = ITEMSSHOP_STARTPOS_X;
            y   = ITEMSSHOP_STARTPOS_Y + ((SIZE_M * GRID_H) * 2) + SPACE_H;
            w   = (ITEMSSHOP_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h   = (ITEMSSHOP_WINDOW_H / 1.4) * GRID_H;
            class Items {};
        };

        class AmountTitle: GW_ctrlStatic {
            idc  = DUMMY_NUMBER + 6;
            text = "Amount:";
            x    = ITEMSSHOP_STARTPOS_X;
            y    = (ITEMSSHOP_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H) + ((ITEMSSHOP_WINDOW_H / LIST_HEIGHT) * GRID_H) - (SPACE_H * 1.6);
            w    = ITEMSSHOP_W * 0.19;
            h    = SIZE_M * GRID_H;
        };
        class AmountInput: GW_ctrlEdit {
            idc  = IDC_DISPLAYITEMSSHOP_AMOUNTINPUT;
            text = "1";
            x    = (ITEMSSHOP_STARTPOS_X + (ITEMSSHOP_W * 0.19));
            y    = (ITEMSSHOP_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H) + ((ITEMSSHOP_WINDOW_H / LIST_HEIGHT) * GRID_H) - (SPACE_H * 1.6);
            w    = (ITEMSSHOP_W * 0.66) - (GAP_W / 2);
            h    = SIZE_M * GRID_H;
        };
        class Plus: GW_ctrlDefaultButton {
            idc  = IDC_DISPLAYITEMSSHOP_AMOUNTPLUS;
            text = "+";
            x    = ITEMSSHOP_STARTPOS_X + ITEMSSHOP_W - ((SIZE_M * GRID_W) * 2) - (GAP_W * 0.5);
            y    = (ITEMSSHOP_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H) + ((ITEMSSHOP_WINDOW_H / LIST_HEIGHT) * GRID_H) - (SPACE_H * 1.6);
            w    = SIZE_M * GRID_W;
            h    = SIZE_M * GRID_H;
        };
        class Minus: GW_ctrlDefaultButton {
            idc  = IDC_DISPLAYITEMSSHOP_AMOUNTMINUS;
            text = "-";
            x    = ITEMSSHOP_STARTPOS_X + ITEMSSHOP_W - (SIZE_M * GRID_W);
            y    = (ITEMSSHOP_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H) + ((ITEMSSHOP_WINDOW_H / LIST_HEIGHT) * GRID_H) - (SPACE_H * 1.6);
            w    = SIZE_M * GRID_W;
            h    = SIZE_M * GRID_H;
        };

        class MyInventoryProgressBarBackground: GW_ctrlStatic {
            idc               = DUMMY_NUMBER + 100;
            x                 = MYITEMS_STARTPOS_X;
            y                 = (ITEMSSHOP_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H) + ((ITEMSSHOP_WINDOW_H / LIST_HEIGHT) * GRID_H) - (SPACE_H * 1.6);
            w                 = ITEMSSHOP_W;
            h                 = SIZE_M * GRID_H;
            colorBackground[] = {0, 0, 0, 0.2};
        };
        class MyInventoryProgressBar: GW_ctrlProgress {
            idc               = IDC_DISPLAYITEMSSHOP_PROGRESSBAR;
            x                 = MYITEMS_STARTPOS_X;
            y                 = (ITEMSSHOP_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H) + ((ITEMSSHOP_WINDOW_H / LIST_HEIGHT) * GRID_H) - (SPACE_H * 1.6);
            w                 = ITEMSSHOP_W;
            h                 = SIZE_M * GRID_H;
            colorBar[]        = {0.3, 0.3, 0.3, 1};
            colorFrame[]      = {0, 0, 0, 0};
        };
        class MyInventoryProgressBarText: GW_ctrlStatic {
            idc               = IDC_DISPLAYITEMSSHOP_PROGRESSBARTEXT;
            text              = "10/10";
            x                 = MYITEMS_STARTPOS_X;
            y                 = (ITEMSSHOP_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H) + ((ITEMSSHOP_WINDOW_H / LIST_HEIGHT) * GRID_H) - (SPACE_H * 1.6);
            w                 = ITEMSSHOP_W;
            h                 = SIZE_M * GRID_H;
            style             = ST_CENTER;
        };

        /**
         * Footer
         */
        class Footer: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYITEMSSHOP_FOOTER;
            x   = ITEMSSHOP_POS_X;
            y   = ITEMSSHOP_POS_Y + ((ITEMSSHOP_WINDOW_H * GRID_H) - (SIZE_M * GRID_H)) + (SIZE_M * GRID_H);
            w   = ITEMSSHOP_WINDOW_W * GRID_W;
            h   = (SIZE_M + FOOTER_EXTRA) * GRID_H;
            class controls {
                class Background: GW_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    w = "safezoneW";
                    h = "safezoneH";
                };
                class ButtonBuy: GW_ctrlDefaultButton {
                    idc  = IDC_DISPLAYITEMSSHOP_FOOTER_BUTTONBUY;
                    text = "BUY";
                    x    = GRID_W;
                    y    = GRID_H;
                    w    = (ITEMSSHOP_WINDOW_W / 6.8) * GRID_W;
                    h    = SIZE_M * GRID_H;
                };
                class ButtonSell: GW_ctrlDefaultButton {
                    idc  = IDC_DISPLAYITEMSSHOP_FOOTER_BUTTONSELL;
                    text = "SELL";
                    x    = (GRID_W * 2) + ((ITEMSSHOP_WINDOW_W / 6.8) * GRID_W);
                    y    = GRID_H;
                    w    = (ITEMSSHOP_WINDOW_W / 6.8) * GRID_W;
                    h    = SIZE_M * GRID_H;
                };
            };
        };

        /**
         * Close
         */
        class ButtonClose: GW_ctrlButtonClose {
            x = ITEMSSHOP_POS_X + (ITEMSSHOP_WINDOW_W * GRID_W) - (SIZE_M * GRID_W);
            y = ITEMSSHOP_POS_Y;
            w = SIZE_M * GRID_W;
            h = SIZE_M * GRID_H;
        };
    };
};
