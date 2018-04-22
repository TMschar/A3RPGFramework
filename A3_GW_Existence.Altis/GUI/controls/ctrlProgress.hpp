/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: ctrlProgress.hpp
*/

class GW_ctrlProgress: GW_ctrlDefault {
	type           = CT_PROGRESS;
    colorBar[]     = COLOUR_PROGRESSBAR;
    colorFrame[]   = COLOUR_EMPTY;

	texture        = "#(argb,8,8,3)color(1,1,1,1)";
	onCanDestroy   = "";
	onDestroy      = "";
};
