/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: CfgLicenses.hpp
 */

class CfgLicenses
{
    class Altis
    {
        class Licenses
        {
            class Legal
            {
                class CivilianGunLicense
                {
                    displayName             = "Firearms Training";
                    requiredLevelCategory   = LEVEL_TOOLSOFTHETRADE;
                    requiredLevel           = 3;
                    price                   = 95000;
                    condition               = "playerSide isEqualTo civ";
                };
                class CivilianCopper
                {
                    displayName           = "Copper Training";
                    requiredLevelCategory = LEVEL_TOOLSOFTHETRADE;
                    requiredLevel         = 1;
                    price                 = 25000;
                    condition             = "playerSide isEqualTo civ";
                };
                class CivilianLumber
                {
                    displayName           = "Lumber Jack Training";
                    requiredLevelCategory = LEVEL_TOOLSOFTHETRADE;
                    requiredLevel         = 1;
                    price                 = 50000;
                    condition             = "playerSide isEqualTo civ";
                };
                class CivilianSugar
                {
                    displayName           = "Sugar Training";
                    requiredLevelCategory = LEVEL_TOOLSOFTHETRADE;
                    requiredLevel         = 1;
                    price                 = 25000;
                    condition             = "playerSide isEqualTo civ";
                };
                class CivilianIron
                {
                    displayName           = "Iron Training";
                    requiredLevelCategory = LEVEL_TOOLSOFTHETRADE;
                    requiredLevel         = 1;
                    price                 = 50000;
                    condition             = "playerSide isEqualTo civ";
                };
                class CivilianSilver
                {
                    displayName           = "Silver Training";
                    requiredLevelCategory = LEVEL_TOOLSOFTHETRADE;
                    requiredLevel         = 2;
                    price                 = 100000;
                    condition             = "playerSide isEqualTo civ";
                };
                class CivilianRocks
                {
                    displayName           = "Rock and Cement Training";
                    requiredLevelCategory = LEVEL_TOOLSOFTHETRADE;
                    requiredLevel         = 1;
                    price                 = 50000;
                    condition             = "playerSide isEqualTo civ";
                };
                class CivilianSand
                {
                    displayName           = "Sand Training";
                    requiredLevelCategory = LEVEL_TOOLSOFTHETRADE;
                    requiredLevel         = 1;
                    price                 = 50000;
                    condition             = "playerSide isEqualTo civ";
                };
                class CivilianSalt
                {
                    displayName           = "Salt Training";
                    requiredLevelCategory = LEVEL_TOOLSOFTHETRADE;
                    requiredLevel         = 1;
                    price                 = 50000;
                    condition             = "playerSide isEqualTo civ";
                };
                class CivilianBeer
                {
                    displayName           = "Beer Brewers Training";
                    requiredLevelCategory = LEVEL_TOOLSOFTHETRADE;
                    requiredLevel         = 2;
                    price                 = 150000;
                    condition             = "playerSide isEqualTo civ";
                };
                class CivilianDiamond
                {
                    displayName           = "Diamond Training";
                    requiredLevelCategory = LEVEL_TOOLSOFTHETRADE;
                    requiredLevel         = 2;
                    price                 = 200000;
                    condition             = "playerSide isEqualTo civ";
                };
                class CivilianTobacco
                {
                    displayName           = "Tobacco Permit";
                    requiredLevelCategory = LEVEL_TOOLSOFTHETRADE;
                    requiredLevel         = 2;
                    price                 = 250000;
                    condition             = "playerSide isEqualTo civ";
                };
            };
            class Illegal
            {
                class CivilianRebel
                {
                    displayName             = "Rebel Training";
                    requiredLevelCategory   = LEVEL_TOOLSOFTHETRADE;
                    requiredLevel           = 3;
                    price                   = 1500000;
                    condition               = "playerSide isEqualTo civilian";
                };
                class CivilianTurtlePoaching
                {
                    displayName             = "Turtle Poaching Training";
                    requiredLevelCategory   = LEVEL_REBELLIOUS;
                    requiredLevel           = 1;
                    price                   = 100000;
                    condition               = "playerSide isEqualTo civilian && {['CivilianRebel'] call GW_client_fnc_licensingHasLicense}";
                };
                class CivilianWeed
                {
                    displayName           = "Marijuana Training";
                    requiredLevelCategory = LEVEL_REBELLIOUS;
                    requiredLevel         = 2;
                    price                 = 500000;
                    condition             = "playerSide isEqualTo civilian && {['CivilianRebel'] call GW_client_fnc_licensingHasLicense}";
                };
                class CivilianEcstacy
                {
                    displayName           = "Ecstacy Lab Training";
                    requiredLevelCategory = LEVEL_REBELLIOUS;
                    requiredLevel         = 2;
                    price                 = 600000;
                    condition             = "playerSide isEqualTo civilian && {['CivilianRebel'] call GW_client_fnc_licensingHasLicense}";
                };
                class CivilianMeth
                {
                    displayName           = "Meth Lab Training";
                    requiredLevelCategory = LEVEL_REBELLIOUS;
                    requiredLevel         = 5;
                    price                 = 2000000;
                    condition             = "playerSide isEqualTo civilian && {['CivilianRebel'] call GW_client_fnc_licensingHasLicense}";
                };
                class CivilianLSD
                {
                    displayName             = "LSD Production Training";
                    requiredLevelCategory   = LEVEL_REBELLIOUS;
                    requiredLevel           = 4;
                    price                   = 850000;
                    condition               = "playerSide isEqualTo civilian && {['CivilianRebel'] call GW_client_fnc_licensingHasLicense}";
                };
                class CivilianHeroin
                {
                    displayName             = "Heroin Production Training";
                    requiredLevelCategory   = LEVEL_REBELLIOUS;
                    requiredLevel           = 5;
                    price                   = 1500000;
                    condition               = "playerSide isEqualTo civilian && {['CivilianRebel'] call GW_client_fnc_licensingHasLicense}";
                };
                class CivilianCocaine
                {
                    displayName             = "Cocaine Production Training";
                    requiredLevelCategory   = LEVEL_REBELLIOUS;
                    requiredLevel           = 4;
                    price                   = 1000000;
                    condition               = "playerSide isEqualTo civilian && {['CivilianRebel'] call GW_client_fnc_licensingHasLicense}";
                };
                class CivilianNaphyrone
                {
                    displayName             = "Naphyrone Production Training";
                    requiredLevelCategory   = LEVEL_REBELLIOUS;
                    requiredLevel           = 4;
                    price                   = 800000;
                    condition               = "playerSide isEqualTo civilian && {['CivilianRebel'] call GW_client_fnc_licensingHasLicense}";
                };
                class CivilianMushrooms
                {
                    displayName             = "Mushrooms Training";
                    requiredLevelCategory   = LEVEL_REBELLIOUS;
                    requiredLevel           = 2;
                    price                   = 650000;
                    condition               = "playerSide isEqualTo civilian && {['CivilianRebel'] call GW_client_fnc_licensingHasLicense}";
                };
                class CivilianCarfentanil
                {
                    displayName             = "Carfentanil Production Training";
                    requiredLevelCategory   = LEVEL_REBELLIOUS;
                    requiredLevel           = 3;
                    price                   = 750000;
                    condition               = "playerSide isEqualTo civilian && {['CivilianRebel'] call GW_client_fnc_licensingHasLicense}";
                };
            };
            class DVLA
            {
                class CivilianDriver
                {
                    displayName             = "Drivers Training";
                    requiredLevelCategory   = -1;
                    requiredLevel           = -1;
                    price                   = 25000;
                    condition               = "playerSide isEqualTo civ";
                };
                class CivilianMaritime
                {
                    displayName             = "Maritime Training";
                    requiredLevelCategory   = LEVEL_VEHICLES;
                    requiredLevel           = 1;
                    price                   = 35000;
                    condition               = "playerSide isEqualTo civ";
                };
                class CivilianAviation
                {
                    displayName             = "Aviation Training";
                    requiredLevelCategory   = LEVEL_VEHICLES;
                    requiredLevel           = 2;
                    price                   = 200000;
                    condition               = "playerSide isEqualTo civ";
                };
            };
        };
    };
    // class Malden
    // {
    //     class Licenses
    //     {
    //         class Legal
    //         {
    //             class CivilianGunLicense
    //             {
    //                 displayName             = "Firearms Training";
    //                 requiredLevelCategory   = LEVEL_TOOLSOFTHETRADE;
    //                 requiredLevel           = 3;
    //                 price                   = 100000;
    //                 condition               = "playerSide isEqualTo civ";
    //             };

