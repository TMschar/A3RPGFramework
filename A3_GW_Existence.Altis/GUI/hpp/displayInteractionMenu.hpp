/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayInteractionMenu.hpp
*/

class GW_displayInteractionMenu: GW_displayStandard {
    idd         = IDD_DISPLAYINTERACTIONMENU_DISPLAY;
    scriptName  = "GW_displayInteractionMenu";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displayInteractionMenu'] call GW_client_fnc_initDisplay";
    class controlsBackground {};
    class controls {
        class ButtonsGroup: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYINTERACTIONMENU_BUTTONSGROUP;
            x   = 0.551562 * safezoneW + safezoneX;
            y   = 0.522 * safezoneH + safezoneY;
            w   = 70 * GRID_W;
            h   = (SIZE_M * GRID_H) * 20;
            class controls {
                class Header: GW_ctrlStaticHeader {
                    idc  = 222;
                    x    = 0;
                    y    = 0;
                    w    = safezoneW;
                    h    = SIZE_M * GRID_H;
                };
                class ButtonClose: GW_ctrlButtonClose {
                    idc = 223;
                    x   = (70 * GRID_W) - (SIZE_M * GRID_W);
                    y   = 0;
                    w   = SIZE_M * GRID_W;
                    h   = SIZE_M * GRID_H;
                };
                class Button_1: GW_ctrlShortcutButton {
                    idc               = IDC_DISPLAYINTERACTIONMENU_BUTTON + 1;
                    x                 = 0;
                    y                 = SIZE_M * GRID_H;
                    w                 = safezoneW;
                    h                 = SIZE_M * GRID_H;
                    colorBackground[] = {0.1, 0.1, 0.1, 1};
                };
                class Button_2: Button_1 {
                    idc = IDC_DISPLAYINTERACTIONMENU_BUTTON + 2;
                    y   = (SIZE_M * GRID_H) * 2;
                };
                class Button_3: Button_1 {
                    idc = IDC_DISPLAYINTERACTIONMENU_BUTTON + 3;
                    y   = (SIZE_M * GRID_H) * 3;
                };
                class Button_4: Button_1 {
                    idc = IDC_DISPLAYINTERACTIONMENU_BUTTON + 4;
                    y   = (SIZE_M * GRID_H) * 4;
                };
                class Button_5: Button_1 {
                    idc = IDC_DISPLAYINTERACTIONMENU_BUTTON + 5;
                    y   = (SIZE_M * GRID_H) * 5;
                };
                class Button_6: Button_1 {
                    idc = IDC_DISPLAYINTERACTIONMENU_BUTTON + 6;
                    y   = (SIZE_M * GRID_H) * 6;
                };
                class Button_7: Button_1 {
                    idc = IDC_DISPLAYINTERACTIONMENU_BUTTON + 7;
                    y   = (SIZE_M * GRID_H) * 7;
                };
                class Button_8: Button_1 {
                    idc = IDC_DISPLAYINTERACTIONMENU_BUTTON + 8;
                    y   = (SIZE_M * GRID_H) * 8;
                };
                class Button_9: Button_1 {
                    idc = IDC_DISPLAYINTERACTIONMENU_BUTTON + 9;
                    y   = (SIZE_M * GRID_H) * 9;
                };
                class Button_10: Button_1 {
                    idc = IDC_DISPLAYINTERACTIONMENU_BUTTON + 10;
                    y   = (SIZE_M * GRID_H) * 10;
                };
                class Button_11: Button_1 {
                    idc = IDC_DISPLAYINTERACTIONMENU_BUTTON + 11;
                    y   = (SIZE_M * GRID_H) * 11;
                };
                class Button_12: Button_1 {
                    idc = IDC_DISPLAYINTERACTIONMENU_BUTTON + 12;
                    y   = (SIZE_M * GRID_H) * 12;
                };
                class Button_13: Button_1 {
                    idc = IDC_DISPLAYINTERACTIONMENU_BUTTON + 13;
                    y   = (SIZE_M * GRID_H) * 13;
                };
                class Button_14: Button_1 {
                    idc = IDC_DISPLAYINTERACTIONMENU_BUTTON + 14;
                    y   = (SIZE_M * GRID_H) * 14;
                };
                class Button_15: Button_1 {
                    idc = IDC_DISPLAYINTERACTIONMENU_BUTTON + 15;
                    y   = (SIZE_M * GRID_H) * 15;
                };
                class Button_16: Button_1 {
                    idc = IDC_DISPLAYINTERACTIONMENU_BUTTON + 16;
                    y   = (SIZE_M * GRID_H) * 16;
                };
                class Button_17: Button_1 {
                    idc = IDC_DISPLAYINTERACTIONMENU_BUTTON + 17;
                    y   = (SIZE_M * GRID_H) * 17;
                };
                class Button_18: Button_1 {
                    idc = IDC_DISPLAYINTERACTIONMENU_BUTTON + 18;
                    y   = (SIZE_M * GRID_H) * 18;
                };
                class Button_19: Button_1 {
                    idc = IDC_DISPLAYINTERACTIONMENU_BUTTON + 19;
                    y   = (SIZE_M * GRID_H) * 19;
                };
            };
        };
    };
};