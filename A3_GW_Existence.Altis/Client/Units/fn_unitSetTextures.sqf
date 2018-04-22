#include "script_component.hpp"
/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: fn_unitSetTextures.sqf
*
*    Parameter(s):
*        0: OBJECT - Unit to set textures for
*
*    Description:
*        Set object textures on objects
*/
scriptName "GW_client_fnc_unitSetTextures: main";
scopeName "main";

if !params [["_unit", objNull, [objNull]]] exitWith {
    ["Param error", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog
};

private _uniform = uniform player;
switch (side _unit) do {
    case west: {
        // Hide Backpack
        if (backpack _unit isEqualTo "B_Bergen_mcamo_F") then {
            backpackContainer _unit setObjectTextureGlobal [0, ""]
        };

        private _texturePath = switch _uniform do {
            // Combat Uniform
            case "U_I_CombatUniform";
            case "U_I_CombatUniform_shortsleeve": {"Textures\police\uniforms\CombatUniform.paa"};

            // Patrol Uniform
            case "U_B_CombatUniform_mcam";
            case "U_B_CombatUniform_mcam_vest";
            case "U_B_CombatUniform_mcam_tshirt": {"Textures\police\uniforms\PatrolUniform.paa"};

            default {""}
        };

        if (_texturePath isEqualTo "") exitWith {};

        // Set texture to unit
        _unit setObjectTextureGlobal [0, _texturePath]
    };
    case independent: {};
    case east: {};
    case civilian: {
        // if (_uniform == "U_I_CombatUniform") then {
        //     _texturePath = "Textures\Civilians\christmasJumper1.paa";
        //     _unit setObjectTextureGlobal [0, _texturePath];
        // } else {
        //     if (_uniform == "U_I_CombatUniform_shortsleeve") then {
        //         _texturePath = "Textures\Civilians\christmasJumper2.paa";
        //         _unit setObjectTextureGlobal [0, _texturePath];
        //     };
        // };
    };
};
