/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayDepositBox.hpp
*/

class GW_DISPLAYDEPOSITBOX: GW_displayStandard {
    idd        = IDD_DISPLAYDEPOSITBOX_DISPLAY;
    scriptName = "GW_displayDepositBox";
    scriptPath = "GUI";
    onLoad     = "[_this, 'GW_displayDepositBox'] call GW_client_fnc_initDisplay";
    class controlsBackground {
        class HEADER: GW_ctrlStaticHeader {
        	text               = "Deposit Box"; // ToDo: Localize;
        	x                  = "0.355625 * safezoneW + safezoneX";
        	y                  = "0.313 * safezoneH + safezoneY";
        	w                  = "0.288704 * safezoneW";
        };
        class BACKGROUND: GW_ctrlStaticBackground {
        	x                  = "0.355729 * safezoneW + safezoneX";
        	y                  = "0.331481 * safezoneH + safezoneY";
        	w                  = "0.288704 * safezoneW";
        	h                  = "0.311118 * safezoneH";
        };
        class FOOTER: GW_ctrlStaticFooter {
        	x                  = "0.355729 * safezoneW + safezoneX";
        	y                  = "0.642592 * safezoneH + safezoneY";
        	w                  = "0.288704 * safezoneW";
        	h                  = "0.0259259 * safezoneH";
        };
        class FILTER_BACKGROUND: GW_ctrlStatic {
            idc                = IDC_DISPLAYDEPOSITBOX_FILTER;
            x                  = "0.357656 * safezoneW + safezoneX";
            y                  = "0.355148 * safezoneH + safezoneY";
            w                  = "0.284569 * safezoneW";
            h                  = "5 * (pixelH * pixelGrid * 0.50)";
            colorBackground[]  = {0, 0, 0, 1};
        };
        class LIST: FILTER_BACKGROUND {
            idc                = IDC_DISPLAYDEPOSITBOX_LIST;
            x                  = "0.357708 * safezoneW + safezoneX";
            y                  = "0.374074 * safezoneH + safezoneY";
            w                  = "0.284115 * safezoneW";
            h                  = "0.264111 * safezoneH";
            colorBackground[]  = {0, 0, 0, 0.5};
        };
    };
    class controls {
        class BUTTON_CLOSE: GW_ctrlButtonCancel {
            idc                = IDC_DISPLAYDEPOSITBOX_BUTTONCLOSE;
            x                  = "0.632969 * safezoneW + safezoneX";
            y                  = "0.313 * safezoneH + safezoneY";
            w                  = "0.0115625 * safezoneW";
            h                  = "5 * (pixelH * pixelGrid * 	0.50)";
        };
        class PLAYER_INFO: GW_ctrlStatic {
            idc                = IDC_DISPLAYDEPOSITBOX_PLAYERINFO;
            text               = "";
            x                  = "0.357812 * safezoneW + safezoneX";
            y                  = "0.335186 * safezoneH + safezoneY";
            w                  = "0.284569 * safezoneW";
            h                  = "0.0185185 * safezoneH";
            style              = ST_RIGHT;
        };
        class FILTER: GW_ctrlListNBox {
        	idc                = IDC_DISPLAYDEPOSITBOX_FILTER;
        	x                  = "0.357656 * safezoneW + safezoneX";
        	y                  = "0.355148 * safezoneH + safezoneY";
        	w                  = "0.284569 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
            disableOverflow     = 1;
            columns[]           = {0, 0.43, 0.66};
            class Items {
                class DESCRIPTION {
                    text 	= "Description";
                    value   = 0;
                };
                class TYPE: DESCRIPTION {
                    text 	= "Type";
                    value   = -1;
                    data    = "data";
                };
                class DATA: DESCRIPTION {
                    text 	= "Data";
                    value   = -1;
                    data    = "data";
                };
            };
        };
        class LIST: FILTER {
        	idc                = IDC_DISPLAYDEPOSITBOX_LIST;
        	x                  = "0.357708 * safezoneW + safezoneX";
        	y                  = "0.374074 * safezoneH + safezoneY";
        	w                  = "0.284115 * safezoneW";
        	h                  = "0.264111 * safezoneH";
            class Items {};
        };
        class BUTTON_CLAIM: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYDEPOSITBOX_BUTTONCLAIM;
        	text               = "CLAIM"; // ToDo: Localize;
        	x                  = "0.357708 * safezoneW + safezoneX";
        	y                  = "0.646704 * safezoneH + safezoneY";
        	w                  = "(60 * 0.5 - 1) * (pixelW * pixelGrid * 0.50)";
        	h                  = "5 * (pixelH * pixelGrid * 	0.50)";
        };
    };
};
