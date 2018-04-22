/**
*    Original Credit to Bohemia Interactive Studios and their developers for base classes
*    Enhanced by SimZor, SimZor Studios 2017
*
*    RscControls.hpp
*/

class GW_ScrollBar {
	color[] 			= {1, 1, 1, 0.6};
	colorActive[] 		= {1, 1, 1, 1};
	colorDisabled[] 	= {1, 1, 1, 0.3};
	thumb 				= "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
	arrowEmpty 			= "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	arrowFull 			= "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	border 				= "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	shadow 				= 0;
	scrollSpeed 		= 0.06;
	width 				= 0;
	height 				= 0;
	autoScrollEnabled 	= 0;
	autoScrollSpeed 	= -1;
	autoScrollDelay 	= 5;
	autoScrollRewind 	= 0;
};

class GW_RscFrame {
	type = 0;
	idc = -1;
	deletable = 0;
	style = 64;
	shadow = 2;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = "RobotoCondensed";
	sizeEx = 0.02;
	text = "";
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.3;
};

class GW_RscText {
	x 					= 0;
	y 					= 0;
	h 					= 0.037;
	w 					= 0.30000001;
	style 				= 0;
	type 				= 0;
	shadow 				= 0;
    text 				= "";
	colorShadow[] 		= {0, 0, 0, 0.5};
	font 				= "PuristaMedium";
	SizeEx 				= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] 		= {1, 1, 1, 1};
	colorBackground[] 	= {0, 0, 0, 0};
	linespacing 		= 1;
	tooltipColorText[] 	= {1, 1, 1, 1};
	tooltipColorBox[] 	= {1, 1, 1, 1};
	tooltipColorShade[] = {0, 0, 0, 0.64999998};
};

class GW_RscPicture {
	shadow 					= 0;
	colorText[] 			= {1, 1, 1, 1};
	colorBackground[] 		= {-1, -1, -1, -1};
	style 					= 48;
	x 						= 0;
	y 						= 0;
	w 						= 0.2;
	h 						= 0.15000001;
	type 					= 0;
	tooltipColorText[] 		= {1, 1, 1, 1};
	tooltipColorBox[] 		= {1, 1, 1, 1};
	tooltipColorShade[] 	= {0, 0, 0, 0.64999998};
	font 					= "PuristaMedium";
	sizeEx 					= -1;
};
class GW_RscPictureKeepAspect: GW_RscPicture {
	style = "0x30 + 0x800";
};

