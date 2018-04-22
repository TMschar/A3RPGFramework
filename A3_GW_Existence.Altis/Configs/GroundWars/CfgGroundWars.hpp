/**
 * Copyright (C) SimZor, SimZor Studios 2017
 * All Rights Reserved
 *
 * Filename: CfgGroundWars.hpp
 */

#define false 0
#define true 1
#define CHANNEL_GLOBAL 0
#define CHANNEL_SIDE 1
#define CHANNEL_COMMAND 2

#include "CfgExperience.hpp"
#include "CfgFactories.hpp"
#include "CfgProperties.hpp"
#include "CfgResources.hpp"
#include "CfgScriptPaths.hpp"
#include "CfgSpawns.hpp"
#include "CfgVirtualItems.hpp"
#include "CfgActions.hpp"
#include "CfgOrganizations.hpp"
#include "CfgVehicles.hpp"
#include "CfgEquipment.hpp"
#include "CfgLicenses.hpp"
#include "CfgSurvival.hpp"
#include "CfgClothing.hpp"
#include "CfgBanks.hpp"
#include "CfgMedical.hpp"
#include "CfgWarrants.hpp"
#include "CfgJail.hpp"
#include "CfgPetrolStations.hpp"
#include "CfgCaptureZones.hpp"

class CfgGroundWars {
    class View {
        firstPersonOnly              = false;
        allow3rdPersonInVehicle      = true;
        allow3rdPersonWithoutAWeapon = true;
        disableGroupView             = true;
    };
    class Build {
        version = "";
        /**
         * Deployment Environment:
         *     "development": Extensive logging for debugging
         *     "staging":     No description
         *     "production":  No description
         */
        deploymentEnvironment = "production";
    };
    class Players {
        class Finance {
            class Money {
                bankStart     = 150000;
                cashStart     = 0;
                maxCashPickup = 100000;
            };
            class Paychecks {
                class West {
                    money = 12500;
                    exp   = 100;
                };
                class Guer {
                    money = 15000;
                    exp   = 100;
                };
                class East {
                    money = 0;
                    exp   = 0;
                };
                class Civ {
                    money = 5000;
                    exp   = 100;
                };
            };
        };
        class Factions {
            class Tags {
                class Prefixes {
                    blufor      = "[MP]";
                    independent = "[IHAS]";
                };
            };
        };
    };
    class GameProperties {
        enableStamina           = false;    // Default: false
        enableFatigue           = false;    // Default: false
        customSwayCoef          = 0.1;      // Default: 1
        unitRecoilCoefficient   = 1;        // Default: 1
        animSpeedCoef           = 1;        // Default: 1
        bleedoutDuration        = 15;       // Duration of bleedout before bleeding out and dying, in minutes. - Default: 15
        class Restrictions {
            enable   = true; // If enabled a player needs to wait after connecting and disconnecting and then connecting again (softlogging) - Default: true
            cooldown = 5;    // Time (in minutes) a player needs to wait after disconnecting and connecting to server again - Default: 5
        };
        class VON {
            vonCheckEnable      = true;                                            // Enable disabling of channels - Default: true
            disableChannelIDs[] = {CHANNEL_GLOBAL, CHANNEL_SIDE, CHANNEL_COMMAND}; // Channel IDs to disable (Use currentChannel in debug console to check what channels you wanna disable)
        };
    };
    class World {
        atms[] = {
            "Land_Atm_01_F",
            "Land_ATM_01_malden_F",
            "Land_Atm_02_F",
            "Land_ATM_02_malden_F"
        };
        phoneBooths[] = {"Land_PhoneBooth_01_F"};
        class GUI {
            /**
            *   This defines all objects that can have 3D actions bound to them.
            *
            *   Array Format:
            *       0: ARRAY  - Array with datatype STRING containing object classnames
            *       1: STRING - Icon Path (Will show up as an icon on the object itself)
            *       2: STRING - Text (Will show up as text on the object itself)
            *       3: STRING - Expression
            *       4: STRING - Condition (Object is automatically passed in with _object)
            */
            actions3D[] = {};
        };
    };
};
