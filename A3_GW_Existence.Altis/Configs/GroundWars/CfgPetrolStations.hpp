/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: CfgPetrolStations.hpp
 */

class CfgPetrolStations
{
    class Malden
    {
        class Settings
        {
            cooldown       = 3 * 60;               // The cooldown (in seconds) that it will lock the station for
            robbableObject = "Land_CashDesk_F";  // The object that the initialization will look for
            requiredBlufor = 2;
        };
        class PetrolStations
        {
            class LaTrinite
            {
                position[] = { 7208.28, 7792.5, 0.00143433 };
                basePayout = 40000;
            };
        };
    };
    class Altis
    {
        class Settings
        {
            robbableObject = "Land_CashDesk_F";
            requiredBlufor = 2;
            cooldown       = 8 * 60;
        };
        class PetrolStations
        {
            class KavalaNorth
            {
                position[] = { 5050.23, 14438.7, 0.546 };
                basePayout = 25000;
            };
            class KavalaSouth
            {
                position[] = { 4025.44, 12589.2, 0.190001 };
                basePayout = 25000;
            };
            class AgiosDionysios
            {
                position[] = { 9028.8, 15715.3, 0.186996 };
                basePayout = 25000;
            };
            class Lakka
            {
                position[] = { 12032.5, 15812.3, 0.17399 };
                basePayout = 25000;
            };
            class Airfield
            {
                position[] = { 14165, 16519.7, 0.269901 };
                basePayout = 25000;
            };
            class Paros
            {
                position[] = { 20768.3, 16669.6, 0.13763 };
                basePayout = 25000;
            };
            class Telos
            {
                position[] = { 15796.5, 17464.7, 0.0809011 };
                basePayout = 25000;
            };
            class Athira
            {
                position[] = { 14239.1, 18314.3, 0.07757 };
                basePayout = 25000;
            };
            class Anthrakia
            {
                position[] = { 16832, 15473.1, 0.967 };
                basePayout = 25000;
            };
        };
    };
};