/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: CfgJail.hpp
 */

class CfgJail {
    class Settings {
        // Minimum and maximum time for jail
        // in minutes.
        minTime = 5 * 60;
        maxTime = 15 * 60;

        // Loadout unit gets when getting incarcerated
        class Loadout {
            uniform  = "U_C_WorkerCoveralls";
            backpack = "";
            headgear = "H_Bandanna_sand";
            goggles  = "";
        };
    };
    class Centers {
        class Malden {
            class HMPMalden {
                name        = "HMP Malden";
                description = "Her Majesty's Prison Malden is the national prison on the Malden Island.";
                icon        = "textures\worlds\maldenSmall.paa";
                class ProcessingArea {
                    direction = 90;
                    positionATL[] = {7714.67, 4150.73, 0.502014};
                };
                class ReleaseArea {
                    direction = 197;
                    positionATL[] = {7743.16, 4108.31, 0.00143814};
                };
            };
        };
        class Altis {
            class HMPPyrgos {
                name        = "HMP Pyrgos";
                description = "Her Majesty's Prison Pyrgos is a prison in the town of Pyrgos on Altis.";
                icon        = "";
                class ProcessingArea {
                    direction = 90;
                    positionATL[] = {16503.4, 15493.2, 8.61912};
                };
                class ReleaseArea {
                    direction = 90;
                    positionATL[] = {16503.5, 15493.2, 8.5926};
                };
            };
        };
    };
};