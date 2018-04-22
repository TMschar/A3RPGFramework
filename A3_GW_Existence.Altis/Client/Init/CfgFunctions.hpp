/**
*    Copyright (c) 2017 SimZor, SimZor Studios
*    All Rights Reserved
*
*    Filename: CfgFunctions.hpp
*/

// NORMAL
REGISTER(initClient);
REGISTER(initEventHandlers);
REGISTER(initPublicVariableEventHandlers);
REGISTER(initSetPlayerSettings);

// POSTINIT
REGISTER_POSTINIT(initClientVariables);
