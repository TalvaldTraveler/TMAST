private _uav = _this select 0;
private _variableCheck = _this select 1;
private _signalTimeOut = _uav getVariable ["TMAST_SignalTimeOut", 0];

if ((_uav getVariable [_variableCheck, false]) && (_signalTimeOut <= 10)) exitWith {
	_signalTimeOut = _signalTimeOut + 1;
	_uav setVariable ["TMAST_SignalTimeOut", _signalTimeOut];
};
if ((_uav getVariable [_variableCheck, false])  && (_signalTimeOut >= 10)) exitWith {
	if (count (crew _uav) != 0) then {
		_side = side _uav;
		_uav setVariable ["TMAST_UAV_ControllSide", _side];
		deleteVehicleCrew _uav;
	};
};
_uav setVariable [_variableCheck, true];
_uavCrew = crew _uav;
{
	[_x, true] remoteExec ["TMAST_fnc_setJammedUAV_AI", 0]; 
} forEach _uavCrew;
[_connectedUav, false] remoteExec ["enableUAVWaypoints", 0];
[_connectedUav, false] remoteExec ["setAutonomous", 0];