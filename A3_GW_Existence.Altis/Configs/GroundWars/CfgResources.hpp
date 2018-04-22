/**
* Copyright (c) 2017 SimZor, SimZor Studios
* All Rights Reserved
*
* Filename: CfgResources.hpp
*/

// Define types
#define TYPE_PICK 0
#define TYPE_WOOD 1
#define TYPE_MINE 2
#define TYPE_FISH 3

#define true 1
#define false 0

class CfgResources
{
    class FishingSpots
    {
        // class Malden
        // {
        //     /**
        //      * Fishing Area Class
        //      *     STRING  : displayName     - the name that will show above area
        //      *     STRING  : licenseRequired - the required
        //      *     ARRAY   : markers         - array with markers for said area
        //      *     BOOLEAN : illegal         - if the resource is illegal
        //      *     ARRAY   : fishTypes       - the possible fish types to catch
        //      *     STRING  : icon            - icon that will be displayed on nametag
        //      *     NUMBER  : radius          - the radius that fishing in resource will be available
        //      *     NUMBER  : fishAmount      - the maximum amount of fish a player can get per gather
        //      *     FishTypes Class
        //      *         STRING : displayName    - the display name of the fish type
        //      *         STRING : representsItem - the item to give the player
        //      */
        //     class LePort
        //     {
        //         displayName     = "Le Port Fishing Area";
        //         title           = "Le Port Fishing Area";
        //         license         = "CivilianFishing";
        //         markers[]       = {"leport_fishingarea"};
        //         illegal         = false;
        //         icon            = "";
        //         radius          = 50;
        //         fishAmount      = 5;
        //         class FishTypes
        //         {
        //             class Salema_F
        //             {
        //                 displayName    = "Salema";
        //                 representsItem = "FishSalema";
        //             };
        //             class Ornate_Random_F
        //             {
        //                 displayName    = "Ornate";
        //                 representsItem = "FishOrnate";
        //             };
        //             class Mackerel_F
        //             {
        //                 displayName    = "Salema";
        //                 representsItem = "FishMackerel";
        //             };
        //             class Tuna_F
        //             {
        //                 displayName    = "Salema";
        //                 representsItem = "FishTuna";
        //             };
        //             class Mullet_F
        //             {
        //                 displayName    = "Salema";
        //                 representsItem = "FishMullet";
        //             };
        //             class Catshark_F
        //             {
        //                 displayName    = "Salema";
        //                 representsItem = "FishCatshark";
        //             };
        //         };
        //     };
        // };
        class Altis
        {
            /**
             * Fishing Area Class
             *     STRING  : displayName     - the name that will show above area
             *     STRING  : licenseRequired - the required
             *     ARRAY   : markers         - array with markers for said area
             *     BOOLEAN : illegal         - if the resource is illegal
             *     ARRAY   : fishTypes       - the possible fish types to catch
             *     STRING  : icon            - icon that will be displayed on nametag
             *     NUMBER  : radius          - the radius that fishing in resource will be available
             *     NUMBER  : fishAmount      - the maximum amount of fish a player can get per gather
             *     FishTypes Class
             *         STRING : displayName    - the display name of the fish type
             *         STRING : representsItem - the item to give the player
             */
            class Kavala
            {
                displayName     = "Kavala Fishing Area";
                title           = "Kavala Fishing Area";
                license         = "CivilianFishing";
                markers[]       = {"fishingarea_kavala"};
                illegal         = false;
                icon            = "";
                radius          = 50;
                fishAmount      = 5;
                class FishTypes
                {
                    class Salema_F
                    {
                        displayName    = "Salema";
                        representsItem = "FishSalema";
                    };
                    class Ornate_Random_F
                    {
                        displayName    = "Ornate";
                        representsItem = "FishOrnate";
                    };
                    class Mackerel_F
                    {
                        displayName    = "Salema";
                        representsItem = "FishMackerel";
                    };
                    class Tuna_F
                    {
                        displayName    = "Salema";
                        representsItem = "FishTuna";
                    };
                    class Mullet_F
                    {
                        displayName    = "Salema";
                        representsItem = "FishMullet";
                    };
                    class Catshark_F
                    {
                        displayName    = "Salema";
                        representsItem = "FishCatshark";
                    };
                };
            };
            class Negades
            {
                displayName = "Turtle Poaching Area";
                title       = "Turtle Poaching Area";
                license     = "CivilianTurtlePoaching";
                markers[]   = {"fishingarea_turtles_negades"};
                illegal     = "true";
                icon        = "";
                radius      = 100;
                fishAmount  = 5;
                class FishTypes
                {
                    class Turtle_F
                    {
                        displayName    = "Turtle";
                        representsItem = "FishTurtle";
                    };
                };
            };
        };
    };
    class Fields
    {
        class Altis
        {
            class Apples
            {
                title       = "Apple Trees";
                displayName = "Picking Apples";
                type        = TYPE_PICK;
                markers[]   = {
                    "apple_field",
                    "apple_field_1",
                    "apple_field_2",
                    "apple_field_3"
                };
                itemsGive[] = { "Apple" };
                itemAmount  = 3;
                radius      = 50;
                license     = "";
                illegal     = false;
                icon        = "";
            };
            class Copper
            {
                title       = "Copper Field";
                displayName = "Mining Copper";
                type        = TYPE_MINE;
                markers[]   = { "copper_mine_kavala" };
                itemsGive[] = { "CopperOre" };
                itemAmount  = 3;
                radius      = 50;
                license     = "CivilianCopper";
                illegal     = false;
                icon        = "";
            };
            class Lumber
            {
                title       = "Lumber Field";
                displayName = "Cutting Trees";
                type        = TYPE_WOOD;
                markers[]   = { "lumber_field", "lumber_field_1", "lumber_field_2" };
                itemsGive[] = { "wood" };
                itemAmount  = 3;
                radius      = 50;
                license     = "CivilianLumber";
                illegal     = false;
                icon        = "";
                class TreeProperties
                {
                    trees[] = {
                        "b_ficusc1s_f.p3d",
                        "t_ficusb2s_f.p3d",
                        "t_pinuss2s_b_f.p3d",
                        "t_pinuss2s_f.p3d",
                        "t_broussonetiap1s_f.p3d",
                        "t_oleae2s_f.p3d",
                        "t_pinusp3s_f.p3d"
                    };
                };
            };
            class Sugar
            {
                title       = "Sugar Field";
                displayName = "Gathering Sugar Canes";
                type        = TYPE_PICK;
                markers[]   = { "sugar_field_1" };
                itemsGive[] = { "SugarCane" };
                itemAmount  = 3;
                radius      = 50;
                license     = "CivilianSugar";
                illegal     = false;
                icon        = "";
            };
            class Iron
            {
                title       = "Iron Mine";
                displayName = "Mining Iron";
                type        = TYPE_MINE;
                markers[]   = { "iron_mine_field" };
                itemsGive[] = { "IronOre" };
                itemAmount  = 3;
                radius      = 50;
                license     = "CivilianIron";
                illegal     = false;
                icon        = "";
            };
            class Silver
            {
                title       = "Silver Mine";
                displayName = "Mining Silver";
                type        = TYPE_MINE;
                markers[]   = { "silver_mine" };
                itemsGive[] = { "SilverOre" };
                itemAmount  = 3;
                radius      = 50;
                license     = "CivilianSilver";
                illegal     = false;
                icon        = "";
            };
            class RockQuarry
            {
                title       = "Rock Quarry";
                displayName = "Mining Rocks";
                type        = TYPE_MINE;
                markers[]   = { "rocks_mine" };
                itemsGive[] = { "Rock" };
                itemAmount  = 3;
                radius      = 50;
                license     = "CivilianRocks";
                illegal     = false;
                icon        = "";
            };
            class Sand
            {
                title       = "Sand Dune";
                displayName = "Digging Sand";
                type        = TYPE_PICK;
                markers[]   = { "sand_gather_field" };
                itemsGive[] = { "Sand" };
                itemAmount  = 3;
                radius      = 50;
                license     = "CivilianSand";
                illegal     = false;
                icon        = "";
            };
            class Salt
            {
                title       = "Salt Mine";
                displayName = "Mining Salt";
                type        = TYPE_MINE;
                markers[]   = { "salt_field" };
                itemsGive[] = { "Salt" };
                itemAmount  = 3;
                radius      = 50;
                license     = "CivilianSalt";
                illegal     = false;
                icon        = "";
            };
            class Hops
            {
                title       = "Hops Field";
                displayName = "Gathering Hops";
                type        = TYPE_PICK;
                markers[]   = { "hops_field" };
                itemsGive[] = { "Hops" };
                itemAmount  = 3;
                radius      = 50;
                license     = "CivilianBeer";
                illegal     = false;
                icon        = "";
            };
            class Barley
            {
                title       = "Barley Field";
                displayName = "Gathering Barley";
                type        = TYPE_PICK;
                markers[]   = { "barley_field" };
                itemsGive[] = { "Barley" };
                itemAmount  = 3;
                radius      = 50;
                license     = "CivilianBeer";
                illegal     = false;
                icon        = "";
            };
            class Diamond
            {
                title       = "Diamond Mine";
                displayName = "Mining Diamonds";
                type        = TYPE_MINE;
                markers[]   = { "diamond_mine" };
                itemsGive[] = { "DiamondOre" };
                radius      = 50;
                itemAmount  = 3;
                license     = "CivilianDiamond";
                illegal     = false;
                icon        = "";
            };
            class Tobacco
            {
                title       = "Tobacco Field";
                displayName = "Picking Tobacco";
                type        = TYPE_PICK;
                markers[]   = { "tobacco_field" };
                itemsGive[] = { "TobaccoLeaf" };
                radius      = 50;
                itemAmount  = 3;
                license     = "CivilianTobacco";
                illegal     = false;
                icon        = "";
            };
            class Weed
            {
                title       = "Weed Field";
                displayName = "Gathering Cannabis";
                type        = TYPE_PICK;
                markers[]   = { "weed_field" };
                itemsGive[] = { "Cannabis" };
                radius      = 50;
                itemAmount  = 3;
                license     = "CivilianWeed";
                illegal     = true;
                icon        = "";
            };
            class Ecstacy
            {
                title       = "Ecstacy Chemical Plant";
                displayName = "Gathering Ecstacy Chemicals";
                type        = TYPE_PICK;
                markers[]   = { "ecstacy_field" };
                itemsGive[] = { "Ecstacy" };
                radius      = 50;
                itemAmount  = 3;
                license     = "CivilianEcstacy";
                illegal     = true;
                icon        = "";
            };
            class Meth
            {
                title       = "Meth Chemical Plant";
                displayName = "Gathering Meth Chemicals";
                type        = TYPE_PICK;
                markers[]   = { "meth_field" };
                itemsGive[] = { "MethChemical" };
                radius      = 50;
                itemAmount  = 3;
                license     = "CivilianMeth";
                illegal     = true;
                icon        = "";
            };
            class LSD
            {
                title       = "LSD Field";
                displayName = "Gathering LSD";
                type        = TYPE_PICK;
                markers[]   = { "lsd_field" };
                itemsGive[] = { "LSD" };
                radius      = 50;
                itemAmount  = 3;
                license     = "CivilianLSD";
                illegal     = true;
                icon        = "";
            };
            class Heroin
            {
                title       = "Heroin Field";
                displayName = "Gathering Heroin";
                type        = TYPE_PICK;
                markers[]   = { "heroin_field" };
                itemsGive[] = { "Heroin" };
                radius      = 50;
                itemAmount  = 3;
                license     = "CivilianHeroin";
                illegal     = true;
                icon        = "";
            };
            class Cocaine
            {
                title       = "Cocaine Field";
                displayName = "Gathering Cocaine";
                type        = TYPE_PICK;
                markers[]   = { "cocaine_field" };
                itemsGive[] = { "Cocaine" };
                radius      = 50;
                itemAmount  = 3;
                license     = "CivilianCocaine";
                illegal     = true;
                icon        = "";
            };
            class Mushrooms
            {
                title       = "Mushroom Field";
                displayName = "Picking Mushrooms";
                type        = TYPE_PICK;
                markers[]   = { "mushroom_field" };
                itemsGive[] = { "Mushroom" };
                radius      = 50;
                itemAmount  = 3;
                license     = "CivilianMushrooms";
                illegal     = true;
                icon        = "";
            };
            class Naphyrone
            {
                title       = "Naphyrone Field";
                displayName = "Gathering Naphyrone";
                type        = TYPE_PICK;
                markers[]   = { "naphyrone_field" };
                itemsGive[] = { "Naphyrone" };
                itemAmount  = 3;
                license     = "CivilianNaphyrone";
                illegal     = true;
                icon        = "";
                radius      = 50;
            };
            class Carfentanil
            {
                title       = "Carfentanil Field";
                displayName = "Gathering Carfentanil";
                type        = TYPE_PICK;
                markers[]   = { "carfentanil_field" };
                itemsGive[] = { "Carfentanil" };
                license     = "CivilianCarfentanil";
                itemAmount  = 3;
                illegal     = true;
                icon        = "";
                radius      = 50;
            };
        };
        // class Malden
        // {
        //     class GrapeVine
        //     {
        //         title        = "Grape Vine Field";
        //         displayName  = "Picking Grapes";
        //         type         = TYPE_PICK;
        //         markers[]    = {"grapevine_field_1", "grapevine_field_2", "grapevine_field_3"};
        //         itemsGive[]  = {"grape"};
        //         itemAmount   = 3;
        //         radius       = 50;
        //         license      = "";
        //         illegal      = false;
        //         icon         = "Textures\icons\grape.paa";
        //     };
        //     class Strawberries
        //     {
        //         title        = "Strawberry Field";
        //         displayName  = "Picking Strawberries";
        //         type         = TYPE_PICK;
        //         markers[]    = {"strawberry_field_1", "strawberry_field_2", "strawberry_field_3"};
        //         itemsGive[]  = {"strawberry"};
        //         itemAmount   = 3;
        //         radius       = 50;
        //         license      = "";
        //         illegal      = false;
        //         icon         = "Textures\icons\strawberry.paa";
        //     };
        //     class Lumber
        //     {
        //         title        = "Wood Area";
        //         displayName  = "Cutting down trees";
        //         type         = TYPE_WOOD;
        //         markers[]    = {"lumber_field_1", "lumber_field_2"};
        //         itemsGive[]  = {"wood"};
        //         itemAmount   = 3;
        //         radius       = 50;
        //         license      = "CivilianLumber";
        //         illegal      = false;
        //         icon         = "Textures\icons\lumber.paa";

