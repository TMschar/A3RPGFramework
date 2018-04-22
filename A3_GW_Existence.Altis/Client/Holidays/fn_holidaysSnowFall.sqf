#include "script_component.hpp"
/**
 * Filename: fn_holidaysSnowFall.sqf
 */
scriptName "GW_client_fnc_holidaysSnowFall: main";
scopeName "main";

if (!canSuspend) exitWith { ["Cannot suspend", _fnc_scriptName] call GW_ext_fnc_loggingDebugLog; };

for "_i" from 0 to 1 step 0 do {
    private _oSnowParticle = "#particlesource" createVehicleLocal (position player);
    _oSnowParticle setParticleParams [
        ["\A3\Data_F\ParticleEffects\Universal\Universal",16,12,8,1]
        ,"",
        "Billboard",
        1,
        20,
        [0,0,0],
        [0,0,0],
        1,0.000001,
        0,
        1.4,
        [0.1,0.1],
        [[1,1,1,1]],
        [0,1],
        0.2,
        1.2,
        "",
        "",
        vehicle player
    ];

    _oSnowParticle setParticleRandom [0, [30, 30, 20], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
    _oSnowParticle setParticleCircle [0, [0, 0, 0]];
    _oSnowParticle setDropInterval 0.001;

    sleep 30;

    deleteVehicle _oSnowParticle;

    sleep 1;
};