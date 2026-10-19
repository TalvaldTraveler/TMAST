params ["_mrkName", "_uavDrone"];

if (!(_uavDrone getVariable ["TMAST_GPSjammed", false])) 
then {
	[{!((_this select 1) inArea (_this select 0))}, {(_this select 1) setVariable ["TMAST_GPSjammed", false, true];}, [_mrkName, _uavDrone]] call CBA_fnc_waitUntilAndExecute;
	_uavDrone setVariable ["TMAST_GPSjammed", true, true];
}
else {
};