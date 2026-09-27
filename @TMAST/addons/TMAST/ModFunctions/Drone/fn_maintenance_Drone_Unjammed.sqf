private _uav = _this select 0;
private _variableCheck = _this select 1;
private _signalTimeOut = _uav getVariable ["TMAST_SignalTimeOut", 0];

if ((_signalTimeOut >= 0)) exitWith {
	_signalTimeOut = _signalTimeOut - 2;
	_uav setVariable ["TMAST_SignalTimeOut", _signalTimeOut];
	hint str _signalTimeOut;
};
if (count (crew _uav) == 0) then {
	_side = _uav getVariable "TMAST_UAV_ControllSide";
	_grp = _side createVehicleCrew _uav;
	_uav setVariable ["TMAST_UAV_ControllSide", nil];
	_grp addVehicle _uav;
	_vehicles = assignedVehicles _grp;
	units _grp doFollow leader _grp;
}
else
{
	_uavCrew = crew _uav;
	{
		[_x, false] remoteExec ["TMAST_fnc_setJammedUAV_AI", 0]; 
	} forEach _uavCrew;
};
_uav setVariable ["TMAST_SignalTimeOut", nil];
_uav setVariable [_variableCheck, nil];
[_connectedUav, true] remoteExec ["enableUAVWaypoints", 0];
[_connectedUav, true] remoteExec ["setAutonomous", 0];