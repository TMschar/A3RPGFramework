/*
    Copyright (C) SimZor, SimZor Studios 2017
    All Rights Reserved

    Filename: CfgRemoteExec.hpp
*/

// DEFINES
#define HC GW_HC1
#define SERVER 2
#define CLIENT 1
#define ANYONE 0

class CfgRemoteExec {
    mode = 1;
    jip = 1;

    // SCRIPTED FUNCTIONS
    class Functions {
        // SERVER FUNCTIONS
        class GW_server_fnc_log                                 {allowedTargets = SERVER;};
        class GW_server_fnc_antiHackInit                        {allowedTargets = CLIENT;};
        class GW_server_fnc_validateAdmin                       {allowedTargets = SERVER;};
        class GW_server_fnc_compile                             {allowedTargets = ANYONE;};
        class GW_server_fnc_compileRequest                      {allowedTargets = SERVER;};
        class GW_server_fnc_getPlayerData                       {allowedTargets = SERVER;};
        class GW_server_fnc_messageSendRequest                  {allowedTargets = SERVER;};
        class GW_server_fnc_vehicleInsert                       {allowedTargets = SERVER;};
        class GW_server_fnc_vehicleDelete                       {allowedTargets = SERVER;};
        class GW_server_fnc_vehicleUpdateStatus                 {allowedTargets = SERVER;};
        class GW_server_fnc_propertyUpdateContainers            {allowedTargets = SERVER;};
        class GW_server_fnc_vehicleGetInactiveVehicles          {allowedTargets = SERVER;};
        class GW_server_fnc_logPlayerDeath                      {allowedTargets = SERVER;};
        class GW_server_fnc_warrantsAddWarrant                  {allowedTargets = SERVER;};
        class GW_server_fnc_warrantsQueryWarrants               {allowedTargets = SERVER;};
        class GW_server_fnc_warrantsDeleteWarrant               {allowedTargets = SERVER;};
        class GW_server_fnc_worldtrackSpikestrip                {allowedTargets = SERVER;};

        // CLIENT FUNCTIONS
        class GW_client_fnc_syncAnimation                       {allowedTargets = CLIENT;};
        class GW_client_fnc_moveUnitIntoVehicle                 {allowedTargets = CLIENT;};
        class GW_client_fnc_propertySetupClient                 {allowedTargets = CLIENT;};
        class GW_client_fnc_propertyRequestRespond              {allowedTargets = CLIENT;};
        class GW_client_fnc_receivePlayerData                   {allowedTargets = CLIENT;};
        class GW_client_fnc_organizationsInitPlayerResponse     {allowedTargets = CLIENT;};
        class GW_client_fnc_notificationsAdd                    {allowedTargets = CLIENT;};
        class GW_client_fnc_broadcast                           {allowedTargets = CLIENT;};
        class GW_client_fnc_retrieveMessage                     {allowedTargets = CLIENT;};
        class GW_client_fnc_organizationsDisbandFromPlayer      {allowedTargets = CLIENT;};
        class GW_client_fnc_vehicleSetupVehicleEventhandlers    {allowedTargets = ANYONE;};
        class GW_client_fnc_say3D                               {allowedTargets = CLIENT;};
        class GW_client_fnc_actionRestrainHandler               {allowedTargets = CLIENT;};
        class GW_client_fnc_bleedoutNotifyRevivers              {allowedTargets = CLIENT;};
        class GW_client_fnc_arrestWarrantsReceive               {allowedTargets = CLIENT;};
        class GW_client_fnc_moneyReceive                        {allowedTargets = CLIENT;};
        class GW_client_fnc_ticketSystemIssueTicket             {allowedTargets = CLIENT;};
        class GW_client_fnc_ticketSystemRewards                 {allowedTargets = CLIENT;};
        class GW_client_fnc_playersHandleMoney                  {allowedTargets = CLIENT;};
        class GW_client_fnc_experienceCategoryAddExperience     {allowedTargets = CLIENT;};
        class GW_client_fnc_jailOnIncarceration                 {allowedTargets = CLIENT;};
        class GW_client_fnc_jailOnRelease                       {allowedTargets = CLIENT;};
        class GW_client_fnc_moneyPickupResponse                 {allowedTargets = CLIENT;};
        class GW_client_fnc_banksDrill                          {allowedTargets = CLIENT;};
        class GW_client_fnc_banksCollectMoneybag                {allowedTargets = CLIENT;};
        class GW_client_fnc_organizationsInviteReceived         {allowedTargets = CLIENT;};
        class GW_client_fnc_holidaysXmasExperienceBoost         {allowedTargets = CLIENT;};
        class GW_client_fnc_virtualInventoryGiveItemRemote      {allowedTargets = CLIENT;};
        class GW_client_fnc_vehicleSpikestripEffect             {allowedTargets = CLIENT;};
        class GW_client_fnc_moneyRobberyRobbed                  {allowedTargets = CLIENT;};
        class GW_client_fnc_moneyRobberyReceive                 {allowedTargets = CLIENT;};
    };

    // SCRIPTED COMMANDS
    class Commands {
        mode = 1;
        jip = 1;

        class hideObject  {allowedTargets = CLIENT;};
        class setVelocity {allowedTargets = CLIENT;};
    };
};
