/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: CfgWorld.hpp
 */

class GW_CfgWorld
{
    class Cleanup
    {
        cleanupTimer = 3; // Time in minutes to wait between cleanups in world - Default: 10
    };
    class Weather
    {
        class RandomWeatherConfigurations
        {
            randomFog       = 0.3;
            randomDecay     = 0.3;
            randomBase      = 0.3;
            randomOvercast  = 0.8;
            randomRain      = 0.8;
            randomWind      = 0.8;
            randomLightning = 0.8;
        };
    };
};
