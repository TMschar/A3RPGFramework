
/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: CfgVirtualItems.hpp
 */

#define true 1
#define false 0

class CfgVirtualItems
{
    class Items
    {
        /**
         * ==================================
         * NORMAL ITEMS
         * ==================================
         */
        class Spikestrip
        {
            displayName   = "Spikestrip";
            condition     = "";
            weight        = 10;
            buy           = 1000;
            sell          = 50;
            illegal       = true;
            icon          = "textures\virtualItems\spikestrips.paa";
            edible        = false;
            function      = "GW_client_fnc_itemsSpikestrip";
        };
        class Coke
        {
            displayName    = "Coke";
            condition      = "";
            weight         = 2;
            buy            = 100;
            sell           = 50;
            illegal        = false;
            icon           = "textures\virtualItems\water.paa";
            edible         = true;
            function       = "GW_client_fnc_itemsEdibles";
            class EdibleProperties
            {
                decrease = 0.4;
                stat     = "thirst";
            };
        };
        class ClubSandwich
        {
            displayName    = "Club Sandwich";
            condition      = "";
            weight         = 2;
            buy            = 100;
            sell           = 50;
            illegal        = false;
            icon           = "textures\virtualItems\sandwich.paa";
            edible         = true;
            function       = "GW_client_fnc_itemsEdibles";
            class EdibleProperties
            {
                decrease = 0.3;
                stat     = "hunger";
            };
        };
        class Coffee
        {
            displayName    = "Black Coffee";
            condition      = "";
            weight         = 2;
            buy            = 100;
            sell           = 50;
            illegal        = false;
            icon           = "textures\virtualItems\water.paa";
            edible         = true;
            function       = "GW_client_fnc_itemsEdibles";
            class EdibleProperties
            {
                decrease = 0.5;
                stat     = "thirst";
            };
        };
        class Tea
        {
            displayName    = "Tea";
            condition      = "";
            weight         = 2;
            buy            = 100;
            sell           = 50;
            illegal        = false;
            icon           = "textures\virtualItems\water.paa";
            edible         = true;
            decrease       = 0.5;
            function       = "GW_client_fnc_itemsEdibles";
            class EdibleProperties
            {
                decrease = 0.5;
                stat     = "thirst";
            };
        };
        class Moneybag
        {
            displayName = "Moneybag";
            condition   = "";
            weight      = 25;
            buy         = 300000;
            sell        = -1;
            illegal     = false;
            icon        = "textures\virtualItems\moneybag.paa";
            edible      = false;
        };
        class VehicleAmmo
        {
            displayName = "Vehicle Ammo";
            condition   = "";
            weight      = 30;
            buy         = 25000;
            sell        = -1;
            illegal     = false;
            icon        = "textures\virtualItems\vehammo.paa";
            edible      = false;
        };
        // class ScrapMetal
        // {
        //     displayName    = "Scrapmetal";
        //     condition      = "";
        //     weight         = 10;
        //     buy            = -1;
        //     sell           = -1;
        //     illegal        = false;
        //     icon           = "";
        //     edible         = false;
        // };
        // class Grape
        // {
        //     displayName    = "Grape";
        //     condition      = "";
        //     weight         = 3;
        //     buy            = 20;
        //     sell           = -1;
        //     illegal        = false;
        //     icon           = "textures\virtualItems\grape.paa";
        //     edible         = true;
        //     function       = "GW_client_fnc_itemsEdibles";
        //     class EdibleProperties
        //     {
        //         decrease = 0.2;
        //         stat     = "hunger";
        //     };
        // };
        // class Strawberry
        // {
        //     displayName    = "Strawberry";
        //     condition      = "";
        //     weight         = 3;
        //     buy            = 20;
        //     sell           = -1;
        //     illegal        = false;
        //     icon           = "textures\virtualItems\strawberry.paa";
        //     edible         = true;
        //     function       = "GW_client_fnc_itemsEdibles";
        //     class EdibleProperties
        //     {
        //         decrease = 0.2;
        //         stat     = "hunger";
        //     };
        // };
        class Handcuffs
        {
            displayName    = "Handcuffs";
            condition      = "";
            weight         = 5;
            buy            = 5000;
            sell           = 50;
            illegal        = true;
            icon           = "textures\virtualItems\handcuffs.paa";
            edible         = false;
        };
        class Lockpick
        {
            displayName    = "Lockpick";
            condition      = "";
            weight         = 5;
            buy            = 1500;
            sell           = 50;
            illegal        = true;
            icon           = "textures\virtualItems\lockpicks.paa";
            edible         = false;
        };
        class Drill
        {
            displayName    = "Drill";
            condition      = "";
            weight         = 5;
            buy            = 100000;
            sell           = -1;
            illegal        = true;
            icon           = "textures\virtualItems\drill.paa";
            edible         = false;
        };
        class Boltcutter
        {
            displayName    = "Boltcutter";
            condition      = "";
            weight         = 5;
            buy            = 150000;
            sell           = -1;
            illegal        = true;
            icon           = "textures\virtualItems\boltcutters.paa";
            edible         = false;
        };
        class Bloodbag
        {
            displayName    = "Bloodbag";
            condition      = "";
            weight         = 3;
            buy            = 2500;
            sell           = -1;
            illegal        = false;
            icon           = "textures\virtualItems\bloodbag.paa";
            edible         = false;
        };

