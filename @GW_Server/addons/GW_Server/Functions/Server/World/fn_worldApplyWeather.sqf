#include "script_component.hpp"
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_worldApplyWeather.sqf
 *
 * Description:
 *     Apply weather with dynamic values
 */
#define CONFIG_RANDOMWEATHER (configFile >> "GW_CfgWorld" >> "Weather" >> "RandomWeatherConfiguration")
#define GET_RANDOM_VALUE(entry) ([] call compile ((getNumber (CONFIG_RANDOMWEATHER >> entry)) toFixed 1));

scriptName "GW_server_fnc_worldApplyWeather: main";
scopeName "main";

private _overcast = GET_RANDOM_VALUE("randomOvercast");
private _rain = GET_RANDOM_VALUE("randomRain");
private _wind = GET_RANDOM_VALUE("randomWind");
private _lightning = GET_RANDOM_VALUE("randomLightning");
private _fog = GET_RANDOM_VALUE("randomFog");
private _fogDecay = GET_RANDOM_VALUE("randomDecay");
private _fogBase = GET_RANDOM_VALUE("randomBase");

// Apply instantly
0 setOvercast _overcast;
0 setRain _rain;
0 setFog [_fog, _fogDecay, _fogBase];
0 setLightnings _lightning;
0 setWindStr _wind;

// Set these values for the rest of the server time.
// 10^10
10e10 setOvercast _overcast;
10e10 setRain _rain;
10e10 setFog [_fog, _fogDecay, _fogBase];
10e10 setLightnings _lightning;
10e10 setWindStr _wind;

// Log Weather Change (TODO: Localize)
[LOG_INFO, format [
    "Random Weather applied with presets %1",
    [
        _overcast,
        _rain,
        _wind,
        _lightning,
        _fog,
        _fogDecay,
        _fogBase
    ]
], _fnc_scriptName] call GW_server_fnc_log
