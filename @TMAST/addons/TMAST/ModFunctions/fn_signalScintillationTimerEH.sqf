_timeEffect  = param [0,15,[0],1];
_lagWeight  = param [1,0.5,[0],1];
_blockWeigth  = param [2,0.25,[0],1];
_normWeigth  = param [3,0.25,[0],1];

TMAST_ScintillationTime = 0;
TMAST_ScintillationTimeEffect = _timeEffect;
TMAST_ScintillationLagWeight = _lagWeight;
TMAST_ScintillationBlockWeight = _blockWeigth;
TMAST_ScintillationNormWeight = _normWeigth;

TMAST_GpsScintillationTimerEvent = addMissionEventHandler ["EachFrame", {
	if (TMAST_ScintillationTime <= TMAST_ScintillationTimeEffect) then {
		_randomElement = selectRandom [0.1,0.2,0.3,0.4,0.5,1];
		TMAST_ScintillationTime = TMAST_ScintillationTime + _randomElement;
	} else {
		_randomElement = selectRandom [0, TMAST_PathTimeEffect, 5, 10, 15];
		TMAST_ScintillationTime = _randomElement;
		_tmastEvent = ["Multipathing", "Blocked", "Normal"] selectRandomWeighted [TMAST_ScintillationLagWeight, TMAST_ScintillationBlockWeight, TMAST_ScintillationNormWeight];
		player setVariable ["TMAST_GPSscintillation", _tmastEvent];
	};
}];