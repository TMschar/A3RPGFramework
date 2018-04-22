#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_playersSetupNametags.sqf
 *
 * Parameter(s):
 *     0: BOOLEAN - Set Group ID or not
 *
 * Description:
 *     Sets up a player with nametags
 */
scriptName "GW_client_fnc_playersSetupNametags: main";
scopeName "main";

params [["_setGroupID", false, [false]]];

private _nametagProperties = switch (playerSide) do {
    case west: {
        private _rankIcon = [
            "",
            "\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa",
            "\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa",
            "\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa",
            "\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa",
            "\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa",
            "\a3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa",
            "\a3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa",
            "\a3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa",
            "\a3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa",
            "\a3\ui_f\data\gui\cfg\Ranks\captain_gs.paa",
            "\a3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa",
            "\a3\ui_f\data\gui\cfg\Ranks\general_gs.paa",
            "\a3\ui_f\data\gui\cfg\Ranks\general_gs.paa"
        ] select call GW_player_sideRank;

        private _rankName = ["", "RCT", "PVT", "PFC", "L/CPL", "CPL", "SGT", "S/SGT", "S/LIEUT", "LIEUT", "CPT", "COL", "L/GEN", "GEN"] select call GW_Player_SideRank;
        private _name = "Royal Military Police";

        [_name, _rankIcon, format ["#%1 [MP] %3. %2", call GW_Player_ID, name player, _rankName], _name];
    };
    case independent: {
        private _rankName = ["ASP", "MI", "DR", "S/DR", "MP", "CMO", "D/MO"] select call GW_Player_SideRank;
        private _name = "International Health and Assistance Service";

        [_name, "textures\ihas\icons\logo.paa", format ["#%1 [IHAS] %3. %2", call GW_Player_ID, name player, _rankName], _name];
    };
    case east: {};
    case civilian: {
        private _rank = [player] call GW_client_fnc_organizationsGetRank;
        private _rankName = [_rank] call GW_client_fnc_organizationsRank;
        private _tag = group player getVariable ["organization_tag", ""];
        private _name = group player getVariable ["organizationName", ""];

        [_name, "", format ["#%1 %3 %4 %2", call GW_Player_ID, name player, _rankName, _tag], _name]
    };
    default {[]};
};

_nametagProperties params [
    ["_groupID", "", [""]],
    ["_rankIcon", "", [""]],
    ["_name", "", [""]],
    ["_subtitle", "", [""]]
];

if _setGroupID then {
    group player setGroupID [_groupID];
};

player setVariable ["nametags_title", _name, true];
player setVariable ["nametags_icon", _rankIcon, true];
player setVariable ["nametags_subtitle", _subtitle, true];
player setVariable ["nametags_title_colour", [side group player, false] call BIS_fnc_sideColor, true];
player setVariable ["nametags_subtitle_colour", [1, 1, 1, 1], true];
