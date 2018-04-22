/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayEquipmentShop.hpp
*/

class GW_DISPLAYEQUIPMENTSHOP: GW_displayStandard {
    idd         = IDD_DISPLAYEQUIPMENTSHOP_DISPLAY;
    scriptName  = "GW_displayEquipmentShop";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displayEquipmentShop'] call GW_client_fnc_initDisplay";
    blockEscape = 0;
    class ControlsBackground {
        class BACKGROUND: GW_ctrlStatic {
        	idc                = -1;
        	x                  = "0.32468 * safezoneW + safezoneX";
        	y                  = "0.313578 * safezoneH + safezoneY";
        	w                  = "0.351671 * safezoneW";
        	h                  = "0.396 * safezoneH";
        	colorBackground[]  = COLOUR_AREABACKGROUND;
        };
        class HEADER: GW_ctrlStatic {
        	idc                = IDC_DISPLAYEQUIPMENTSHOP_HEADER;
        	text               = "";
        	x                  = "0.32468 * safezoneW + safezoneX";
        	y                  = "0.291 * safezoneH + safezoneY";
        	w                  = "0.351671 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_HEADER;
        };
        class TITLE_EQUIPMENT: GW_ctrlStatic {
        	idc                = -1;
        	text               = "Available Equipment"; // ToDo: Localize;
        	x                  = "0.326743 * safezoneW + safezoneX";
        	y                  = "0.3174 * safezoneH + safezoneY";
        	w                  = "0.122713 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_CONTENTTITLE;
        };
        class BACKGROUND_BUTTON: GW_ctrlStatic {
        	idc                = -1;
        	x                  = "0.326763 * safezoneW + safezoneX";
        	y                  = "0.341 * safezoneH + safezoneY";
        	w                  = "0.0123751 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
        class TITLE_WEAPONINFORMATION: GW_ctrlStatic {
        	idc                = -1;
        	text               = "Equipment Information"; // ToDo: Localize;
        	x                  = "0.451742 * safezoneW + safezoneX";
        	y                  = "0.317852 * safezoneH + safezoneY";
        	w                  = "0.221689 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_CONTENTTITLE;
        };
        class TITLE_NAME: GW_ctrlStatic {
        	idc                = -1;
        	text               = "Name"; // ToDo: Localize;
        	x                  = "0.451763 * safezoneW + safezoneX";
        	y                  = "0.49563 * safezoneH + safezoneY";
        	w                  = "0.0598127 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
            style              = ST_RIGHT;
        };
        class TITLE_PRICE: TITLE_NAME {
        	text               = "Price"; // ToDo: Localize;
        	y                  = "0.541222 * safezoneH + safezoneY";
        };
        class TITLE_LEVELREQUIRED: TITLE_NAME {
        	text               = "Level Required"; // ToDo: Localize;
        	y                  = "0.518778 * safezoneH + safezoneY";
        };
    };
    class Controls {
        class BUTTON_CLOSE: GW_ctrlButtonCancel {
            idc                = IDC_DISPLAYEQUIPMENTSHOP_BUTTONCLOSE;
            x                  = "0.663969 * safezoneW + safezoneX";
            y                  = "0.291 * safezoneH + safezoneY";
            w                  = "0.0123747 * safezoneW";
        };
        class BUTTON_PURCHASE: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYEQUIPMENTSHOP_BUTTONPURCHASE;
            text               = "PURCHASE"; // ToDo: Localize;
            x                  = "0.594811 * safezoneW + safezoneX";
            y                  = "0.687 * safezoneH + safezoneY";
            w                  = "0.0794139 * safezoneW";
            colorBackground[]  = COLOUR_CONTENTBUTTON;
        };
        class TREE_EQUIPMENT: GW_ctrlTree {
            idc                = IDC_DISPLAYEQUIPMENTSHOP_TREEEQUIPMENT;
            idcSearch          = IDC_DISPLAYEQUIPMENTSHOP_INPUTSEARCH;
            x                  = "0.326763 * safezoneW + safezoneX";
            y                  = "0.364148 * safezoneH + safezoneY";
            w                  = "0.122724 * safezoneW";
            h                  = "0.342852 * safezoneH";
            colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
        class INPUT_SEARCH: GW_ctrlEdit {
        	idc                = IDC_DISPLAYEQUIPMENTSHOP_INPUTSEARCH;
        	x                  = "0.339656 * safezoneW + safezoneX";
        	y                  = "0.341 * safezoneH + safezoneY";
        	w                  = "0.10982 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_INPUT;
        };
        class BUTTON_SEARCH_REFRESH: GW_ctrlButtonPictureKeepAspect {
        	idc                = IDC_DISPLAYEQUIPMENTSHOP_BUTTONSEARCHREFRESH;
            text               = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
        	x                  = "0.327752 * safezoneW + safezoneX";
        	y                  = "0.342874 * safezoneH + safezoneY";
        	w                  = "0.0103125 * safezoneW";
        	h                  = "0.0182963 * safezoneH";
            colorBackground[]  = COLOUR_CONTENTBUTTON;
        };
        class WEAPON_PREVIEW: GW_ctrlStructuredText {
        	idc                = IDC_DISPLAYEQUIPMENTSHOP_WEAPONPREVIEW;
        	x                  = "0.451763 * safezoneW + safezoneX";
        	y                  = "0.341 * safezoneH + safezoneY";
        	w                  = "0.221734 * safezoneW";
        	h                  = "0.151222 * safezoneH";
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
        class NAME_TEXT: GW_ctrlStatic {
        	idc                = IDC_DISPLAYEQUIPMENTSHOP_WEAPONNAME;
        	text               = "";
        	x                  = "0.512 * safezoneW + safezoneX";
        	y                  = "0.49563 * safezoneH + safezoneY";
        	w                  = "0.161912 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_INPUT;
        };
        class TEXT_PRICE: NAME_TEXT {
            idc                = IDC_DISPLAYEQUIPMENTSHOP_WEAPONPRICE;
            text               = "";
            y                  = "0.541245 * safezoneH + safezoneY";
        };
        class TEXT_EXPREQUIRED: NAME_TEXT {
            idc                = IDC_DISPLAYEQUIPMENTSHOP_EXPERIENCEREQUIREDTEXT;
            text               = "";
            y                  = "0.518778 * safezoneH + safezoneY";
        };
        class EQUIPMENT_DESCRIPTION: GW_ctrlStatic {
        	idc                = IDC_DISPLAYEQUIPMENTSHOP_EQUIPMENTDESCRIPTIONTEXT;
        	x                  = "0.451562 * safezoneW + safezoneX";
        	y                  = "0.564815 * safezoneH + safezoneY";
        	w                  = "0.22224 * safezoneW";
        	h                  = "0.1208 * safezoneH";
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
    };
};
