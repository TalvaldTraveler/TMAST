params ["_device", "_marker"];

[
	{
		private _args = _this select 0;
		private _tracked = _args select 0;
		private _mrkName = _args select 1;
		
		if (markerShape _mrkName == "") exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
		
		if (!(alive _tracked)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
		_mrkName setMarkerPos _tracked;
	}, 
	1,
	[_device, _marker]
] call CBA_fnc_addPerFrameHandler;