/**
 * Copyright (c) 2017 SimZor, SimZor Studios
 * All Rights Reserved
 *
 * Filename: fn_numbersSortDate.sqf
 *
 * Parameter(s):
 *     0: ARRAY - Date and Time
 *
 * Returns:
 *     STRING
 *
 * Description:
 *     Formats a TIMESTAMP array to string. Array needs to look like [y,m,d,h,m,s]
 */
params [["_dateTime", [], [[]]]];

private _date = _dateTime select [0, 3];
private _time = _dateTime select [3, 5];

_date = _date joinString ":";
_time = _time joinString ":";

_date + " " + _time;