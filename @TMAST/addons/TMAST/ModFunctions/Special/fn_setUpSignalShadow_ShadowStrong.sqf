params ["_marker", "_altitude"];

[
	{
		private _args = _this select 0;
		private _mrkName = _args select 0;
		private _alt = _args select 1;
		
		if (markerShape _mrkName == "") exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
		
		if (!(player getVariable ["TMAST_InSignalShadow", false])) 
		then {
           if (player inArea _mrkName)
		   then {
				[_mrkName, _alt] call TMAST_fnc_setSignalShadow_Strong;
			};
        };
		
		private _uav = getConnectedUAV player;
		
		if (!(isNull _uav) && !(_uav getVariable ["TMAST_InSignalShadow", false]))
		then {
           if (_uav inArea _mrkName)
		   then {
				[_mrkName, _alt, _uav] call TMAST_fnc_setSignalShadow_Strong_Drone;
			};
        };
	}, 
	3,
	[_marker, _altitude]
] call CBA_fnc_addPerFrameHandler;