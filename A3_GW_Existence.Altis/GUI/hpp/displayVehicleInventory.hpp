/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayVehicleInventory.hpp
*/

#define VEHICLEINVENTORY_WINDOW_H 100
#define VEHICLEINVENTORY_WINDOW_W 160
#define VEHICLEINVENTORY_POS_X (CENTER_X - (VEHICLEINVENTORY_WINDOW_W * 0.5) * GRID_W)
#define VEHICLEINVENTORY_POS_Y (0.415 - (VEHICLEINVENTORY_WINDOW_H * 0.5 - SIZE_M) * GRID_H)
#define VEHICLEINVENTORY_STARTPOS_Y (VEHICLEINVENTORY_POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define VEHICLEINVENTORY_STARTPOS_X (VEHICLEINVENTORY_POS_X + (1.5 * GRID_W))
#define VEHICLEINVENTORY_ENDPOS_Y 1
#define VEHICLEINVENTORY_ENDPOS_X (VEHICLEINVENTORY_POS_X + (VEHICLEINVENTORY_WINDOW_W * GRID_W) - (1.5 * GRID_W))
#define PORTION 2.18
#define VEHICLEINV_STARTPOS (VEHICLEINVENTORY_ENDPOS_X - ((VEHICLEINVENTORY_WINDOW_W / PORTION) * GRID_W))
#define SPACE_H (SIZE_XXS * GRID_H)
#define INVENTORY_W ((VEHICLEINVENTORY_WINDOW_W / PORTION) * GRID_W)
#define LIST_HEIGHT 1.35
#define DUMMY_NUMBER 232321

class GW_displayVehicleInventory: GW_displayStandard {
    idd         = IDC_DISPLAYVEHICLEINVENTORY_DISPLAY;
    scriptName  = "GW_displayVehicleInventory";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displayVehicleInventory'] call GW_client_fnc_initDisplay";
    class controlsBackground {
        class Tiles: GW_RscTiles {};
        class Header: GW_ctrlStaticHeader {
            text = "Vehicle Inventory";
            x    = VEHICLEINVENTORY_POS_X;
            y    = VEHICLEINVENTORY_POS_Y;
            w    = VEHICLEINVENTORY_WINDOW_W * GRID_W;
            h    = SIZE_M * GRID_H;
        };
        class Background: GW_ctrlStaticBackground {
            x = VEHICLEINVENTORY_POS_X;
            y = VEHICLEINVENTORY_POS_Y + (SIZE_M * GRID_H);
            w = VEHICLEINVENTORY_WINDOW_W * GRID_W;
            h = (VEHICLEINVENTORY_WINDOW_H * GRID_H) - (SIZE_M * GRID_H);
        };
        class MyInventoryProgressBarBackground: GW_ctrlStatic {
            x                 = VEHICLEINVENTORY_STARTPOS_X;
            y                 = VEHICLEINVENTORY_STARTPOS_Y + (SIZE_M * GRID_H) + (SPACE_H / 2);
            w                 = INVENTORY_W;
            h                 = SIZE_M * GRID_H;
            colorBackground[] = {0, 0, 0, 0.2};
        };
        class VehicleInventoryProgressBarBackground: MyInventoryProgressBarBackground {
            x = VEHICLEINV_STARTPOS;
        };
        class MyInventoryFilterBackground: GW_ctrlStatic {
            x                 = VEHICLEINVENTORY_STARTPOS_X;
            y                 = VEHICLEINVENTORY_STARTPOS_Y + ((SIZE_M * GRID_H) * 2) + SPACE_H;
            w                 = INVENTORY_W;
            h                 = SIZE_M * GRID_H;
            colorBackground[] = {0, 0, 0, 1};
        };
        class VehicleInventoryFilterBackground: MyInventoryFilterBackground {
            x = VEHICLEINV_STARTPOS;
        };
        class MyInventoryListBackground: MyInventoryFilterBackground {
            h                 = (VEHICLEINVENTORY_WINDOW_H / LIST_HEIGHT) * GRID_H;
            colorBackground[] = {0, 0, 0, 0.5};
        };
        class VehicleInventoryListBackground: MyInventoryListBackground {
            x                 = VEHICLEINV_STARTPOS;
        };
    };
    class controls {
        class MyInventoryTitle: GW_ctrlStatic {
            idc  = DUMMY_NUMBER + 1;
            text = "My Inventory";
            x    = VEHICLEINVENTORY_STARTPOS_X;
            y    = VEHICLEINVENTORY_STARTPOS_Y;
            w    = INVENTORY_W;
            h    = SIZE_M * GRID_H;
        };
        class MyInventoryProgressBar: GW_ctrlProgress {
            idc          = IDC_DISPLAYVEHICLEINVENTORY_MYINVENTORYPROGRESSBAR;
            x            = VEHICLEINVENTORY_STARTPOS_X;
            y            = VEHICLEINVENTORY_STARTPOS_Y + (SIZE_M * GRID_H) + (SPACE_H / 2);
            w            = INVENTORY_W;
            h            = SIZE_M * GRID_H;
            colorBar[]   = {0.3, 0.3, 0.3, 1};
            colorFrame[] = {0, 0, 0, 0};
        };
        class MyInventoryProgressBarText: GW_ctrlStatic {
            idc   = IDC_DISPLAYVEHICLEINVENTORY_MYINVENTORYPROGRESSBARTEXT;
            text  = "10/224";
            x     = VEHICLEINVENTORY_STARTPOS_X;
            y     = VEHICLEINVENTORY_STARTPOS_Y + (SIZE_M * GRID_H) + (SPACE_H / 2);
            w     = INVENTORY_W;
            h     = SIZE_M * GRID_H;
            style = ST_CENTER;
        };
        class MyInventoryFilter: GW_ctrlListNBox {
            idc             = IDC_DISPLAYVEHICLEINVENTORY_MYINVENTORYFILTER;
            x               = VEHICLEINVENTORY_STARTPOS_X;
            y               = VEHICLEINVENTORY_STARTPOS_Y + ((SIZE_M * GRID_H) * 2) + SPACE_H;
            w               = INVENTORY_W;
            h               = SIZE_M * GRID_H;
            disableOverflow = 1;
            columns[]       = {0, 0.09, 0.43, 0.73};
            class Items {
                class Icon {
                    text    = "";
                    value   = 0;
                };
                class Item: Icon {
                    text    = "Item";
                    value   = 0;
                };
                class TotalWeight: Icon {
                    text    = "Total Weight";
                    value   = 0;
                };
                class Quantity: Icon {
                    text    = "Qty";
                    value   = 0;
                };
            };
        };
        class MyInventoryList: MyInventoryFilter {
            idc = IDC_DISPLAYVEHICLEINVENTORY_MYINVENTORYLIST;
            x   = VEHICLEINVENTORY_STARTPOS_X;
            y   = VEHICLEINVENTORY_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H;
            w   = INVENTORY_W;
            h   = (VEHICLEINVENTORY_WINDOW_H / LIST_HEIGHT) * GRID_H;
            class Items {};
        };

