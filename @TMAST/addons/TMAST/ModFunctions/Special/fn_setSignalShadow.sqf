params ["_marker", "_laggingInformation", "_shiftingSec", "_shadowWeight", "_pathingWeight", "_signalWeight", "_altitude"];
player setVariable ["TMAST_InSignalShadow", true, true];
player setVariable ["TMAST_GPSShadowData", _laggingInformation, true];

[
	{
		private _args = _this select 0;
		private _mrkName = _args select 0;
		private _altitudePos = (getPosASL player) select 2;
		private _alt = _args select 5;
		
		if ((player inArea _mrkName) && _altitudePos < _alt) 
		then {
			private _shiftingSec = _args select 1;
			private _shiftingTimer = player getVariable ["TMAST_SHShiftingSec", _shiftingSec];
			if (_shiftingSec <= _shiftingTimer)
			then {
				player setVariable ["TMAST_SHShiftingSec", 0];
				private _shadowWeight = _args select 2;
				private _pathingWeight = _args select 3;
				private _signalWeight = _args select 4;
				private _tmastEvent = ["Blocked", "Multipathing", false] selectRandomWeighted [_shadowWeight, _pathingWeight, _signalWeight];
				player setVariable ["TMAST_GPSshadow", _tmastEvent, true];
			}
			else {
				private _randomElement = random [3, 3, 6];
				private _shiftingTimer = _shiftingTimer + _randomElement;
				player setVariable ["TMAST_SHShiftingSec", _shiftingTimer];
			};
		}
		else {
			player setVariable ["TMAST_SHShiftingSec", nil];
			player setVariable ["TMAST_InSignalShadow", nil, true];
			player setVariable ["TMAST_GPSshadow", nil, true];
			[_handle] call CBA_fnc_removePerFrameHandler;
		};
	}, 
	3,
	[_marker, _shiftingSec, _shadowWeight,_pathingWeight, _signalWeight, _altitude]
] call CBA_fnc_addPerFrameHandler;