/*
    Copyright (c) 2017 SimZor, SimZor Studios
    All Rights Reserved

    Filename: displayOrganizations.hpp
*/

class GW_DISPLAYORGANIZATIONS: GW_displayStandard {
    idd              = IDD_DISPLAYORGANIZATIONS_DISPLAY;
    scriptName       = "GW_displayOrganizations";
    scriptPath       = "GUI";
    onLoad           = "[_this, 'GW_displayOrganizations'] call GW_client_fnc_initDisplay";
    blockEscape      = 0;
    enableSimulation = true;
    class ControlsBackground {
        //----------------------------------------
        //- TOP CONTROLS
        //----------------------------------------
        class TILES: GW_RscTiles {};
        class BACKGROUND: GW_ctrlStatic {
            idc                 = -1;
            x                   = "0.29375 * safezoneW + safezoneX";
            y                   = "0.248148 * safezoneH + safezoneY";
            w                   = "0.4125 * safezoneW";
            h                   = "0.528 * safezoneH";
            colorBackground[]   = COLOUR_AREABACKGROUND;
        };
        class HEADER: GW_ctrlStatic {
            idc                 = -1;
            text                = "$STR_GW_GUI_DISPLAYS_DISPLAYORGANIZATIONS_TITLE";
            x                   = "0.293751 * safezoneW + safezoneX";
            y                   = "0.225 * safezoneH + safezoneY";
            w                   = "0.4125 * safezoneW";
            h                   = SIZE_BLOCK_HEADER2;
            colorBackground[]   = COLOUR_HEADER;
        };

        //----------------------------------------
        //- SUBTITLES
        //----------------------------------------
        class TREE_ORGS_TITLE: GW_ctrlStatic {
            idc                 = -1;
            text                = "$STR_GW_GUI_DISPLAYS_DISPLAYORGANIZATIONS";
            x                   = "0.296354 * safezoneW + safezoneX";
            y                   = "0.251852 * safezoneH + safezoneY";
            w                   = "0.165 * safezoneW";
            h                   = SIZE_BLOCK_HEADER2;
            colorBackground[]   = COLOUR_CONTENTTITLE;
        };
        class ORG_SELECTED_INFO: TREE_ORGS_TITLE {
            text                = "Organization Information";
            x                   = "0.464573 * safezoneW + safezoneX";
            y                   = "0.251852 * safezoneH + safezoneY";
            w                   = "0.239232 * safezoneW";
        };
        class SELMEMBER_TITLE: TREE_ORGS_TITLE {
            text                = "Selected Member";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.465763 * safezoneH + safezoneY";
            w                   = "0.239232 * safezoneW";
        };
        class FOUNDORG_TITLE: TREE_ORGS_TITLE {
            text                = "Start an organization";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.586489 * safezoneH + safezoneY";
            w                   = "0.239232 * safezoneW";
        };

