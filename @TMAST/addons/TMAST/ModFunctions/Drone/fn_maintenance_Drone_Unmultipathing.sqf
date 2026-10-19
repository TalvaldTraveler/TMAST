private _uav = _this select 0;
private _variableCheck = _this select 1;

_uav setVariable [_variableCheck, nil];
_uavGroup = group (driver _uav);

[_uav, false] remoteExec ["TMAST_fnc_setLaggedUAV_EH", 0, true]; 

_uav removeEventHandler ["Fired", TMAST_UAVLag_FiredEH];

_uavCrew = crew _uav;
{
	[_x, false] remoteExec ["TMAST_fnc_setSkillUAV_AI", _uav]; 
} forEach _uavCrew;