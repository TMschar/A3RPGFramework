/**
*    Author: BoGuu
*    Changes: SimZor
*
*    Filename: config_macros.hpp
*/

#include "macros\level_macros.hpp"

#define REGISTER(functionName)                 class functionName {}
#define REGISTER_PUBVAR(functionName)          class functionName {publicVariable = 1;}
#define REGISTER_POSTINIT_PUBVAR(functionName) class functionName {postInit = 1; publicVariable = 1;}
#define REGISTER_PREINIT(functionName)         class functionName {preInit = 1;}
#define REGISTER_POSTINIT(functionName)        class functionName {postInit = 1;}