    //             // Legal Resources
    //             class CivilianFishing
    //             {
    //                 displayName           = "Fishing Permit";
    //                 requiredLevelCategory = -1;
    //                 requiredLevel         = -1;
    //                 price                 = 25000;
    //                 condition             = "playerSide isEqualTo civ";
    //             };

    //             class CivilianSand
    //             {
    //                 displayName           = "Sand Collection Training";
    //                 requiredLevelCategory = -1;
    //                 requiredLevel         = -1;
    //                 price                 = 25000;
    //                 condition             = "playerSide isEqualTo civ";
    //             };

    //             class CivilianLumber
    //             {
    //                 displayName           = "Lumber Jack Training";
    //                 requiredLevelCategory = -1;
    //                 requiredLevel         = -1;
    //                 price                 = 25000;
    //                 condition             = "playerSide isEqualTo civ";
    //             };

    //             class CivilianScrapmetal
    //             {
    //                 displayName           = "Scrapmetal Training";
    //                 requiredLevelCategory = LEVEL_TOOLSOFTHETRADE;
    //                 requiredLevel         = 5;
    //                 price                 = 50000;
    //                 condition             = "playerSide isEqualTo civ";
    //             };
    //         };
    //         class Illegal
    //         {
    //             class CivilianRebel
    //             {
    //                 displayName             = "Rebel Training";
    //                 requiredLevelCategory   = LEVEL_TOOLSOFTHETRADE;
    //                 requiredLevel           = 2;
    //                 price                   = 500000;
    //                 condition               = "playerSide isEqualTo civ";
    //             };

