/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: CfgExperience.hpp
*/

#define LEVEL_VEHICLES 5
#define LEVEL_VIGILANCE 2
#define LEVEL_MEDICAL 1
#define LEVEL_WEAPONS 4
#define LEVEL_TOOLSOFTHETRADE 0
#define LEVEL_REBELLIOUS 3

class CfgExperience {
    class Earnings {
        /**
        * CLASS:
        *     ARRAY - Categories:
        *         NUMBER - Level ID
        *         NUMBER - Amount
        *         STRING - Reason
        */
        class PetrolStationRobbery {
            categories[] = {
                {LEVEL_REBELLIOUS, 20, "Robbing small businesses"},
                {LEVEL_WEAPONS, 20, "Robbery with a weapon"}
            };
        };
    };
    class Categories {
        class Jack {
            id          = 0;
            displayName = "Jack of all trades";
            class Levels {
                class L1 {
                    id              = 1;
                    displayName     = "Level 1";
                    pointsRequired  = 500;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L2 {
                    id              = 2;
                    displayName     = "Level 2";
                    pointsRequired  = 1000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L3 {
                    id              = 3;
                    displayName     = "Level 3";
                    pointsRequired  = 2000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L4 {
                    id              = 4;
                    displayName     = "Level 4";
                    pointsRequired  = 3500;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L5 {
                    id              = 5;
                    displayName     = "Level 5";
                    pointsRequired  = 6500;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L6 {
                    id              = 6;
                    displayName     = "Level 6";
                    pointsRequired  = 12000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L7 {
                    id              = 6;
                    displayName     = "Level 7";
                    pointsRequired  = 25000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L8 {
                    id              = 6;
                    displayName     = "Level 8";
                    pointsRequired  = 45000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L9 {
                    id              = 6;
                    displayName     = "Level 9";
                    pointsRequired  = 85000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L10 {
                    id              = 6;
                    displayName     = "Level 10";
                    pointsRequired  = 160000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L11 {
                    id              = 6;
                    displayName     = "Level 11";
                    pointsRequired  = 300000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L12 {
                    id              = 6;
                    displayName     = "Level 12";
                    pointsRequired  = 580000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
            };
        };
        class Medical {
            id          = 1;
            displayName = "Health & Wellbeing";
            class Levels {
                class L1 {
                    id              = 1;
                    displayName     = "Level 1";
                    pointsRequired  = 500;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L2 {
                    id              = 2;
                    displayName     = "Level 2";
                    pointsRequired  = 1000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L3 {
                    id              = 3;
                    displayName     = "Level 3";
                    pointsRequired  = 2000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L4 {
                    id              = 4;
                    displayName     = "Level 4";
                    pointsRequired  = 3500;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L5 {
                    id              = 5;
                    displayName     = "Level 5";
                    pointsRequired  = 6500;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L6 {
                    id              = 6;
                    displayName     = "Level 6";
                    pointsRequired  = 12000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L7 {
                    id              = 6;
                    displayName     = "Level 7";
                    pointsRequired  = 25000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L8 {
                    id              = 6;
                    displayName     = "Level 8";
                    pointsRequired  = 45000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L9 {
                    id              = 6;
                    displayName     = "Level 9";
                    pointsRequired  = 85000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L10 {
                    id              = 6;
                    displayName     = "Level 10";
                    pointsRequired  = 160000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L11 {
                    id              = 6;
                    displayName     = "Level 11";
                    pointsRequired  = 300000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L12 {
                    id              = 6;
                    displayName     = "Level 12";
                    pointsRequired  = 580000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
            };
        };
        class Vigilance {
            id          = 2;
            displayName = "Vigilance";
            class Levels {
                class L1 {
                    id              = 1;
                    displayName     = "Level 1";
                    pointsRequired  = 500;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L2 {
                    id              = 2;
                    displayName     = "Level 2";
                    pointsRequired  = 1000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L3 {
                    id              = 3;
                    displayName     = "Level 3";
                    pointsRequired  = 2000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L4 {
                    id              = 4;
                    displayName     = "Level 4";
                    pointsRequired  = 3500;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L5 {
                    id              = 5;
                    displayName     = "Level 5";
                    pointsRequired  = 6500;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L6 {
                    id              = 6;
                    displayName     = "Level 6";
                    pointsRequired  = 12000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L7 {
                    id              = 6;
                    displayName     = "Level 7";
                    pointsRequired  = 25000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L8 {
                    id              = 6;
                    displayName     = "Level 8";
                    pointsRequired  = 45000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L9 {
                    id              = 6;
                    displayName     = "Level 9";
                    pointsRequired  = 85000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L10 {
                    id              = 6;
                    displayName     = "Level 10";
                    pointsRequired  = 160000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L11 {
                    id              = 6;
                    displayName     = "Level 11";
                    pointsRequired  = 300000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L12 {
                    id              = 6;
                    displayName     = "Level 12";
                    pointsRequired  = 580000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
            };
        };
        class Rebellious {
            id          = 3;
            displayName = "Rebellious";
            class Levels {
                class L1 {
                    id              = 1;
                    displayName     = "Level 1";
                    pointsRequired  = 500;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L2 {
                    id              = 2;
                    displayName     = "Level 2";
                    pointsRequired  = 1000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L3 {
                    id              = 3;
                    displayName     = "Level 3";
                    pointsRequired  = 2000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L4 {
                    id              = 4;
                    displayName     = "Level 4";
                    pointsRequired  = 3500;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L5 {
                    id              = 5;
                    displayName     = "Level 5";
                    pointsRequired  = 6500;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L6 {
                    id              = 6;
                    displayName     = "Level 6";
                    pointsRequired  = 12000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L7 {
                    id              = 6;
                    displayName     = "Level 7";
                    pointsRequired  = 25000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L8 {
                    id              = 6;
                    displayName     = "Level 8";
                    pointsRequired  = 45000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L9 {
                    id              = 6;
                    displayName     = "Level 9";
                    pointsRequired  = 85000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L10 {
                    id              = 6;
                    displayName     = "Level 10";
                    pointsRequired  = 160000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L11 {
                    id              = 6;
                    displayName     = "Level 11";
                    pointsRequired  = 300000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L12 {
                    id              = 6;
                    displayName     = "Level 12";
                    pointsRequired  = 580000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
            };
        };
        class Weapons {
            id          = 4;
            displayName = "Weapons";
            class Levels {
                class L1 {
                    id              = 1;
                    displayName     = "Level 1";
                    pointsRequired  = 500;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L2 {
                    id              = 2;
                    displayName     = "Level 2";
                    pointsRequired  = 1000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L3 {
                    id              = 3;
                    displayName     = "Level 3";
                    pointsRequired  = 2000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L4 {
                    id              = 4;
                    displayName     = "Level 4";
                    pointsRequired  = 3500;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L5 {
                    id              = 5;
                    displayName     = "Level 5";
                    pointsRequired  = 6500;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L6 {
                    id              = 6;
                    displayName     = "Level 6";
                    pointsRequired  = 12000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L7 {
                    id              = 6;
                    displayName     = "Level 7";
                    pointsRequired  = 25000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L8 {
                    id              = 6;
                    displayName     = "Level 8";
                    pointsRequired  = 45000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L9 {
                    id              = 6;
                    displayName     = "Level 9";
                    pointsRequired  = 85000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L10 {
                    id              = 6;
                    displayName     = "Level 10";
                    pointsRequired  = 160000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L11 {
                    id              = 6;
                    displayName     = "Level 11";
                    pointsRequired  = 300000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L12 {
                    id              = 6;
                    displayName     = "Level 12";
                    pointsRequired  = 580000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
            };
        };
        class Vehicles {
            id          = 5;
            displayName = "Vehicles";
            class Levels {
                class L1 {
                    id              = 1;
                    displayName     = "Level 1";
                    pointsRequired  = 500;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L2 {
                    id              = 2;
                    displayName     = "Level 2";
                    pointsRequired  = 1000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L3 {
                    id              = 3;
                    displayName     = "Level 3";
                    pointsRequired  = 2000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L4 {
                    id              = 4;
                    displayName     = "Level 4";
                    pointsRequired  = 3500;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L5 {
                    id              = 5;
                    displayName     = "Level 5";
                    pointsRequired  = 6500;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L6 {
                    id              = 6;
                    displayName     = "Level 6";
                    pointsRequired  = 12000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L7 {
                    id              = 6;
                    displayName     = "Level 7";
                    pointsRequired  = 25000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L8 {
                    id              = 6;
                    displayName     = "Level 8";
                    pointsRequired  = 45000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L9 {
                    id              = 6;
                    displayName     = "Level 9";
                    pointsRequired  = 85000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L10 {
                    id              = 6;
                    displayName     = "Level 10";
                    pointsRequired  = 160000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L11 {
                    id              = 6;
                    displayName     = "Level 11";
                    pointsRequired  = 300000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
                class L12 {
                    id              = 6;
                    displayName     = "Level 12";
                    pointsRequired  = 580000;
                    unlocksStrings[]= {
                        "Ability to farm tier 2 legal fields",
                        "Test 1"
                    };
                };
            };
        };
    };
};
