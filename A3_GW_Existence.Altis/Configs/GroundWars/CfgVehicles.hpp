/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: CfgVehicles.hpp
 */

class CfgVehicles {
    class Shops {
        /**
        *   CLASS:
        *       displayName (Name for shop)
        *       condition (Condition to check)
        *       vehicles
        *           CLASSNAME
        *           CONDITION
        *           LEVEL CATEGORY (NUMBER)
        *           LEVEL IN ABOVE CATEGORY (NUMBER)
        */

        /**
         *  Civilian Vehicles
         *      * Ground
         *      * Air
         *      * Sea
         */
        class CivilianGroundVehicles {
            displayName = "Civilian Automobiles";
            condition   = "playerSide isEqualTo civilian";
            vehicles[]  = {
                {"C_Kart_01_F",             "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1},
                {"C_Kart_01_Blu_F",         "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1}, // Go-Kart
                {"C_Kart_01_Red_F",         "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1}, // Go-Kart
                {"C_Kart_01_Vrana_F",       "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1}, // Go-Kart
                {"C_Kart_01_Fuel_F",        "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1}, // Go-Kart

                {"B_Quadbike_01_F",         "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1}, // Quad Bike
                {"C_Hatchback_01_F",        "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1}, // Hatchback
                {"C_SUV_01_F",              "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1}, // SUV
                {"C_Offroad_02_unarmed_F",  "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1}, // 4x4 offroad
                {"C_Offroad_01_F",          "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1}, // Offroad
                {"C_Hatchback_01_sport_F",  "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 1}, // Hatchback Sport

                {"C_Van_01_Fuel_F",         "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 1}, // Truck Boxer Fuel
                {"C_Van_01_Transport_F",    "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 0}, // Flatbed Boxer
                {"C_Van_01_Box_F",          "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 1}, // Truck Boxer

                {"I_Truck_02_Fuel_F",       "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 3}, // Zamac Fuel
                {"I_Truck_02_Ammo_F",       "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 1}, // Zamac Ammo
                {"I_Truck_02_Covered_F",    "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 2}, // Zamac Covered

                // Tempests
                {"O_Truck_03_Fuel_F",       "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 5}, // Tempest Fuel
                {"O_Truck_03_Ammo_F",       "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 3}, // Tempest Ammo
                {"O_Truck_03_Covered_F",    "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 4}, // Tempest Covered

                // Hemtts
                {"B_Truck_01_Fuel_F",       "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 7}, // Hemtt Fuel
                {"B_Truck_01_Ammo_F",       "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 5}, // Hemtt Ammo
                {"B_Truck_01_Box_F",        "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 6}  // Hemtt Box
            };
        };
        class CivilianAirVehicles {
            displayName = "Civilian Rotary Aircrafts";
            condition   = "playerSide isEqualTo civilian";
            vehicles[]  = {
                {"C_Heli_Light_01_civil_F",             "['CivilianAviation'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 3}, // M900
                {"B_Heli_Light_01_F",                   "['CivilianAviation'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 4}, // MH9
                {"O_Heli_Light_02_unarmed_F",           "['CivilianAviation'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 6}, // Orca
                {"I_Heli_Transport_02_F",               "['CivilianAviation'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 4}, // Mohawk
                {"B_Heli_Transport_03_unarmed_F",       "['CivilianAviation'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 5}, // Huron
                {"O_Heli_Transport_04_F",               "['CivilianAviation'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 4}, // Taru
                {"O_Heli_Transport_04_box_F",           "['CivilianAviation'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 7}, // Taru Box
                {"I_Heli_light_03_unarmed_F",           "['CivilianAviation'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 6}  // Hellcat
            };
        };
        class CivilianNavalVehicles {
            displayName = "Civilian Maritime Vessels";
            condition   = "playerSide isEqualTo civilian && {['CivilianMaritime'] call GW_client_fnc_licensingHasLicense";
            vehicles[]  = {
                {"C_Scooter_Transport_01_F",            "['CivilianMaritime'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 0}, // Water Scooter
                {"C_Rubberboat",                        "['CivilianMaritime'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 0}, // Motorboat
                {"C_Boat_Civil_01_F",                   "['CivilianMaritime'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 0}, // Motorboat
                {"I_C_Boat_Transport_02_F",             "['CivilianMaritime'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 1}, // RHIB
                {"B_SDV_01_F",                          "['CivilianMaritime'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 3}  // SDV
            };
        };
        class CivilianPlanes {
            displayName = "Civilian Fixed-Wing Aircrafts";
            condition   = "playerSide isEqualTo civilian";
            vehicles[]  = {
                // Planes
                {"C_Plane_Civil_01_F",                  "['CivilianAviation'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 5}, // Ceasar
                {"I_Plane_Fighter_03_CAS_F",            "['CivilianAviation'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 7}, // Buzzard CAS
                {"O_Plane_CAS_02_F",                    "['CivilianAviation'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 7}, // Neophron CAS
                {"I_Plane_Fighter_04_F",                "['CivilianAviation'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 7}, // Gryphon
                {"O_Plane_Fighter_02_F",                "['CivilianAviation'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 7}  // Shikra
            };
        };

        /**
         *  Rebel Vehicles
         *      * Ground
         *      * Air
         *      * Sea
         */
        class RebelGroundVehicles {
            displayName = "Rebel Ground Vehicles";
            condition   = "playerSide isEqualTo civilian && {['CivilianRebel'] call GW_client_fnc_licensingHasLicense}";
            vehicles[]  = {
                {"C_Kart_01_F",             "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1},
                {"C_Kart_01_Blu_F",         "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1}, // Go-Kart
                {"C_Kart_01_Red_F",         "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1}, // Go-Kart
                {"C_Kart_01_Vrana_F",       "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1}, // Go-Kart
                {"C_Kart_01_Fuel_F",        "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1}, // Go-Kart

                {"B_Quadbike_01_F",         "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1}, // Quad Bike
                {"C_Hatchback_01_F",        "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1}, // Hatchback
                {"C_SUV_01_F",              "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1}, // SUV
                {"C_Offroad_02_unarmed_F",  "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1}, // 4x4 offroad
                {"C_Offroad_01_F",          "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", -1, -1}, // Offroad
                {"C_Hatchback_01_sport_F",  "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 1}, // Hatchback Sport

                {"C_Van_01_Fuel_F",         "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 1}, // Truck Boxer Fuel
                {"C_Van_01_Transport_F",    "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 0}, // Flatbed Boxer
                {"C_Van_01_Box_F",          "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 1}, // Truck Boxer

                {"I_Truck_02_Fuel_F",       "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 3}, // Zamac Fuel
                {"I_Truck_02_Ammo_F",       "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 1}, // Zamac Ammo
                {"I_Truck_02_Covered_F",    "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 2}, // Zamac Covered

                // Tempests
                {"O_Truck_03_Fuel_F",       "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 5}, // Tempest Fuel
                {"O_Truck_03_Ammo_F",       "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 3}, // Tempest Ammo
                {"O_Truck_03_Covered_F",    "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 4}, // Tempest Covered

                // Hemtts
                {"B_Truck_01_Fuel_F",       "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 7}, // Hemtt Fuel
                {"B_Truck_01_Ammo_F",       "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 5}, // Hemtt Ammo
                {"B_Truck_01_Box_F",        "['CivilianDriver'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 6}  // Hemtt Box
            };
        };
        class RebelAirVehicles {
            displayName = "Rebel - Air Vehicles";
            condition   = "playerSide isEqualTo civilian && {['CivilianRebel'] call GW_client_fnc_licensingHasLicense}";
            vehicles[]  = {
                {"C_Heli_Light_01_civil_F",             "['CivilianPilot'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 3}, // M900
                {"B_Heli_Light_01_F",                   "['CivilianPilot'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 4}, // MH9
                {"O_Heli_Light_02_unarmed_F",           "['CivilianPilot'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 6}, // Orca
                {"I_Heli_Transport_02_F",               "['CivilianPilot'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 4}, // Mohawk
                {"B_Heli_Transport_03_unarmed_F",       "['CivilianPilot'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 5}, // Huron
                {"O_Heli_Transport_04_F",               "['CivilianPilot'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 4}, // Taru
                {"O_Heli_Transport_04_box_F",           "['CivilianPilot'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 7}, // Taru Box
                {"I_Heli_light_03_unarmed_F",           "['CivilianPilot'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 6}, // Hellcat
                {"C_UAV_06_F",                          "['CivilianPilot'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 4}, // AL-6 Pelican
                {"C_UAV_01_F",                          "['CivilianPilot'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 7}  // AR-2 Darter
            };
        };
        class RebelNavalVehicles {
            displayName = "Rebel Naval Vehicles";
            condition   = "playerSide isEqualTo civilian && {['CivilianRebel'] call GW_client_fnc_licensingHasLicense}";
            vehicles[]  = {
                {"C_Scooter_Transport_01_F",            "['CivilianMaritime'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 0}, // Water Scooter
                {"C_Rubberboat",                        "['CivilianMaritime'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 0}, // Motorboat
                {"C_Boat_Civil_01_F",                   "['CivilianMaritime'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 0}, // Motorboat
                {"I_C_Boat_Transport_02_F",             "['CivilianMaritime'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 1}, // RHIB
                {"B_SDV_01_F",                          "['CivilianMaritime'] call GW_client_fnc_licensingHasLicense", LEVEL_VEHICLES, 3}  // SDV
            };
        };

        // Police Vehicles
        // Ground Vehicles
        // Air Vehicles
        // Naval Vehicles
        class PoliceGroundVehicles {
            displayName = "Police Automobiles";
            condition   = "playerSide isEqualTo west";
            vehicles[]  = {
                {"B_Quadbike_01_F",           "call GW_player_sideRank >= 1", -1, -1}, // Quadbike
                {"C_Offroad_01_F",            "call GW_player_sideRank >= 1", -1, -1}, // Offroad Regular
                {"C_Offroad_02_unarmed_F",    "call GW_player_sideRank >= 3", -1, -1}, // MB 4WD
                {"C_Hatchback_01_F",          "call GW_player_sideRank >= 1", -1, -1}, // Normal Hatchback
                {"C_Hatchback_01_sport_F",    "call GW_player_sideRank >= 4", -1, -1}, // Hathback Sport
                {"C_SUV_01_F",                "call GW_player_sideRank >= 2", -1, -1}, // SUV
                {"B_G_Van_02_transport_F",    "call GW_player_sideRank >= 2", -1, -1}, // IDAP Van Transport
                {"B_G_Van_02_vehicle_F",      "call GW_player_sideRank >= 2", -1, -1}, // IDAP Van Cargo
                {"B_T_LSV_01_unarmed_F",      "call GW_player_sideRank >= 5", -1, -1}, // Prowler Unarmed
                {"B_T_LSV_01_armed_F",        "call GW_player_sideRank >= 10",-1, -1}, // Prowler Armed
                {"B_T_MRAP_01_F",             "call GW_player_sideRank >= 9", -1, -1}, // Hunter Unarmed
                {"I_MRAP_03_F",               "call GW_player_sideRank >= 9", -1, -1}  // Strider Unarmed
            };
        };
        class PoliceAirVehicles {
            displayName = "Police Aircrafts";
            condition   = "playerSide isEqualTo west";
            vehicles[]  = {
                {"B_Heli_Light_01_F",               "call GW_player_sideRank >= 5",  -1, -1}, // MH-9 Hummingbird
                {"I_Heli_light_03_unarmed_F",       "call GW_player_sideRank >= 6",  -1, -1}, // Hellcat
                {"B_Heli_Transport_01_camo_F",      "call GW_player_sideRank >= 11", -1, -1}, // Ghosthawk
                {"B_Heli_Transport_03_unarmed_F",   "call GW_player_sideRank >= 10", -1, -1}, // Huron
                {"B_T_VTOL_01_infantry_F",          "call GW_player_sideRank >= 11", -1, -1}, // Blackfish Infantry
                {"B_T_VTOL_01_vehicle_F",           "call GW_player_sideRank >= 11", -1, -1}, // Blackfish Vehicle
                {"B_UAV_01_F",                      "call GW_player_sideRank >= 6",  -1, -1}, // AR-2 Darter
                {"B_UAV_05_F",                      "call GW_player_sideRank >= 11", -1, -1}, // Sentinel
                {"B_UAV_02_F",                      "call GW_player_sideRank >= 11", -1, -1}, // Greyhawk
                {"B_T_UAV_03_F",                    "call GW_player_sideRank >= 11", -1, -1}, // MQ-12 Falcon
                {"B_Plane_Fighter_01_F",            "call GW_player_sideRank >= 11", -1, -1}, // Black Wasp
                {"B_Plane_Fighter_01_Stealth_F",    "call GW_player_sideRank >= 11", -1, -1}, // Black Wasp Stealth
                {"I_Plane_Fighter_04_F",            "call GW_player_sideRank >= 11", -1, -1}  // Gryphon
            };
        };
        class PoliceNavalVehicles {
            displayName = "Maritime Police Vessels";
            condition   = "playerSide isEqualTo west";
            vehicles[]  = {
                {"C_Scooter_Transport_01_F",        "call GW_player_sideRank >= 1",  -1, -1}, // Jet Ski
                {"C_Boat_Civil_01_F",               "call GW_player_sideRank >= 2",  -1, -1}, // Police Boat
                {"B_Boat_Transport_01_F",           "call GW_player_sideRank >= 5",  -1, -1}, // Assault Boat
                {"I_C_Boat_Transport_02_F",         "call GW_player_sideRank >= 6",  -1, -1}, // RHIB
                {"B_Boat_Armed_01_minigun_F",       "call GW_player_sideRank >= 11", -1, -1}  // Speedboat Minigun
            };
        };

        /**
         *  Medical Vehicles
         *      * Ground
         *      * Air
         *      * Sea
         */
        class IHASGroundVehicles {
            displayName = "IHAS - Automobiles";
            condition   = "playerSide isEqualTo independent";
            vehicles[]  = {
                {"C_Offroad_01_F",          "", -1, -1},
                {"B_Quadbike_01_F",         "", -1, -1},
                {"C_Hatchback_01_sport_F",  "", -1, -1},
                {"C_SUV_01_F",              "", -1, -1},
                {"C_Van_01_box_F",          "", -1, -1},
                {"C_Van_02_medevac_F",      "", -1, -1},
                {"C_Van_02_service_F",      "", -1, -1}
            };
        };
        class IHASAirVehicles {
            displayName = "IHAS - Aircrafts";
            condition   = "playerSide isEqualTo independent";
            vehicles[]  = {
                {"B_Heli_Light_01_F",               "", -1, -1}
            };
        };
        class IHASNavalVehicles {
            displayName = "IHAS - Maritime Vessles";
            condition   = "playerSide isEqualTo independent";
            vehicles[]  = {};
        };
    };
    class Vehicles {
        /**
        *   CLASS:
        *       displayName (Name for shop)
        *       condition (Condition to check)
        *       vehicles
        *           CLASSNAME
        *           CONDITION
        *           LEVEL CATEGORY (NUMBER)
        *           LEVEL IN ABOVE CATEGORY (NUMBER)
        */
        // Qillin Unarmed
        class O_T_LSV_02_unarmed_F {
            virtualInventorySpace = 50;
            purchasePrice         = 325000;
            rentalPriceOverride   = 320000;
            textures[]            = {};
        };

        // Qillin Armed
        class O_T_LSV_02_armed_F {
            virtualInventorySpace = 5;
            purchasePrice         = 2000000;
            rentalPriceOverride   = 2000000;
            textures[]            = {};
        };

        // Ifrit Unarmed
        class O_MRAP_02_F {
            virtualInventorySpace = 5;
            purchasePrice         = 1000000;
            rentalPriceOverride   = 1000000;
            textures[]            = {};
        };

        // Gryphon
        class I_Plane_Fighter_04_F {
            virtualInventorySpace = 5;
            purchasePrice         = 20000000;
            rentalPriceOverride   = 20000000;
            textures[]            = {};
        };

        // Shikra
        class O_Plane_Fighter_02_F {
            virtualInventorySpace = 5;
            purchasePrice         = 30000000;
            rentalPriceOverride   = 30000000;
            textures[]            = {};
        };

        // Buzzard CAS
        class I_Plane_Fighter_03_dynamicLoadout_F {
            virtualInventorySpace = 5;
            purchasePrice         = 10000000;
            rentalPriceOverride   = 10000000;
            textures[]            = {};
        };

        // Neophron CAS
        class O_Plane_CAS_02_dynamicLoadout_F {
            virtualInventorySpace = 5;
            purchasePrice         = 15000000;
            rentalPriceOverride   = 15000000;
            textures[]            = {};
        };

        // Ceasar plane
        class C_Plane_Civil_01_F {
            virtualInventorySpace = 300;
            purchasePrice         = 1000000;
            rentalPriceOverride   = 1000000;
            textures[]            = {};
        };

        // SDV Submarine
        class B_SDV_01_F {
            virtualInventorySpace = 320;
            purchasePrice         = 500000;
            rentalPriceOverride   = 500000;
            textures[]            = {};
        };

        // RHIB Boat
        class I_C_Boat_Transport_02_F {
            virtualInventorySpace = 200;
            purchasePrice         = 125000;
            rentalPriceOverride   = 120000;
            textures[]            = {};
        };
        class C_Rubberboat
        {
            virtualInventorySpace = 80;
            purchasePrice         = 50000;
            rentalPriceOverride   = 50000;
            textures[]            = {};
        };

        // Motorboat
        class C_Boat_Civil_01_F {
            virtualInventorySpace = 140;
            purchasePrice         = 80000;
            rentalPriceOverride   = 80000;
            textures[]            = {};
        };

        // Jetski
        class C_Scooter_Transport_01_F {
            virtualInventorySpace = 20;
            purchasePrice         = 25000;
            rentalPriceOverride   = 25000;
            textures[]            = {};
        };

        // Taru
        class O_Heli_Transport_04_F {
            virtualInventorySpace = 100;
            purchasePrice         = 2000000;
            rentalPriceOverride   = 2000000;
            textures[]            = {};
        };
        class O_Heli_Transport_04_box_F {
            virtualInventorySpace = 800;
            purchasePrice         = 6000000;
            rentalPriceOverride   = 6000000;
            textures[]            = {};
        };

        // Orca
        class O_Heli_Light_02_unarmed_F {
            virtualInventorySpace = 5;
            purchasePrice         = 1500000;
            rentalPriceOverride   = 1500000;
            textures[]            = {};
        };

        // Mohawk
        class I_Heli_Transport_02_F {
            virtualInventorySpace = 170;
            purchasePrice         = 750000;
            rentalPriceOverride   = 750000;
            textures[]            = {};
        };

        // M900
        class C_Heli_Light_01_civil_F {
            virtualInventorySpace = 5;
            purchasePrice         = 150000;
            rentalPriceOverride   = 150000;
            textures[]            = {};
        };

        // Civilian UAVs
        class C_UAV_06_F
        {
            virtualInventorySpace = 20;
            purchasePrice         = 200000;
            rentalPriceOverride   = 200000;
            textures[]            = {};
        };
        class C_UAV_01_F
        {
            virtualInventorySpace = 0;
            purchasePrice         = 500000;
            rentalPriceOverride   = 500000;
            textures[]            = {};
        };

        // Blufor UAVs
        class B_UAV_06_F
        {
            virtualInventorySpace = 20;
            purchasePrice         = 250000;
            rentalPriceOverride   = 250000;
            textures[]            = {};
        };
        class B_UAV_01_F
        {
            virtualInventorySpace = 0;
            purchasePrice         = 350000;
            rentalPriceOverride   = 350000;
            textures[]            = {};
        };

        // Independent UAVs
        class I_UAV_06_F
        {
            virtualInventorySpace = 20;
            purchasePrice         = 200000;
            rentalPriceOverride   = 200000;
            textures[]            = {};
        };
        class I_UAV_01_F
        {
            virtualInventorySpace = 0;
            purchasePrice         = 500000;
            rentalPriceOverride   = 500000;
            textures[]            = {};
        };

        class C_Kart_01_F {
            virtualInventorySpace = 3;
            purchasePrice         = 4000;
            rentalPriceOverride   = 2500;
            textures[]            = {};
        };
        class C_Kart_01_Blu_F: C_Kart_01_F {};
        class C_Kart_01_Red_F: C_Kart_01_F {};
        class C_Kart_01_Vrana_F: C_Kart_01_F {};
        class C_Kart_01_Fuel_F: C_Kart_01_F {};

        class B_Quadbike_01_F {
            virtualInventorySpace = 5;
            purchasePrice         = 4000;
            rentalPriceOverride   = 4000;
            textures[]            = {
                {
                    "Brown",
                    "quadbike_brown",
                    "playerSide isEqualTo civ",
                    {
                        "\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"
                    }
                },
                {
                    "Red",
                    "quadbike_red",
                    "playerSide isEqualTo civ",
                    {
                        "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"
                    }
                },
                {
                    "Blue",
                    "quadbike_blue",
                    "playerSide isEqualTo civ",
                    {
                        "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"
                    }
                }
            };
        };
        class C_Offroad_02_unarmed_F {
            virtualInventorySpace = 45;
            purchasePrice         = 15000;
            rentalPriceOverride   = 15000;
            textures[]            = {
                {
                    "Dark Blue",
                    "hatchback_darkblue",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
                    }
                },
                {
                    "Red",
                    "hatchback_red",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
                    }
                }
            };
        };
        class C_Hatchback_01_F {
            virtualInventorySpace = 15;
            purchasePrice         = 7500;
            rentalPriceOverride   = 7500;
            textures[]            = {
                {
                    "Dark Blue",
                    "hatchback_darkblue",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
                    }
                },
                {
                    "Red",
                    "hatchback_red",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
                    }
                },
                {
                    "Patrol White",
                    "hatchback_police_patrol_white",
                    "playerSide isEqualTo west",
                    {
                        "textures\police\vehicles\HatchbackWhite.paa"
                    }
                },
                {
                    "Patrol Black",
                    "hatchback_police_patrol_black",
                    "playerSide isEqualTo west",
                    {
                        "textures\police\vehicles\HatchbackBlack.paa"
                    }
                },
                {
                    "Ambulance",
                    "hatchback_ambulance_ihas",
                    "playerSide isEqualTo independent",
                    {
                        "textures\ihas\vehicles\MedicHatchback.paa"
                    }
                }
            };
        };
        class C_Hatchback_01_sport_F {
            virtualInventorySpace = 15;
            purchasePrice         = 100000;
            rentalPriceOverride   = 100000;
            textures[]            = {
                {
                    "Dark Blue",
                    "hatchback_darkblue",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
                    }
                },
                {
                    "Red",
                    "hatchback_red",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
                    }
                },
                {
                    "Patrol White",
                    "hatchback_police_patrol_white",
                    "playerSide isEqualTo west",
                    {
                        "textures\police\vehicles\HatchbackWhite.paa"
                    }
                },
                {
                    "Patrol Black",
                    "hatchback_police_patrol_black",
                    "playerSide isEqualTo west",
                    {
                        "textures\police\vehicles\HatchbackBlack.paa"
                    }
                },
                {
                    "Ambulance",
                    "hatchback_sport_ambulance_ihas",
                    "playerSide isEqualTo independent",
                    {
                        "textures\ihas\vehicles\MedicHatchback.paa"
                    }
                }
            };
        };
        class C_SUV_01_F {
            virtualInventorySpace = 30;
            purchasePrice         = 30000;
            rentalPriceOverride   = 30000;
            textures[]            = {
                {
                    "Dark Red",
                    "suv_darkred",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
                    }
                },
                {
                    "Silver",
                    "suv_silver",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
                    }
                },
                {
                    "Orange",
                    "suv_orange",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
                    }
                },
                {
                    "Patrol",
                    "suv_police",
                    "playerSide isEqualTo west",
                    {
                        "textures\police\vehicles\SUV.paa"
                    }
                },
                {
                    "Black",
                    "suv_black",
                    "playerSide isEqualTo civilian || {playerSide isEqualTo west}",
                    {
                        "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"
                    }
                }
            };
        };
        class C_Offroad_01_F {
            virtualInventorySpace = 45;
            purchasePrice         = 15000;
            rentalPriceOverride   = 15000;
            textures[]            = {
                {
                    "White",
                    "suv_white_independent",
                    "playerSide isEqualTo independent",
                    {
                        "a3\soft_f\offroad_01\data\offroad_01_ext_base02_co.paa",
                        "a3\soft_f\offroad_01\data\offroad_01_ext_base02_co.paa"
                    }
                },
                {
                    "Black",
                    "suv_black_military",
                    "playerSide isEqualTo west",
                    {
                        "#(argb,8,8,3)color(0,0,0,0.6)"
                    }
                }
            };
        };
        class B_APC_Wheeled_01_cannon_F {
            virtualInventorySpace = 25;
            purchasePrice         = 25000;
            rentalPriceOverride   = 20000;
            textures[]            = {
                {
                    "Patrol",
                    "apc_police",
                    "playerSide isEqualTo west",
                    {
                        "Textures\Police\Vehicles\APCMain.paa",
                        "Textures\Police\Vehicles\APCSecondary.paa"
                    }
                }
            };
        };

        class C_Van_02_medevac_F {
            virtualInventorySpace = 25;
            purchasePrice         = 25000;
            rentalPriceOverride   = 20000;
            textures[]            = {
                {
                    "Ambulance",
                    "van_medevac_independent",
                    "playerSide isEqualTo independent",
                    {
                        "Textures\IHAS\Vehicles\MedicAmbulance.paa"
                    }
                }
            };
        };

        class C_Van_02_service_F {
            virtualInventorySpace = 25;
            purchasePrice         = 25000;
            rentalPriceOverride   = 20000;
            textures[]            = {
                {
                    "Service",
                    "van_service_independent",
                    "playerSide isEqualTo independent",
                    {
                        "a3\soft_f_orange\van_02\data\van_body_civservice_co.paa",
                        "a3\soft_f_orange\van_02\data\van_wheel_dirty_co.paa",
                        "a3\soft_f_orange\van_02\data\van_glass_civservice_ca.paa",
                        "a3\soft_f_orange\van_02\data\van_body_civservice_co.paa"
                    }
                }
            };
        };

        // Van Flat Bed
        class C_Van_01_transport_F {
            virtualInventorySpace = 140;
            purchasePrice         = 75000;
            rentalPriceOverride   = 75000;
            textures[]            = {
                {
                    "White",
                    "van_flatbed_white",
                    "playerSide isEqualTo civilian",
                    {
                        "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
                    }
                },
                {
                    "Red",
                    "van_flatbed_red",
                    "playerSide isEqualTo civilian",
                    {
                        "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
                    }
                }
            };
        };

        // Van Fuel
        class C_Van_01_fuel_F {
            virtualInventorySpace = 20;
            purchasePrice         = 50000;
            rentalPriceOverride   = 50000;
            textures[]            = {
                {
                    "White",
                    "van_fuel_white",
                    "playerSide isEqualTo civilian",
                    {
                        "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
                    }
                },
                {
                    "Red",
                    "van_fuel_red",
                    "playerSide isEqualTo civilian",
                    {
                        "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
                    }
                }
            };
        };

        // Van Transport
        class C_Van_01_box_F {
            virtualInventorySpace = 200;
            purchasePrice         = 135000;
            rentalPriceOverride   = 135000;
            textures[]            = {
                {
                    "White",
                    "van_box_white",
                    "playerSide isEqualTo civilian",
                    {
                        "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
                    }
                },
                {
                    "Red",
                    "van_box_red",
                    "playerSide isEqualTo civilian",
                    {
                        "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
                    }
                }
            };
        };

        // A-143 Buzzard
        class I_Plane_Fighter_03_CAS_F
        {
            virtualInventorySpace = 5;
            purchasePrice         = 7500000;
            rentalPriceOverride   = 7500000;
            textures[]            = {};
        };

        // Zamac Ammo
        class I_Truck_02_Ammo_F {
            virtualInventorySpace = 320;
            purchasePrice         = 190000;
            rentalPriceOverride   = 190000;
            textures[]            = {
                {
                    "Normal",
                    "zamac_ammo_normal",
                    "playerSide isEqualTo civilian",
                    {
                        "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
                    }
                }
            };
        };

        // Tempest Ammo
        class O_Truck_03_Ammo_F
        {
            virtualInventorySpace = 450;
            purchasePrice         = 380000;
            rentalPriceOverride   = 380000;
            textures[]            =
            {
                {
                    "Normal",
                    "tempest_ammo_normal",
                    "playerSide isEqualTo civilian",
                    {
                        "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
                    }
                }
            };
        };

        // Tempest Fuel
        class O_Truck_03_Fuel_F
        {
            virtualInventorySpace = 20;
            purchasePrice         = 100000;
            rentalPriceOverride   = 100000;
            textures[]            =
            {
                {
                    "Normal",
                    "tempest_ammo_normal",
                    "playerSide isEqualTo civilian",
                    {
                        "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
                    }
                }
            };
        };

        // Zamac Covered
        class I_Truck_02_Covered_F {
            virtualInventorySpace = 290;
            purchasePrice         = 175000;
            rentalPriceOverride   = 175000;
            textures[]            = {
                {
                    "Normal",
                    "zamac_covered_normal",
                    "playerSide isEqualTo civilian",
                    {
                        "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
                    }
                }
            };
        };

        // Zamac Fuel
        class I_Truck_02_Fuel_F {
            virtualInventorySpace = 10;
            purchasePrice         = 75000;
            rentalPriceOverride   = 75000;
            textures[]            = {
                {
                    "Normal",
                    "zamac_fuel_normal",
                    "playerSide isEqualTo civilian",
                    {
                        "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
                    }
                }
            };
        };

        // Tempest Ammo
        class O_Truck_02_Ammo_F {
            virtualInventorySpace = 550;
            purchasePrice         = 420000;
            rentalPriceOverride   = 400000;
            textures[]            = {
                {
                    "Normal",
                    "tempest_ammo_normal",
                    "playerSide isEqualTo civilian",
                    {
                        "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
                    }
                }
            };
        };

        // Tempest Covered
        class O_Truck_03_Covered_F
        {
            virtualInventorySpace = 550;
            purchasePrice         = 420000;
            rentalPriceOverride   = 420000;
            textures[]            =
            {
                {
                    "Normal",
                    "tempest_covered_normal",
                    "playerSide isEqualTo civilian",
                    {
                        "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
                    }
                }
            };
        };

        // Tempest Device
        class O_Truck_03_Device_F {
            virtualInventorySpace = 450;
            purchasePrice         = 1250000;
            rentalPriceOverride   = 1250000;
            textures[]            = {
                {
                    "Normal",
                    "tempest_device_normal",
                    "playerSide isEqualTo civilian",
                    {
                        "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
                    }
                }
            };
        };

        // Hemtt Ammo
        class B_Truck_01_Ammo_F {
            virtualInventorySpace = 680;
            purchasePrice         = 650000;
            rentalPriceOverride   = 650000;
            textures[]            = {
                {
                    "Normal",
                    "hemtt_ammo_normal",
                    "playerSide isEqualTo civilian",
                    {
                        "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
                    }
                }
            };
        };

        // Hemtt Fuel
        class B_Truck_01_Fuel_F {
            virtualInventorySpace = 30;
            purchasePrice         = 150000;
            rentalPriceOverride   = 150000;
            textures[]            = {
                {
                    "Normal",
                    "hemtt_fuel_normal",
                    "playerSide isEqualTo civilian",
                    {
                        "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
                    }
                }
            };
        };

        // Armed Offroad
        class B_G_Offroad_01_armed_F
        {
            virtualInventorySpace = 5;
            purchasePrice         = 1000000;
            rentalPriceOverride   = 1000000;
            textures[]            =
            {
                {
                    "Black",
                    "armed_offroad_texture_black",
                    "true",
                    {
                        "#(argb,8,8,3)color(0,0,0,0.6)"
                    }
                }
            };
        };

        // Slingload Crate
        class B_Slingload_01_Cargo_F
        {
            virtualInventorySpace = 500;
            purchasePrice         = 1500000;
            rentalPriceOverride   = 1500000;
            textures[]            = {};
        };

        // Hemtt Box
        class B_Truck_01_Box_F {
            virtualInventorySpace = 800;
            purchasePrice         = 900000;
            rentalPriceOverride   = 900000;
            textures[]            = {
                {
                    "Normal",
                    "hemtt_box_normal",
                    "playerSide isEqualTo civilian",
                    {
                        "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
                    }
                }
            };
        };

        // Laws of War Vans
        class B_G_Van_02_transport_F {
            virtualInventorySpace = 25;
            purchasePrice         = 25000;
            rentalPriceOverride   = 20000;
            textures[]            = {
                {
                    "Patrol",
                    "van_police2",
                    "playerSide isEqualTo west",
                    {
                        "textures\police\vehicles\Van.paa"
                    }
                }
            };
        };
        class B_G_Van_02_vehicle_F {
            virtualInventorySpace = 25;
            purchasePrice         = 25000;
            rentalPriceOverride   = 20000;
            textures[]            = {
                {
                    "Patrol",
                    "van_police",
                    "playerSide isEqualTo west",
                    {
                        "textures\police\vehicles\Van.paa"
                    }
                }
            };
        };

        // Prowler
        class B_T_LSV_01_unarmed_F {
            virtualInventorySpace = 5;
            purchasePrice         = 250000;
            rentalPriceOverride   = 250000;
            textures[]            = {};
        };
        class B_T_LSV_01_armed_F {
            virtualInventorySpace = 5;
            purchasePrice         = 2000000;
            rentalPriceOverride   = 2000000;
            textures[]            = {};
        };

        // Hunter
        class B_T_MRAP_01_F {
            virtualInventorySpace = 5;
            purchasePrice         = 1000000;
            rentalPriceOverride   = 1000000;
            textures[]            = {
                {
                    "Patrol",
                    "hunter_patrol",
                    "playerSide isEqualTo west",
                    {
                        "textures\police\vehicles\Hunter.paa",
                        "textures\police\vehicles\HunterBack.paa"
                    }
                }
            };
        };

        class I_MRAP_03_F {
            virtualInventorySpace = 5;
            purchasePrice         = 1000000;
            rentalPriceOverride   = 1000000;
            textures[]            = {
                {
                    "Camo",
                    "strider_camo",
                    "playerSide isEqualTo west",
                    {
                        "\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa",
                        "\A3\data_f\vehicles\turret_co.paa"
                    }
                },
                {
                    "Patrol",
                    "strider_patrol",
                    "playerSide isEqualTo west",
                    {
                        "textures\police\vehicles\Strider.paa"
                    }
                }
            };
        };

        // Blufor Air Vehicles
        // MH-9
        class B_Heli_Light_01_F {
            virtualInventorySpace = 5;
            purchasePrice         = 250000;
            rentalPriceOverride   = 250000;
            textures[]            = {
                {
                    "Blue",
                    "mh9_blue",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
                    }
                },
                {
                    "Red",
                    "mh9_red",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
                    }
                },
                {
                    "Blueline",
                    "mh9-blueline",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
                    }
                },
                {
                    "Elliptical",
                    "mh9-elliptical",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
                    }
                },
                {
                    "Furious",
                    "mh9-furious",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
                    }
                },
                {
                    "Jeans Blue",
                    "mh9-jeansblue",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
                    }
                },
                {
                    "Redline",
                    "mh9-redline",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
                    }
                },
                {
                    "Sunset",
                    "mh9-sunset",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
                    }
                },
                {
                    "Vrana",
                    "mh9-vrana",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
                    }
                },
                {
                    "Rebel Digital Grey",
                    "mh9-rebeldigitalgrey",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
                    }
                },
                {
                    "Rebel Digital Green",
                    "mh9-rebeldigitalgreen",
                    "playerSide isEqualTo civ",
                    {
                        "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
                    }
                },
                {
                    "Camo",
                    "mh9-militarypolice",
                    "playerSide isEqualTo west",
                    {
                        "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blufor_co.paa"
                    }
                },
                {
                    "Patrol",
                    "mh9-patrol",
                    "playerSide isEqualTo west",
                    {
                        "textures\police\vehicles\Hummingbird.paa"
                    }
                }
            };
        };

        // Ghosthawk
        class B_Heli_Transport_01_camo_F {
            virtualInventorySpace = 25;
            purchasePrice         = 25000;
            rentalPriceOverride   = 20000;
            textures[]            = {};
        };

        // Huron
        class B_Heli_Transport_03_unarmed_F {
            virtualInventorySpace = 300;
            purchasePrice         = 2000000;
            rentalPriceOverride   = 2000000;
            textures[]            = {
                {
                    "Black",
                    "huron-black",
                    "true",
                    {
                        "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
                    }
                },
                {
                    "Transport",
                    "huron-black",
                    "playerside isEqualTo west",
                    {
                        "textures\police\vehicles\HuronFront.paa",
                        "textures\police\vehicles\HuronBack.paa"
                    }
                }
            };
        };

        // Hellcat
        class I_Heli_light_03_unarmed_F {
            virtualInventorySpace = 5;
            purchasePrice         = 850000;
            rentalPriceOverride   = 850000;
            textures[]            = {
                {
                    "Camo",
                    "hellcat_military",
                    "playerSide isEqualTo west",
                    {
                        "\a3\air_f_epb\Heli_Light_03\Data\Heli_Light_03_base_CO.paa"
                    }
                },
                {
                    "Patrol",
                    "hellcat_military_patrol",
                    "playerSide isEqualTo west",
                    {
                        "textures\police\vehicles\Hellcat.paa"
                    }
                },
                {
                    "Black",
                    "hellcat_black",
                    "playerSide isEqualTo civilian",
                    {
                        "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
                    }
                }
            };
        };

        // Blackfish Infantry
        class B_T_VTOL_01_infantry_F {
            virtualInventorySpace = 25;
            purchasePrice         = 25000;
            rentalPriceOverride   = 20000;
            textures[]            = {};
        };
    };
};