        /**
         * ==================================
         * UNPROCESSED ITEMS
         * ==================================
         */
        class Sand
        {
            displayName    = "Sand";
            condition      = "";
            weight         = 3;
            buy            = -1;
            sell           = -1;
            illegal        = false;
            icon           = "textures\virtualItems\sand.paa";
            edible         = false;
        };
        class CopperOre
        {
            displayName  = "Copper Ore";
            condition    = "";
            weight       = 3;
            buy          = -1;
            sell         = -1;
            illegal      = false;
            icon         = "textures\virtualItems\ore.paa";
            edible       = false;
        };
        class IronOre
        {
            displayName  = "Iron Ore";
            condition    = "";
            weight       = 3;
            buy          = -1;
            sell         = -1;
            illegal      = false;
            icon         = "textures\virtualItems\ore.paa";
            edible       = false;
        };
        class SugarCane
        {
            displayName = "Sugar Cane";
            condition   = "";
            weight      = 3;
            buy         = -1;
            sell        = -1;
            illegal     = false;
            icon        = "textures\virtualItems\sugarcane.paa";
            edible      = false;
        };
        class SilverOre
        {
            displayName = "Silver Ore";
            condition   = "";
            weight      = 3;
            buy         = -1;
            sell        = -1;
            illegal     = false;
            icon        = "textures\virtualItems\ore.paa";
            edible      = false;
        };
        class Hops
        {
            displayName = "Hops";
            condition   = "";
            weight      = 3;
            buy         = -1;
            sell        = -1;
            illegal     = false;
            icon        = "textures\virtualItems\beerhop.paa";
            edible      = false;
        };
        class Barley
        {
            displayName = "Barley";
            condition   = "";
            weight      = 3;
            buy         = -1;
            sell        = -1;
            illegal     = false;
            icon        = "textures\virtualItems\barley.paa";
            edible      = false;
        };
        class DiamondOre
        {
            displayName = "Diamond Ore";
            condition   = "";
            weight      = 3;
            buy         = -1;
            sell        = -1;
            illegal     = false;
            icon        = "textures\virtualItems\ore.paa";
            edible      = false;
        };
        class TobaccoLeaf
        {
            displayName = "Tobacco Leaf";
            condition   = "";
            weight      = 3;
            buy         = -1;
            sell        = -1;
            illegal     = false;
            icon        = "textures\virtualItems\tobaccoLeaf.paa";
            edible      = false;
        };
        class Rock
        {
            displayName = "Rock";
            condition   = "";
            weight      = 3;
            buy         = -1;
            sell        = -1;
            illegal     = false;
            icon        = "textures\virtualItems\rock.paa";
            edible      = false;
        };
        class Salt
        {
            displayName = "Unprocessed Salt";
            condition   =  "";
            weight      = 3;
            buy         = -1;
            sell        = -1;
            illegal     = false;
            icon        = "textures\virtualItems\unprocessedSalt.paa";
            edible      = false;
        };
        class Wood
        {
            displayName    = "Wood";
            condition      = "";
            weight         = 3;
            buy            = -1;
            sell           = -1;
            illegal        = false;
            icon           = "textures\virtualItems\wood.paa";
            edible         = false;
        };
        class Cannabis
        {
            displayName    = "Cannabis";
            condition      = "";
            weight         = 4;
            buy            = -1;
            sell           = -1;
            illegal        = true;
            icon           = "textures\virtualItems\unprocesseddrug.paa";
            edible         = false;
        };
        class EcstacyChemical
        {
            displayName = "Ecstacy Chemical";
            condition   = "";
            weight      = 4;
            buy         = -1;
            sell        = -1;
            illegal     = true;
            icon        = "textures\virtualItems\unprocesseddrug.paa";
            edible      = false;
        };
        class MethChemical
        {
            displayName = "Meth Chemical";
            condition   = "";
            weight      = 4;
            buy         = -1;
            sell        = -1;
            illegal     = true;
            icon        = "textures\virtualItems\unprocesseddrug.paa";
            edible      = false;
        };
        class LSD
        {
            displayName = "Unprocessed LSD";
            condition   = "";
            weight      = 4;
            buy         = -1;
            sell        = -1;
            illegal     = true;
            icon        = "textures\virtualItems\unprocesseddrug.paa";
            edible      = false;
        };
        class Cocaine
        {
            displayName    = "Cocaine";
            condition      = "";
            weight         = 4;
            buy            = -1;
            sell           = -1;
            illegal        = true;
            icon           = "textures\virtualItems\unprocesseddrug.paa";
            edible         = false;
        };
        class Heroin
        {
            displayName    = "Heroin";
            condition      = "";
            weight         = 4;
            buy            = -1;
            sell           = -1;
            illegal        = true;
            icon           = "textures\virtualItems\unprocesseddrug.paa";
            edible         = false;
        };
        class Oil
        {
            displayName    = "Oil";
            condition      = "";
            weight         = 4;
            buy            = -1;
            sell           = -1;
            illegal        = true;
            icon           = "textures\virtualItems\oilcan.paa";
            edible         = false;
        };
        class Carfentanil
        {
            displayName    = "Unprocessed Carfentanil";
            condition      = "";
            weight         = 4;
            buy            = -1;
            sell           = -1;
            illegal        = true;
            icon           = "textures\virtualItems\unprocesseddrug.paa";
            edible         = false;
        };
        class Mushroom
        {
            displayName    = "Unprocessed Mushroom";
            condition      = "";
            weight         = 4;
            buy            = -1;
            sell           = -1;
            illegal        = true;
            icon           = "textures\virtualItems\unprocesseddrug.paa";
            edible         = false;
        };
        class Naphyrone
        {
            displayName    = "Unprocessed Naphyrone";
            condition      = "";
            weight         = 4;
            buy            = -1;
            sell           = -1;
            illegal        = true;
            icon           = "";
            edible         = false;
        };
        class Apple
        {
            displayName    = "Apple";
            condition      = "";
            weight         = 4;
            buy            = 200;
            sell           = 180;
            illegal        = false;
            icon           = "";
            edible         = false;
        };

