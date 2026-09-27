private _uavAI = _this select 0;
private _condition = _this select 1;

if (_condition) then {
	_uavAI disableAI "ALL";
} else {
	_uavAI enableAI "ALL";
};