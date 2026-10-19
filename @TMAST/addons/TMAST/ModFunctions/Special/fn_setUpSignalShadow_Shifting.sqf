params ["_marker", "_laggingInformation", "_shiftingSec", "_shadowWeight", "_pathingWeight", "_signalWeight", "_altitude"];

[
	{
		private _args = _this select 0;
		private _mrkName = _args select 0;
		private _lagInfo = _args select 1;
		private _shiftSec = _args select 2;
		private _shadowW = _args select 3;
		private _pathW = _args select 4;
		private _signalW = _args select 5;
		private _alt = _args select 6;
		
		if (markerShape _mrkName == "") exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
		
		if (!(player getVariable ["TMAST_InSignalShadow", false])) 
		then {
           if (player inArea _mrkName)
		   then {
				[_mrkName, _lagInfo, _shiftSec, _shadowW, _pathW, _signalW, _alt] call TMAST_fnc_setSignalShadow;
			};
        };
		
		private _uav = getConnectedUAV player;
		
		if (!(isNull _uav) && !(_uav getVariable ["TMAST_InSignalShadow", false])) 
		then {
           if (_uav inArea _mrkName)
		   then {
				[_mrkName, _lagInfo, _shiftSec, _shadowW, _pathW, _signalW, _alt, _uav] call TMAST_fnc_setSignalShadow_Drone;
			};
        };
	}, 
	3,
	[_marker, _laggingInformation, _shiftingSec, _shadowWeight,_pathingWeight, _signalWeight, _altitude]
] call CBA_fnc_addPerFrameHandler;