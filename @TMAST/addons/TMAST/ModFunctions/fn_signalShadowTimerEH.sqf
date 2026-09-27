_timeEffect  = param [0,15,[0],1];
_blockWeigth  = param [1,0.5,[0],1];
_normWeigth  = param [2,0.5,[0],1];

TMAST_ShadowTime = 0;
TMAST_ShadowTimeEffect = _timeEffect;
TMAST_ShadowBlockWeight = _blockWeigth;
TMAST_ShadowNormWeight = _normWeigth;


TMAST_GpsShadowTimerEvent = addMissionEventHandler ["EachFrame", {
	if (TMAST_ShadowTime <= TMAST_ShadowTimeEffect) then {
		_randomElement = selectRandom [0.1,0.2,0.3,0.4,0.5,1];
		TMAST_ShadowTime = TMAST_ShadowTime + _randomElement;
	} else {
		_randomElement = selectRandom [0, TMAST_PathTimeEffect, 5, 10, 15];
		TMAST_ShadowTime = _randomElement;
		_tmastEvent = ["Blocked", "Normal"] selectRandomWeighted [TMAST_ShadowBlockWeight, TMAST_ShadowNormWeight];
		player setVariable ["TMAST_GPSshadow", _tmastEvent];
	};
}];

