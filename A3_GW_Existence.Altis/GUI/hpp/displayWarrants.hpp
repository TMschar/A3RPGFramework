/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displayWarrants.hpp
 */

#define WARRANTS_WINDOW_H 100
#define WARRANTS_WINDOW_W 160
#define WARRANTS_POS_X (CENTER_X - (WARRANTS_WINDOW_W * 0.5) * GRID_W)
#define WARRANTS_POS_Y (0.415 - (WARRANTS_WINDOW_H * 0.5 - SIZE_M) * GRID_H)
#define WARRANTS_STARTPOS_Y (WARRANTS_POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define WARRANTS_STARTPOS_X (WARRANTS_POS_X + (1.5 * GRID_W))

#define WARRANTS_ADD_WINDOW_H 80
#define WARRANTS_ADD_WINDOW_W 120
#define WARRANTS_ADD_POS_X (CENTER_X - (WARRANTS_ADD_WINDOW_W * 0.5) * GRID_W)
#define WARRANTS_ADD_POS_Y (0.415 - (WARRANTS_ADD_WINDOW_H * 0.5 - SIZE_M) * GRID_H)
#define WARRANTS_ADD_STARTPOS_Y (WARRANTS_ADD_POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define WARRANTS_ADD_STARTPOS_X (WARRANTS_ADD_POS_X + (1.5 * GRID_W))

