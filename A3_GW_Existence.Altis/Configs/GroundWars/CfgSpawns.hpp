/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: CfgSpawns.hpp
 */

class CfgSpawns
{
    class Stratis
    {

    };
    class Altis
    {
        class Settings
        {
            spawnBuildingClassnames[] =
            {
                "Land_i_Shop_01_V1_F",
                "Land_i_Shop_01_V2_F",
                "Land_i_Shop_01_V3_F",
                "Land_i_Shop_02_V1_F",
                "Land_i_Shop_02_V2_F",
                "Land_i_Shop_02_V3_F"
            };
        };
        class West
        {
            class Kavala
            {
                name            = "Kavala RMP Headquarters";
                description     = "Kavala Military Police Headquarters";
                marker          = "police_spawn_kavala";
                condition       = "";
            };
            class Pyrgos
            {
                name            = "Pyrgos RMP Outpost";
                description     = "Pyrgos Military Police Outpost";
                marker          = "police_spawn_pyrgos";
                condition       = "";
            };
            class Sofia
            {
                name            = "Sofia RMP Outpost";
                description     = "Sofia Military Police Outpost";
                marker          = "police_spawn_sofia";
                condition       = "";
            };
            class AirHQ
            {
                name            = "Air RMP Headquarters";
                description     = "Air Military Police HQ";
                marker          = "police_spawn_airhq";
                condition       = "";
            };
            class KavalaCheckpoint
            {
                name            = "Kavala Checkpoint";
                description     = "The main checkpoint in Kavala";
                marker          = "spawn_kavalacheckpoint";
                condition       = "";
            };
        };
        class Guer
        {
            class Kavala
            {
                name           = "Kavala Hospital";
                description    = "The main hospital on Altis.";
                marker         = "independent_spawn_kavala";
                condition      = "";
            };
        };
        class Civ
        {
            class Kavala
            {
                name            = "Kavala";
                description     = "The main town of Altis. This is where you will meet the most amount of people.";
                marker          = "civilian_spawn_kavala";
                condition       = "";
            };
            class Athira
            {
                name            = "Athira";
                description     = "Athira is a big part of Altis, one of the bigger towns which is also located close to the main airfield.";
                marker          = "civilian_spawn_athira";
                condition       = "";
            };
            class Pyrgos
            {
                name            = "Pyrgos";
                description     = "The capitol of Altis.";
                marker          = "civilian_spawn_pyrgos";
                condition       = "";
            };
            class Sofia
            {
                name            = "Sofia";
                description     = "Sofia is one of the calm cities. Located North East of Altis it is far away from the civilization.";
                marker          = "civilian_spawn_sofia";
                condition       = "";
            };
        };
    };
    class Tanoa
    {

    };
    class Malden
    {
        class West
        {
            class LePort
            {
                name            = "Le Port";
                description     = "Main Military Police headquarters for Malden Military Police";
                marker          = "police_spawn_marker_leport";
                condition       = "";
            };
            class Airfield
            {
                name            = "Air Headquarters";
                description     = "Airfield headquarters for Malden Military Police";
                marker          = "police_spawn_marker_airhq";
                condition       = "";
            };
            class USSFreedom
            {
                name            = "USS Freedom";
                description     = "USS Freedom, aircraft carrier docked in Le Port close to Le Port Police HQ";
                marker          = "police_spawn_marker_uss_freedom";
                condition       = "";
            };
        };
        class Guer
        {
            class LePort
            {
                name            = "Le Port Field Hospital";
                description     = "Main field hospital on Malden";
                marker          = "medic_spawn_marker_leport";
                condition       = "";
            };
            class Airfield
            {
                name            = "Airfield Field Hospital";
                description     = "Airfield Field Hospital";
                marker          = "medic_spawn_marker_airfield";
                condition       = "";
            };
        };
        class Civ
        {
            class LaTrinite
            {
                name            = "La Trinite";
                description     = "La Trinite, it's the main point of Malden on Existence. This is where you will find most of the shops and interactions.";
                marker          = "marker_spawn_civ_latrinite_1";
                condition       = "";
            };
            class LePort
            {
                name            = "Le Port";
                description     = "Le Port is one of the towns in Malden, the Military Police has it's headquarters here as well as USS Freedom.";
                marker          = "marker_spawn_civ_leport_1";
                condition       = "";
            };
            class LaPassange
            {
                name            = "La Passagne";
                description     = "La Passagne is one of the cities where you will find some people, some interaction and some jobs to do.";
                marker          = "marker_spawn_civ_lepessagne_1";
                condition       = "";
            };
        };
    };
};