        //     };
        //     class Cannabis
        //     {
        //         title        = "Cannabis Farm";
        //         displayName  = "Picking Cannabis";
        //         type         = TYPE_PICK;
        //         markers[]    = {"cannabis_field_1"};
        //         itemsGive[]  = {"cannabis"};
        //         itemAmount   = 3;
        //         radius       = 80;
        //         license      = "CivilianMarijuana";
        //         illegal      = true;
        //         icon         = "Textures\icons\marijuana.paa";
        //     };
        //     class Cocaine
        //     {
        //         title        = "Cocaine Farm";
        //         displayName  = "Picking Cocaine";
        //         type         = TYPE_PICK;
        //         markers[]    = {"coca_field_1"};
        //         itemsGive[]  = {"cocaine"};
        //         itemAmount   = 3;
        //         radius       = 50;
        //         license      = "CivilianCocaine";
        //         illegal      = true;
        //         icon         = "Textures\icons\marijuana.paa";
        //     };
        //     class Heroin
        //     {
        //         title        = "Heroin Farm";
        //         displayName  = "Picking Heroin";
        //         type         = TYPE_PICK;
        //         markers[]    = {"heroin_field_1"};
        //         itemsGive[]  = {"heroin"};
        //         itemAmount   = 3;
        //         radius       = 50;
        //         license      = "CivilianHeroin";
        //         illegal      = true;
        //         icon         = "Textures\icons\heroin.paa";
        //     };
        //     class ScrapMetal
        //     {
        //         title        = "Scrapmetals";
        //         displayName  = "Picking up metals";
        //         type         = TYPE_PICK;
        //         markers[]    = {"scrapmetal"};
        //         itemsGive[]  = {"scrapmetal"};
        //         itemAmount   = 3;
        //         radius       = 20;
        //         license      = "CivilianScrapmetal";
        //         illegal      = true;
        //         icon         = "Textures\icons\oilbarrel.paa";
        //     };
        // };
    };
    class Processing
    {
        class Altis
        {
            class Copper
            {
                displayName       = "Processing Copper";
                items[]           = { { "CopperOre", 1 } };
                itemsGive[]       = { { "Copper", 1 } };
                license           = "CivilianCopper";
            };
            class Sand
            {
                displayName       = "Processing Sand";
                items[]           = { { "Sand", 1 } };
                itemsGive[]       = { { "Glass", 1 } };
                license           = "CivilianSand";
            };
            class Iron
            {
                displayName       = "Processing Iron";
                items[]           = { { "IronOre", 1 } };
                itemsGive[]       = { { "Iron", 1 } };
                license           = "CivilianIron";
            };
            class Silver
            {
                displayName       = "Processing Silver";
                items[]           = { { "SilverOre", 1 } };
                itemsGive[]       = { { "Silver", 1 } };
                license           = "CivilianSilver";
            };
            class Rocks
            {
                displayName       = "Making Cement";
                items[]           = { { "Rocks", 1 } };
                itemsGive[]       = { { "ProcessedRock", 1 } };
                license           = "CivilianRocks";
            };
            class Lumber
            {
                displayName       = "Cutting Rolls of Wood";
                items[]           = { { "Wood", 1 } };
                itemsGive[]       = { { "Lumber", 1 } };
                license           = "CivilianLumber";
            };
            class Sugar
            {
                displayName       = "Processing Sugar";
                items[]           = { { "SugarCane", 1 } };
                itemsGive[]       = { { "ProcessedSugar", 1 } };
                license           = "CivilianSugar";
            };
            class Tobacco
            {
                displayName       = "Processing Tobacco";
                items[]           = { { "TobaccoLeaf", 1 } };
                itemsGive[]       = { { "ProcessedTobacco", 1 } };
                license           = "CivilianTobacco";
            };
            class Diamond
            {
                displayName       = "Processing Diamonds";
                items[]           = { { "DiamondOre", 1 } };
                itemsGive[]       = { { "ProcessedDiamond", 1 } };
                license           = "CivilianDiamond";
            };
            class Salt
            {
                displayName       = "Processing Salt";
                items[]           = { { "Salt", 1 } };
                itemsGive[]       = { { "RefinedSalt", 1 } };
                license           = "CivilianSalt";
            };
            class Beer
            {
                displayName       = "Processing Beer";
                items[]           = { { "Hops", 1 }, { "Barley", 1 } };
                itemsGive[]       = { { "Beer", 1} };
                license           = "CivilianBeer";
            };

