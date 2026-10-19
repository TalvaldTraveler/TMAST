params ["_marker", "_altitude"];
player setVariable ["TMAST_InSignalShadow", true, true];

[
	{
		private _args = _this select 0;
		private _mrkName = _args select 0;
		private _alt = _args select 1;
		
		private _altitudePos = (getPosASL player) select 2;
		
		if ((player inArea _mrkName) && _altitudePos < _alt) 
		then {
			if ((player getVariable ["TMAST_GPSshadow", false]) isNotEqualTo "Blocked")
			then {
				player setVariable ["TMAST_GPSshadow", "Blocked", true];
			};
		}
		else {
			player setVariable ["TMAST_InSignalShadow", nil, true];
			player setVariable ["TMAST_GPSshadow", nil, true];
			[_handle] call CBA_fnc_removePerFrameHandler;
		};
	}, 
	3,
	[_marker, _altitude]
] call CBA_fnc_addPerFrameHandler;