        // Button to switch items from one inventory to another
        // class ButtonSwap: GW_ctrlButtonToolbar {
        //     idc                     = IDC_DISPLAYVEHICLEINVENTORY_SWAPITEMS;
        //     x                       = ((VEHICLEINVENTORY_WINDOW_W * GRID_W) / 2) + ((SIZE_M * GRID_W) / 2) + ((SIZE_M * GRID_W) * 2.7);
        //     y                       = (VEHICLEINVENTORY_WINDOW_H * GRID_H) / 2 + ((SIZE_M * GRID_H) * 4);
        //     w                       = SIZE_M * GRID_W;
        //     h                       = SIZE_M * GRID_H;
        //     colorBackgroundActive[] = {0, 0, 0, 0};
        //     colorFocused[]          = {0, 0, 0, 0};
        //     onLoad                  = "(_this select 0) ctrlSetText (GW_Mission_Root + 'GUI\data\displays\displayVehicleInventory\arrow_left.paa')";
        // };

        class AmountTitle: GW_ctrlStatic {
            idc  = DUMMY_NUMBER + 2;
            text = "Amount:";
            x    = VEHICLEINVENTORY_STARTPOS_X;
            y    = (VEHICLEINVENTORY_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H) + ((VEHICLEINVENTORY_WINDOW_H / LIST_HEIGHT) * GRID_H) - (SPACE_H * 1.6);
            w    = INVENTORY_W * 0.19;
            h    = SIZE_M * GRID_H;
        };
        class AmountInput: GW_ctrlEdit {
            idc  = IDC_DISPLAYVEHICLEINVENTORY_ITEMAMOUNTINPUT;
            text = "1";
            x    = (VEHICLEINVENTORY_STARTPOS_X + (INVENTORY_W * 0.19));
            y    = (VEHICLEINVENTORY_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H) + ((VEHICLEINVENTORY_WINDOW_H / LIST_HEIGHT) * GRID_H) - (SPACE_H * 1.6);
            w    = (INVENTORY_W * 0.66) - (GAP_W / 2);
            h    = SIZE_M * GRID_H;
        };
        class Plus: GW_ctrlDefaultButton {
            idc  = IDC_DISPLAYVEHICLEINVENTORY_ITEMAMOUNTPLUS;
            text = "+";
            x    = VEHICLEINVENTORY_STARTPOS_X + INVENTORY_W - ((SIZE_M * GRID_W) * 2) - (GAP_W * 0.5);
            y    = (VEHICLEINVENTORY_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H) + ((VEHICLEINVENTORY_WINDOW_H / LIST_HEIGHT) * GRID_H) - (SPACE_H * 1.6);
            w    = SIZE_M * GRID_W;
            h    = SIZE_M * GRID_H;
        };
        class Minus: GW_ctrlDefaultButton {
            idc  = IDC_DISPLAYVEHICLEINVENTORY_ITEMAMOUNTMINUS;
            text = "-";
            x    = VEHICLEINVENTORY_STARTPOS_X + INVENTORY_W - (SIZE_M * GRID_W);
            y    = (VEHICLEINVENTORY_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H) + ((VEHICLEINVENTORY_WINDOW_H / LIST_HEIGHT) * GRID_H) - (SPACE_H * 1.6);
            w    = SIZE_M * GRID_W;
            h    = SIZE_M * GRID_H;
        };

