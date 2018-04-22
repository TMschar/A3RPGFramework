/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: CfgFunctions.hpp
 */
class Extensions
{
    tag = "GW_ext";
    class Arrays
    {
        file = "Extensions\Arrays";
        #include "Arrays\CfgFunctions.hpp"
    };
    class Logging
    {
        file = "Extensions\Logging";
        #include "Logging\CfgFunctions.hpp"
    };
    class Network
    {
        file = "Extensions\Network";
        #include "Network\CfgFunctions.hpp"
    };
    class Units
    {
        file = "Extensions\Units";
        #include "Units\CfgFunctions.hpp"
    };
};
