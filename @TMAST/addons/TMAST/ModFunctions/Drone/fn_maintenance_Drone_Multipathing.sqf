private _uav = _this select 0;
private _variableCheck = _this select 1;

if (_uav getVariable [_variableCheck, false]) exitWith {
};

_uav setVariable [_variableCheck, true];

[_uav, true] remoteExec ["TMAST_fnc_setLaggedUAV_EH", 0, true]; 

_uavCrew = crew _uav;
{
	[_x, true] remoteExec ["TMAST_fnc_setSkillUAV_AI", _uav]; 
} forEach _uavCrew;