/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: bleedout.hpp
*/

#define COLOUR_RED {0.59, 0, 0, 1}

class GW_BLEEDOUT: GW_displayStandard {
    idd         = IDD_BLEEDOUT_DISPLAY;
    scriptName  = "GW_Bleedout";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_Bleedout'] call GW_client_fnc_initDisplay";
    duration    = 10e10;
    blockEscape = 1;
    class controlsBackground {
        // class Background: GW_ctrlStatic {
        // 	idc                = -1;
        // 	x                  = "safezoneX";
        // 	y                  = "0.8168 * safezoneH + safezoneY";
        // 	w                  = "safezoneW";
        // 	h                  = "0.0968 * safezoneH";
        // 	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        // };
        class PROGRESS_BACKGROUND: GW_ctrlStatic {
        	idc                = -1;
        	x                  = "0.314375 * safezoneW + safezoneX";
        	y                  = "0.8498 * safezoneH + safezoneY";
        	w                  = "0.371242 * safezoneW";
        	h                  = "0.0308 * safezoneH";
        	colorBackground[]  = COLOUR_PROGRESSBAR_BACKGROUND;
        };
    };
    class controls {
        class PROGRESS: GW_ctrlProgress {
        	idc                = IDC_BLEEDOUT_PROGRESS;
            x                  = "0.314375 * safezoneW + safezoneX";
        	y                  = "0.8498 * safezoneH + safezoneY";
        	w                  = "0.371242 * safezoneW";
        	h                  = "0.0308 * safezoneH";
        	colorBar[]         = COLOUR_RED;
        };
        class PROGRESS_TEXT: GW_ctrlStatic {
        	idc                = IDC_BLEEDOUT_PROGRESSTEXT;
        	text               = "";
        	x                  = "0.314375 * safezoneW + safezoneX";
        	y                  = "0.8498 * safezoneH + safezoneY";
        	w                  = "0.371242 * safezoneW";
        	h                  = "0.0286 * safezoneH";
            style              = ST_CENTER;
            font               = FONT_ALT_LIGHT;
            sizeEx             = TEXT_NORMAL;
        };
        class NEAREST_MEDIC: GW_ctrlStatic {
        	idc                = IDC_BLEEDOUT_NEARESTMEDIC;
        	text               = "";
        	x                  = "0.314375 * safezoneW + safezoneX";
        	y                  = "0.8168 * safezoneH + safezoneY";
        	w                  = "0.371184 * safezoneW";
        	h                  = "0.033 * safezoneH";
            style              = ST_CENTER;
            font               = FONT_ALT_NORMAL;
            sizeEx             = TEXT_NORMAL;
        };
        class ESCAPE_NOTICE: GW_ctrlStatic {
        	idc                = IDC_BLEEDOUT_ESCAPENOTICE;
        	text               = "$STR_GW_GUI_BLEEDOUT_ESCAPENOTICE";
        	x                  = "0.314374 * safezoneW + safezoneX";
        	y                  = "0.8806 * safezoneH + safezoneY";
        	w                  = "0.371184 * safezoneW";
        	h                  = "0.033 * safezoneH";
            style              = ST_CENTER;
            font               = FONT_ALT_LIGHT;
            sizeEx             = TEXT_SMALL2;
        };
    };
};
