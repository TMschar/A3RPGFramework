/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: displayDeveloperConsole.hpp
*/

class GW_DISPLAYDEVELOPERCONSOLE: GW_displayStandard {
    idd        = IDD_DISPLAYDEVELOPERCONSOLE_DISPLAY;
    scriptName = "GW_displayDeveloperConsole";
    scriptPath = "GUI";
    onLoad     = "[_this, 'GW_displayDeveloperConsole'] call GW_client_fnc_initDisplay";
    class controlsBackground {
        class HEADER: GW_ctrlStaticHeaderMoving {
            text                = "Developer Console";
            x                   = "0.29375 * safezoneW + safezoneX";
            y                   = "0.225 * safezoneH + safezoneY";
            w                   = "0.412424 * safezoneW";
        };
        class BACKGROUND: GW_ctrlStaticBackground {
            x                   = "0.293751 * safezoneW + safezoneX";
            y                   = "0.243526 * safezoneH + safezoneY";
            w                   = "0.4125 * safezoneW";
            h                   = "0.505652 * safezoneH";
        };
        class FOOTER: GW_ctrlStaticFooter {
            x                   = "0.29375 * safezoneW + safezoneX";
            y                   = "0.748615 * safezoneH + safezoneY";
            w                   = "0.4125 * safezoneW";
        };
        class EXECUTE_TITLE: GW_ctrlStatic {
            text                = "EXECUTE:";
            x                   = "0.492782 * safezoneW + safezoneX";
            y                   = "0.535548 * safezoneH + safezoneY";
            w                   = "0.0525936 * safezoneW";
            h                   = "5 * (pixelH * pixelGrid * 0.50)";
            colorBackground[]   = {0, 0, 0, 0.5};
        };
        class WATCH_TITLE: EXECUTE_TITLE {
            text                = "WATCH:"; // ToDo: Localize;
            x                   = "0.492782 * safezoneW + safezoneX";
            y                   = "0.614622 * safezoneH + safezoneY";
            w                   = "0.0525937 * safezoneW";
        };
        class TOOLS_TITLE: EXECUTE_TITLE {
            text                = "TOOLS:"; // ToDo: Localize;
            x                   = "0.602068 * safezoneW + safezoneX";
            y                   = "0.535548 * safezoneH + safezoneY";
            w                   = "0.0402188 * safezoneW";
        };
        class TITLE_ACTIVESCRIPTS: EXECUTE_TITLE {
            text                = "ACTIVE SCRIPTS:"; // ToDo: Localize;
            x                   = "0.295813 * safezoneW + safezoneX";
            y                   = "0.615104 * safezoneH + safezoneY";
            w                   = "0.0670308 * safezoneW";
        };
        class TITLE_ACTIVESQFSCRIPTS: EXECUTE_TITLE {
            text                = "ACTIVE SQF SCTS:"; // ToDo: Localize;
            x                   = "0.295833 * safezoneW + safezoneX";
            y                   = "0.63426 * safezoneH + safezoneY";
            w                   = "0.0670308 * safezoneW";
        };
        class TITLE_ACTIVESQSSCRIPTS: EXECUTE_TITLE {
            text                = "ACTIVE SQS SCTS:"; // ToDo: Localize;
            x                   = "0.295833 * safezoneW + safezoneX";
            y                   = "0.653704 * safezoneH + safezoneY";
            w                   = "0.0670308 * safezoneW";
        };
        class TITLE_ACTIVEFSMS: EXECUTE_TITLE {
            text                = "ACTIVE FSM'S:"; // ToDo: Localize;
            x                   = "0.295833 * safezoneW + safezoneX";
            y                   = "0.673148 * safezoneH + safezoneY";
            w                   = "0.0670308 * safezoneW";
        };
        class TITLE_CURRENTBUILD: EXECUTE_TITLE {
            text                = "CURRENT BUILD:"; // ToDo: Localize;
            x                   = "0.295833 * safezoneW + safezoneX";
            y                   = "0.694563 * safezoneH + safezoneY";
            w                   = "0.0670308 * safezoneW";
        };
        class TITLE_SCRIPTMONITORS: EXECUTE_TITLE {
            text                = "SCRIPT MONITORS:"; // ToDo: Localize;
            x                   = "0.295833 * safezoneW + safezoneX";
            y                   = "0.713778 * safezoneH + safezoneY";
            w                   = "0.0670308 * safezoneW";
        };
    };
    class controls {
        class INPUT: GW_ctrlEditMultiCode {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_INPUT;
        	x                  = "0.295813 * safezoneW + safezoneX";
        	y                  = "0.247 * safezoneH + safezoneY";
        	w                  = "0.194695 * safezoneW";
        	h                  = "0.345919 * safezoneH";
        };
        class INPUT_RETURN: GW_ctrlStaticContent {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_INPUTRETURN;
	        x                  = "0.295812 * safezoneW + safezoneX";
        	y                  = "0.59372 * safezoneH + safezoneY";
        	w                  = "0.194892 * safezoneW";
        	h                  = "0.0185185 * safezoneH";
        };
        class BUTTON_CLOSE: GW_ctrlButtonCancel {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_BUTTONCLOSE;
        	x                  = "0.692844 * safezoneW + safezoneX";
        	y                  = "0.225 * safezoneH + safezoneY";
        	w                  = "0.013406 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class EXECUTE_CHECKBOX: GW_ctrlCheckbox {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_EXECBUTTONS_CHECKBOX;
            tooltip            = "$STR_GW_GUI_DISPLAYS_DISPLAYDEVELOPERCONSOLE_SAFETYCHECKBOXTOOLTIP";
            x                  = "0.531591 * safezoneW + safezoneX";
            y                  = "0.534726 * safezoneH + safezoneY";
            w                  = "5 * (pixelW * pixelGrid * 0.50)";
            h                  = "5 * (pixelH * pixelGrid * 0.50)";
            checked 		   = 0;
        };
        class EXECUTE_LOCAL: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_EXECBUTTONS_BUTTONLOCAL;
        	text               = "LOCAL"; // ToDo: Localize;
        	x                  = "0.546406 * safezoneW + safezoneX";
        	y                  = "0.5352 * safezoneH + safezoneY";
        	w                  = "0.0376562 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class EXECUTE_GLOBAL: EXECUTE_LOCAL {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_EXECBUTTONS_BUTTONGLOBAL;
        	text               = "GLOBAL"; // ToDo: Localize;
        	x                  = "0.546406 * safezoneW + safezoneX";
        	y                  = "0.555 * safezoneH + safezoneY";
        	w                  = "0.0496982 * safezoneW";
        };
        class EXECUTE_SERVER: EXECUTE_LOCAL {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_EXECBUTTONS_BUTTONSERVER;
        	text               = "SERVER"; // ToDo: Localize;
        	x                  = "0.546402 * safezoneW + safezoneX";
        	y                  = "0.573874 * safezoneH + safezoneY";
        	w                  = "0.0496982 * safezoneW";
        };
        class EXECUTE_SELPLAYER: EXECUTE_LOCAL {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_EXECBUTTONS_BUTTONSELPLAYER;
            text               = "PLAYER"; // ToDo: Localize;
            x                  = "0.546402 * safezoneW + safezoneX";
            y                  = "0.593793 * safezoneH + safezoneY";
            w                  = "0.0496982 * safezoneW";
        };
        class EXECUTE_LOCAL_PERFORMANCE: GW_ctrlButton {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_EXECBUTTONS_BUTTONLOCALPERFORMANCE;
            text               = "\a3\ui_f\data\GUI\RscCommon\RscDebugConsole\performance_ca.paa";
            style 		       = "0x02 + 0x30 + 0x800";
            x                  = "0.585104 * safezoneW + safezoneX";
            y                  = "0.534852 * safezoneH + safezoneY";
            w                  = "0.010823 * safezoneW";
            h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class TREE_PLAYERS: GW_ctrlTree {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_PLAYERS_LISTBOX;
            idcSearch          = IDC_DISPLAYDEVELOPERCONSOLE_PLAYERS_SEARCH;
        	x                  = "0.492782 * safezoneW + safezoneX";
        	y                  = "0.267726 * safezoneH + safezoneY";
        	w                  = "0.102936 * safezoneW";
        	h                  = "0.264519 * safezoneH";
        	colorBackground[]  = {0, 0, 0, 0.5};
        };
        class TREE_PLAYERS_SEARCH: GW_ctrlEdit {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_PLAYERS_SEARCH;
        	x                  = "0.492782 * safezoneW + safezoneX";
        	y                  = "0.247 * safezoneH + safezoneY";
        	w                  = "0.0680624 * safezoneW";
        	h                  = "0.0185185 * safezoneH";
        	colorBackground[]  = {0, 0, 0, 0.3};
        };
        class TREE_PLAYERS_BUTTONSEARCH: GW_ctrlButtonSearch {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_TREEPLAYERSBUTTONSEARCH;
        	x                  = "0.562011 * safezoneW + safezoneX";
        	y                  = "0.246874 * safezoneH + safezoneY";
        };
        class PLAYERS_TREE_COLLAPSEALL: GW_ctrlButtonCollapseAll {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_TREEPLAYERSCOLLAPSEALL;
        	x                  = "0.584172 * safezoneW + safezoneX";
        	y                  = "0.246874 * safezoneH + safezoneY";
        };
        class TREE_PLAYERS_EXPANDALL: GW_ctrlButtonExpandAll {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_TREEPLAYERSEXPANDALL;
        	x                  = "0.575414 * safezoneW + safezoneX";
        	y                  = "0.246874 * safezoneH + safezoneY";
        };
        class TREE_SCRIPTS: GW_ctrlTree {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_TREESCRIPTS;
        	x                  = "0.600963 * safezoneW + safezoneX";
        	y                  = "0.267593 * safezoneH + safezoneY";
        	w                  = "0.102936 * safezoneW";
        	h                  = "0.242519 * safezoneH";
            colorBackground[]  = {0, 0, 0, 0.5};
        };
        class TREE_SCRIPTS_BUTTONSEARCH: GW_ctrlButtonSearch {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_TREESCRIPTSBUTTONSEARCH;
            x                  = "0.671297 * safezoneW + safezoneX";
            y                  = "0.246874 * safezoneH + safezoneY";
        };
        class TREE_SCRIPTS_EXPANDALL: GW_ctrlButtonExpandAll {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_TREESCRIPTSBUTTONEXPANDALL;
            x                  = "0.6847 * safezoneW + safezoneX";
            y                  = "0.246874 * safezoneH + safezoneY";
        };
        class TREE_SCRIPTS_COLLAPSEALL: GW_ctrlButtonCollapseAll {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_TREESCRIPTSBUTTONCOLLAPSEALL;
            x                  = "0.693458 * safezoneW + safezoneX";
            y                  = "0.246874 * safezoneH + safezoneY";
        };
        class SCRIPTS_SAVESCRIPT_INPUT: GW_ctrlEdit {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_TREESCRIPTSEDITSAVESCRIPT;
        	x                  = "0.602068 * safezoneW + safezoneX";
        	y                  = "0.247 * safezoneH + safezoneY";
        	w                  = "0.0680624 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class BUTTON_BUILDCOMMIT: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_BUTTONBUILDCOMMIT;
        	text               = "TRACK BUILD"; // ToDo: Localize;
        	x                  = "0.636648 * safezoneW + safezoneX";
        	y                  = "0.753 * safezoneH + safezoneY";
        	w                  = "0.0677501 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        	colorBackground[]  = {0, 0.44, 0.84, 1};
        };
        class CODE_INPUT_NAME: GW_ctrlEdit {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_CODEINPUTNAME;
        	x                  = "0.602094 * safezoneW + safezoneX";
        	y                  = "0.5132 * safezoneH + safezoneY";
        	w                  = "0.078375 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class CODE_BUTTON_LOAD: GW_ctrlButtonToolbar {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_CODEBUTTONLOAD;
        	text               = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\open_ca.paa";
        	x                  = "0.680988 * safezoneW + safezoneX";
        	y                  = "0.512274 * safezoneH + safezoneY";
        	w                  = "5 * (pixelH * pixelGrid * 0.50)";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class CODE_BUTTON_SAVE: CODE_BUTTON_LOAD {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_CODEBUTTONSAVE;
        	text               = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\save_ca.paa";
        	x                  = "0.691811 * safezoneW + safezoneX";
        	y                  = "0.512274 * safezoneH + safezoneY";
        };
        class TOOLS_BUTTON_CONFIG: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_BUTTONTOOLSCONFIG;
        	text               = "CONFIGS"; // ToDo: Localize;
        	x                  = "0.643229 * safezoneW + safezoneX";
        	y                  = "0.535185 * safezoneH + safezoneY";
        	w                  = "0.0610415 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class TOOLS_BUTTON_ANIMATIONS: TOOLS_BUTTON_CONFIG {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_BUTTONTOOLSANIMATIONS;
        	text               = "ANIMATIONS"; // ToDo: Localize;
        	y                  = "0.55463 * safezoneH + safezoneY";
        };
        class TOOLS_BUTTON_FNCVIEWER: TOOLS_BUTTON_CONFIG {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_BUTTONTOOLSFNCVIEWER;
        	text               = "FUNCTIONS"; // ToDo: Localize;
        	y                  = "0.574074 * safezoneH + safezoneY";
        };
        class TOOLS_BUTTON_SPLENDIDCAM: TOOLS_BUTTON_CONFIG {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_TOOLSBUTTONSPLENDID;
        	text               = "SPLENDID CAM"; // ToDo: Localize;
        	y                  = "0.593519 * safezoneH + safezoneY";
        };
        class BUTTON_FOOTER_BUGREPORT: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_BUTTONBUGREPORT;
        	text               = "BUG REPORT"; // ToDo: Localize;
        	x                  = "0.567025 * safezoneW + safezoneX";
        	y                  = "0.753 * safezoneH + safezoneY";
        	w                  = "0.0677501 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        	colorBackground[]  = {0.92, 0.01, 0, 1};
        };
        class WATCH_1_EXPRESSION: GW_ctrlEdit {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_WATCHFIELDS_INPUTFIELD1;
        	x                  = "0.546406 * safezoneW + safezoneX";
        	y                  = "0.6144 * safezoneH + safezoneY";
        	w                  = "0.157767 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class WATCH_2_EXPRESSION: WATCH_1_EXPRESSION {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_WATCHFIELDS_INPUTFIELD2;
            y                  = "0.654 * safezoneH + safezoneY";
        };
        class WATCH_3_EXPRESSION: WATCH_1_EXPRESSION {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_WATCHFIELDS_INPUTFIELD3;
            y                  = "0.692593 * safezoneH + safezoneY";
        };
        class WATCH_1_RETURN: GW_ctrlEdit {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_WATCHFIELDS_OUTPUTFIELD1;
        	x                  = "0.546402 * safezoneW + safezoneX";
        	y                  = "0.633689 * safezoneH + safezoneY";
        	w                  = "0.157767 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
            style              = ST_RIGHT + ST_NO_RECT;
            colorBackground[]  = {0, 0, 0, 0.5};
        };
        class WATCH_2_RETURN: WATCH_1_RETURN {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_WATCHFIELDS_OUTPUTFIELD2;
        	y                  = "0.673148 * safezoneH + safezoneY";
        };
        class WATCH_3_RETURN: WATCH_1_RETURN {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_WATCHFIELDS_OUTPUTFIELD3;
        	y                  = "0.711111 * safezoneH + safezoneY";
        };
        class TEXT_ACTIVESQSSCRIPTS: GW_ctrlStatic {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_ACTIVESQSSCRIPTS;
        	text               = "24"; // ToDo: Localize;
        	x                  = "0.363542 * safezoneW + safezoneX";
        	y                  = "0.654052 * safezoneH + safezoneY";
        	w                  = "0.126837 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        	colorBackground[]  = {0, 0, 0, 0.3};
        };
        class TEXT_ACTIVESQFSCRIPTS: TEXT_ACTIVESQSSCRIPTS {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_ACTIVESQFSCRIPTS;
        	y                  = "0.634252 * safezoneH + safezoneY";
        };
        class TEXT_ACTIVESCRIPTS: TEXT_ACTIVESQSSCRIPTS {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_ACTIVESCRIPTS;
        	y                  = "0.614452 * safezoneH + safezoneY";
        };
        class TEXT_ACTIVEFSMS: TEXT_ACTIVESQSSCRIPTS {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_ACTIVEFSMS;
        	y                  = "0.673496 * safezoneH + safezoneY";
        };
        class TEXT_CURRENTBUILD: TEXT_ACTIVESQSSCRIPTS {
        	idc                = IDC_DISPLAYDEVELOPERCONSOLE_CURRENTBUILD;
        	y                  = "0.694904 * safezoneH + safezoneY";
        };
        class BUTTON_SCRIPTMONITOR_CLIENT: GW_ctrlDefaultButton {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_BUTTONSMCLIENT;
        	text               = "CLIENT"; // ToDo: Localize;
        	x                  = "0.363685 * safezoneW + safezoneX";
        	y                  = "0.713548 * safezoneH + safezoneY";
        	w                  = "0.0419687 * safezoneW";
        	h                  = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class BUTTON_SCRIPTMONITOR_SELPLAYER: BUTTON_SCRIPTMONITOR_CLIENT {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_BUTTONSMSELCLIENT;
        	text               = "PLAYER"; // ToDo: Localize;
        	x                  = "0.40625 * safezoneW + safezoneX";
        };
        class BUTTON_SCRIPTMONITOR_SERVER: BUTTON_SCRIPTMONITOR_CLIENT {
            idc                = IDC_DISPLAYDEVELOPERCONSOLE_BUTTONSMSERVER;
        	text               = "SERVER"; // ToDo: Localize;
        	x                  = "0.448438 * safezoneW + safezoneX";
        };
    };
};
