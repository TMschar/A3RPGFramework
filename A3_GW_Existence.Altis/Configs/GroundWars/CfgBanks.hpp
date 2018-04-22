/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: CfgBanks.hpp
 */
class CfgBanks
{
    class Altis
    {
        class AthiraBank
        {
            displayName           = "Athira Bank";
            classname             = "Land_MilOfficers_V1_F";
            positionATL[]         = { 13847.2, 18577.8, 0 };
            requiredLevelCategory = LEVEL_TOOLSOFTHETRADE;
            requiredLevel         = 4;
            requiredWest          = 0;
            class Vaults
            {
                class DefaultVault
                {
                    timer       = 30;
                    lockDoors[] = {4};
                    class Box
                    {
                        classname      = "Land_CargoBox_V1_F";
                        randomPosATL[] = { {13833.8, 18572.6, 0.503} };
                        moneybags      = 20;
                    };
                };
            };
        };
    };
    class Malden
    {
        class SaintLouisBank
        {
            displayName           = "Saint Louis Bank";
            classname             = "Land_MilOffices_V1_F";
            positionATL[]         = { 6965.62, 8833.09, 7.62939e-006 };
            requiredLevelCategory = LEVEL_TOOLSOFTHETRADE;
            requiredLevel         = 4;
            requiredWest          = 0;
            class Vaults
            {
                class DefaultVault
                {
                    timer       = 30;
                    lockDoors[] = {4};
                    class Box
                    {
                        classname      = "Land_CargoBox_V1_F";
                        randomPosATL[] = { { 6955.77, 8821.79, 0.504448 } };
                        moneybags      = 20;
                    };
                };
            };
        };
    };
};
