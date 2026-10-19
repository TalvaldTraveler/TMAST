params ["_mrkName", "_uavDrone", "_spoofedData"];

if (!((_uavDrone getVariable "TMAST_GPShacked") isEqualTo "LocSpoofing")) 
then {
	[{!((_this select 1) inArea (_this select 0))}, {(_this select 1) setVariable ["TMAST_GPShacked", nil, true];}, [_mrkName, _uavDrone]] call CBA_fnc_waitUntilAndExecute;
	_uavDrone setVariable ["TMAST_GPShacked", "LocSpoofing", true];
	_uavDrone setVariable ["TMAST_GPSSpoofedData", _spoofedData, true];
}
else {
};