        /**
         * ==================================
         * PROCESSED ITEMS
         * ==================================
         */
        class Beer
        {
            displayName = "Beer";
            condition   = "";
            weight      = 2;
            buy         = -1;
            sell        = 3700;
            illegal     = false;
            icon        = "";
            edible      = false;
        };
        class RefinedSalt
        {
            displayName = "Refined Salt";
            condition   = "";
            weight      = 2;
            buy         = -1;
            sell        = 1900;
            illegal     = false;
            icon        = "";
            edible      = false;
        };
        class ProcessedDiamond
        {
            displayName = "Processed Diamond";
            condition   = "";
            weight      = 2;
            buy         = -1;
            sell        = 2700;
            illegal     = false;
            icon        = "";
            edible      = false;
        };
        class ProcessedTobacco
        {
            displayName = "Processed Tobacco";
            condition   = "";
            weight      = 2;
            buy         = -1;
            sell        = 3000;
            illegal     = false;
            icon        = "";
            edible      = false;
        };
        class ProcessedSugar
        {
            displayName = "SugarCane";
            condition   = "";
            weight      = 2;
            buy         = -1;
            sell        = 800;
            illegal     = false;
            icon        = "";
            edible      = false;
        };
        class ProcessedRock
        {
            displayName = "Cement";
            condition   = "";
            weight      = 2;
            buy         = -1;
            sell        = 1500;
            illegal     = false;
            icon        = "";
            edible      = false;
        };
        class Silver
        {
            displayName = "Silver";
            condition   = "";
            weight      = 2;
            buy         = -1;
            sell        = 2200;
            illegal     = false;
            icon        = "";
            edible      = false;
        };
        class Iron
        {
            displayName  = "Iron";
            condition    = "";
            weight       = 2;
            buy          = -1;
            sell         = 1300;
            illegal      = false;
            icon         = "";
            edible       = false;
        };
        class Copper
        {
            displayName  = "Copper";
            condition    = "";
            weight       = 2;
            buy          = -1;
            sell         = 900;
            illegal      = false;
            icon         = "textures\virtualItems\ore.paa";
            edible       = false;
        };
        class ProcessedNaphyrone
        {
            displayName    = "Processed Naphyrone";
            condition      = "";
            weight         = 3;
            buy            = -1;
            sell           = 6500;
            illegal        = true;
            icon           = "";
            edible         = false;
        };
        class ProcessedMeth
        {
            displayName   = "Processed Meth";
            condition     = "";
            weight        = 3;
            buy           = -1;
            sell          = 11500;
            illegal       = true;
            icon          = "";
            edible        = false;
        };
        class ProcessedCarfentanil
        {
            displayName   = "Processed Carfentanil";
            condition     = "";
            weight        = 3;
            buy           = -1;
            sell          = 6000;
            illegal       = true;
            icon          = "";
            edible        = false;
        };
        class FruitSalad
        {
            displayName    = "Fruit Salad";
            condition      = "";
            weight         = 2;
            buy            = 1050;
            sell           = 1000;
            illegal        = false;
            icon           = "textures\virtualItems\fruitsalad.paa";
            edible         = true;
            function       = "GW_client_fnc_itemsEdibles";
            class EdibleProperties
            {
                decrease = 0.7;
                stat     = "hunger";
            };
        };
        class Glass
        {
            displayName    = "Glass";
            condition      = "";
            weight         = 2;
            buy            = -1;
            sell           = 1400;
            illegal        = false;
            icon           = "textures\virtualItems\glass.paa";
            edible         = false;
        };
        class Lumber
        {
            displayName    = "Lumber";
            condition      = "";
            weight         = 2;
            buy            = -1;
            sell           = 1000;
            illegal        = false;
            icon           = "textures\virtualItems\lumber.paa";
            edible         = false;
        };
        class Marijuana
        {
            displayName    = "Marijuana";
            condition      = "";
            weight         = 3;
            buy            = -1;
            sell           = 4000;
            illegal        = true;
            icon           = "textures\virtualItems\marijuana.paa";
            edible         = false;
        };
        class ProcessedCocaine
        {
            displayName    = "Processed Cocaine";
            condition      = "";
            weight         = 3;
            buy            = -1;
            sell           = 8500;
            illegal        = true;
            icon           = "textures\virtualItems\cocain.paa";
            edible         = false;
        };
        class ProcessedHeroin
        {
            displayName    = "Processed Heroin";
            condition      = "";
            weight         = 3;
            buy            = -1;
            sell           = 9000;
            illegal        = true;
            icon           = "textures\virtualItems\heroin.paa";
            edible         = false;
        };
        class ProcessedOil
        {
            displayName    = "Benzine";
            condition      = "";
            weight         = 3;
            buy            = -1;
            sell           = 15000;
            illegal        = true;
            icon           = "textures\virtualItems\oilbarrel.paa";
            edible         = false;
        };
        class ProcessedEcstacy
        {
            displayName    = "Processed Ecstacy";
            condition      = "";
            weight         = 3;
            buy            = -1;
            sell           = 4500;
            illegal        = true;
            icon           = "";
            edible         = false;
        };
        class ProcessedLSD
        {
            displayName    = "Processed LSD";
            condition      = "";
            weight         = 3;
            buy            = -1;
            sell           = 7500;
            illegal        = true;
            icon           = "";
            edible         = false;
        };
        class ProcessedMushrooms
        {
            displayName    = "Processed Mushrooms";
            condition      = "";
            weight         = 3;
            buy            = -1;
            sell           = 5500;
            illegal        = true;
            icon           = "";
            edible         = false;
        };

