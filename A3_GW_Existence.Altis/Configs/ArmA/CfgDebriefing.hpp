/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: CfgDebriefing.hpp
*/

class CfgDebriefing {
    class GW_End {
		title = "DISCONNECTED TO LOBBY";
		subtitle = "Thank you for visiting Ground Wars: Existence.";
		description = "You are very welcome back at any point in time. We are grateful for you stopping by and playing! We certainly hope you enjoyed yourself. Your player data has been synced. Do not forget to check out our forums at https://forums.simzorstudios.com, ground-wars.com or simzorstudios.com.";
		pictureBackground = "\a3\ui_f\data\gui\cfg\Debriefing\debriefingBackground_co.paa";
		picture = "\a3\ui_f\data\gui\cfg\Hints\ActionMenu_ca.paa";
		pictureColor[] = {1, 1, 1, 1};
	};
    class GW_AccessDenied {
        title = "ACCESS DENIED";
        subtitle = "You do not have access to this slot.";
        description = "If this is a whitelisted slot, either IHAS or NATO, you can apply for whitelisting on our forums at https://forums.simzorstudios.com. Good luck!";
        pictureBackground = "\a3\ui_f\data\gui\cfg\Debriefing\debriefingBackground_co.paa";
        picture = "\a3\ui_f\data\gui\cfg\Debriefing\endDefault_ca.paa";
        pictureColor[] = {1, 1, 1, 1};
    };
    class GW_DataError {
        title = "DATA ERROR";
        subtitle = "Some or all of your data may be corrupted.";
        description = "If you received this error, please report it to a member of staff immediately on https://simzorstudios.com and they can resolve the issue with your support. We apologise for any inconvenience this may have caused you.";
        pictureBackground = "\a3\ui_f\data\gui\cfg\Debriefing\debriefingBackground_co.paa";
        picture = "\a3\ui_f\data\gui\cfg\Debriefing\endDefault_ca.paa";
        pictureColor[] = {1, 1, 1, 1};
    };
};
