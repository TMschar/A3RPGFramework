/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: displayInit.hpp
 */

class GW_displayInit: GW_displayStandard {
    idd = IDD_DISPLAYINIT_DISPLAY;
    scriptName = "GW_displayInit";
    scriptPath = "GUI";
    onLoad = "[_this, 'GW_displayInit'] call GW_client_fnc_initDisplay";
    blockEscape = 1;
    class Controls {
        class Logo: GW_ctrlStaticPictureKeepAspect {
            idc  = IDC_DISPLAYINIT_LOGO;
            text = "textures\splash\groundwars_shadow.paa";
            x    = "0.25 * safezoneW + safezoneX";
            y    = "0.3125 * safezoneH + safezoneY";
            w    = "0.5 * safezoneW";
            h    = "0.25 * safezoneH";
        };
        class ProgressBarBackground: GW_ctrlStatic {
            idc               = IDC_DISPLAYINIT_PROGRESSBARBACKGROUND;
            x                 = safezoneX;
            y                 = safezoneY + safezoneH - (3 * GRID_H);
            w                 = safezoneW;
            h                 = 3 * GRID_H;
            colorBackground[] = {0.2, 0.2, 0.2, 0.9};
        };
        class ProgressBarBackgroundStriped: GW_ctrlStaticBackgroundDisableTiles {
            idc = IDC_DISPLAYINIT_PROGRESSBARBACKGROUNDSTRIPED;
            x   = safezoneX;
            y   = safezoneY + safezoneH - (3 * GRID_H);
            w   = safezoneW;
            h   = 3 * GRID_H;
        };
        class ProgressBar: GW_ctrlProgress {
            idc    = IDC_DISPLAYINIT_PROGRESSBAR;
            x      = safezoneX;
            y      = safezoneY + safezoneH - (3 * GRID_H);
            w      = safezoneW;
            h      = 3 * GRID_H;
        };
        class InitStateText: GW_ctrlStatic {
            idc    = IDC_DISPLAYININT_INITSTATETEXT;
            text   = "LOADING DATA";
            sizeEx = "11 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
            x      = safezoneX + (SIZE_XXS * GRID_W);
            y      = "(safezoneY + safezoneH) - (11 * (1 / (getResolution select 3)) * pixelGrid * 0.5) - (5 * (pixelH * pixelGrid * 0.50))";
            h      = "11 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
            w      = safezoneW;
            shadow = 0.6;
            font   = FONT_ALT_BOLD;
        };
    };
};