/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayCommunicationSendMessage.hpp
*/

class GW_DISPLAYCOMMUNICATIONSENDMESSAGE: GW_displayStandard {
    idd        = IDD_DISPLAYCOMMUNICATIONSENDMESSAGE_DISPLAY;
    scriptName = "GW_displayCommunicationSendMessage";
    scriptPath = "GUI";
    onLoad     = "[_this, 'GW_displayCommunicationSendMessage'] call GW_client_fnc_initDisplay";
    class controlsBackground {
        class TILES: GW_RscTiles {};
        class HEADER: GW_ctrlStatic {
        	idc                = -1;
        	text               = "$STR_GW_GUI_DISPLAYS_DISPLAYCOMMUNICATIONSENDMESSAGE_TITLE";
        	x                  = "0.29375 * safezoneW + safezoneX";
        	y                  = "0.225 * safezoneH + safezoneY";
        	w                  = "0.4125 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_HEADER;
            font               = FONT_ALT_NORMAL;
            sizeEx             = TEXT_SIZE_HEADER;
        };
        class BACKGROUND: GW_ctrlStatic {
        	idc                = -1;
        	x                  = "0.29375 * safezoneW + safezoneX";
        	y                  = "0.2481 * safezoneH + safezoneY";
        	w                  = "0.4125 * safezoneW";
        	h                  = "0.528 * safezoneH";
        	colorBackground[]  = COLOUR_AREABACKGROUND;
        };
        class TITLE_TO: GW_ctrlStatic {
        	idc                = -1;
        	text               = "$STR_GW_GUI_DISPLAYS_DISPLAYCOMMUNICATIONSENDMESSAGE_TO";
        	x                  = "0.295812 * safezoneW + safezoneX";
        	y                  = "0.2514 * safezoneH + safezoneY";
        	w                  = "0.0690937 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
            font			   = FONT_HEAVY;
            sizeEx             = TEXT_SMALL2;
        };
        class TITLE_LOCATION: TITLE_TO {
        	text               = "$STR_GW_GUI_DISPLAYS_DISPLAYCOMMUNICATIONSENDMESSAGE_LOCATION";
        	y                  = "0.275 * safezoneH + safezoneY";
        };
    };
    class controls {
        class TEXT_TO: GW_ctrlStatic {
            idc                = IDC_DISPLAYCOMMUNICATIONSENDMESSAGE_TEXTO;
            text               = "$STR_GW_GLOBAL_NA";
            x                  = "0.365628 * safezoneW + safezoneX";
            y                  = "0.25184 * safezoneH + safezoneY";
            w                  = "0.33825 * safezoneW";
            h                  = SIZE_BLOCK_HEADER2;
            colorBackground[]  = COLOUR_INPUT;
            sizeEx             = TEXT_SMALL2;
        };
        class TEXT_LOCATION: TEXT_TO {
        	idc                = IDC_DISPLAYCOMMUNICATIONSENDMESSAGE_TEXTLOCATION;
        	text               = "$STR_GW_GLOBAL_NA";
        	y                  = "0.275 * safezoneH + safezoneY";
        	w                  = "0.323816 * safezoneW";
        	colorBackground[]  = COLOUR_INPUT;
        };
        class CHECKBOX_SENDLOCATION: GW_RscCheckBox {
        	idc                = IDC_DISPLAYCOMMUNICATIONSENDMESSAGE_SENDLOCATIONCHECKBOX;
            tooltip            = "$STR_GW_GUI_DISPLAYS_DISPLAYCOMMUNICATIONSENDMESSAGE_TOOLTIPLOCATION";
        	x                  = "0.690104 * safezoneW + safezoneX";
        	y                  = "0.275 * safezoneH + safezoneY";
        	w                  = "0.0134063 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
            colorBackground[]  = COLOUR_CONTENTBUTTON;
        };
        class INPUT_MESSAGE: GW_ctrlEdit {
        	idc                = IDC_DISPLAYCOMMUNICATIONSENDMESSAGE_INPUTMESSAGE;
        	x                  = "0.295813 * safezoneW + safezoneX";
        	y                  = "0.298 * safezoneH + safezoneY";
        	w                  = "0.4078 * safezoneW";
        	h                  = "0.4532 * safezoneH";
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
            style              = ST_MULTI + ST_NO_RECT;
            sizeEx             = TEXT_SMALL2;
        };
        class BUTTON_SENDMESSAGE: GW_ctrlContentAreaButton {
            idc                = IDC_DISPLAYCOMMUNICATIONSENDMESSAGE_BUTTONSENDMESSAGE;
        	text               = "$STR_GW_GUI_DISPLAYS_DISPLAYCOMMUNICATIONSENDMESSAGE_SENDMESSAGE";
        	x                  = "0.295813 * safezoneW + safezoneX";
        	y                  = "0.753 * safezoneH + safezoneY";
        	w                  = "0.0773437 * safezoneW";
        	h                  = SIZE_BLOCK_CONTENTBUTTON;
        	colorBackground[]  = COLOUR_CONTENTBUTTON;
        };
        class BUTTON_GOBACK: BUTTON_SENDMESSAGE {
            idc                = IDC_DISPLAYCOMMUNICATIONSENDMESSAGE_BUTTONGOBACK;
            text               = "$STR_GW_GUI_DISPLAYS_DISPLAYCOMMUNICATIONSENDMESSAGE_GOBACK";
        	x                  = "0.62631 * safezoneW + safezoneX";
        };
        class BUTTON_CLOSE: GW_ctrlButtonCancel {
            idc                = IDC_DISPLAYCOMMUNICATIONSENDMESSAGE_BUTTONCLOSE;
        	x                  = "0.693147 * safezoneW + safezoneX";
        	y                  = "0.225 * safezoneH + safezoneY";
        	w                  = "0.0123751 * safezoneW";
        };
    };
};