        /**
         * ==================================
         * FISHING
         * ==================================
         */
        class FishSalema
        {
            displayName    = "Raw Salema";
            condition      = "";
            weight         = 4;
            buy            = -1;
            sell           = 100;
            illegal        = false;
            icon           = "textures\virtualItems\fish.paa";
            edible         = false;
        };
        class FishOrnate
        {
            displayName    = "Raw Ornate";
            condition      = "";
            weight         = 4;
            buy            = -1;
            sell           = 130;
            illegal        = false;
            icon           = "textures\virtualItems\fish.paa";
            edible         = false;
        };
        class FishMackerel
        {
            displayName    = "Raw Mackerel";
            condition      = "";
            weight         = 4;
            buy            = -1;
            sell           = 180;
            illegal        = false;
            icon           = "textures\virtualItems\fish.paa";
            edible         = false;
        };
        class FishTuna
        {
            displayName    = "Raw Tuna";
            condition      = "";
            weight         = 4;
            buy            = -1;
            sell           = 200;
            illegal        = false;
            icon           = "textures\virtualItems\fish.paa";
            edible         = false;
        };
        class FishMullet
        {
            displayName    = "Raw Mullet";
            condition      = "";
            weight         = 4;
            buy            = -1;
            sell           = 230;
            illegal        = false;
            icon           = "textures\virtualItems\fish.paa";
            edible         = false;
        };
        class FishCatshark
        {
            displayName    = "Raw Catshark";
            condition      = "";
            weight         = 4;
            buy            = -1;
            sell           = 380;
            illegal        = false;
            icon           = "textures\virtualItems\fish.paa";
            edible         = false;
        };
        class FishTurtle
        {
            displayName = "Raw Turtle";
            condition   = "";
            weight      = 4;
            buy         = -1;
            sell        = 800;
            illegal     = false;
            icon        = "textures\virtualItems\turtle.paa";
            edible      = false;
        };
    };