class GW_displayWarrants: GW_displayStandard {
    idd         = IDD_DISPLAYWARRANTS_DISPLAY;
    scriptName  = "GW_displayWarrants";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displayWarrants'] call GW_client_fnc_initDisplay";
    class ControlsBackground {
        class Tiles: GW_RscTiles {};
        class Header: GW_ctrlStaticHeader {
            text = "Warrants Database";
            x    = WARRANTS_POS_X;
            y    = WARRANTS_POS_Y;
            w    = WARRANTS_WINDOW_W * GRID_W;
            h    = SIZE_M * GRID_H;
        };
        class Background: GW_ctrlStaticBackground {
            x = WARRANTS_POS_X;
            y = WARRANTS_POS_Y + (SIZE_M * GRID_H);
            w = WARRANTS_WINDOW_W * GRID_W;
            h = (WARRANTS_WINDOW_H * GRID_H) - (SIZE_M * GRID_H) - ((SIZE_M + 2) * GRID_H);
        };
        class FilterBackground: GW_ctrlStatic {
            x                 = WARRANTS_STARTPOS_X;
            y                 = WARRANTS_STARTPOS_Y + (SIZE_M * GRID_H) + GAP_H;
            w                 = (WARRANTS_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h                 = SIZE_M * GRID_H;
            colorBackground[] = {0, 0, 0, 1};
        };
        class ListBackground: GW_ctrlStaticContent {
            x                 = WARRANTS_STARTPOS_X;
            y                 = WARRANTS_STARTPOS_Y + ((SIZE_M * GRID_H) * 2) + GAP_H;
            w                 = (WARRANTS_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2));
            h                 = (WARRANTS_WINDOW_H * 0.73) * GRID_H;
        };
    };
    class Controls {
        class Search: GW_ctrlEdit {
            idc = IDC_DISPLAYWARRANTS_SEARCH;
            x   = WARRANTS_STARTPOS_X;
            y   = WARRANTS_STARTPOS_Y;
            w   = (WARRANTS_WINDOW_H / 2.5) * GRID_W;
            h   = SIZE_M * GRID_H;
        };
        class ButtonSearch: GW_ctrlButtonSearch {
            idc = IDC_DISPLAYWARRANTS_BUTTONSEARCH;
            x   = WARRANTS_STARTPOS_X + ((WARRANTS_WINDOW_H / 2.5) * GRID_W) + (0.85 * GRID_W);
            y   = WARRANTS_STARTPOS_Y;
        };
        class Filter: GW_ctrlListNBox {
            idc             = IDC_DISPLAYWARRANTS_FILTER;
            x               = WARRANTS_STARTPOS_X;
            y               = WARRANTS_STARTPOS_Y + (SIZE_M * GRID_H) + GAP_H;
            w               = (WARRANTS_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h               = SIZE_M * GRID_H;
            disableOverflow = 1;
            columns[]       = {0, 0.15, 0.38, 0.6};
            class Items {
                class WarrantID {
                    text  = "Warrant ID";
                    value = 0;
                };
                class Name: WarrantID {
                    text = "Suspects Name";
                };
                class Crime: WarrantID {
                    text = "Crime";
                };
                class Date: WarrantID {
                    text = "Issuing Date and Time";
                };
            };
        };
        class List: Filter {
            idc             = IDC_DISPLAYWARRANTS_LIST;
            x               = WARRANTS_STARTPOS_X;
            y               = WARRANTS_STARTPOS_Y + ((SIZE_M * GRID_H) * 2) + GAP_H;
            w               = (WARRANTS_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2));
            h               = (WARRANTS_WINDOW_H * 0.73) * GRID_H;
            class Items {};
        };
        class GroupFooter: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYWARRANTS_GROUPFOOTER;
            x   = WARRANTS_POS_X;
            y   = WARRANTS_POS_Y + (WARRANTS_WINDOW_H * GRID_H) - ((SIZE_M + 2) * GRID_H);
            h   = (SIZE_M + 2) * GRID_H;
            w   = WARRANTS_WINDOW_W * GRID_W;
            class Controls {
                class Background: GW_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    h = (SIZE_M + 2) * GRID_H;
                    w = WARRANTS_WINDOW_W * GRID_W;
                };
                class ButtonNewWarrant: GW_ctrlDefaultButton {
                    idc  = 25;
                    text = "NEW WARRANT";
                    x    = GRID_W;
                    y    = GRID_H;
                    w    = (WARRANTS_WINDOW_W / 4) * GRID_W;
                    h    = SIZE_M * GRID_H;
                };
                class ButtonDestroyWarrant: GW_ctrlDefaultButton {
                    idc  = 26;
                    text = "DESTROY WARRANT";
                    x    = (GRID_W * 2) + ((WARRANTS_WINDOW_W / 4) * GRID_W);
                    y    = GRID_H;
                    w    = (WARRANTS_WINDOW_W / 4) * GRID_W;
                    h    = SIZE_M * GRID_H;
                };
            };
        };
        class GroupNewWarrantBackground: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYWARRANTS_GROUPNEWWARRANTBACKGROUND;
            x   = safezoneX;
            y   = safezoneY;
            w   = safezoneW;
            h   = safezoneH;
            class Controls {
                class Background: GW_ctrlStaticBackgroundDisableTiles {
                    x = 0;
                    y = 0;
                    w = safezoneW;
                    h = safezoneH;
                };
            };
        };
        class GroupNewWarrant: GW_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYWARRANTS_GROUPNEWWARRANT;
            x   = WARRANTS_ADD_POS_X;
            y   = WARRANTS_ADD_POS_Y;
            w   = WARRANTS_ADD_WINDOW_W * GRID_W;
            h   = WARRANTS_ADD_WINDOW_H * GRID_H;
            class Controls {
                class Header: GW_ctrlStaticHeader {
                    text = "New Warrant";
                    x    = 0;
                    y    = 0;
                    w    = WARRANTS_ADD_WINDOW_W * GRID_W;
                    h    = SIZE_M * GRID_H;
                };
                class Background: GW_ctrlStaticBackground {
                    x = 0;
                    y = SIZE_M * GRID_H;
                    w = WARRANTS_ADD_WINDOW_W * GRID_W;
                    h = (WARRANTS_ADD_WINDOW_H * GRID_H) - (SIZE_M * GRID_H) - ((SIZE_M + 2) * GRID_H);
                };
                class FooterBackground: GW_ctrlStaticFooter {
                    x = 0;
                    y = (WARRANTS_ADD_WINDOW_H * GRID_H) - ((SIZE_M + 2) * GRID_H);
                    w = WARRANTS_ADD_WINDOW_W * GRID_W;
                    h = (SIZE_M + 2) * GRID_H;
                };
                class ButtonAddWarrant: GW_ctrlDefaultButton {
                    idc  = 21;
                    text = "ISSUE WARRANT";
                    x    = GRID_W;
                    y    = (WARRANTS_ADD_WINDOW_H * GRID_H) - ((SIZE_M + 2) * GRID_H) + GRID_H;
                    w    = (WARRANTS_ADD_WINDOW_W * GRID_W) / 3;
                    h    = SIZE_M * GRID_H;
                };
                class ButtonCancel: GW_ctrlDefaultButton {
                    idc  = 20;
                    text = "CANCEL";
                    x    = (GRID_W * 2) + ((WARRANTS_ADD_WINDOW_W * GRID_W) / 3);
                    y    = (WARRANTS_ADD_WINDOW_H * GRID_H) - ((SIZE_M + 2) * GRID_H) + GRID_H;
                    w    = (WARRANTS_ADD_WINDOW_W * GRID_W) / 3;
                    h    = SIZE_M * GRID_H;
                };
                class Search: GW_ctrlEdit {
                    idc = 3;
                    x   = GAP_W;
                    y   = (SIZE_M * GRID_H) + GAP_H;
                    w   = ((WARRANTS_ADD_WINDOW_W * GRID_W) * 0.46) - GRID_W - (SIZE_M * GRID_W);
                    h   = SIZE_M * GRID_H;
                };
                class SearchButton: GW_ctrlButtonSearch {
                    idc = 4;
                    x   = GAP_W + ((WARRANTS_ADD_WINDOW_W * GRID_W) * 0.46) - GRID_W - (SIZE_M * GRID_W) + GRID_W;
                    y   = (SIZE_M * GRID_H) + GAP_H;
                    w   = SIZE_M * GRID_W;
                    h   = SIZE_M * GRID_H;
                };
                class ListPlayers: GW_ctrlListBox {
                    idc = 1005;
                    x   = GAP_W;
                    y   = (GAP_H * 2) + ((SIZE_M * GRID_H) * 2);
                    w   = (WARRANTS_ADD_WINDOW_W * GRID_W) * 0.46;
                    h   = (WARRANTS_ADD_WINDOW_H * GRID_H) * 0.72;
                };
                class CrimesList: GW_ctrlCombo {
                    idc = 1004;
                    x   = WARRANTS_ADD_WINDOW_W * GRID_W - ((WARRANTS_ADD_WINDOW_W * GRID_W) * 0.48) - GAP_W;
                    y   = (SIZE_M * GRID_H) + GAP_H;
                    w   = (WARRANTS_ADD_WINDOW_W * GRID_W) * 0.48;
                    h   = SIZE_M * GRID_H;
                };
                class Title: GW_ctrlStatic {
                    idc  = 67;
                    text = "Title";
                    x    = WARRANTS_ADD_WINDOW_W * GRID_W - ((WARRANTS_ADD_WINDOW_W * GRID_W) * 0.48) - GAP_W;
                    y    = (SIZE_M * GRID_H) + (GAP_H * 2) + ((SIZE_M * GRID_H) * 1);
                    w    = (WARRANTS_ADD_WINDOW_W * GRID_W) * 0.48;
                    h    = SIZE_M * GRID_H;
                };
                class Penalty: GW_ctrlStatic {
                    idc  = 68;
                    text = "Penalty";
                    x    = WARRANTS_ADD_WINDOW_W * GRID_W - ((WARRANTS_ADD_WINDOW_W * GRID_W) * 0.48) - GAP_W;
                    y    = (SIZE_M * GRID_H) + (GAP_H * 3) + ((SIZE_M * GRID_H) * 2);
                    w    = (WARRANTS_ADD_WINDOW_W * GRID_W) * 0.48;
                    h    = SIZE_M * GRID_H;
                };
                class TicketValue: GW_ctrlStatic {
                    idc  = 69;
                    text = "Ticket";
                    x    = WARRANTS_ADD_WINDOW_W * GRID_W - ((WARRANTS_ADD_WINDOW_W * GRID_W) * 0.48) - GAP_W;
                    y    = (SIZE_M * GRID_H) + (GAP_H * 4) + ((SIZE_M * GRID_H) * 3);
                    w    = (WARRANTS_ADD_WINDOW_W * GRID_W) * 0.48;
                    h    = SIZE_M * GRID_H;
                };
                class PrisonTime: GW_ctrlStatic {
                    idc  = 70;
                    text = "Prison Time";
                    x    = WARRANTS_ADD_WINDOW_W * GRID_W - ((WARRANTS_ADD_WINDOW_W * GRID_W) * 0.48) - GAP_W;
                    y    = (SIZE_M * GRID_H) + (GAP_H * 5) + ((SIZE_M * GRID_H) * 4);
                    w    = (WARRANTS_ADD_WINDOW_W * GRID_W) * 0.48;
                    h    = SIZE_M * GRID_H;
                };
            };
        };
        class ButtonClose: GW_ctrlButtonClose {
            x = WARRANTS_POS_X + (WARRANTS_WINDOW_W * GRID_W) - (SIZE_M * GRID_W);
            y = WARRANTS_POS_Y;
            w = SIZE_M * GRID_W;
            h = SIZE_M * GRID_H;
        };
    };
};