    //             // Drugs
    //             class CivilianMarijuana
    //             {
    //                 displayName             = "Marijuana Production Training";
    //                 requiredLevelCategory   = LEVEL_TOOLSOFTHETRADE;
    //                 requiredLevel           = 2;
    //                 price                   = 350000;
    //                 condition               = "playerSide isEqualTo civ";
    //             };
    //             class CivilianCocaine
    //             {
    //                 displayName             = "Cocaine Production Training";
    //                 requiredLevelCategory   = LEVEL_TOOLSOFTHETRADE;
    //                 requiredLevel           = 3;
    //                 price                   = 375000;
    //                 condition               = "playerSide isEqualTo civ";
    //             };
    //             class CivilianHeroin
    //             {
    //                 displayName             = "Heroin Production Training";
    //                 requiredLevelCategory   = LEVEL_TOOLSOFTHETRADE;
    //                 requiredLevel           = 4;
    //                 price                   = 425000;
    //                 condition               = "playerSide isEqualTo civ";
    //             };

    //             // Other licenses
    //             class CivilianOil
    //             {
    //                 displayName             = "Oil Robbery Training";
    //                 requiredLevelCategory   = LEVEL_REBELLIOUS;
    //                 requiredLevel           = 5;
    //                 price                   = 300000;
    //                 condition               = "playerSide isEqualTo civ";
    //             };
    //         };
    //         class DVLA
    //         {
    //             class CivilianDriver
    //             {
    //                 displayName             = "Drivers Training";
    //                 requiredLevelCategory   = -1;
    //                 requiredLevel           = -1;
    //                 price                   = 25000;
    //                 condition               = "playerSide isEqualTo civ";
    //             };
    //             class CivilianMaritime
    //             {
    //                 displayName             = "Maritime Training";
    //                 requiredLevelCategory   = LEVEL_VEHICLES;
    //                 requiredLevel           = 2;
    //                 price                   = 35000;
    //                 condition               = "playerSide isEqualTo civ";
    //             };
    //             class CivilianAviation
    //             {
    //                 displayName             = "Aviation Training";
    //                 requiredLevelCategory   = LEVEL_VEHICLES;
    //                 requiredLevel           = 3;
    //                 price                   = 115000;
    //                 condition               = "playerSide isEqualTo civ";
    //             };
    //         };
    //     };
    // };
};
