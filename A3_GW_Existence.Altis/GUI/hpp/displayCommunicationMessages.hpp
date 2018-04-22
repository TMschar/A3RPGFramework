/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayCommunicationMessages.hpp
*/
class GW_DISPLAYCOMMUNICATIONMESSAGES: GW_displayStandard {
    idd        = IDD_DISPLAYCOMMUNICATIONMESSAGES_DISPLAY;
    scriptName = "GW_displayCommunicationMessages";
    scriptPath = "GUI";
    onLoad     = "[_this, 'GW_displayCommunicationMessages'] call GW_client_fnc_initDisplay";
    class controlsBackground {
        class TILES: GW_RscTiles {};
		class HEADER: GW_ctrlStaticTitle {
			idc 				= -1;
			text 				= "$STR_GW_GUI_DISPLAYS_DISPLAYCOMMUNICATIONMESSAGES_TITLE";
			x					= "0.29375 * safezoneW + safezoneX";
			y 					= "0.225 * safezoneH + safezoneY";
			w 					= "0.4125 * safezoneW";
			h 					= SIZE_BLOCK_HEADER2;
		};
		class BACKGROUND: GW_ctrlStatic {
			idc 				= -1;
			x 					= "0.29375 * safezoneW + safezoneX";
			y 					= "0.248148 * safezoneH + safezoneY";
			w 					= "0.4125 * safezoneW";
			h 					= "0.528 * safezoneH";
			colorBackground[] 	= COLOUR_AREABACKGROUND;
		};
		class TITLE_RECEIVEDMESSAGES: GW_ctrlStatic {
			idc 				= -1;
			text 				= "$STR_GW_GUI_DISPLAYS_DISPLAYCOMMUNICATIONMESSAGES_RECEIVEDMESSAGES";
			x 					= "0.295813 * safezoneW + safezoneX";
			y 					= "0.2514 * safezoneH + safezoneY";
			w 					= "0.127871 * safezoneW";
			h 					= SIZE_BLOCK_HEADER2;
			colorBackground[] 	= COLOUR_CONTENTTITLE;
		};
		class TITLE_FROM: GW_ctrlStatic {
			idc 				= -1;
			text 				= "$STR_GW_GUI_DISPLAYS_DISPLAYCOMMUNICATIONMESSAGES_FROM";
			x 					= "0.425 * safezoneW + safezoneX";
			y 					= "0.2514 * safezoneH + safezoneY";
			w 					= "0.0804375 * safezoneW";
			h 					= SIZE_BLOCK_HEADER2;
			colorBackground[] 	= COLOUR_CONTENTBACKGROUND;
		};
		class TITLE_TO: TITLE_FROM {
			text 				= "$STR_GW_GUI_DISPLAYS_DISPLAYCOMMUNICATIONMESSAGES_TO";
			y 					= "0.275 * safezoneH + safezoneY";
		};
		class TITLE_DATE: TITLE_FROM {
			text 				= "$STR_GW_GUI_DISPLAYS_DISPLAYCOMMUNICATIONMESSAGES_DATE";
			y 					= "0.298148 * safezoneH + safezoneY";
		};
		class TITLE_LOCATION: TITLE_FROM {
			text 				= "$STR_GW_GUI_DISPLAYS_DISPLAYCOMMUNICATIONMESSAGES_LOCATION";
			y 					= "0.321296 * safezoneH + safezoneY";
		};
    };
	class controls {
		class LIST_MESSAGES: GW_ctrlListbox {
			idc 				= IDC_DISPLAYCOMMUNICATIONMESSAGES_LISTMESSAGES;
			x 					= "0.295813 * safezoneW + safezoneX";
			y 					= "0.275 * safezoneH + safezoneY";
			w 					= "0.127871 * safezoneW";
			h 					= "0.477052 * safezoneH";
			colorBackground[] 	= COLOUR_CONTENTBACKGROUND;
		};
		class BUTTON_REPLY: GW_ctrlContentAreaButton {
			idc 				= IDC_DISPLAYCOMMUNICATIONMESSAGES_BUTTONREPLY;
			text 				= "$STR_GW_GUI_DISPLAYS_DISPLAYCOMMUNICATIONMESSAGES_REPLY";
			x 					= "0.295813 * safezoneW + safezoneX";
			y 					= "0.753 * safezoneH + safezoneY";
			w 					= "0.0635 * safezoneW";
			h 					= SIZE_BLOCK_CONTENTBUTTON;
			colorBackground[] 	= COLOUR_CONTENTBUTTON;
		};
		class BUTTON_DELETE: BUTTON_REPLY {
			idc 				= IDC_DISPLAYCOMMUNICATIONMESSAGES_BUTTONDELETE;
			text 				= "$STR_GW_GUI_DISPLAYS_DISPLAYCOMMUNICATIONMESSAGES_DELETE";
			x 					= "0.359896 * safezoneW + safezoneX";
			y 					= "0.752778 * safezoneH + safezoneY";
			w 					= "0.0639 * safezoneW";
		};
		class BUTTON_CLOSE: GW_ctrlButtonCancel {
			idc 				= IDC_DISPLAYCOMMUNICATIONMESSAGES_BUTTONCLOSE;
			x					= "0.692843 * safezoneW + safezoneX";
			y 					= "0.225 * safezoneH + safezoneY";
			w 					= "0.0134063 * safezoneW";
		};
		class SENDER_NAME: GW_ctrlStatic {
			idc 				= IDC_DISPLAYCOMMUNICATIONMESSAGES_TEXTSENDER;
			text 				= "$STR_GW_GLOBAL_NA";
			x 					= "0.505729 * safezoneW + safezoneX";
			y 					= "0.251852 * safezoneH + safezoneY";
			w 					= "0.197976 * safezoneW";
			h 					= "0.022 * safezoneH";
			colorBackground[] 	= COLOUR_INPUT;
		};
		class TO_NAME: SENDER_NAME {
			idc 				= IDC_DISPLAYCOMMUNICATIONMESSAGES_TEXTRECEIVER;
			text 				= "$STR_GW_GLOBAL_NA";
			y 					= "0.275 * safezoneH + safezoneY";
		};
		class DATE_SENT: SENDER_NAME {
			idc 				= IDC_DISPLAYCOMMUNICATIONMESSAGES_TEXTDATESENT;
			text				= "$STR_GW_GLOBAL_NA";
			y					= "0.298148 * safezoneH + safezoneY";
		};
		class LOCATION: SENDER_NAME {
			idc 				= IDC_DISPLAYCOMMUNICATIONMESSAGES_TEXTLOCATION;
			text 				= "$STR_GW_GLOBAL_NA";
			y 					= "0.321296 * safezoneH + safezoneY";
            w                   = "0.185604 * safezoneW";
		};
		class MESSAGE_TEXT: GW_ctrlStatic {
			idc 				= IDC_DISPLAYCOMMUNICATIONMESSAGES_MESSAGETEXT;
			x 					= "0.425 * safezoneW + safezoneX";
			y 					= "0.344792 * safezoneH + safezoneY";
			w 					= "0.278437 * safezoneW";
			h 					= "0.407 * safezoneH";
			style 				= ST_LEFT + ST_MULTI + ST_NO_RECT;
			colorBackground[] 	= COLOUR_CONTENTBACKGROUND;
		};
		class BUTTON_NEWMESSAGE: GW_ctrlContentAreaButton {
			idc					= IDC_DISPLAYCOMMUNICATIONMESSAGES_BUTTONNEWMESSAGE;
			text 				= "$STR_GW_GUI_DISPLAYS_DISPLAYCOMMUNICATIONMESSAGES_NEWMESSAGE";
			x 					= "0.639818 * safezoneW + safezoneX";
			y 					= "0.752778 * safezoneH + safezoneY";
			w 					= "0.0639 * safezoneW";
			h 					= SIZE_BLOCK_CONTENTBUTTON;
			colorBackground[] 	= COLOUR_CONTENTBUTTON;
		};
        class MAP_MARK_LOCATION: GW_ctrlButtonPictureKeepAspect {
        	idc                = IDC_DISPLAYCOMMUNICATIONMESSAGES_ADDMARKONMAP;
            text               = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\map_off_ca.paa";
        	x                  = "0.691667 * safezoneW + safezoneX";
        	y                  = "0.321296 * safezoneH + safezoneY";
        	w                  = "0.0118438 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
	};
};