    /**
     * Items Array:
     *     0: Item Class
     *     1: Override Purchase Price
     *     2: Override Sell Price
     *     3: Condition
     */
    class Shops
    {
        class Altis
        {
            /**
             * Traders
             */
            class CopperTrader
            {
                displayName = "Copper Trader";
                condition   = "playerSide isEqualTo civilian";
                items[]     = {{"Copper", -1, -1, ""}};
            };
            class CementTrader
            {
                displayName = "Cement Trader";
                condition   = "playerSide isEqualTo civilian";
                items[]     = {{"ProcessedRock", -1, -1, ""}};
            };
            class SaltTrader
            {
                displayName = "Salt Trader";
                condition   = "playerSide isEqualTo civilian";
                items[]     = {{"RefinedSalt", -1, -1, ""}};
            };
            class TobaccoTrader
            {
                displayName = "Tobacco Trader";
                condition   = "playerSide isEqualTo civilian";
                items[]     = {{"ProcessedTobacco", -1, -1, ""}};
            };
            class BeerTrader
            {
                displayName = "Beer Trader";
                condition   = "playerSide isEqualTo civilian";
                items[]     = {{"Beer", -1, -1, ""}};
            };
            class GlassTrader
            {
                displayName = "Glass Trader";
                condition   = "playerSide isEqualTo civilian";
                items[]     = {{"Glass", -1, -1, ""}};
            };
            class LumberTrader
            {
                displayName = "Lumber Trader";
                condition   = "playerSide isEqualTo civilian";
                items[]     = {{"Lumber", -1, -1, ""}};
            };
            class DiamondTrader
            {
                displayName = "Diamond Trader";
                condition   = "playerSide isEqualTo civilian";
                items[]     = {{"ProcessedDiamond", -1, -1, ""}};
            };
            class SugarTrader
            {
                displayName = "Sugar Trader";
                condition   = "playerSide isEqualTo civilian";
                items[]     = {{"ProcessedSugar", -1, -1, ""}};
            };
            class OilTrader
            {
                displayName = "Oil Trader";
                condition   = "playerSide isEqualTo civilian";
                items[]     = {{"ProcessedOil", -1, -1, ""}};
            };
            class SilverTrader
            {
                displayName = "Silver Trader";
                condition   = "playerSide isEqualTo civilian";
                items[]     = {{"Silver", -1, -1, ""}};
            };
            class IronTrader
            {
                displayName = "Iron Trader";
                condition   = "playerSide isEqualTo civilian";
                items[]     = {{"Iron", -1, -1, ""}};
            };

