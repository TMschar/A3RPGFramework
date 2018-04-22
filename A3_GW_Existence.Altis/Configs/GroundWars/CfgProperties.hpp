/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: CfgProperties.hpp
*/

#define true           1
#define false          0
#define TYPE_HOUSE     0
#define TYPE_GARAGE    1
#define TYPE_SAFEHOUSE 2

class CfgProperties {
    class Altis {};
    class Tanoa {};
    class Malden {
        // Array with blocked locations, format: {location, radius}
        blockedLocations[] = {};
        garageLimit = 1;
        houseLimit = 1;
        safehouseLimit = 1;
        containerType = "Box_NATO_Equip_F";

        // HOUSES: Tier 1 - 0 crate(s)
        class Land_Slum_House02_F {
            purchasePrice = 100000;
            containers = 0;
            virtualInventorySpace = 20;
            propertyRobbable = true;
            propertyType = TYPE_HOUSE;
        };
        class Land_i_Stone_Shed_01_b_raw_F: Land_Slum_House02_F {
            purchasePrice = 500000;
        };
        class Land_i_Stone_Shed_01_b_clay_F:  Land_i_Stone_Shed_01_b_raw_F {};
        class Land_i_Stone_Shed_01_b_white_F: Land_i_Stone_Shed_01_b_raw_F {};

        // HOUSES: Tier 2 - 1 crate(s)
        class Land_i_Stone_HouseSmall_V2_F {
            purchasePrice = 1000000;
            containers = 1;
            virtualInventorySpace = 20;
            propertyRobbable = true;
            propertyType = TYPE_HOUSE;
            class Container_Locations {
                class Container_1 {
                    relativePosition[] = {0, 0, 0};
                    relativeDirection = 0;
                };
            };
        };
        class Land_i_Stone_HouseSmall_V3_F: Land_i_Stone_HouseSmall_V2_F {};

        class Land_i_House_Small_02_b_brown_F {
            purchasePrice = 1200000;
            containers = 1;
            virtualInventorySpace = 20;
            propertyRobbable = true;
            propertyType = TYPE_HOUSE;
            class Container_Locations {
                class Container_1 {
                    relativePosition[] = {0, 0, 0};
                    relativeDirection = 0;
                };
            };
        };
        class Land_i_House_Small_02_b_white_F:     Land_i_House_Small_02_b_brown_F {};
        class Land_i_House_Small_02_b_whiteblue_F: Land_i_House_Small_02_b_brown_F {};
        class Land_i_House_Small_02_b_pink_F:      Land_i_House_Small_02_b_brown_F {};
        class Land_i_House_Small_02_b_blue_F:      Land_i_House_Small_02_b_brown_F {};
        class Land_i_House_Small_02_c_yellow_F:    Land_i_House_Small_02_b_brown_F {};

        // HOUSES: Tier 3 - 2 crate(s)
        class Land_i_House_Small_01_b_blue_F {
            purchasePrice = 2000000;
            containers = 2;
            virtualInventorySpace = 20;
            propertyRobbable = true;
            propertyType = TYPE_HOUSE;
            class Container_Locations {
                class Container_1 {
                    relativePosition[] = {1.2, -1.1, 0};
                    relativeDirection = 0;
                };
                class Container_2 {
                    relativePosition[] = {1.2, -2.3, 0};
                    relativeDirection = 0;
                };
            };
        };
        class Land_i_House_Small_01_b_pink_F:      Land_i_House_Small_01_b_blue_F {};
        class Land_i_House_Small_01_b_whiteblue_F: Land_i_House_Small_01_b_blue_F {};
        class Land_i_House_Small_01_b_white_F:     Land_i_House_Small_01_b_blue_F {};
        class Land_i_House_Small_01_b_brown_F:     Land_i_House_Small_01_b_blue_F {};
        class Land_i_House_Small_01_b_yellow_F:    Land_i_House_Small_01_b_blue_F {};

