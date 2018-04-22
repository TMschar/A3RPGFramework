GW_client_fnc_currencyFormat = {
    params ["_cash"];

    _cash = _cash * 10;
    if (_cash isEqualTo 0) exitWith {"£0"};

    _numDigits = 1;
    while{(_cash / (10 ^ _numDigits)) > 1} do {
        _numDigits = _numDigits + 1;
    };
    _value = [];
    _parts = [];
    for "_i" from _numDigits-1 to 1 step -1 do {
        _digit = floor(_cash / (10 ^ _i));
        _cash = _cash - (_digit * (10 ^ _i));
        _parts pushback str(_digit);
    };
    reverse _parts;
    {

        if((_forEachIndex % 3) == 0 && _forEachIndex != 0) then {
            _value pushBack ",";
        };
        _value pushBack _x;
    } forEach _parts;
    reverse _value;

    ("£" + (_value joinString ""))

};