        class VehicleInventoryTitle: MyInventoryTitle {
            idc  = IDC_DISPLAYVEHICLEINVENTORY_VEHICLEINVENTORYTITLE;
            text = "Vehicle Inventory";
            x    = VEHICLEINV_STARTPOS;
        };
        class VehicleInventoryProgressBar: MyInventoryProgressBar {
            idc = IDC_DISPLAYVEHICLEINVENTORY_VEHICLEINVENTORYPROGRESSBAR;
            x   = VEHICLEINV_STARTPOS;
        };
        class VehicleInventoryProgressBarText: MyInventoryProgressBarText {
            idc = IDC_DISPLAYVEHICLEINVENTORY_VEHICLEINVENTORYPROGRESSBARTEXT;
            x   = VEHICLEINV_STARTPOS;
        };
        class VehicleInventoryFilter: MyInventoryFilter {
            idc = IDC_DISPLAYVEHICLEINVENTORY_VEHICLEINVENTORYFILTER;
            x   = VEHICLEINV_STARTPOS;
            y   = VEHICLEINVENTORY_STARTPOS_Y + ((SIZE_M * GRID_H) * 2) + SPACE_H;
            w   = INVENTORY_W;
            h   = SIZE_M * GRID_H;
        };
        class VehicleInventoryList: MyInventoryList {
            idc = IDC_DISPLAYVEHICLEINVENTORY_VEHICLEINVENTORYLIST;
            x   = VEHICLEINV_STARTPOS;
            y   = VEHICLEINVENTORY_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H;
            w   = INVENTORY_W;
            h   = (VEHICLEINVENTORY_WINDOW_H / 1.7) * GRID_H;
        };

        class Footer: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYVEHICLEINVENTORY_FOOTER;
            x   = VEHICLEINVENTORY_POS_X;
            y   = VEHICLEINVENTORY_POS_Y + ((VEHICLEINVENTORY_WINDOW_H * GRID_H) - (SIZE_M * GRID_H)) + (SIZE_M * GRID_H);
            w   = VEHICLEINVENTORY_WINDOW_W * GRID_W;
            h   = (SIZE_M + FOOTER_EXTRA) * GRID_H;
            class controls {
                class Background: GW_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    w = "safezoneW";
                    h = "safezoneH";
                };
                class ButtonTake: GW_ctrlDefaultButton {
                    idc  = IDC_DISPLAYVEHICLEINVENTORY_FOOTER_BUTTONTAKE;
                    text = "TAKE";
                    x    = GRID_W;
                    y    = GRID_H;
                    w    = (VEHICLEINVENTORY_WINDOW_W / 6.8) * GRID_W;
                    h    = SIZE_M * GRID_H;
                };
                class ButtonStore: GW_ctrlDefaultButton {
                    idc  = IDC_DISPLAYVEHICLEINVENTORY_FOOTER_BUTTONSTORE;
                    text = "STORE";
                    x    = (GRID_W * 2) + (VEHICLEINVENTORY_WINDOW_W / 6.8) * GRID_W;
                    y    = GRID_H;
                    w    = (VEHICLEINVENTORY_WINDOW_W / 6.8) * GRID_W;
                    h    = SIZE_M * GRID_H;
                };
                class ButtonDestroy: GW_ctrlDefaultButton {
                    idc  = IDC_DISPLAYVEHICLEINVENTORY_FOOTER_BUTTONDESTROY;
                    text = "DESTROY";
                    x    = (GRID_W * 3) + (((VEHICLEINVENTORY_WINDOW_W / 6.8) * GRID_W) * 2);
                    y    = GRID_H;
                    w    = (VEHICLEINVENTORY_WINDOW_W / 6.8) * GRID_W;
                    h    = SIZE_M * GRID_H;
                };
            };
        };
        class ButtonClose: GW_ctrlButtonClose {
            x = VEHICLEINVENTORY_POS_X + (VEHICLEINVENTORY_WINDOW_W * GRID_W) - (SIZE_M * GRID_W);
            y = VEHICLEINVENTORY_POS_Y;
            w = SIZE_M * GRID_W;
            h = SIZE_M * GRID_H;
        };
    };
};
