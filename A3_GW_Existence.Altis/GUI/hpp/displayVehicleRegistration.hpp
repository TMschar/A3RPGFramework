/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayVehicleRegistration.hpp
*/

class GW_DISPLAYVEHICLEREGISTRATION: GW_displayStandard {
    idd         = IDD_DISPLAYVEHICLEREGISTRATION_DISPLAY;
    scriptName  = "GW_displayVehicleRegistration";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displayVehicleRegistration'] call GW_client_fnc_initDisplay";
    class ControlsBackground {
		class HEADER: GW_ctrlStaticHeaderMoving {
			text 				= "Vehicle Registration"; // ToDo: Localize;
			x 					= "0.408216 * safezoneW + safezoneX";
			y 					= "0.313 * safezoneH + safezoneY";
			w 					= "0.184579 * safezoneW";
		};
		class BACKGROUND: GW_ctrlStaticBackground {
			x 					= "0.408334 * safezoneW + safezoneX";
			y 					= "0.331481 * safezoneH + safezoneY";
			w 					= "0.184579 * safezoneW";
			h 					= "0.329644 * safezoneH";
		};
		class FOOTER: GW_ctrlStaticFooter {
			x 					= "0.408334 * safezoneW + safezoneX";
			y 					= "0.660674 * safezoneH + safezoneY";
			w 					= "0.184579 * safezoneW";
		};
		class LIST_FILTER_BACKGROUND: GW_ctrlStatic {
			x 					= "0.41025 * safezoneW + safezoneX";
			y 					= "0.355726 * safezoneH + safezoneY";
			w 					= "0.180449 * safezoneW";
			h 					= "5 * (pixelH * pixelGrid * 0.50)";
			colorBackground[]   = {0, 0, 0, 1};
		};
		class LIST_VEHICLEREGISTRANTS: GW_ctrlStaticContent {
			x 					= "0.410417 * safezoneW + safezoneX";
			y 					= "0.37443 * safezoneH + safezoneY";
			w 					= "0.180449 * safezoneW";
			h 					= "0.283444 * safezoneH";
		};
	};
	class Controls {
		class BUTTON_CLOSE: GW_ctrlButtonCancel {
			idc 				= IDC_DISPLAYVEHICLEREGISTRATION_BUTTONCLOSE;
			x 					= "0.582292 * safezoneW + safezoneX";
			y 					= "0.312963 * safezoneH + safezoneY";
			w 					= "0.0105208 * safezoneW";
			h 					= "5 * (pixelH * pixelGrid * 0.50)";
		};
		class VEHICLE_PICTURE: GW_ctrlStaticPictureKeepAspect {
			idc 				= IDC_DISPLAYVEHICLEREGISTRATION_VEHICLEPICTURE;
			x 					= "0.41025 * safezoneW + safezoneX";
			y 					= "0.335 * safezoneH + safezoneY";
			w 				  	= "5 * (pixelW * pixelGrid * 0.50)";
			h 					= "5 * (pixelH * pixelGrid * 0.50)";
		};
		class VEHICLE_INFO: GW_ctrlStatic {
			idc 				= IDC_DISPLAYVEHICLEREGISTRATION_VEHICLEINFO;
			text 				= ""; // ToDo: Localize;
			x 					= "0.41025 * safezoneW + safezoneX";
			y 					= "0.335 * safezoneH + safezoneY";
			w 					= "0.180449 * safezoneW";
			h 					= "5 * (pixelH * pixelGrid * 0.50)";
			style				= ST_RIGHT;
		};
		class LIST_FILTER: GW_ctrlListNBox {
			idc					= IDC_DISPLAYVEHICLEREGISTRATION_LISTFILTER;
			x 					= "0.41025 * safezoneW + safezoneX";
			y 					= "0.355726 * safezoneH + safezoneY";
			w 					= "0.180449 * safezoneW";
			h 					= "5 * (pixelH * pixelGrid * 0.50)";
			disableOverflow     = 1;
			columns[]           = {0, 0.65};
			class Items {
				class PLAYER_NAME {
					text 	= "Name";
                    value   = 0;
				};
				class PLAYER_ROLE: PLAYER_NAME {
					text 	= "Role";
                    value   = 0;
				};
			};
		};
		class LIST_VEHICLEREGISTRANTS: GW_ctrlListNBox {
			idc 				= IDC_DISPLAYVEHICLEREGISTRATION_PLAYERSWITHACCESS;
			x 					= "0.410417 * safezoneW + safezoneX";
			y 					= "0.37443 * safezoneH + safezoneY";
			w 					= "0.180449 * safezoneW";
			h 					= "0.283444 * safezoneH";
            disableOverflow     = 1;
			columns[]           = {0, 0.65};
		};
		class BUTTON_CONTACT: GW_ctrlDefaultButton {
			idc					= IDC_DISPLAYVEHICLEREGISTRATION_BUTTONCONTACT;
			text 				= "CONTACT"; // ToDo: Localize;
			x 					= "0.410261 * safezoneW + safezoneX";
			y 					= "0.664889 * safezoneH + safezoneY";
			w 					= "0.0593855 * safezoneW";
			h 					= "5 * (pixelH * pixelGrid * 0.50)";
		};
		class BUTTON_WARRANT: BUTTON_CONTACT {
			idc 				= IDC_DISPLAYVEHICLEREGISTRATION_BUTTONWARRANT;
			text 				= "WARRANT"; // ToDo: Localize;
			x 					= "0.470844 * safezoneW + safezoneX";
		};
	};
};
