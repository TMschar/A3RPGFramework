/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: CfgFactories.hpp
*/

#define true 1
#define false 0

class CfgFactories {
    class Vehicles {
        /**
        *    Vehicle Class:
        *        illegal  : BOOLEAN - illegal or not illegal
        *        price    : NUMBER  - Price to manufactre
        *        duration : NUMBER  - Duration (in seconds) of manufactre
        *        Level Class:
        *            category : NUMBER - Category needed to manufactre
        *            level    : NUMBER - Level needed to manufactre
        */
        class C_SUV_01_F {
            illegal   = false;
            price     = 10000;
            duration  = 100;
            sellprice = 100000;
            class Level {
                category = 1;
                level    = 1;
            };
        };
        class B_Quadbike_01_F {
            illegal  = false;
            price    = 213123;
            duration = 22;
            class Level {
                category = 1;
                level    = 1;
            };
        };
    };
    class Weapons {
        class Free_Factory {

        };
        class Organization_Factory {

        };
    };
};
