_timeEffect  = param [0,15,["SCALAR"],1];
_pathErrorWeight  = param [1,0.5,[0],1];
_pathNormWeigth  = param [2,0.5,[0],1];

TMAST_PathTime = 0;
TMAST_PathTimeEffect = _timeEffect;
TMAST_PathErrorWeight = _pathErrorWeight;
TMAST_PathNormWeight = _pathNormWeigth;

TMAST_GpsPathTimerEvent = addMissionEventHandler ["EachFrame", {
	if (TMAST_PathTime <= TMAST_PathTimeEffect) then {
		_randomElement = selectRandom [0.1,0.2,0.3,0.4,0.5,1];
		TMAST_PathTime = TMAST_PathTime + _randomElement;
	} else {
		_randomElement = selectRandom [0, TMAST_PathTimeEffect, 5, 10, 15];
		TMAST_PathTime = _randomElement;
		_tmastEvent = ["Multipathing", "Normal"] selectRandomWeighted [TMAST_PathErrorWeight, TMAST_PathNormWeight];
		player setVariable ["TMAST_GPSshadow", _tmastEvent];
	};
}];