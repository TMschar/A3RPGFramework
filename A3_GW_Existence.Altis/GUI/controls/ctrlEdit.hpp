/**
*    Original Credit to Bohemia Interactive Studios and their developers for base classes
*    Enhanced by SimZor, SimZor Studios 2017
*
*    ctrlEdit.hpp
*/

class GW_ctrlEdit: GW_ctrlDefaultText {
	type                   = CT_EDIT;
	style				   = ST_LEFT + ST_FRAME;
	colorBackground[]      = {0, 0, 0, 0.3};
	text                   = "";
	colorText[]            = {1, 1, 1, 1};
	colorDisabled[]        = {1, 1, 1, 0.25};
	colorSelection[]       = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	canModify              = 1;
	autocomplete           = "";
	onCanDestroy           = "";
	onDestroy              = "";
	onSetFocus             = "";
	onKillFocus            = "";
	onKeyDown              = "";
	onKeyUp                = "";
	onMouseButtonDown      = "";
	onMouseButtonUp        = "";
	onMouseButtonClick     = "";
	onMouseButtonDblClick  = "";
	onMouseZChanged        = "";
	onMouseMoving          = "";
	onMouseHolding         = "";
};

class GW_ctrlEditMulti: GW_ctrlEdit {
	style = ST_MULTI;
};

class GW_ctrlEditMultiCode: GW_ctrlEdit {
	style 		 = ST_MULTI + ST_LEFT;
	autocomplete = "scripting";
	font 		 = "EtelkaMonospacePro";
};

class GW_ctrlEditNoRect: GW_ctrlEdit {
	style = ST_LEFT + ST_NO_RECT;
};