            /**
             * Shops
             */
            class Police
            {
                displayName = "Royal Military Police Items";
                condition   = "playerSide isEqualTo west";
                items[]     =
                {
                    {"Coke",         0, 0, ""},
                    {"ClubSandwich", 0, 0, ""},
                    {"Coffee",       0, 0, ""},
                    {"Tea",          0, 0, ""},
                    {"Bloodbag",     0, 0, ""},
                    {"Lockpick",     0, 0, ""},
                    {"VehicleAmmo",  0, 0, ""},
                    {"Spikestrip",   0, 0, ""}
                };
            };
            class PoliceFridge
            {
                displayName = "Royal Military Police Fridge";
                condition   = "playerSide isEqualTo west";
                items[]     =
                {
                    {"Coke",         0, 0, ""},
                    {"ClubSandwich", 0, 0, ""},
                    {"Coffee",       0, 0, ""},
                    {"Tea",          0, 0, ""}
                };
            };
            class CivMarket
            {
                displayName = "Market";
                condition   = "playerSide isEqualTo civilian";
                items[]     =
                {
                    {"Apple",        -1, -1, ""},
                    {"Coke",         -1, -1, ""},
                    {"Coffee",       -1, -1, ""},
                    {"Tea",          -1, -1, ""},
                    {"ClubSandwich", -1, -1, ""},
                    {"FruitSalad",   -1, -1, ""},
                    {"Lockpick",     -1, -1, ""}
                };
            };
            class DrugDealer
            {
                displayName = "Drug Dealer";
                condition   = "playerSide isEqualTo civilian";
                items[]     =
                {
                    {"Marijuana",            -1, -1, ""},
                    {"ProcessedCocaine",     -1, -1, ""},
                    {"ProcessedHeroin",      -1, -1, ""},
                    {"ProcessedMushrooms",   -1, -1, ""},
                    {"ProcessedEcstacy",     -1, -1, ""},
                    {"ProcessedLSD",         -1, -1, ""},
                    {"ProcessedOil",         -1, -1, ""},
                    {"ProcessedCarfentanil", -1, -1, ""},
                    {"ProcessedMeth",        -1, -1, ""},
                    {"ProcessedNaphyrone",   -1, -1, ""}
                };
            };
            class Rebel
            {
                displayName = "Rebel Items";
                condition   = "playerSide isEqualTo civilian && {['CivilianRebel'] call GW_client_fnc_licensingHasLicense}";
                items[]     =
                {
                    {"Coke",         -1, -1, ""},
                    {"ClubSandwich", -1, -1, ""},
                    {"Lockpick",     -1, -1, ""},
                    {"Handcuffs",    -1, -1, ""},
                    {"Boltcutter",   -1, -1, ""},
                    {"Drill",        -1, -1, ""},
                    {"VehicleAmmo",  -1, -1, ""},
                    {"Spikestrip",   -1, -1, ""}
                };
            };
            class IHAS
            {
                displayName = "IHAS Supplies";
                condition   = "playerSide isEqualTo independent";
                items[]     =
                {
                    {"Coke",         0, 0, ""},
                    {"ClubSandwich", 0, 0, ""},
                    {"Coffee",       0, 0, ""},
                    {"Tea",          0, 0, ""},
                    {"Bloodbag",     0, 0, ""},
                    {"Lockpick",     0, 0, ""}
                };
            };
        };
        // class Malden
        // {
        //     class Police
        //     {
        //         displayName = "Royal Military Police Items";
        //         condition   = "playerSide isEqualTo west";
        //         items[]     =
        //         {
        //             {"Coke",         0, 0, ""},
        //             {"ClubSandwich", 0, 0, ""},
        //             {"Coffee",       0, 0, ""},
        //             {"Tea",          0, 0, ""},
        //             {"Bloodbag",     0, 0, ""},
        //             {"Lockpick",     0, 0, ""},
        //             {"VehicleAmmo",  0, 0, ""}
        //         };
        //     };
        //     class PoliceFridge
        //     {
        //         displayName = "RMP Fridge";
        //         condition   = "playerSide isEqualTo west";
        //         items[]     =
        //         {
        //             {"Coke",         0, 0, ""},
        //             {"ClubSandwich", 0, 0, ""},
        //             {"Coffee",       0, 0, ""},
        //             {"Tea",          0, 0, ""}
        //         };
        //     };
        //     class IHAS
        //     {
        //         displayName = "IHAS Supplies";
        //         condition   = "playerSide isEqualTo independent";
        //         items[]     =
        //         {
        //             {"Coke",         0, 0, ""},
        //             {"ClubSandwich", 0, 0, ""},
        //             {"Coffee",       0, 0, ""},
        //             {"Tea",          0, 0, ""},
        //             {"Bloodbag",     0, 0, ""},
        //             {"Lockpick",     0, 0, ""}
        //         };
        //     };
        //     class CivMarket
        //     {
        //         displayName = "Market";
        //         condition   = "playerSide isEqualTo civilian";
        //         items[]     =
        //         {
        //             {"Coke",         -1, -1, ""},
        //             {"ClubSandwich", -1, -1, ""},
        //             {"Grape",        -1, -1, ""},
        //             {"Strawberry",   -1, -1, ""},
        //             {"FruitSalad",   -1, -1, ""},
        //             {"Lockpick",     -1, -1, ""}
        //         };
        //     };
        //     class Rebel
        //     {
        //         displayName = "Rebel Items";
        //         condition   = "playerSide isEqualTo civilian && {['CivilianRebel'] call GW_client_fnc_licensingHasLicense}";
        //         items[]     =
        //         {
        //             {"Coke",         -1, -1, ""},
        //             {"ClubSandwich", -1, -1, ""},
        //             {"Lockpick",     -1, -1, ""},
        //             {"Handcuffs",    -1, -1, ""},
        //             {"Boltcutter",   -1, -1, ""},
        //             {"Drill",        -1, -1, ""},
        //             {"VehicleAmmo",  -1, -1, ""}
        //         };
        //     };

        //     // Traders
        //     class Glass
        //     {
        //         displayName = "Market";
        //         condition   = "playerSide isEqualTo civilian";
        //         items[]     = {{"Glass", -1, -1, ""}};
        //     };
        //     class Lumber
        //     {
        //         displayName = "Lumber Trader";
        //         condition   = "playerSide isEqualTo civilian";
        //         items[]     = {{"Lumber", -1, -1, ""}};
        //     };
        //     class Benzine
        //     {
        //         displayName = "Benzine Trader";
        //         condition   = "playerSide isEqualTo civilian";
        //         items[]     = {{"ProcessedOil", -1, -1, ""}};
        //     };
        //     class DrugDealer
        //     {
        //         displayName = "Drug Dealer";
        //         condition   = "playerSide isEqualTo civilian";
        //         items[]     =
        //         {
        //             {"Marijuana",         -1, -1, ""},
        //             {"ProcessedCocaine",  -1, -1, ""},
        //             {"ProcessedHeroin",   -1, -1, ""}
        //         };
        //     };
        // };
    };
};
