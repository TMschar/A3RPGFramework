/*
    File: fn_handleItem.sqf
    Author: Bryan "Tonic" Boardwine
    Description
    Main gear handling functionality.
*/

_fnc_accType = {
    private ["_item","_type","_tmp","_ret","_weaponArray"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
_type = [_this,1,0,[0]] call BIS_fnc_param;
if (_item isEqualTo "" || _type isEqualTo 0) exitWith {0};
_ret = 0;

_weaponArray = [primaryWeapon player, secondaryWeapon player, handgunWeapon player];
{
    if (!(_ret isEqualTo 0)) exitWith {}; //Make sure we exit the loop since there was already a match.
    if (!(_x isEqualTo "")) then
    {
        _weapon = _x;
        _cfgInfo = [_weapon,"CfgWeapons"] call _fnc_fetchCfgDetails;

        _legacyItems = ((_cfgInfo select 10) + (_cfgInfo select 11) + (_cfgInfo select 12));
        _newItems = _cfgInfo select 14;

        //Check Legacy Items first
        if (count _legacyItems > 0) then {
            for "_i" from 0 to (count _legacyItems)-1 do {
                _legacyItems set[_i,toLower(_legacyItems select _i)];
            };

            if ((toLower _item) in _legacyItems) exitWith {_ret = switch (_weapon) do {case (primaryWeapon player): {1};case (secondaryWeapon player) : {2};case (handgunWeapon player): {3};default {0};};};
        };

        //Check new compatibleItems class structure
        if (count _newItems > 0) then {
            //This gets weird with forEach in forEach :\
            {
                if (!(_ret isEqualTo 0)) exitWith {};

                if (isClass (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> _x >> "compatibleItems")) then {
                    _cfg = getNumber (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> _x >> "compatibleItems" >> _item);
                };

                if (isNil "_cfg") then {_cfg = 0;};
                if (_cfg isEqualTo 1) exitWith {
                    _ret = switch (_weapon) do {case (primaryWeapon player): {1};case (secondaryWeapon player) : {2};case (handgunWeapon player): {3};default {0};};
                };
            } forEach _newItems;
            if (!(_ret isEqualTo 0)) exitWith {}; //Make sure we exit the loop
        };
    };
} forEach _weaponArray;

_ret;
};

_fnc_fetchCfgDetails = {
    private ["_className","_section","_type","_accPointer","_accMuzzle","_accOptic","_classes","_itemInfo","_magazines","_scope","_config","_displayName"];
    _className = [_this,0,"",[""]] call BIS_fnc_param;
    _section = [_this,1,"",[""]] call BIS_fnc_param;
    if (_className isEqualTo "") exitWith {[]};

    _type = -1;
    _accPointer = [];
    _accOptic = [];
    _accMuzzle = [];
    _classes = [];
    _scope = 0;
    _itemInfo = -1;
    _muzzles = [];
    _magazines = [];
    _return = [];

    if (_section isEqualTo "") then {
        _section = switch (true) do {
            case (isClass(configFile >> "CfgMagazines" >> _className)): {"CfgMagazines"};
            case (isClass(configFile >> "CfgWeapons" >> _className)): {"CfgWeapons"};
            case (isClass(configFile >> "CfgVehicles" >> _className)): {"CfgVehicles"};
            case (isClass(configFile >> "CfgGlasses" >> _className)): {"CfgGlasses"};
        };
    };

    if (!(_section isEqualType "") || {!isClass(configFile >> _section >> _className)} || {_section isEqualTo ""}) exitWith {[]};
    _config = configFile >> _section >> _className;
    _displayName = getText(_config >> "displayName");
    _picture = getText(_config >> "picture");
    _desc = getText(_config >> "descriptionshort");
    _base = inheritsFrom _config;

    switch (_section) do
    {
        case "CfgVehicles": {
            _type = getText(_config >> "vehicleClass");
            _scope = getNumber(_config >> "scope");
        };

        case "CfgWeapons": {
            _scope = getNumber(_config >> "scope");
            _type = getNumber(_config >> "type");
            _desc = getText(_config >> "descriptionshort");

            //Compatible attachments
            if (isClass (_config >> "WeaponSlotsInfo")) then
            {
                _accPointer = getArray(_config >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
                _accOptic = getArray(_config >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
                _accMuzzle = getArray(_config >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");

                {    private "_thiscfgitem";
                    for "_i" from 0 to (count(_x) - 1) do {
                        _thiscfgitem = _x select _i;
                        if (isClass _thiscfgitem) then {
                            if !((configName _thiscfgitem) in _classes) then {
                                _classes pushBack configName _thiscfgitem;
                            };
                        };
                    };
                } forEach ([_config>>"WeaponSlotsInfo"] call bis_fnc_returnParents);
            };

            if (isClass (_config >> "ItemInfo")) then {
                _itemInfo = getNumber(_config >> "ItemInfo" >> "Type");
            };

            _muzzles = getArray(_config >> "muzzles");
            _magazines = getArray(_config >> "magazines");
            if (!isNil "_muzzles") then {
                private ["_tmp"];
                {
                    if (_x != "this") then {
                        _tmp = getArray(_base >> _x >> "magazines"); {
                            _magazines pushBack _x;
                        } forEach (_tmp);
                    };
                } forEach _muzzles;
            };
        };

        case "CfgMagazines": {
            _scope = getNumber(_config >> "scope");
        };
    };

    if (!isNil "_classes") then {
        _classes = _classes - ["MuzzleSlot"];
        _classes = _classes - ["CowsSlot"];
        _classes = _classes - ["PointerSlot"];
    };
    _return = [_className,_displayName,_picture,_scope,_type,_itemInfo,_section,_magazines,_muzzles,_desc,_accPointer,_accOptic,_accMuzzle,_base,_classes];
    _return;
};

private ["_item","_details","_bool","_ispack","_items","_isgun","_ongun","_override","_toUniform","_toVest","_preview"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
_bool = [_this,1,false,[false]] call BIS_fnc_param;
_ispack = [_this,2,false,[false]] call BIS_fnc_param;
_ongun = [_this,3,false,[false]] call BIS_fnc_param;
_override = [_this,4,false,[false]] call BIS_fnc_param;
_toUniform = [_this,5,false,[false]] call BIS_fnc_param; //Manual override to send items specifically to a uniform.
_toVest = [_this,6,false,[false]] call BIS_fnc_param; //Manual override to send items specifically to a vest
_preview = [_this,7,false,[false]] call BIS_fnc_param;

//Some checks
if (_item isEqualTo "") exitWith {};
_isgun = false;

_details = [_item] call _fnc_fetchCfgDetails;
if (count _details isEqualTo 0) exitWith {};

if (_bool) then {
    switch (_details select 6) do {
        case "CfgGlasses": {
            if (_toUniform) exitWith {player addItemToUniform _item;};
            if (_toVest) exitWith {player addItemToVest _item;};

            if (_ispack) then {
                player addItemToBackpack _item;
            } else {
                if (_override) then {
                    player addItem _item;
                } else {
                    if (!(goggles player isEqualTo "")) then {
                        removeGoggles player;
                    };
                    player addGoggles _item;
                };
            };
        };

        case "CfgVehicles": {
            if (!(backpack player isEqualTo "")) then {
                _items = (backpackItems player);
                removeBackpack player;
            };

            player addBackpack _item;
            clearAllItemsFromBackpack player;

            if (!isNil "_items") then {
                {[_x,true,true,false,true] call GW_client_fnc_external; } forEach _items;
            };
        };

        case "CfgMagazines": {
            if (_toUniform) exitWith {player addItemToUniform _item;};
            if (_toVest) exitWith {player addItemToVest _item;};
            if (_ispack) exitWith {player addItemToBackpack _item;};

            player addMagazine _item;
        };

        case "CfgWeapons": {
            //New addition
            if (_toUniform) exitWith {player addItemToUniform _item;};
            if (_toVest) exitWith {player addItemToVest _item;};
            if (_ispack) exitWith {player addItemToBackpack _item;};

            if ((_details select 4) in [1,2,4,5,4096]) then {
                if ((_details select 4) isEqualTo 4096) then {
                    if ((_details select 5) isEqualTo -1) then {
                        _isgun = true;
                    };
                } else {
                    _isgun = true;
                };
            };

            if (_isgun) then {
                if (!_ispack && _override) exitWith {}; //It was in the vest/uniform, try to close to prevent it overriding stuff... (Actual weapon and not an item)
                if (_item isEqualTo "MineDetector") then {
                    player addItem _item;
                } else {
                    player addWeapon _item;
                };
            } else {
                switch (_details select 5) do {
                    case 0:  {
                        if (_ispack) then {
                            player addItemToBackpack _item;
                        } else {
                            if (_override) then {
                                player addItem _item;
                            } else {
                                if (_item in (assignedItems  player)) then {
                                    player addItem _item;
                                } else {
                                    player linkItem _item;
                                };
                            };
                        };
                    };

                    case 605: {
                        if (_ispack) then{
                            player addItemToBackpack _item;
                        } else {
                            if (_override) then {
                                player addItem _item;
                            } else {
                                if (headgear player isEqualTo _item && {!_preview}) then {
                                    player addItem _item;
                                } else {
                                    if (!(headgear player isEqualTo "")) then {removeHeadGear player;};
                                    player addHeadGear _item;
                                };
                            };
                        };
                    };

                    case 801: {
                        if (_ispack) then {
                            player addItemToBackpack _item;
                        } else {
                            if (_override) then {
                                player addItem _item;
                            } else {
                                if (player isKindOf "Civilian") then {
                                    if (uniform player isEqualTo _item && {!_preview}) then {
                                        player addItem _item;
                                    } else {
                                        if (!(uniform player isEqualTo "")) then {
                                            _items = uniformItems player;
                                            removeUniform player;
                                        };

                                        player addUniform _item;
                                        if (!isNil "_items") then {
                                            {player addItemToUniform _x} forEach _items;
                                        };
                                    };
                                } else {
                                    if (!(uniform player isEqualTo "")) then {
                                        _items = uniformItems player;
                                        removeUniform player;
                                    };

                                    if (!(player isUniformAllowed _item)) then {
                                        player forceAddUniform _item;
                                    } else {
                                        player addUniform _item;
                                    };
                                    if (!isNil "_items") then {
                                        {player addItemToUniform _x} forEach _items;
                                    };
                                };
                            };
                        };
                    };

                    case 701: {
                        if (_ispack) then {
                            player addItemToBackpack _item;
                        } else {
                            if (_override) then{
                                player addItem _item;
                            } else {
                                if (vest player isEqualTo _item && {!_preview}) then {
                                    player addItem _item;
                                } else {
                                    if (!(vest player isEqualTo "")) then {
                                        _items = vestItems player;
                                        removeVest player;
                                    };

                                    player addVest _item;

                                    if (!isNil "_items") then {
                                        {[_x,true,false,false,true] spawn GW_client_fnc_external;} forEach _items;
                                    };
                                };
                            };
                        };
                    };

                    case 201: {
                        if (_ispack) then {
                            player addItemToBackpack _item;
                        } else {
                            private "_type";
                            _type = [_item,201] call _fnc_accType;
                            if (_ongun) then {
                                switch (_type) do {
                                    case 1: { player addPrimaryWeaponItem _item; };
                                    case 2: { player addSecondaryWeaponItem _item; };
                                    case 3: { player addHandgunItem _item; };
                                };
                            } else {
                                if (_override) then {
                                    player addItem _item;
                                } else {
                                    private ["_wepItems","_action","_slotTaken"];
                                    _wepItems = switch (_type) do {case 1:{primaryWeaponItems player}; case 2:{secondaryWeaponItems player}; case 3:{handgunItems player}; default {["","",""]};};
                                    _slotTaken = false;

                                    if (!((_wepItems select 2) isEqualTo "")) then {_slotTaken = true;};

                                    if (_slotTaken) then {
                                        _action = [localize "STR_MISC_AttachmentMSG",localize "STR_MISC_Attachment",localize "STR_MISC_Weapon",localize "STR_MISC_Inventory"] call BIS_fnc_guiMessage;
                                        if (_action) then {
                                            switch (_type) do {
                                                case 1: {player addPrimaryWeaponItem _item;};
                                                case 2: {player addSecondaryWeaponItem _item;};
                                                case 3: {player addHandgunItem _item;};
                                                default {player addItem _item;};
                                            };
                                        } else {
                                            player addItem _item; //Add it to any available container
                                        };
                                    } else {
                                        switch (_type) do {
                                            case 1: {player addPrimaryWeaponItem _item;};
                                            case 2: {player addSecondaryWeaponItem _item;};
                                            case 3: {player addHandgunItem _item;};
                                            default {player addItem _item;};
                                        };
                                    };
                                };
                            };
                        };
                    };

                    case 301: {
                        if (_ispack) then {
                            player addItemToBackpack _item;
                        } else {
                            private "_type";
                            _type = [_item,301] call _fnc_accType;

                            if (_ongun) then {
                                switch (_type) do {
                                    case 1: { player addPrimaryWeaponItem _item; };
                                    case 2: { player addSecondaryWeaponItem _item; };
                                    case 3: { player addHandgunItem _item; };
                                };
                            } else {
                                if (_override) then {
                                    player addItem _item;
                                } else {
                                    private ["_wepItems","_action","_slotTaken"];
                                    _wepItems = switch (_type) do {case 1:{primaryWeaponItems player}; case 2:{secondaryWeaponItems player}; case 3:{handgunItems player}; default {["","",""]};};
                                    _slotTaken = false;

                                    if (!((_wepItems select 1) isEqualTo "")) then {_slotTaken = true;};

                                    if (_slotTaken) then {
                                        _action = [localize "STR_MISC_AttachmentMSG",localize "STR_MISC_Attachment",localize "STR_MISC_Weapon",localize "STR_MISC_Inventory"] call BIS_fnc_guiMessage;
                                        if (_action) then {
                                            switch (_type) do {
                                                case 1: {player addPrimaryWeaponItem _item;};
                                                case 2: {player addSecondaryWeaponItem _item;};
                                                case 3: {player addHandgunItem _item;};
                                                default {player addItem _item;};
                                            };
                                        } else {
                                            player addItem _item; //Add it to any available container
                                        };
                                    } else {
                                        switch (_type) do {
                                            case 1: {player addPrimaryWeaponItem _item;};
                                            case 2: {player addSecondaryWeaponItem _item;};
                                            case 3: {player addHandgunItem _item;};
                                            default {player addItem _item;};
                                        };
                                    };
                                };
                            };
                        };
                    };

                    case 101:{
                        if (_ispack) then {
                            player addItemToBackpack _item;
                        } else {
                            private "_type";
                            _type = [_item,101] call _fnc_accType;

                            if (_ongun) then {
                                switch (_type) do {
                                    case 1: { player addPrimaryWeaponItem _item; };
                                    case 2: { player addSecondaryWeaponItem _item; };
                                    case 3: { player addHandgunItem _item; };
                                };
                            } else {
                                if (_override) then {
                                    player addItem _item;
                                } else {
                                    private ["_wepItems","_action","_slotTaken"];
                                    _wepItems = switch (_type) do {case 1:{primaryWeaponItems player}; case 2:{secondaryWeaponItems player}; case 3:{handgunItems player}; default {["","",""]};};
                                    _slotTaken = false;

                                    if (!((_wepItems select 0) isEqualTo "")) then {_slotTaken = true;};

                                    if (_slotTaken) then {
                                        _action = [localize "STR_MISC_AttachmentMSG",localize "STR_MISC_Attachment",localize "STR_MISC_Weapon",localize "STR_MISC_Inventory"] call BIS_fnc_guiMessage;
                                        if (_action) then {
                                            switch (_type) do {
                                                case 1: {player addPrimaryWeaponItem _item;};
                                                case 2: {player addSecondaryWeaponItem _item;};
                                                case 3: {player addHandgunItem _item;};
                                                default {player addItem _item;};
                                            };
                                        } else {
                                            player addItem _item; //Add it to any available container
                                        };
                                    } else {
                                        switch (_type) do {
                                            case 1: {player addPrimaryWeaponItem _item;};
                                            case 2: {player addSecondaryWeaponItem _item;};
                                            case 3: {player addHandgunItem _item;};
                                            default {player addItem _item;};
                                        };
                                    };
                                };
                            };
                        };
                    };

                    case 621: {
                        if (_ispack) then {
                            player addItemToBackpack _item;
                        } else {
                            if (_override) then {
                                player addItem _item;
                            } else {
                                player linkItem _item;
                            };
                        };
                    };

                    case 616: {
                        if (_ispack) then {
                            player addItemToBackpack _item;
                        } else {
                            if (_override) then {
                                player addItem _item;
                            } else {
                                player linkItem _item;
                            };
                        };
                    };

                    default {
                        if (_ispack) then {
                            player addItemToBackpack _item;
                        } else {
                            player addItem _item;
                        };
                    };
                };
            };
        };
    };
} else {
    switch (_details select 6) do {
        case "CfgVehicles": {
            removeBackpack player;
        };

        case "CfgMagazines": {
            player removeMagazine _item;
        };

        case "CfgGlasses": {
            if (_item isEqualTo goggles player) then {
                removeGoggles player;
            } else {
                player removeItem _item;
            };
        };

        case "CfgWeapons": {
            if ((_details select 4) in [1,2,4,5,4096]) then {
                if ((_details select 4) isEqualTo 4096) then {
                    if ((_details select 5) isEqualTo 1) then {
                        _isgun = true;
                    };
                } else {
                    _isgun = true;
                };
            };

            if (_isgun) then {
                switch (true) do {
                    case (primaryWeapon player isEqualTo _item) : {_ispack = false;};
                    case (secondaryWeapon player isEqualTo _item) : {_ispack = false;};
                    case (handgunWeapon player isEqualTo _item) : {_ispack = false;};
                    case (_item in assignedItems player) : {_ispack = false;};
                    default {_ispack = true;};
                };

                if (_item isEqualTo "MineDetector") then {
                    player removeItem _item;
                } else {

                    //Lovely code provided by [OCB]Dash
                    private "_tmpfunction";
                    _tmpfunction = {
                        private ["_tWeapons","_tWeaponCount"];
                        switch (true) do {
                            case (_this in (uniformItems player)): {
                                _tWeapons = (getWeaponCargo (uniformContainer player)) select 0;
                                _tWeaponCount = (getWeaponCargo (uniformContainer  player)) select 1;

                                clearWeaponCargo (uniformContainer player);
                                {
                                    _numVestWeps = _tWeaponCount select _forEachIndex;
                                    if (_x == _this) then
                                    {
                                        _numVestWeps = _numVestWeps - 1;
                                    };
                                    (uniformContainer player) addWeaponCargo [ _x,_numVestWeps];
                                }forEach _tWeapons;
                            };

                            case (_this in (vestItems player)): {
                                _tWeapons = (getWeaponCargo (vestContainer player)) select 0;
                                _tWeaponCount = (getWeaponCargo (vestContainer  player)) select 1;

                                clearWeaponCargo (vestContainer player);
                                {
                                    _numVestWeps = _tWeaponCount select _forEachIndex;
                                    if (_x == _this) then
                                    {
                                        _numVestWeps = _numVestWeps - 1;
                                    };
                                    (vestContainer player) addWeaponCargo [ _x,_numVestWeps];
                                }forEach _tWeapons;
                            };

                            case (_this in (backpackItems player)): {
                                _tWeapons = (getWeaponCargo (backpackContainer player)) select 0;
                                _tWeaponCount = (getWeaponCargo (backpackContainer  player)) select 1;

                                clearWeaponCargo (backpackContainer player);
                                {
                                    _numVestWeps = _tWeaponCount select _forEachIndex;
                                    if (_x == _this) then
                                    {
                                        _numVestWeps = _numVestWeps - 1;
                                    };
                                    (backpackContainer player) addWeaponCargo [ _x,_numVestWeps];
                                }forEach _tWeapons;
                            };
                        };
                    };

                    if (_ispack) then {
                        _item call _tmpfunction;
                    } else {
                        switch (true) do {
                            case (_item in (uniformItems player)): {_item call _tmpfunction;};
                            case (_item in (vestItems player)) : {_item call _tmpfunction;};
                            case (_item in (backpackItems player)) : {_item call _tmpfunction;};
                            default {player removeWeapon _item;};
                        };
                    };
                };
            } else {
                switch (_details select 5) do {
                    case 0: {player unassignItem _item; player removeItem _item;};
                    case 605: {if (headgear player isEqualTo _item) then {removeHeadgear player} else {player removeItem _item};};
                    case 801: {if (uniform player isEqualTo _item) then {removeUniform player} else {player removeItem _item};};
                    case 701: {if (vest player isEqualTo _item) then {removeVest player} else {player removeItem _item};};
                    case 621: {player unassignItem _item; player removeItem _item;};
                    case 616: {player unassignItem _item; player removeItem _item;};
                    default {
                        switch (true) do {
                            case (_item in primaryWeaponItems player) : {player removePrimaryWeaponItem _item;};
                            case (_item in handgunItems player) : {player removeHandgunItem _item;};
                            default {player removeItem _item;};
                        };
                    };
                };
            };
        };
    };
};
