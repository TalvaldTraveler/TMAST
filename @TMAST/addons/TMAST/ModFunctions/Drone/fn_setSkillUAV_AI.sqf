private _uavAI = _this select 0;
private _condition = _this select 1;

if (_condition) then {
	_spottSkill = _uavAI skill "spotTime";
	_aimSpeedSkill = _uavAI skill "aimingSpeed";
	_aimSkill = _uavAI skill "aimingAccuracy";
	_comSkill = _uavAI skill "commanding";
	_spotdSkill = _uavAI skill "spotDistance";
	
	_uavAI setVariable ["AI_SpotTSkill", _spottSkill];
	_uavAI setVariable ["AI_AimSpeedSkill", _aimSpeedSkill];
	_uavAI setVariable ["AI_AimSkill", _aimSkill];
	_uavAI setVariable ["AI_ComSkill", _comSkill];
	_uavAI setVariable ["AI_SpotDSkill", _spotdSkill];
	
	_uavAI setSkill ["spotTime", (_spottSkill*0.5)];
	_uavAI setSkill ["aimingSpeed", (_aimSpeedSkill*0.5)];
	_uavAI setSkill ["aimingAccuracy", (_aimSkill*0.5)];
	_uavAI setSkill ["commanding", (_comSkill*0.5)];
	_uavAI setSkill ["spotDistance", (_spotdSkill*0.5)];
} else {
	_spottSkill = _uavAI getVariable "AI_SpotTSkill";
	_aimSpeedSkill = _uavAI getVariable "AI_AimSpeedSkill";
	_aimSkill = _uavAI getVariable "AI_AimSkill";
	_comSkill = _uavAI getVariable "AI_ComSkill";
	_spotdSkill = _uavAI getVariable "AI_SpotDSkill";
	
	_uavAI setSkill ["spotTime", _spottSkill];
	_uavAI setSkill ["aimingSpeed", _aimSpeedSkill];
	_uavAI setSkill ["aimingAccuracy", _aimSkill];
	_uavAI setSkill ["commanding", _comSkill];
	_uavAI setSkill ["spotDistance", _spotdSkill];
};