            /**
             * Illegal Processors
             */
            class Ecstacy
            {
                displayName       = "Processing Ecstacy";
                items[]           = { { "EcstacyChemical", 1 } };
                itemsGive[]       = { { "ProcessedEcstacy", 1 } };
                license           = "CivilianEcstacy";
            };
            class Heroin
            {
                displayName       = "Processing Heroin";
                items[]           = {{"Heroin", 1}};
                itemsGive[]       = {{"ProcessedHeroin", 1}};
                license           = "CivilianHeroin";
            };
            class Weed
            {
                displayName       = "Processing Weed";
                items[]           = {{"Cannabis", 1}};
                itemsGive[]       = {{"Marijuana", 1}};
                license           = "CivilianWeed";
            };
            class LSD
            {
                displayName       = "Processing LSD";
                items[]           = {{"LSD", 1}};
                itemsGive[]       = {{"ProcessedLSD", 1}};
                license           = "CivilianLSD";
            };
            class Cocaine
            {
                displayName       = "Processing Cocaine";
                items[]           = {{"Cocaine", 1}};
                itemsGive[]       = {{"ProcessedCocaine", 1}};
                license           = "CivilianCocaine";
            };
            class Carfentanil
            {
                displayName       = "Processing Carfentanil";
                items[]           = {{"Carfentanil", 1}};
                itemsGive[]       = {{"ProcessedCarfentanil", 1}};
                license           = "CivilianCarfentanil";
            };
            class Meth
            {
                displayName       = "Processing Methamphetamine";
                items[]           = {{"MethChemical", 1}};
                itemsGive[]       = {{"ProcessedMeth", 1}};
                license           = "CivilianMeth";
            };
            class Oil
            {
                displayName       = "Processing Oil";
                items[]           = {{"Oil", 1}};
                itemsGive[]       = {{"ProcessedOil", 1}};
                license           = "CivilianOil";
            };
            class Mushrooms
            {
                displayName       = "Processing Mushrooms";
                items[]           = {{"Mushroom", 1}};
                itemsGive[]       = {{"ProcessedMushrooms", 1}};
                license           = "CivilianMushrooms";
            };
            class Naphyrone
            {
                displayName       = "Processing Naphryone";
                items[]           = {{"Naphyrone", 1}};
                itemsGive[]       = {{"ProcessedNaphyrone", 1}};
                license           = "CivilianNaphyrone";
            };
        };
        // class Malden
        // {
        //     class Fruit
        //     {
        //         displayName     = "Making Fruit Sallad";
        //         items[]         = {{"Grape", 3}, {"Strawberry", 3}};
        //         itemsGive[]     = {{"FruitSalad", 1}};
        //         license         = "";
        //     };
        //     class Glass
        //     {
        //         displayName     = "Making Glass";
        //         items[]         = {{"Sand", 1}};
        //         itemsGive[]     = {{"Glass", 1}};
        //         license         = "CivilianSand";
        //     };
        //     class Lumber
        //     {
        //         displayName     = "Cutting Wood into Lumber";
        //         items[]         = {{"Wood", 1}};
        //         itemsGive[]     = {{"Lumber", 1}};
        //         license         = "CivilianLumber";
        //     };
        //     class Marijuana
        //     {
        //         displayName     = "Drying Cannabis Leafs";
        //         items[]         = {{"Cannabis", 1}};
        //         itemsGive[]     = {{"Marijuana", 1}};
        //         license         = "CivilianMarijuana";
        //     };
        //     class Cocaine
        //     {
        //         displayName     = "Processing Cocaine";
        //         items[]         = {{"cocaine", 1}};
        //         itemsGive[]     = {{"ProcessedCocaine", 1}};
        //         license         = "CivilianCocaine";
        //     };
        //     class Heroin
        //     {
        //         displayName     = "Processing Heroin";
        //         items[]         = {{"heroin", 1}};
        //         itemsGive[]     = {{"ProcessedHeroin", 1}};
        //         license         = "CivilianHeroin";
        //     };
        //     class Oil
        //     {
        //         displayName     = "Making Benzine";
        //         items[]         = {{"oil", 1}};
        //         itemsGive[]     = {{"ProcessedOil", 1}};
        //         license         = "CivilianOil";
        //     };
        // };
    };
};
