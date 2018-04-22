/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: ctrlPrompt.hpp
*/

class GW_ctrlPrompt: GW_ctrlControlsGroupNoScrollbars {
    idd        = -1;
    x          = "safezoneX";
    y          = "safezoneY";
    w          = "safezoneW";
    h          = "safezoneH";
    class controls {
        class BACKGROUND: GW_ctrlStatic {
            idc                 = -1;
            x                   = "0.29375 * safezoneW";
            y                   = "0.380556 * safezoneH";
            w                   = "0.4125 * safezoneW";
            h                   = "0.2398 * safezoneH";
            colorBackground[]   = COLOUR_AREABACKGROUND;
        };
        class HEADER: GW_ctrlStatic {
            idc                 = -1;
            text                = "Confirm Action";
            x                   = "0.29375 * safezoneW";
            y                   = "0.357 * safezoneH";
            w                   = "0.412424 * safezoneW";
            h                   = SIZE_BLOCK_HEADER2;
            colorBackground[]   = COLOUR_HEADER;
            font                = FONT_ALT_NORMAL;
            sizeEx				= TEXT_SIZE_HEADER;
        };
        class BUTTON_NO: GW_ctrlFloatButton {
            idc                = 1;
            text		       = "";
            x 				   = "0.649531 * safezoneW";
            y 				   = "0.621 * safezoneH";
            w                  = "0.0567187 * safezoneW";
        };
        class BUTTON_YES: GW_ctrlFloatButton {
            idc                = 2;
            text		       = "";
            x                  = "0.592 * safezoneW";
            y                  = "0.621 * safezoneH";
            w                  = "0.0567187 * safezoneW";
        };
        class CONTENT_TITLE: GW_ctrlStatic {
            idc                = 3;
            text               = "";
            x                  = "0.295812 * safezoneW";
            y                  = "0.384956 * safezoneH";
            w                  = "0.4083 * safezoneW";
            h                  = SIZE_BLOCK_HEADER2;
            colorBackground[]  = COLOUR_CONTENTTITLE;
            font               = FONT_ALT_NORMAL;
            sizeEx			   = TEXT_SIZE_SUBHEADER;
        };
        class CONTENT_TEXT: GW_ctrlStatic {
            idc                = 4;
            text               = "";
            style			   = ST_LEFT + ST_MULTI;
            x                  = "0.295833 * safezoneW";
            y                  = "0.408333 * safezoneH";
            w                  = "0.4083 * safezoneW";
            h                  = "0.2068 * safezoneH";
            colorBackground[]  = COLOUR_CONTENTBACKGROUND;
            sizeEx			   = TEXT_SIZE_TEXTBOX;
        };
    };
};

class GW_ctrlPromptSmall: GW_ctrlControlsGroupNoScrollbars {
    idd        = -1;
    x          = "safezoneX";
    y          = "safezoneY";
    w          = "safezoneW";
    h          = "safezoneH";
    class controls {
        class HEADER: GW_ctrlStaticTitle {
            idc 				= 3;
            x 					= "0.396354 * safezoneW";
            y 					= "0.4032 * safezoneH";
            w 					= "0.20625 * safezoneW";
            h 					= "0.0185185 * safezoneH";
        };
        class BACKGROUND: GW_ctrlStaticBackground {
            x 					= "0.396359 * safezoneW";
            y 					= "0.420974 * safezoneH";
            w 					= "0.20625 * safezoneW";
            h 					= "0.110926 * safezoneH";
        };
        class FOOTER: GW_ctrlStaticFooter {
            x 					= "0.396354 * safezoneW";
            y 					= "0.532407 * safezoneH";
            w 					= "0.20625 * safezoneW";
            h 					= "0.0259259 * safezoneH";
        };
        class CONTENT_TEXT: GW_ctrlStatic {
            idc 				= 4;
            x 					= "0.398437 * safezoneW";
            y 					= "0.424852 * safezoneH";
            w 					= "0.202136 * safezoneW";
            h 					= "0.10363 * safezoneH";
            style			    = ST_LEFT + ST_MULTI + ST_NO_RECT;
        };
        class BUTTON_CANCEL: GW_ctrlDefaultButton {
            idc					= 1;
            text				= "";
            x 					= "0.550521 * safezoneW";
            y 					= "0.535778 * safezoneH";
            w 					= "0.05 * safezoneW";
            h 					= "0.0185185 * safezoneH";
        };
        class BUTTON_OK: BUTTON_CANCEL {
            idc 				= 2;
            x 					= "0.498959 * safezoneW";
        };
    };
};