/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayClothingShop.hpp
*/
class GW_DISPLAYCLOTHINGSHOP: GW_displayStandard {
    idd        = IDD_DISPLAYCLOTHINGSHOP_DISPLAY;
    scriptName = "GW_displayClothingShop";
    scriptPath = "GUI";
    onLoad     = "[_this, 'GW_displayClothingShop'] call GW_client_fnc_initDisplay";
    class controlsBackground {
        class HEADER: GW_ctrlStatic {
        	idc                = IDC_DISPLAYCLOTHINGSHOP_TITLE;
        	text               = "Clothing Store";
        	x                  = "0.707238 * safezoneW + safezoneX";
        	y                  = "0.291 * safezoneH + safezoneY";
        	w                  = "0.175313 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_HEADER;
        };
        class BACKGROUND: GW_ctrlStatic {
        	idc                = -1;
        	x                  = "0.707238 * safezoneW + safezoneX";
        	y                  = "0.313926 * safezoneH + safezoneY";
        	w                  = "0.175313 * safezoneW";
        	h                  = "0.396 * safezoneH";
        	colorBackground[]  = COLOUR_AREABACKGROUND;
        };
        class BACKGROUND_SEARCHBUTTON: GW_ctrlStatic {
        	idc                = -1;
        	x                  = "0.709344 * safezoneW + safezoneX";
        	y                  = "0.3174 * safezoneH + safezoneY";
        	w                  = "0.0134063 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
        class NAME_TITLE: GW_ctrlStatic {
        	idc                = -1;
        	text               = "Name:"; // ToDo: Localize;
        	x                  = "0.709396 * safezoneW + safezoneX";
        	y                  = "0.615674 * safezoneH + safezoneY";
        	w                  = "0.0634955 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
        class PRICE_TITLE: NAME_TITLE {
        	text               = "Price:"; // ToDo: Localize;
        	y                  = "0.638659 * safezoneH + safezoneY";
        };
        class REQLEVEL_TITLE: NAME_TITLE {
        	text               = "Required Level:"; // ToDo: Localize;
        	y                  = "0.661807 * safezoneH + safezoneY";
        };
    };
    class controls {
        class SEARCH_INPUT: GW_ctrlEdit {
        	idc                = IDC_DISPLAYCLOTHINGSHOP_SEARCHINPUT;
        	x                  = "0.723438 * safezoneW + safezoneX";
        	y                  = "0.317593 * safezoneH + safezoneY";
        	w                  = "0.156736 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_INPUT;
        };
        class BUTTON_SEARCH: GW_ctrlButtonPictureKeepAspect {
            idc                = IDC_DISPLAYCLOTHINGSHOP_BUTTONSEARCHREFRESH;
        	text               = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
        	x                  = "0.710364 * safezoneW + safezoneX";
        	y                  = "0.31937 * safezoneH + safezoneY";
        	w                  = "0.0113542 * safezoneW";
        	h                  = "0.0182963 * safezoneH";
        	colorBackground[]  = COLOUR_CONTENTBUTTON;
        };
        class TREE: GW_ctrlTree {
        	idc                = IDC_DISPLAYCLOTHINGSHOP_TREE;
            idcSearch          = IDC_DISPLAYCLOTHINGSHOP_SEARCHINPUT;
        	x                  = "0.709323 * safezoneW + safezoneX";
        	y                  = "0.340556 * safezoneH + safezoneY";
        	w                  = "0.170729 * safezoneW";
        	h                  = "0.273726 * safezoneH";
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
        class NAME_INPUT: GW_ctrlStatic {
        	idc                = IDC_DISPLAYCLOTHINGSHOP_NAMEINPUT;
        	text               = "N/A"; // ToDo: Localize;
        	x                  = "0.773438 * safezoneW + safezoneX";
        	y                  = "0.615511 * safezoneH + safezoneY";
        	w                  = "0.106807 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_INPUT;
        };
        class PRICE: NAME_INPUT {
        	idc                = IDC_DISPLAYCLOTHINGSHOP_PRICE;
        	y                  = "0.638659 * safezoneH + safezoneY";
        };
        class LEVEL_REQUIRED: NAME_INPUT {
        	idc                = IDC_DISPLAYCLOTHINGSHOP_LEVELREQUIRED;
        	y                  = "0.661807 * safezoneH + safezoneY";
        };
        class BUTTON_PURCHASE: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYCLOTHINGSHOP_BUTTONPURCHASE;
            text               = "PURCHASE";
        	x                  = "0.709344 * safezoneW + safezoneX";
        	y                  = "0.687 * safezoneH + safezoneY";
        	w                  = "0.170649 * safezoneW";
        	h                  = SIZE_BLOCK_CONTENTBUTTON;
        };
    };
};
