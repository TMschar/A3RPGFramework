/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: hint.hpp
*/
#define HINT_WIDTH 70
#define HINT_POS_X (safezoneW - (HINT_WIDTH * GRID_W) - (GAP_W * 3))
#define HINT_POS_Y (40 * GRID_H)

class GW_Hint: GW_RscControlsGroupNoScrollbars {
    idd = -1;
    x   = safezoneX;
    y   = safezoneY;
    w   = safezoneW;
    h   = safezoneH;
    class controls {
        class ColourStripe: GW_ctrlStatic {
            idc               = 0;
            x                 = HINT_POS_X;
            y                 = HINT_POS_Y;
            w                 = HINT_WIDTH * GRID_W;
            h                 = 0.8 * GRID_H;
            colorBackground[] = COLOUR_EMPTY;
        };
        class Title: GW_ctrlStructuredText {
            idc               = 1;
            text              = "";
            x                 = HINT_POS_X;
            y                 = HINT_POS_Y + (0.8 * GRID_H);
            w                 = HINT_WIDTH * GRID_W;
            h                 = 5 * GRID_H;
            colorBackground[] = {0.1, 0.1, 0.1, 0.95};
        };
        class TextArea: GW_ctrlStructuredText {
            idc                = 2;
            text               = "";
            x                  = HINT_POS_X;
            y                  = HINT_POS_Y + (0.8 * GRID_H) + (5 * GRID_H);
            w                  = HINT_WIDTH * GRID_W;
            h                  = 5 * GRID_H;
             colorBackground[] = {0.1, 0.1, 0.1, 0.95};
        };
    };
};