private _timeEffect = param [0, 120, [0],1];
private _lagWeight = param [1, 50, [0],1];
private _blockWeigth = param [2, 25, [0],1];
private _normWeigth = param [3, 25, [0],1];
private _laggingInformation = param [4, [670,67], []];
private _target = param [5, allPlayers, []];

{ _x setVariable ["TMAST_GPSSscintillationData", _laggingInformation, true];} forEach _target;

TMAST_ScintillationTime = _timeEffect;
missionNamespace setVariable ["TMAST_ScintillationEnabled", true];
[
	{
		private _args = _this select 0;
		private _timeEf = _args select 0;
		private _lagW = _args select 1;
		private _blockW = _args select 2;
		private _normW = _args select 3;
		private _targ = _args select 4;
		
		if (TMAST_ScintillationTime <= _timeEf) then {
			_randomElement = selectRandom [0.5,1,1.5];
			TMAST_ScintillationTime = TMAST_ScintillationTime + _randomElement;
		} else {
			_randomElement = selectRandom [0, (_timeEf*0.05), (_timeEf*0.1), (_timeEf*0.25), (_timeEf*0.5)];
			TMAST_ScintillationTime = _randomElement;
			_tmastEvent = ["Multipathing", "Blocked", false] selectRandomWeighted [_lagW, _blockW, _normW];
			{ _x setVariable ["TMAST_GPSscintillation", _tmastEvent, true];} forEach _targ;
		};
		if (!(missionNamespace getVariable ["TMAST_ScintillationEnabled", false])) 
		then {
			[_handle] call CBA_fnc_removePerFrameHandler;
			{ _x setVariable ["TMAST_GPSscintillation", nil, true];} forEach _targ;
		};
	}, 
	1,
	[_timeEffect, _lagWeight, _blockWeigth, _normWeigth, _target]
] call CBA_fnc_addPerFrameHandler;