        // HOUSES: Tier 4 - 3 crate(s)
        class Land_i_House_Big_02_b_yellow_F {
            purchasePrice = 3000000;
            containers = 3;
            virtualInventorySpace = 20;
            propertyRobbable = true;
            propertyType = TYPE_HOUSE;
            class Container_Locations {
                class Container_1 {
                    relativePosition[] = {0, 0, 0};
                    relativeDirection = 90;
                };
                class Container_2 {
                    relativePosition[] = {1.4, 0, 0};
                    relativeDirection = 90;
                };
                class Container_3 {
                    relativePosition[] = {2.8, 0, 0};
                    relativeDirection = 90;
                };
            };
        };
        class Land_i_House_Big_02_b_brown_F:     Land_i_House_Big_02_b_yellow_F {};
        class Land_i_House_Big_02_b_white_F:     Land_i_House_Big_02_b_yellow_F {};
        class Land_i_House_Big_02_b_whiteblue_F: Land_i_House_Big_02_b_yellow_F {};
        class Land_i_House_Big_02_b_pink_F:      Land_i_House_Big_02_b_yellow_F {};
        class Land_i_House_Big_02_b_blue_F:      Land_i_House_Big_02_b_yellow_F {};

        // HOUSES: Tier 5 - 4 crate(s)
        class Land_i_House_Big_01_b_brown_F {
            purchasePrice = 4000000;
            containers = 4;
            virtualInventorySpace = 20;
            propertyRobbable = true;
            propertyType = TYPE_HOUSE;
            // TODO: crate positions
            class Container_Locations {
                class Container_1 {
                    relativePosition[] = {0, 3.7, 0};
                    relativeDirection = 90;
                };
                class Container_2 {
                    relativePosition[] = {1.3, 3.7, 0};
                    relativeDirection = 90;
                };
                class Container_3 {
                    relativePosition[] = {2.6, 3.7, 0};
                    relativeDirection = 90;
                };
                class Container_4 {
                    relativePosition[] = {4.1, 0, 0};
                    relativeDirection = 90;
                };
            };
        };
        class Land_i_House_Big_01_b_white_F:     Land_i_House_Big_01_b_brown_F {};
        class Land_i_House_Big_01_b_whiteblue_F: Land_i_House_Big_01_b_brown_F {};
        class Land_i_House_Big_01_b_pink_F:      Land_i_House_Big_01_b_brown_F {};
        class Land_i_House_Big_01_b_blue_F:      Land_i_House_Big_01_b_brown_F {};

        // HOUSES: Tier 6 - 2 crate(s)
        class Land_LightHouse_F {
            purchasePrice = 20000000;
            containers = 2;
            virtualInventorySpace = 20;
            propertyRobbable = false;
            propertyType = TYPE_HOUSE;
            class Container_Locations {
                class Container_1 {
                    relativePosition[] = {-0.7, -3.1, 9};
                    relativeDirection = 0;
                };
                class Container_2 {
                    relativePosition[] = {-0.7, -3.1, 10};
                    relativeDirection = 0;
                };
            };
        };

        // GARAGES
        class Land_i_Garage_V1_F {
            purchasePrice = 750000;
            propertyType = TYPE_GARAGE;
        };
        class Land_i_Garage_V2_F: Land_i_Garage_V1_F {};

        // SAFE HOUSES
        class Land_i_Barracks_V2_F {
            purchasePrice = 25000000;
            containers = 5;
            virtualInventorySpace = 20;
            propertyRobbable = false;
            propertyType = TYPE_SAFEHOUSE;
            class Container_Locations {
                class Container_1 {
                    relativePosition[] = {14.35, 4, 4.4};
                    relativeDirection = 0;
                };
                class Container_2 {
                    relativePosition[] = {14.35, 2, 4.4};
                    relativeDirection = 0;
                };
                class Container_3 {
                    relativePosition[] = {12.5, 4.3, 4.4};
                    relativeDirection = 90;
                };
                class Container_4 {
                    relativePosition[] = {11, 4.3, 4.4};
                    relativeDirection = 90;
                };
                class Container_5 {
                    relativePosition[] = {12.5, 2, 4.4};
                    relativeDirection = 90;
                };
            };
        };
    };
};
