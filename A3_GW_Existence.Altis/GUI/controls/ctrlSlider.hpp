/**
*    Original Credit to Bohemia Interactive Studios and their developers for base classes
*    Enhanced by SimZor, SimZor Studios 2017
*
*    ctrlListbox.hpp
*/

class GW_ctrlSliderV: GW_ctrlDefault {
	type = 3;
	style = 0;
	color[] = {0,0,0,1};
	colorDisabled[] = {1,1,1,0.25};
	colorActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	sliderRange[] = {0,1};
	sliderPosition = 1;
	lineSize = 0.1;
	pageSize = 3;
	class Title {
		idc = -1;
		colorBase[] = {1,1,1,1};
		colorActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	};
	class Value {
		idc = -1;
		format = "%.f";
		type = "SPTPlain";
		colorBase[] = {1,1,1,1};
		colorActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	};
	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onSliderPosChanged = "";
};

class GW_ctrlSliderH: GW_ctrlSliderV {
	style = 1024;
};

class GW_ctrlXSliderV: GW_ctrlDefault {
	type = 43;
	style = 0;
	color[] = {1,1,1,0.6};
	colorActive[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	sliderRange[] = {0,1};
	sliderPosition = 1;
	lineSize = 0.1;
	arrowEmpty = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowEmpty_ca.paa";
	arrowFull = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowFull_ca.paa";
	border = "\a3\3DEN\Data\Controls\CtrlXSlider\border_ca.paa";
	thumb = "\a3\3DEN\Data\Controls\CtrlXSlider\thumb_ca.paa";
	class Title
	{
		idc = -1;
		colorBase[] = {1,1,1,1};
		colorActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	};
	class Value
	{
		idc = -1;
		format = "%.f";
		type = "SPTPlain";
		colorBase[] = {1,1,1,1};
		colorActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	};
	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onSliderPosChanged = "";
};

class GW_ctrlXSliderH: GW_ctrlXSliderV {
	style = 1024;
};