class GW_RscProgress {
	type 				= 8;
	style 				= 0;
	x 					= 0.344;
	y 					= 0.619;
	w 					= 0.313726;
	h 					= 0.0261438;
	texture				= "";
	shadow 				= 0;
	colorFrame[] 		= {0, 0, 0, 1};
	colorBackground[] 	= {0, 0, 0, 0.7};
	colorBar[] 			= {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
};

class GW_RscShortcutButton {
	idc					= -1;
	style				= 0;
	default 			= 0;
	shadow				= 0;
	w					= 0.183825;
	h					= "((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	color[] 			= {1, 1, 1, 1};
	colorFocused[]		= {1, 1, 1, 1};
	color2[]			= {0.94999999, 0.94999999, 0.94999999, 1};
	colorDisabled[]     = {1, 1, 1, 0.25};
	colorBackground[] = {
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		1
	};
	colorBackgroundFocused[] = {
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		1
	};
	textureNoShortcut               = "";
	colorBackground2[]				= {1, 1, 1, 1};
	textSecondary					= "";
	colorSecondary[]				= {1, 1, 1, 1};
	colorFocusedSecondary[]			= {1, 1, 1, 1};
	color2Secondary[]				= {0.94999999, 0.94999999, 0.94999999, 1};
	colorDisabledSecondary[]		= {1, 1, 1, 0.25};
	sizeExSecondary					= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	fontSecondary					= "PuristaLight";
	animTextureDefault				= "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureNormal				= "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureDisabled				= "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureOver					= "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
	animTextureFocused				= "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
	animTexturePressed				= "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
	periodFocus						= 1.2;
	periodOver						= 0.80000001;
	class HitZone {
		left   = 0;
		top    = 0;
		right  = 0;
		bottom = 0;
	};
	class ShortcutPos {
		left = 0;
		top  = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		w    = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		h    = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class TextPos {
		left   = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		top    = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right  = 0.0049999999;
		bottom = 0;
	};
	period = 0.40000001;
	font   = "PuristaLight";
	size   = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text   = "";
	url    = "";
	soundEnter[] = {
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.090000004,
		1
	};
	soundPush[] = {
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.090000004,
		1
	};
	soundClick[] = {
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.090000004,
		1
	};
	soundEscape[] = {
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.090000004,
		1
	};
	action="";
	class Attributes {
		font   = "PuristaLight";
		color  = "#E5E5E5";
		align  = "left";
		shadow = "true";
	};
	class AttributesImage {
		font  = "PuristaLight";
		color = "#E5E5E5";
		align = "left";
	};
};
class GW_RscButtonMenu: GW_RscShortcutButton {
	idc						= -1;
	type					= 16;
	style					= "0x02 + 0xC0";
	default					= 0;
	shadow					= 0;
	x						= 0;
	y						= 0;
	w						= 0.095588997;
	h						= 0.039216001;
	animTextureNormal		= "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled		= "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver			= "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused		= "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed		= "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault		= "#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[]		= {0,0,0,0.80000001};
	colorBackgroundFocused[]= {1,1,1,1};
	colorBackground2[]		= {0.75,0.75,0.75,1};
	color[]					= {1,1,1,1};
	colorFocused[]			= {0,0,0,1};
	color2[]				= {0,0,0,1};
	colorText[]				= {1,1,1,1};
	colorDisabled[]			= {1,1,1,0.25};
	textSecondary			= "";
	colorSecondary[]		= {1,1,1,1};
	colorFocusedSecondary[]	= {0,0,0,1};
	color2Secondary[]		= {0,0,0,1};
	colorDisabledSecondary[]= {1,1,1,0.25};
	sizeExSecondary			= "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	fontSecondary			= "PuristaLight";
	period					= 1.2;
	periodFocus				= 1.2;
	periodOver				= 1.2;
	size					= "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx					= "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	tooltipColorText[]		= {1,1,1,1};
	tooltipColorBox[]		= {1,1,1,1};
	tooltipColorShade[]		= {0,0,0,0.64999998};
	class TextPos {
		left	= "0.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		top		= "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right	= 0.0049999999;
		bottom	= 0;
	};
	class Attributes {
		font	 = "PuristaLight";
		color    = "#E5E5E5";
		align    = "left";
		shadow   = "false";
	};
	class ShortcutPos {
		left	= "5.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		top		= 0;
		w		= "1 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		h		= "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	};
	soundEnter[] = {
		"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",
		0.090000004,
		1
	};
	soundPush[] = {
		"\A3\ui_f\data\sound\RscButtonMenu\soundPush",
		0.090000004,
		1
	};
	soundClick[] = {
		"\A3\ui_f\data\sound\RscButtonMenu\soundClick",
		0.090000004,
		1
	};
	soundEscape[] = {
		"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",
		0.090000004,
		1
	};
};

class GW_RscCombo {
	style 						= "0x10 + 0x200";
	font 						= "PuristaLight";
	sizeEx 						= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow 						= 0;
	type						= 4;
	maxHistoryDelay 			= 0.5;
	x 							= 0;
	y 							= 0;
	w 							= 0.12;
	h 							= 0.035;
	colorSelect[] 				= {0, 0, 0, 1};
	colorText[] 				= {1, 1, 1, 1};
	colorBackground[] 			= {0, 0, 0, 1};
	colorSelectBackground[] 	= {1, 1, 1, 0.69999999};
	colorScrollbar[] 			= {1, 0, 0, 1};
	arrowEmpty 					= "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull 					= "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	wholeHeight 				= 0.44999999;
	colorActive[] 				= {1, 0, 0, 1};
	colorDisabled[] 			= {1, 1, 1, 0.25};
	colorPicture[] 				= {1, 1, 1, 1};
	colorPictureSelected[] 		= {1, 1, 1, 1};
	colorPictureDisabled[] 		= {1, 1, 1, 0.25};
	colorPictureRight[] 		= {1, 1, 1, 1};
	colorPictureRightSelected[] = {1, 1, 1, 1};
	colorPictureRightDisabled[] = {1, 1, 1, 0.25};
	colorTextRight[] 			= {1, 1, 1, 1};
	colorSelectRight[] 			= {0, 0, 0, 1};
	colorSelect2Right[] 		= {0, 0, 0, 1};
	tooltipColorText[] 			= {1, 1, 1, 1};
	tooltipColorBox[] 			= {1, 1, 1, 1};
	tooltipColorShade[] 		= {0, 0, 0, 0.64999998};
	soundSelect[] =	{
		"\A3\ui_f\data\sound\RscCombo\soundSelect",
		0.1,
		1
	};
	soundExpand[] = {
		"\A3\ui_f\data\sound\RscCombo\soundExpand",
		0.1,
		1
	};
	soundCollapse[] = {
		"\A3\ui_f\data\sound\RscCombo\soundCollapse",
		0.1,
		1
	};
	class ComboScrollBar: GW_ScrollBar {
		color[] = {1,1,1,1};
	};
};

class GW_RscListBox {
	x 								= 0;
	y 								= 0;
	w 								= 0.30000001;
	h 								= 0.30000001;
	style 							= 16;
	type							= 5;
	rowHeight 						= 0.04;
	font 							= "PuristaLight";
	sizeEx 							= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow 							= 0;
	colorShadow[] 					= {0, 0, 0, 0.5};
	colorText[] 					= {1, 1, 1, 1};
	colorDisabled[] 				= {1, 1, 1, 0.25};
	colorScrollbar[] 				= {1, 0, 0, 0};
	colorSelect[] 					= {0, 0, 0, 1};
	colorSelect2[] 					= {0, 0, 0, 1};
	colorSelectBackground[]			= {0.94999999, 0.94999999, 0.94999999, 1};
	colorSelectBackground2[]		= {1, 1, 1, 0.5};
	period							= 1.2;
	colorBackground[]				= {0, 0, 0, 0.30000001};
	maxHistoryDelay					= 1;
	colorPicture[]					= {1, 1, 1, 1};
	colorPictureSelected[]			= {1, 1, 1, 1};
	colorPictureDisabled[]			= {1, 1, 1, 0.25};
	colorPictureRight[]				= {1, 1, 1, 1};
	colorPictureRightSelected[]     = {1, 1, 1, 1};
	colorPictureRightDisabled[]     = {1, 1, 1, 0.25};
	colorTextRight[]				= {1, 1, 1, 1};
	colorSelectRight[]				= {0, 0, 0, 1};
	colorSelect2Right[]				= {0, 0, 0, 1};
	tooltipColorText[]				= {1, 1, 1, 1};
	tooltipColorBox[]				= {1, 1, 1, 1};
	tooltipColorShade[]				= {0, 0, 0, 0.64999998};
	soundSelect[] =	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.090000004,
		1
	};
	class ListScrollBar: GW_ScrollBar {
		color[]			  = {1,1,1,1};
		autoScrollEnabled = 1;
	};
};

class GW_RscStructuredText {
	x 			= 0;
	y		 	= 0;
	h 			= 0.035;
	w 			= 0.1;
	type 		= 13;
	style 		= 0;
	text 		= "";
	size 		= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[]	= {1,1,1,1};
	shadow		= 0;
	class Attributes {
		font		= "RobotoCondensed";
		color		= "#ffffff";
		colorLink	= "#D09B43";
		align 		= "left";
		shadow		= 0;
	};
};

class GW_RscControlsGroup {
	type 	= 15;
	idc 	= -1;
	x 		= 0;
	y 		= 0;
	w 		= 1;
	h 		= 1;
	shadow 	= 0;
	style 	= 16;
	class GW_VScrollbar: GW_ScrollBar {
		width 			  = 0.021;
		autoScrollEnabled = 1;
	};
	class GW_HScrollbar: GW_ScrollBar {
		height = 0.028;
	};
	class Controls {};
};

class GW_RscControlsGroupNoScrollbars: GW_RscControlsGroup {
	class VScrollbar: GW_VScrollbar {
		width = 0;
	};
	class HScrollbar: GW_HScrollbar {
		height = 0;
	};
};

class GW_RscControlsGroupNoHScrollbars: GW_RscControlsGroup {
	class HScrollbar: GW_HScrollbar {
		height = 0;
	};
};

class GW_RscControlsGroupNoVScrollbars: GW_RscControlsGroup {
	class VScrollbar: GW_VScrollbar {
		width = 0;
	};
};

class GW_RscEdit {
	access 				= 0;
    type 				= CT_EDIT;
    style 				= ST_LEFT + ST_FRAME + ST_NO_RECT;
    x 					= 0;
    y 					= 0;
    h 					= 0.04;
    w 					= 0.2;
    colorBackground[] 	= {0, 0, 0, 0};
    colorText[] 		= {1, 1, 1, 1};
    colorSelection[] 	= {1, 1, 1, 0.25};
	colorDisabled[]		= {0, 0, 0, 0};
    font 				= "PuristaLight";
    sizeEx 				= 0.04;
    autocomplete 		= "";
    text 				= "";
    size 				= 0;
    shadow 				= 0;
};

class GW_RscTree {
	type 						= CT_TREE;
	style 						= ST_LEFT;
	text						= "";
	font 						= FONT_ALT_NORMAL;
	sizeEx 						= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) - 0.005";
	expandedTexture 			= "A3\ui_f\data\gui\rsccommon\rsctree\expandedTexture_ca.paa";
	hiddenTexture 				= "A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa";
	maxHistoryDelay 			= 0;
	x 							= 0;
	y 							= 0;
	w 							= 0.1;
	h 							= 0.2;
	rowHeight 					= 0.0439091;
	colorMarkedSelected[] 		= {1, 0.5, 0, 1};
	colorMarkedText[] 			= {1, 1, 1, 1};
	colorMarked[] 				= {1, 0.5, 0, 0.5};
	colorArrow[] 				= {0, 0, 0, 0};
	colorText[] 				= {1, 1, 1, 1.0};
	colorSearch[] 				= {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
	colorSelect[] 				= {1, 1, 1, 0.7};
	colorSelectText[] 			= {0, 0, 0, 1};
	colorBackground[] 			= {0, 0, 0, 0};
	colorSelectBackground[] 	= {0, 0, 0, 0.5};
	colorBorder[] 				= {0, 0, 0, 0};
	colorDisabled[] 			= {1, 1, 1, 0.25};
	colorLines[] 				= {0, 0, 0, 0};
	borderSize 					= 0;
	expandOnDoubleclick 		= 1;
	colorPicture[] 				= {1, 1, 1, 1};
	colorPictureSelected[] 		= {0, 0, 0, 1};
	colorPictureDisabled[] 		= {1, 1, 1, 0.25};
	colorPictureRight[] 		= {1, 1, 1, 1};
	colorPictureRightSelected[] = {0, 0, 0, 1};
	colorPictureRightDisabled[] = {1, 1, 1, 0.25};
	class ScrollBar: GW_ScrollBar {};
};

class GW_RscTiles: GW_RscControlsGroupNoScrollbars {
	idc                 = 115099;
	x                   = "safezoneX";
	y                   = "safezoneY";
	w                   = "safezoneW";
	h                   = "safezoneH";
	disableCustomColors = 1;
	onLoad              = "[ctrlParent (_this select 0), 'GW_displayPause'] call (uiNamespace getVariable 'BIS_fnc_guiEffectTiles')";
	class Controls {
		class TileFrame: GW_RscFrame {
			idc             = 114999;
			x               = 0;
			y               = 0;
			w               = "safezoneW";
			h               = "safezoneH";
			colortext[]     = {0, 0, 0, 1};
		};
		class Tile_0_0: GW_RscText {
			idc                 = 115000;
			x                   = "(0 * 1/6) * safezoneW";
			y                   = "(0 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_0_1: GW_RscText {
			idc                 = 115001;
			x                   = "(0 * 1/6) * safezoneW";
			y                   = "(1 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_0_2: GW_RscText {
			idc                 = 115002;
			x                   = "(0 * 1/6) * safezoneW";
			y                   = "(2 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_0_3: GW_RscText {
			idc                 = 115003;
			x                   = "(0 * 1/6) * safezoneW";
			y                   = "(3 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_0_4: GW_RscText {
			idc                 = 115004;
			x                   = "(0 * 1/6) * safezoneW";
			y                   = "(4 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_0_5: GW_RscText {
			idc                 = 115005;
			x                   = "(0 * 1/6) * safezoneW";
			y                   = "(5 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_1_0: GW_RscText {
			idc                 = 115010;
			x                   = "(1 * 1/6) * safezoneW";
			y                   = "(0 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_1_1: GW_RscText {
			idc                 = 115011;
			x                   = "(1 * 1/6) * safezoneW";
			y                   = "(1 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_1_2: GW_RscText {
			idc                 = 115012;
			x                   = "(1 * 1/6) * safezoneW";
			y                   = "(2 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_1_3: GW_RscText {
			idc                 = 115013;
			x                   = "(1 * 1/6) * safezoneW";
			y                   = "(3 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_1_4: GW_RscText {
			idc                 = 115014;
			x                   = "(1 * 1/6) * safezoneW";
			y                   = "(4 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_1_5: GW_RscText {
			idc                 = 115015;
			x                   = "(1 * 1/6) * safezoneW";
			y                   = "(5 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_2_0: GW_RscText {
			idc                 = 115020;
			x                   = "(2 * 1/6) * safezoneW";
			y                   = "(0 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_2_1: GW_RscText {
			idc                 = 115021;
			x                   = "(2 * 1/6) * safezoneW";
			y                   = "(1 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_2_2: GW_RscText {
			idc                 = 115022;
			x                   = "(2 * 1/6) * safezoneW";
			y                   = "(2 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_2_3: GW_RscText {
				idc                 = 115023;
			x                   = "(2 * 1/6) * safezoneW";
			y                   = "(3 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_2_4: GW_RscText {
			idc                 = 115024;
			x                   = "(2 * 1/6) * safezoneW";
			y                   = "(4 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_2_5: GW_RscText {
			idc                 = 115025;
			x                   = "(2 * 1/6) * safezoneW";
			y                   = "(5 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_3_0: GW_RscText {
			idc                 = 115030;
			x                   = "(3 * 1/6) * safezoneW";
			y                   = "(0 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_3_1: GW_RscText {
			idc                 = 115031;
			x                   = "(3 * 1/6) * safezoneW";
			y                   = "(1 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_3_2: GW_RscText {
			idc                 = 115032;
			x                   = "(3 * 1/6) * safezoneW";
			y                   = "(2 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_3_3: GW_RscText {
			idc                 = 115033;
			x                   = "(3 * 1/6) * safezoneW";
			y                   = "(3 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_3_4: GW_RscText {
			idc                 = 115034;
			x                   = "(3 * 1/6) * safezoneW";
			y                   = "(4 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_3_5: GW_RscText {
			idc                 = 115035;
			x                   = "(3 * 1/6) * safezoneW";
			y                   = "(5 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_4_0: GW_RscText {
			idc                 = 115040;
			x                   = "(4 * 1/6) * safezoneW";
			y                   = "(0 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_4_1: GW_RscText {
			idc                 = 115041;
			x                   = "(4 * 1/6) * safezoneW";
			y                   = "(1 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0,0,0.1};
		};
		class Tile_4_2: GW_RscText {
			idc                 = 115042;
			x                   = "(4 * 1/6) * safezoneW";
			y                   = "(2 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_4_3: GW_RscText {
			idc                 = 115043;
			x                   = "(4 * 1/6) * safezoneW";
			y                   = "(3 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_4_4: GW_RscText {
			idc                 = 115044;
			x                   = "(4 * 1/6) * safezoneW";
			y                   = "(4 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_4_5: GW_RscText {
			idc                 = 115045;
			x                   = "(4 * 1/6) * safezoneW";
			y                   = "(5 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_5_0: GW_RscText {
			idc                = 115050;
			x                  = "(5 * 1/6) * safezoneW";
			y                  = "(0 * 1/6) * safezoneH";
			w                  = "1/6 * safezoneW";
			h                  = "1/6 * safezoneH";
			colorBackground[]  = {0, 0, 0, 0.1};
		};
		class Tile_5_1: GW_RscText {
			idc                = 115051;
			x                  = "(5 * 1/6) * safezoneW";
			y                  = "(1 * 1/6) * safezoneH";
			w                  = "1/6 * safezoneW";
			h                  = "1/6 * safezoneH";
			colorBackground[]  = {0, 0, 0, 0.1};
		};
		class Tile_5_2: GW_RscText {
			idc                = 115052;
			x                  = "(5 * 1/6) * safezoneW";
			y                  = "(2 * 1/6) * safezoneH";
			w                  = "1/6 * safezoneW";
			h                  = "1/6 * safezoneH";
			colorBackground[]  = {0, 0, 0, 0.1};
		};
		class Tile_5_3: GW_RscText {
			idc                    = 115053;
			x                      = "(5 * 1/6) * safezoneW";
			y                      = "(3 * 1/6) * safezoneH";
			w                      = "1/6 * safezoneW";
			h                      = "1/6 * safezoneH";
			colorBackground[]      = {0, 0, 0, 0.1};
		};
		class Tile_5_4: GW_RscText {
			idc                = 115054;
			x                  = "(5 * 1/6) * safezoneW";
			y                  = "(4 * 1/6) * safezoneH";
			w                  = "1/6 * safezoneW";
			h                  = "1/6 * safezoneH";
			colorBackground[]  = {0, 0, 0, 0.1};
		};
		class Tile_5_5: GW_RscText {
			idc                 = 115055;
			x                   = "(5 * 1/6) * safezoneW";
			y                   = "(5 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
	};
};

class GW_RscCheckBox {
	idc 							= -1;
	type 							= CT_CHECKBOX;
	deletable 						= 0;
	style 							= 0;
	checked 						= 1;
	x 								= "0.375 * safezoneW + safezoneX";
	y 								= "0.36 * safezoneH + safezoneY";
	w 								= "0.025 * safezoneW";
	h 								= "0.04 * safezoneH";
	color[] 						= {1, 1, 1, 0.7};
	colorFocused[] 					= {1, 1, 1, 1};
	colorHover[] 					= {1, 1, 1, 1};
	colorPressed[] 					= {1, 1, 1, 1};
	colorDisabled[] 				= {1, 1, 1, 0.2};
	colorBackground[] 				= {0, 0, 0, 0};
	colorBackgroundFocused[] 		= {0, 0, 0, 0};
	colorBackgroundHover[] 			= {0, 0, 0, 0};
	colorBackgroundPressed[] 		= {0, 0, 0, 0};
	colorBackgroundDisabled[] 		= {0, 0, 0, 0};
	textureChecked 					= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureUnchecked				= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureFocusedChecked 			= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureFocusedUnchecked 		= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureHoverChecked 			= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureHoverUnchecked 			= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	texturePressedChecked 			= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	texturePressedUnchecked 		= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureDisabledChecked 			= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureDisabledUnchecked		= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	tooltipColorText[] 				= {1, 1, 1, 1};
	tooltipColorBox[] 				= {1, 1, 1, 1};
	tooltipColorShade[] 			= {0, 0, 0, 0.65};
	soundEnter[] 					= {"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush", 0.09, 1};
	soundPush[] 					= {"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush", 0.09, 1};
	soundClick[] 					= {"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush", 0.09, 1};
	soundEscape[] 					= {"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush", 0.09, 1};
};

class GW_RscMapControl {
    access 							= 0;
    type 							= 101;
    idc 							= 51;
    style 							= 48;
    colorBackground[] 				= {0.969, 0.957, 0.949, 1};
    colorOutside[] 					= {0, 0, 0, 1};
    colorText[] 					= {0, 0, 0, 1};
    font 							= "PuristaLight";
    sizeEx 							= 0.04;
    colorSea[] 						= {0.467, 0.631, 0.851, 0.5};
    colorForest[] 					= {0.624, 0.78, 0.388, 0.5};
    colorRocks[]					= {0, 0, 0, 0.3};
    colorCountlines[] 				= {0.572, 0.354, 0.188, 0.25};
    colorMainCountlines[] 			= {0.572, 0.354, 0.188, 0.5};
    colorCountlinesWater[] 			= {0.491, 0.577, 0.702,0.3};
    colorMainCountlinesWater[] 		= {0.491, 0.577, 0.702, 0.6};
    colorForestBorder[] 			= {0, 0, 0, 0};
    colorRocksBorder[] 				= {0, 0, 0, 0};
    colorPowerLines[] 				= {0.1, 0.1, 0.1, 1};
    colorRailWay[] 					= {0.8, 0.2, 0, 1};
    colorNames[] 					= {0.1, 0.1, 0.1, 0.9};
    colorInactive[] 				= {1, 1, 1, 0.5};
    colorLevels[] 					= {0.286, 0.177, 0.094, 0.5};
    colorTracks[] 					= {0.84, 0.76, 0.65, 0.15};
    colorRoads[] 					= {0.7, 0.7, 0.7, 1};
    colorMainRoads[] 				= {0.9, 0.5, 0.3, 1};
    colorTracksFill[]				= {0.84, 0.76, 0.65, 1};
    colorRoadsFill[] 				= {1, 1, 1, 1};
    colorMainRoadsFill[] 			= {1, 0.6, 0.4, 1};
    colorGrid[] 					= COLOUR_CONTENTBACKGROUND;
    colorGridMap[]					= COLOUR_CONTENTBACKGROUND;
    stickX[] 						= {0.2, {"Gamma", 1, 1.5}};
    stickY[] 						= {0.2, {"Gamma", 1, 1.5}};
	moveOnEdges 					= 0;
    x 								= "SafeZoneXAbs";
    y 								= "SafeZoneY + 1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    w 								= "SafeZoneWAbs";
    h 								= "SafeZoneH - 1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    shadow 							= 0;
    ptsPerSquareSea 				= 5;
    ptsPerSquareTxt 				= 3;
    ptsPerSquareCLn 				= 10;
    ptsPerSquareExp 				= 10;
    ptsPerSquareCost 				= 10;
    ptsPerSquareFor 				= 9;
    ptsPerSquareForEdge 			= 9;
    ptsPerSquareRoad 				= 6;
    ptsPerSquareObj 				= 9;
    showCountourInterval 			= 0;
    scaleMin 						= 0.001;
    scaleMax 						= 1;
    scaleDefault 					= 0.16;
    maxSatelliteAlpha 				= 0.85;
    alphaFadeStartScale 			= 0.35;
    alphaFadeEndScale 				= 0.4;
    fontLabel 						= "PuristaMedium";
    sizeExLabel 					= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    fontGrid 						= "TahomaB";
    sizeExGrid 						= 0.02;
    fontUnits 						= "TahomaB";
    sizeExUnits 					= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    fontNames 						= "PuristaMedium";
    sizeExNames 					= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
    fontInfo 						= "PuristaMedium";
    sizeExInfo 						= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    fontLevel 						= "TahomaB";
    sizeExLevel 					= 0.02;
    text 							= "#(argb,8,8,3)color(1,1,1,1)";
    class Legend {
        colorBackground[] 	= {1, 1, 1,0 .5};
        color[] 			= {0, 0, 0, 1};
        x 					= "SafeZoneX + (((safezoneW / safezoneH) min 1.2) / 40)";
        y 					= "SafeZoneY + safezoneH - 4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        w 					= "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
        h 					= "3.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        font 				= "PuristaMedium";
        sizeEx 				= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    };
    class ActiveMarker {
        color[] 			= {0.3, 0.1, 0.9, 1};
        size 				= 50;
    };
    class Command {
        color[] 			= {1, 1, 1, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
        size 				= 18;
        importance			= 1;
        coefMin 			= 1;
        coefMax 			= 1;
    };
    class Task {
        colorCreated[] 		= {1, 1, 1, 1};
        colorCanceled[] 	= {0.7, 0.7, 0.7, 1};
        colorDone[] 		= {0.7, 1, 0.3, 1};
        colorFailed[] 		= {1, 0.3, 0.2, 1};
        color[] 			= {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
        icon 				= "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
        iconCreated 		= "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
        iconCanceled 		= "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
        iconDone 			= "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
        iconFailed			= "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
        size 				= 27;
        importance 			= 1;
        coefMin 			= 1;
        coefMax 			= 1;
    };
    class CustomMark {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 1;
        coefMax 			= 1;
    };
    class Tree {
        color[] 			= {0.45, 0.64, 0.33, 0.4};
        icon 				= "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size 				= 12;
        importance 			= "0.9 * 16 * 0.05";
        coefMin 			= 0.25;
        coefMax 			= 4;
    };
    class SmallTree {
        color[] 			= {0.45, 0.64, 0.33, 0.4};
        icon 				= "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size 				= 12;
        importance 			= "0.6 * 12 * 0.05";
        coefMin 			= 0.25;
        coefMax 			= 4;
    };
    class Bush {
        color[] 			= {0.45, 0.64, 0.33, 0.4};
        icon 				= "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size 				= "14/2";
        importance 			= "0.2 * 14 * 0.05 * 0.05";
        coefMin				= 0.25;
        coefMax 			= 4;
    };
    class Church {
        color[] 			= {1, 1, 1, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
    };
    class Chapel {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
    };
    class Cross {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin				= 0.85;
        coefMax 			= 1;
    };
    class Rock {
        color[] 			= {0.1, 0.1, 0.1, 0.8};
        icon 				= "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
        size 				= 12;
        importance 			= "0.5 * 12 * 0.05";
        coefMin 			= 0.25;
        coefMax 			= 4;
    };
    class Bunker {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        size 				= 14;
        importance 			= "1.5 * 14 * 0.05";
        coefMin 			= 0.25;
        coefMax 			= 4;
    };
    class Fortress {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        size 				= 16;
        importance 			= "2 * 16 * 0.05";
        coefMin 			= 0.25;
        coefMax 			= 4;
    };
    class Fountain {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
        size 				= 11;
        importance 			= "1 * 12 * 0.05";
        coefMin 			= 0.25;
        coefMax 			= 4;
    };
    class ViewTower {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
        size 				= 16;
        importance 			= "2.5 * 16 * 0.05";
        coefMin 			= 0.5;
        coefMax 			= 4;
    };
    class Lighthouse {
        color[] 			= {1, 1, 1, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
    };
    class Quay {
        color[] 			= {1, 1, 1, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
    };
    class Fuelstation {
        color[] 			= {1, 1, 1, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
        size				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
    };
    class Hospital {
        color[] 			= {1, 1, 1, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
    };
    class BusStop {
        color[] 			= {1, 1, 1, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
    };
    class Transmitter {
        color[] 			= {1, 1, 1, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
    };
    class Stack {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
        size 				= 20;
        importance 			= "2 * 16 * 0.05";
        coefMin				= 0.9;
        coefMax 			= 4;
    };
    class Ruin {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
        size 				= 16;
        importance 			= "1.2 * 16 * 0.05";
        coefMin 			= 1;
        coefMax 			= 4;
    };
    class Tourism {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
        size 				= 16;
        importance 			= "1 * 16 * 0.05";
        coefMin 			= 0.7;
        coefMax 			= 4;
    };
    class Watertower {
        color[] 			= {1, 1, 1, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
    };
    class Waypoint {
        color[] 			= {0, 0, 0, 1};
        size 				= 24;
        importance 			= 1;
        coefMin 			= 1;
        coefMax 			= 1;
        icon 				= "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
    };
    class WaypointCompleted {
        color[] 			= {0, 0, 0, 1};
        size 				= 24;
        importance 			= 1;
        coefMin 			= 1;
        coefMax 			= 1;
        icon 				= "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
    };
    class Power {
        icon 				= "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
        color[] 			= {1, 1, 1, 1};
    };
    class Powersolar {
        icon 				= "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
        color[] 			= {1, 1, 1, 1};
    };
    class Powerwave {
        icon 				= "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
        color[] 			= {1, 1, 1, 1};
    };
    class Powerwind {
        icon 				= "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
        color[] 			= {1, 1, 1, 1};
    };
    class Shipwreck {
        icon 				= "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
        color[]				= {1, 1, 1, 1};
    };
    class LineMarker {
        lineDistanceMin  	 = 3e-005;
        lineLengthMin 		 = 5;
        lineWidthThick 		 = 0.014;
        lineWidthThin 		 = 0.008;
        textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
    };
};

class GW_RscBackground: GW_RscText {
	idc                = -1;
	x                  = "safezoneW + safezoneX";
	y                  = "safezoneH + safezoneY";
	w                  = "safezoneW";
	h                  = "safezoneH";
	colorBackground[]  = COLOUR_MAINBACKGROUND;
};

class GW_RscSlider {
	x 				   = 0;
	y 				   = 0;
	w 				   = 0.3;
	h 				   = 0.025;
	color[] 	  	   = {1, 1, 1, 0.8};
	colorActive[] 	   = {1, 1, 1, 1};
};
class GW_RscXSliderH {
	style 				= SL_HORZ;
    type 				= CT_XSLIDER;
	shadow 				= 0;
	x 					= 0;
	y 					= 0;
	h 					= 0.029412;
	w 					= 0.4;
	color[] 			= {1, 1, 1, 0.6};
	colorActive[] 		= {1, 1, 1, 1};
	colorDisabled[]		= {1, 1, 1, 0.2};
	arrowEmpty 			= "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
	arrowFull 			= "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
	border 				= "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
	thumb 				= "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
	tooltipColorText[] 	= {1, 1, 1, 1};
	tooltipColorBox[] 	= {1, 1, 1, 1};
	tooltipColorShade[] = {0, 0, 0, 0.65};
};

class GW_RscDefault {
	access 				= 0;
	idc 				= -1;
	style 				= 0;
	default 			= 0;
	show 				= 1;
	fade 				= 0;
	blinkingPeriod 		= 0;
	deletable 			= 0;
	x 					= 0;
	y 					= 0;
	w 					= 0;
	h 					= 0;
	tooltip 			= "";
	tooltipMaxWidth 	= 0.5;
	tooltipColorShade[] = {0, 0, 0, 1};
	tooltipColorText[] 	= {1, 1, 1, 1};
	tooltipColorBox[] 	= {0, 0, 0, 0};
	class ScrollBar {
		width 			= 0;
		height 			= 0;
		scrollSpeed 	= 0.06;
		arrowEmpty 		= "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
		arrowFull 		= "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
		border 			= "\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
		thumb 			= "\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
		color[] 		= {1, 1, 1, 1};
	};
};
class GW_RscDefaultButton: GW_RscDefault {
	soundClick[] 		= {"\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
	soundEnter[] 		= {"\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1};
	soundPush[] 		= {"\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1};
	soundEscape[] 		= {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1};
	sizeEx 				= "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	font 				= "PuristaLight";
	shadow 				= 0;
};
class GW_RscButton: GW_RscDefaultButton {
	type 						= 1;
	style 						= "0x02 + 0xC0";
	colorBackground[] 			= {0, 0, 0, 1};
	colorBackgroundDisabled[] 	= {0, 0, 0, 0.5};
	colorBackgroundActive[] 	= {0.3, 0.3, 0.3, 0.5};//{"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	colorFocused[] 				= {0.3, 0.3, 0.3, 0.5};//{"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	font 						= "PuristaLight";
	text 						= "";
	colorText[] 				= {1, 1, 1, 1};
	colorDisabled[] 			= {1, 1, 1, 0.25};
	borderSize 					= 0;
	colorBorder[] 				= {0, 0, 0, 0};
	colorShadow[] 				= {0, 0, 0, 0};
	offsetX 					= 0;
	offsetY 					= 0;
	offsetPressedX 				= "pixelW";
	offsetPressedY 				= "pixelH";
	period 						= 0;
	periodFocus 				= 2;
	periodOver 					= 0.5;
	class KeyHints {
		class A {
			key 				= "0x00050000 + 0";
			hint				= "KEY_XBOX_A";
		};
	};
	onCanDestroy 				= "";
	onDestroy 					= "";
	onMouseEnter 				= "";
	onMouseExit 				= "";
	onSetFocus 					= "";
	onKillFocus					= "";
	onKeyDown 					= "";
	onKeyUp 					= "";
	onMouseButtonDown 			= "";
	onMouseButtonUp 			= "";
	onMouseButtonClick 			= "";
	onMouseButtonDblClick 		= "";
	onMouseZChanged 			= "";
	onMouseMoving 				= "";
	onMouseHolding				= "";
	onButtonClick 				= "";
	onButtonDown 				= "";
	onButtonUp 					= "";
};
class GW_RscButtonPictureKeepAspect: GW_RscButton {
	style 						= "0x02 + 0x30 + 0x800";
};
class GW_RscButtonToolbar: GW_RscButtonPictureKeepAspect {
	colorBackground[] 			= {0, 0, 0, 0};
	colorBackgroundDisabled[] 	= {0, 0, 0, 0};
};
