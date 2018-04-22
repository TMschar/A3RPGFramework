/**
 * Copyright (C) SimZor, SimZor Studios 2DISABLE17
 * All Rights Reserved
 *
 * Filename: CfgDisabledCommands.hpp
 *
 * { ENABLESERVER, ENABLECLIENT, ENABLEHC }
 */

#define DISABLE 0
#define ENABLE 1

class CfgDisabledCommands
{
    class COPYTOCLIPBOARD
    {
        class SYNTAX1
        {
            targets[] = { DISABLE, DISABLE, DISABLE };
            args[] = { { }, { "STRING" } };
        };
    };
    class LOADFILE
    {
        class SYNTAX1
        {
            targets[] = { DISABLE, DISABLE, DISABLE };
            args[] = { { }, { "STRING" } };
        };
    };
    class CREATEUNIT
    {
        class SYNTAX1
        {
            targets[]   = { DISABLE, DISABLE, DISABLE };
            args[]      = { { "STRING" }, { "ARRAY" }};
        };
        class SYNTAX2
        {
            targets[]   = { DISABLE, DISABLE, DISABLE };
            args[]      = { { "GROUP" }, { "ARRAY" } };
        };
    };
    // class ADDACTION
    // {
    //     class SYNTAX1
    //     {
    //         targets[]   = { DISABLE, ENABLE, DISABLE };
    //         args[]      = { { "OBJECT" }, { "ARRAY" } };
    //     };
    // };
    class CALLEXTENSION
    {
        class SYNTAX1
        {
            targets[]   = { ENABLE, DISABLE, ENABLE };
            args[]      = { { "STRING" }, { "STRING" }};
        };
        class SYNTAX2
        {
            targets[]   = { ENABLE, DISABLE, ENABLE };
            args[]      = { { "STRING" }, { "ARRAY" } };
        };
    };
    class ALLVARIABLES
    {
        class SYNTAX1
        {
            targets[] = { DISABLE, DISABLE, DISABLE };
            args[] = { { }, { "CONTROL" } };
        };
        class SYNTAX2
        {
            targets[] = { DISABLE, DISABLE, DISABLE };
            args[] = { { }, { "TEAM_MEMBER" } };
        };
        class SYNTAX3
        {
            targets[] = { DISABLE, DISABLE, DISABLE };
            args[] = { { }, { "NAMESPACE" } };
        };
        class SYNTAX4
        {
            targets[] = { DISABLE, DISABLE, DISABLE };
            args[] = { { }, { "OBJECT" } };
        };
        class SYNTAX5
        {
            targets[] = { DISABLE, DISABLE, DISABLE };
            args[] = { { }, { "GROUP" } };
        };
        class SYNTAX6
        {
            targets[] = { DISABLE, DISABLE, DISABLE };
            args[] = { { }, { "TASK" } };
        };
        class SYNTAX7
        {
            targets[] = { DISABLE, DISABLE, DISABLE };
            args[] = { { }, { "LOCATION" } };
        };
    };
    // class CREATEVEHICLE
    // {
    //     class SYNTAX1
    //     {
    //         targets[]   = {DISABLE, DISABLE, DISABLE};
    //         args[]      = {{"STRING"}, {"ARRAY"}};
    //     };
    //     class SYNTAX2
    //     {
    //         targets[]   = {DISABLE, DISABLE, DISABLE};
    //         args[]      = {{}, {"ARRAY"}};
    //     };
    // };
    class SERVERCOMMAND
    {
        class SYNTAX1
        {
            targets[]   = { DISABLE, DISABLE, DISABLE };
            args[]      = { { "STRING" }, { "STRING" } };
        };
        class SYNTAX2
        {
            targets[]   = { DISABLE, DISABLE, DISABLE };
            args[]      = { { }, { "STRING" } };
        };
    };
    class SERVERCOMMANDEXECUTABLE
    {
        class SYNTAX1
        {
            targets[]   = { DISABLE, DISABLE, DISABLE };
            args[]      = { { }, { "STRING" } };
        };
    };
};
