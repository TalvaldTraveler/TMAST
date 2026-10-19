params ["_marker", "_laggingInformation", "_altitude", "_uav"];
_uav setVariable ["TMAST_InSignalShadow", true, true];
_uav setVariable ["TMAST_GPSShadowData", _laggingInformation, true];

[
	{
		private _args = _this select 0;
		private _mrkName = _args select 0;
		private _alt = _args select 1;
		private _uav = _args select 2;
		
		private _altitudePos = (getPosASL _uav) select 2;
		
		if ((_uav inArea _mrkName) && _altitudePos < _alt) 
		then {
			if (!(((_uav getVariable ["TMAST_GPSshadow", false]) isEqualTo "Multipathing") || ((_uav getVariable ["TMAST_GPSshadow", false]) isEqualTo "Blocked")))
			then {
				_uav setVariable ["TMAST_GPSshadow", "Multipathing", true];
			};
		}
		else {
			_uav setVariable ["TMAST_InSignalShadow", nil, true];
			_uav setVariable ["TMAST_GPSshadow", nil, true];
			[_handle] call CBA_fnc_removePerFrameHandler;
		};
	}, 
	3,
	[_marker, _altitude, _uav]
] call CBA_fnc_addPerFrameHandler;