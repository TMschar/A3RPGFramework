/*
    Authored by BoGuu
    Modifications and Additions by SimZor

    Filename: config_macros.hpp
*/

#define true 1
#define false 0

#define REGISTER(functionName)                           class functionName {}
#define REGISTER_PREINIT(functionName)                   class functionName {preInit = 1;}
#define REGISTER_POSTINIT(functionName)                  class functionName {postInit = 1;}
