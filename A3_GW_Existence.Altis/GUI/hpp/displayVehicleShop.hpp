/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayVehicleShop.hpp
*/

class GW_DISPLAYVEHICLESHOP: GW_displayStandard {
    idd         = IDD_DISPLAYVEHICLESHOP_DISPLAY;
    scriptName  = "GW_displayVehicleShop";
    scriptPath  = "GUI";
    onLoad      = "[_this, 'GW_displayVehicleShop'] call GW_client_fnc_initDisplay";
    blockEscape = 0;
    class ControlsBackground {
        class BACKGROUND: GW_ctrlStatic {
            idc                = -1;
            x                  = "0.29375 * safezoneW + safezoneX";
            y                  = "0.314148 * safezoneH + safezoneY";
            w                  = "0.4125 * safezoneW";
            h                  = "0.396 * safezoneH";
            colorBackground[]  = COLOUR_AREABACKGROUND;
        };
        class HEADER: GW_ctrlStatic {
        	idc                = IDC_DISPLAYVEHICLESHOP_HEADER;
        	text               = "Vehicle Purchases"; // ToDo: Localize;
        	x                  = "0.29375 * safezoneW + safezoneX";
        	y                  = "0.291 * safezoneH + safezoneY";
        	w                  = "0.4125 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_HEADER;
        };
        class TREE_TITLE: GW_ctrlStatic {
        	idc                = -1;
        	text               = "Available Vehicles"; // ToDo: Localize;
        	x                  = "0.295802 * safezoneW + safezoneX";
        	y                  = "0.3174 * safezoneH + safezoneY";
        	w                  = "0.140245 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_CONTENTTITLE;
        };
        class VEHICLE_SELECTED_TITLE: GW_ctrlStatic {
        	idc                = IDC_DISPLAYVEHICLESHOP_SELECTEDVEHICLENAME;
        	text               = ""; // ToDo: Localize;
        	x                  = "0.438635 * safezoneW + safezoneX";
        	y                  = "0.3174 * safezoneH + safezoneY";
        	w                  = "0.265031 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_CONTENTTITLE;
        };
        class TITLE_NAME: GW_ctrlStatic {
            idc                = -1;
            text               = "Name:"; // ToDo: Localize;
            x                  = "0.438542 * safezoneW + safezoneX";
            y                  = "0.500037 * safezoneH + safezoneY";
            w                  = "0.0773833 * safezoneW";
            h                  = SIZE_BLOCK_HEADER2;
            colorBackground[]  = COLOUR_CONTENTBACKGROUND;
            style              = ST_RIGHT;
        };
        class TITLE_PRICE: TITLE_NAME {
            text               = "Price:"; // ToDo: Localize;
            y                  = "0.522726 * safezoneH + safezoneY";
        };
        class TITLE_MAXSPEED: TITLE_NAME {
            text               = "Max Speed:"; // ToDo: Localize;
            y                  = "0.546341 * safezoneH + safezoneY";
        };
        class TITLE_HORSEPOWER: TITLE_NAME {
            text               = "Horse Power:"; // ToDo: Localize;
            y                  = "0.569023 * safezoneH + safezoneY";
        };
        class TITLE_PASSENGERSEATS: TITLE_NAME {
            text               = "Passenger Seats:"; // ToDo: Localize;
            y                  = "0.5924 * safezoneH + safezoneY";
        };
        class TITLE_TRUNKSPACE: TITLE_NAME {
            text               = "Trunk Space:"; // ToDo: Localize;
            y                  = "0.616126 * safezoneH + safezoneY";
        };
        class TITLE_FUEL: TITLE_NAME {
            text               = "Fuel Space:"; // ToDo: Localize;
            y                  = "0.638696 * safezoneH + safezoneY";
        };
        class TITLE_ARMOR: TITLE_NAME {
            text               = "Armor:"; // ToDo: Localize;
            y                  = "0.662422 * safezoneH + safezoneY";
        };
        class TITLE_VEHICLESPECIFICATIONS: TITLE_NAME {
            text               = "Vehicle Specifications"; // ToDo: Localize;
            y                  = "0.476533 * safezoneH + safezoneY";
            w                  = "0.265031 * safezoneW";
            colorBackground[]  = COLOUR_CONTENTTITLE;
            style              = ST_LEFT;
        };
        class TEXT_VEHICLE_LEVEL_REQUIRED_TITLE: GW_ctrlStatic {
        	idc                = -1;
        	text               = "Level Required:";
        	x                  = "0.438542 * safezoneW + safezoneX";
        	y                  = "0.451274 * safezoneH + safezoneY";
        	w                  = "0.0773833 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
    };
    class controls {
        class TREE_VEHICLES: GW_ctrlTree {
        	idc                = IDC_DISPLAYVEHICLESHOP_TREEVEHICLES;
        	y                  = "0.341 * safezoneH + safezoneY";
            x                  = "0.295803 * safezoneW + safezoneX";
        	w                  = "0.140245 * safezoneW";
        	h                  = "0.3652 * safezoneH";
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
        class SELECTED_VEHICLE_ICONPREVIEW: GW_ctrlStructuredText {
        	idc                = IDC_DISPLAYVEHICLESHOP_SELVEHICLEICONPREVIEW;
        	x                  = "0.438542 * safezoneW + safezoneX";
        	y                  = "0.340422 * safezoneH + safezoneY";
        	w                  = "0.265031 * safezoneW";
        	h                  = "0.109074 * safezoneH";
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
        class TEXT_NAME: GW_ctrlStatic {
        	idc                = IDC_DISPLAYVEHICLESHOP_TEXTNAME;
        	text               = "";
        	x                  = "0.516667 * safezoneW + safezoneX";
        	y                  = "0.500385 * safezoneH + safezoneY";
        	w                  = "0.187196 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_INPUT;
        };
        class TEXT_PRICE: TEXT_NAME {
        	idc                = IDC_DISPLAYVEHICLESHOP_TEXTPRICE;
        	text               = "£100.000.00"; // ToDo: Localize;
        	y                  = "0.522725 * safezoneH + safezoneY";
        };
        class TEXT_MAXSPEED: TEXT_NAME {
        	idc                = IDC_DISPLAYVEHICLESHOP_TEXTMAXSPEED;
        	text               = "320 km/h"; // ToDo: Localize;
        	y                  = "0.546333 * safezoneH + safezoneY";
        };
        class TEXT_HORSEPOWER: TEXT_NAME {
        	idc                = IDC_DISPLAYVEHICLESHOP_TEXTHORSEPOWER;
        	text               = "220hp"; // ToDo: Localize;
        	y                  = "0.569482 * safezoneH + safezoneY";
        };
        class TEXT_PASSENGERSEATS: TEXT_NAME {
        	idc                = IDC_DISPLAYVEHICLESHOP_TEXTPASSENGERSEATS;
        	text               = "3"; // ToDo: Localize;
        	y                  = "0.592519 * safezoneH + safezoneY";
        };
        class TEXT_TRUNKSPACE: TEXT_NAME {
        	idc                = IDC_DISPLAYVEHICLESHOP_TEXTTRUNKSPACE;
        	text               = "30"; // ToDo: Localize;
        	y                  = "0.616016 * safezoneH + safezoneY";
        };
        class TEXT_FUEL: TEXT_NAME {
        	idc                = IDC_DISPLAYVEHICLESHOP_TEXTFUEL;
        	text               = "50l"; // ToDo: Localize;
        	y                  = "0.639163 * safezoneH + safezoneY";
        };
        class TEXT_ARMOR: TEXT_NAME {
        	idc                = IDC_DISPLAYVEHICLESHOP_TEXTARMOR;
        	text               = "220"; // ToDo: Localize;
        	y                  = "0.662311 * safezoneH + safezoneY";
        };
        class BUTTON_RENT_VEHICLE: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYVEHICLESHOP_BUTTONRENTVEHICLE;
            text               = "RENT VEHICLE"; // ToDo: Localize;
        	x                  = "0.438645 * safezoneW + safezoneX";
        	y                  = "0.685726 * safezoneH + safezoneY";
        	w                  = "0.110341 * safezoneW";
        	h                  = SIZE_BLOCK_CONTENTBUTTON;
        	colorBackground[]  = COLOUR_CONTENTBUTTON;
        };
        class BUTTON_PURCHASE_VEHICLE: BUTTON_RENT_VEHICLE {
            idc                = IDC_DISPLAYVEHICLESHOP_BUTTONPURCHASEVEHICLE;
        	text               = "PURCHASE VEHICLE";
        	x                  = "0.593295 * safezoneW + safezoneX";
        };
        class VEHICLE_LEVEL_REQUIRED_TEXT: GW_ctrlStatic {
        	idc                = IDC_DISPLAYVEHICLESHOP_TEXTREQUIREDVEHICLELEVEL;
        	text               = "N/A";
        	x                  = "0.516752 * safezoneW + safezoneX";
            y                  = "0.451274 * safezoneH + safezoneY";
        	w                  = "0.187196 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_INPUT;
        };
        class INSURANCE_CHECKBOX: GW_RscCheckbox {
        	idc                = IDC_DISPLAYVEHICLESHOP_CHECKBOXINSURANCE;
        	x                  = "0.581954 * safezoneW + safezoneX";
        	y                  = "0.686111 * safezoneH + safezoneY";
        	w                  = "0.0103125 * safezoneW";
        	h                  = SIZE_BLOCK_CONTENTBUTTON;
        	colorBackground[]  = COLOUR_CONTENTBUTTON;
        	tooltip            = "Mark checkbox to add insurance to your vehicle"; // ToDo: Localize;
        };
    };
};
