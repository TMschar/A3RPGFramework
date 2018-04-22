/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayLicenses.hpp
*/
class GW_DISPLAYLICENSES: GW_displayStandard {
    idd        = IDD_DISPLAYLICENSES_DISPLAY;
    scriptName = "GW_displayLicenses";
    scriptPath = "GUI";
    onLoad     = "[_this, 'GW_displayLicenses'] call GW_client_fnc_initDisplay";
    class controlsBackground {
        class TILES: GW_RscTiles {};
        class HEADER: GW_ctrlStatic {
        	idc                = -1;
        	text               = "Licensing"; // ToDo: Localize;
        	x                  = "0.39687 * safezoneW + safezoneX";
        	y                  = "0.269 * safezoneH + safezoneY";
        	w                  = "0.207291 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_HEADER;
        };
        class BACKGROUND: GW_ctrlStatic {
        	idc                = -1;
        	x                  = "0.396662 * safezoneW + safezoneX";
        	y                  = "0.292148 * safezoneH + safezoneY";
        	w                  = "0.207291 * safezoneW";
        	h                  = "0.4378 * safezoneH";
        	colorBackground[]  = COLOUR_AREABACKGROUND;
        };
        class TITLE_NAME: GW_ctrlStatic {
            idc                 = -1;
            text                = "Name:"; // ToDo: Localize;
            x                   = "0.398958 * safezoneW + safezoneX";
            y                   = "0.636222 * safezoneH + safezoneY";
            w                   = "0.0639421 * safezoneW";
            h                   = SIZE_BLOCK_HEADER2;
            colorBackground[]   = COLOUR_CONTENTBACKGROUND;
            style               = ST_RIGHT;
        };
        class TITLE_REQUIREDLEVEL: TITLE_NAME {
            text                = "Required Level:"; // ToDo: Localize;
            y                   = "0.65937 * safezoneH + safezoneY";
        };
        class TITLE_PRICE: TITLE_NAME {
            text                = "Price:";
            y                   = "0.682519 * safezoneH + safezoneY";
        };
        class BACKGROUND_SEARCHBUTTON: GW_ctrlStatic {
            idc                 = -1;
            x                   = "0.398958 * safezoneW + safezoneX";
            y                   = "0.295126 * safezoneH + safezoneY";
            w                   = "0.0123796 * safezoneW";
            h                   = SIZE_BLOCK_HEADER2;
            colorBackground[]   = COLOUR_CONTENTBACKGROUND;
        };
    };
    class controls {
        class LICENSE_TREE: GW_ctrlTree {
        	idc                = IDC_DISPLAYLICENSES_LICENSETREE;
            idcSearch          = IDC_DISPLAYLICENSES_SEARCHINPUT;
        	x                  = "0.398933 * safezoneW + safezoneX";
        	y                  = "0.318326 * safezoneH + safezoneY";
        	w                  = "0.203166 * safezoneW";
        	h                  = "0.3168 * safezoneH";
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
        class BUTTON_REFRESHSEARCH: GW_ctrlButtonPictureKeepAspect {
            idc                = IDC_DISPLAYLICENSES_SEARCHREFRESH;
        	text               = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
        	x                  = "0.399948 * safezoneW + safezoneX";
        	y                  = "0.29737 * safezoneH + safezoneY";
        	w                  = "0.0102605 * safezoneW";
        	h                  = "0.0182963 * safezoneH";
        };
        class INPUT_SEARCHLICENSES: GW_ctrlEdit {
        	idc                = IDC_DISPLAYLICENSES_SEARCHINPUT;
        	x                  = "0.411979 * safezoneW + safezoneX";
        	y                  = "0.29537 * safezoneH + safezoneY";
        	w                  = "0.19026 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_INPUT;
        };
        class BUTTON_CLOSE: GW_ctrlButtonCancel {
            idc                = IDC_DISPLAYLICENSES_BUTTONCLOSE;
        	x                  = "0.59075 * safezoneW + safezoneX";
        	y                  = "0.269 * safezoneH + safezoneY";
        	w                  = "0.0123751 * safezoneW";
        };
        class BUTTON_PURCHASE: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYLICENSES_BUTTONPURCHASE;
        	text               = "PURCHASE"; // ToDo: Localize;
        	x                  = "0.398795 * safezoneW + safezoneX";
        	y                  = "0.70697 * safezoneH + safezoneY";
        	w                  = "0.203131 * safezoneW";
        	h                  = SIZE_BLOCK_CONTENTBUTTON;
        };
        class TEXT_LICENSENAME: GW_ctrlStatic {
        	idc                = IDC_DISPLAYLICENSES_SELECTEDLICENSENAMETEXT;
        	text               = "N/A";
        	x                  = "0.463542 * safezoneW + safezoneX";
        	y                  = "0.636111 * safezoneH + safezoneY";
        	w                  = "0.138704 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_INPUT;
        };
        class TEXT_REQUIREDLEVEL: TEXT_LICENSENAME {
        	idc                = IDC_DISPLAYLICENSES_SELECTEDLICENSEREQUIREDLEVELTEXT;
        	y                  = "0.659259 * safezoneH + safezoneY";
        };
        class TEXT_PRICE: TEXT_LICENSENAME {
        	idc                = IDC_DISPLAYLICENSES_SELECTEDLICENSETEXTPRICE;
        	y                  = "0.682407 * safezoneH + safezoneY";
        };
    };
};