        //----------------------------------------
        //- TITLES
        //----------------------------------------
        class ORG_SELECTED_NAME_TITLE: GW_ctrlStatic {
            idc                 = -1;
            text                = "Name:";
            x                   = "0.464573 * safezoneW + safezoneX";
            y                   = "0.275 * safezoneH + safezoneY";
            w                   = "0.0691184 * safezoneW";
            h                   = SIZE_BLOCK_HEADER2;
            colorBackground[]   = COLOUR_CONTENTBACKGROUND;
            style               = ST_RIGHT;
        };
        class ORG_CREATED_DATE_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "Created:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.298148 * safezoneH + safezoneY";
        };
        class ORG_LASTACTIVE_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "Last seen:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.321296 * safezoneH + safezoneY";
        };
        class ORG_LEVEL_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "Level:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.344444 * safezoneH + safezoneY";
        };
        class ORG_BANK_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "Bank:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.367593 * safezoneH + safezoneY";
        };
        class ORG_OWNER_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "Owner:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.390741 * safezoneH + safezoneY";
        };
        class SELMEMBER_NAME_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "Name:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.489141 * safezoneH + safezoneY";
        };
        class SELMEMBER_RANK_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "Rank:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.512289 * safezoneH + safezoneY";
        };
        class SELMEMBER_ONLINE_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "Status:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.535437 * safezoneH + safezoneY";
        };
        class FOUNDORG_NAME_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "Name:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.609637 * safezoneH + safezoneY";
        };
        class NEWORG_TAG_TITLE: ORG_SELECTED_NAME_TITLE {
            text                = "Tag:";
            x                   = "0.464583 * safezoneW + safezoneX";
            y                   = "0.632785 * safezoneH + safezoneY";
        };
        class ORG_INVITE_PLAYER: ORG_SELECTED_NAME_TITLE {
        	text               = "Invite Player:";
        	x                  = "0.464583 * safezoneW + safezoneX";
        	y                  = "0.413889 * safezoneH + safezoneY";
        };
    };
    class Controls {
        class TREE_ORGS: GW_ctrlTree {
        	idc                = IDC_DISPLAYORGANIZATIONS_TREEORGS;
        	x                  = "0.296354 * safezoneW + safezoneX";
        	y                  = "0.275 * safezoneH + safezoneY";
        	w                  = "0.165 * safezoneW";
        	h                  = "0.4972 * safezoneH";
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
        class BUTTON_CLOSE: GW_ctrlButtonCancel {
            idc                = IDC_DISPLAYORGANIZATIONS_BUTTONCLOSE;
        	x                  = "0.692843 * safezoneW + safezoneX";
        	y                  = "0.225 * safezoneH + safezoneY";
        	w                  = "0.0134063 * safezoneW";
        };

        //----------------------------------------
        //- ORGANIZATION SELECTED INFO
        //----------------------------------------
        class ORG_SELECTED_NAME: GW_ctrlStatic {
        	idc                = IDC_DISPLAYORGANIZATIONS_ORGSELECTEDNAME;
        	text               = "N/A"; // ToDo: Localize;
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.275 * safezoneH + safezoneY";
        	w                  = "0.169133 * safezoneW";
        	h                  = "0.022 * safezoneH";
        	colorBackground[]  = COLOUR_INPUT;
        };
        class ORG_CREATED_DATE: ORG_SELECTED_NAME {
        	idc                = IDC_DISPLAYORGANIZATIONS_ORGSELECTEDDATE;
        	text               = "N/A"; // ToDo: Localize;
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.298148 * safezoneH + safezoneY";
        };
        class ORG_LASTACTIVE: ORG_SELECTED_NAME {
        	idc                = IDC_DISPLAYORGANIZATIONS_ORGSELECTEDLASTACTIVE;
        	text               = "N/A"; // ToDo: Localize;
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.321296 * safezoneH + safezoneY";
        };
        class ORG_LEVEL: ORG_SELECTED_NAME {
        	idc                = IDC_DISPLAYORGANIZATIONS_ORGSELECTELEVEL;
        	text               = "N/A"; // ToDo: Localize;
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.344444 * safezoneH + safezoneY";
        };
        class ORG_BANK: ORG_SELECTED_NAME {
        	idc                = IDC_DISPLAYORGANIZATIONS_ORGSELECTEDBANK;
        	text               = "N/A"; // ToDo: Localize;
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.367593 * safezoneH + safezoneY";
        };
        class ORG_OWNER: ORG_SELECTED_NAME {
        	idc                = IDC_DISPLAYORGANIZATIONS_ORGSELECTEDOWNER;
        	text               = "N/A"; // ToDo: Localize;
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.390741 * safezoneH + safezoneY";
        };

        //----------------------------------------
        //- ORGANIZATION SELECTED INFO
        //----------------------------------------
        class SELMEMBER_NAME: ORG_SELECTED_NAME {
        	idc                = IDC_DISPLAYORGANIZATIONS_MEMBERSELNAME;
        	text               = "N/A"; // ToDo: Localize;
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.489141 * safezoneH + safezoneY";
        };
        class SELMEMBER_RANK: ORG_SELECTED_NAME {
        	idc                = IDC_DISPLAYORGANIZATIONS_MEMBERSELRANK;
        	text               = "N/A"; // ToDo: Localize;
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.512289 * safezoneH + safezoneY";
        };
        class SELMEMBER_ONLINE: ORG_SELECTED_NAME {
        	idc                = IDC_DISPLAYORGANIZATIONS_MEMBERSELONLINESTATUS;
        	text               = "N/A";
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.535437 * safezoneH + safezoneY";
        };

        //----------------------------------------
        //- START ORGANIZATION
        //----------------------------------------
        class STARTORG_NAMEINPUT: GW_ctrlEdit {
        	idc                = IDC_DISPLAYORGANIZATIONS_STARTORGNAMEINPUT;
            toolTip            = "Enter a name in which your organization will be called. Character limit is 27 characters.";
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.609637 * safezoneH + safezoneY";
        	w                  = "0.169133 * safezoneW";
        	h                  = "0.022 * safezoneH";
        	colorBackground[]  = COLOUR_INPUT;
        };
        class STARTORG_TAG: STARTORG_NAMEINPUT {
        	idc                = IDC_DISPLAYORGANIZATIONS_STARTORGTAGINPUT;
            toolTip            = "Enter a tag of choice you want your organization to have. This will automatically be put upon your player tags etc. Character limit is 5 characters.";
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.632785 * safezoneH + safezoneY";
        };

        //----------------------------------------
        //- PLAYER INVITES
        //----------------------------------------
        class LIST_PLAYERS_COMBO: GW_ctrlCombo {
        	idc                = IDC_DISPLAYORGANIZATIONS_LISTINVITEPLAYERS;
        	x                  = "0.534375 * safezoneW + safezoneX";
        	y                  = "0.413889 * safezoneH + safezoneY";
        	w                  = "0.152612 * safezoneW";
        	h                  = "0.022 * safezoneH";
        	colorBackground[]  = COLOUR_INPUT;
        };

        //----------------------------------------
        //- BUTTONS
        //----------------------------------------
        class BUTTON_INVITE_PLAYERS: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYORGANIZATIONS_BUTTONINVITEPLAYERS;
            text               = "OK";
        	x                  = "0.6875 * safezoneW + safezoneX";
        	y                  = "0.413889 * safezoneH + safezoneY";
        	w                  = "0.01586 * safezoneW";
        	h                  = "0.022 * safezoneH";
        };
        class BUTTON_LEAVEORG: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYORGANIZATIONS_BUTTONLEAVEORG;
            text               = "LEAVE ORGANIZATION"; // ToDo: Localize;
            x                  = "0.464583 * safezoneW + safezoneX";
            y                  = "0.437037 * safezoneH + safezoneY";
            w                  = "0.1195145 * safezoneW";
            h                  = "0.0198 * safezoneH";
        };
        class BUTTON_DISBANDORG: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYORGANIZATIONS_BUTTONDISBANDORG;
        	text               = "DISBAND ORGANIZATION"; // ToDo: Localize;
            x                  = "0.584000 * safezoneW + safezoneX";
        	y                  = "0.437037 * safezoneH + safezoneY";
        	w                  = "0.1195145 * safezoneW";
        	h                  = "0.0198 * safezoneH";
        };
        class BUTTON_STARTORG: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYORGANIZATIONS_BUTTONSTARTORG;
        	text               = "START ORGANIZATION"; // ToDo: Localize;
        	x                  = "0.464583 * safezoneW + safezoneX";
        	y                  = "0.655556 * safezoneH + safezoneY";
        	w                  = "0.239029 * safezoneW";
        	h                  = "0.0198 * safezoneH";
        };
        class BUTTON_SELMEMBER_KICK: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYORGANIZATIONS_BUTTONKICKMEMBER;
            text               = "KICK"; // ToDo: Localize;
            x                  = "0.464062 * safezoneW + safezoneX";
            y                  = "0.55823 * safezoneH + safezoneY";
            w                  = "0.0797499 * safezoneW";
            h                  = "0.0198 * safezoneH";
        };
        class BUTTON_SELMEMBER_PROMOTE: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYORGANIZATIONS_BUTTONPROMOTEMEMBER;
            text               = "PROMOTE"; // ToDo: Localize;
            x                  = "0.544228 * safezoneW + safezoneX";
            y                  = "0.55823 * safezoneH + safezoneY";
            w                  = "0.0797499 * safezoneW";
            h                  = "0.0198 * safezoneH";
        };
        class BUTTON_SELMEMBER_DEMOTE: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYORGANIZATIONS_BUTTONDEMOTEMEMBER;
            text               = "DEMOTE"; // ToDo: Localize;
            x                  = "0.624394 * safezoneW + safezoneX";
            y                  = "0.55823 * safezoneH + safezoneY";
            w                  = "0.07875 * safezoneW";
            h                  = "0.0198 * safezoneH";
        };
    };
};
