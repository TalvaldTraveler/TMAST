params ["_mrkName", "_uavDrone", "_hackedTarget"];

if (!((_uavDrone getVariable "TMAST_GPShacked") isEqualTo "TargSpoofing")) 
then {
	[{!((_this select 1) inArea (_this select 0))}, {(_this select 1) setVariable ["TMAST_GPShacked", nil, true];}, [_mrkName, _uavDrone]] call CBA_fnc_waitUntilAndExecute;
	_uavDrone setVariable ["TMAST_GPShacked", "TargSpoofing", true];
	_uavDrone setVariable ["TMAST_GPSHackedData", _hackedTarget, true];
}
else {
};